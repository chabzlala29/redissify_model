require "spec_helper"

describe RedissifyModel do
  RedissifyModel::Config.project_name = "test_project"
  class Test <  Sequel::Model
    include RedissifyModel
  end

  let!(:test){Test.create name: "test_name", price: 23}

  context "#redis_model_key_val" do
    it "should return model key val" do
      expect(test.redis_model_key_val).to match(/test_project:test/)
    end
  end

  context ".get_redis_ins" do
    it "should return a model object based on redis instance" do
      test = Test.get_redis_ins(Test.last.id)
      expect(test).to be_an_instance_of(Test)
    end

    it "should return exact values" do
      test = Test.get_redis_ins(Test.last.id)
      expect(test).to eq(Test.last)
    end
  end

  context ".redis_model" do
    it "should return the exact redis model" do
      expect(Test.redis_model).to eq("test_project:test")
    end
  end

  context "Hooks" do
    it "should delete key if record deleted" do
      test.destroy
      expect(Test.get_redis_ins(test)).to be_nil
    end

    it "should return record instance even if key is deleted" do
      test2 = Test.create name: "test_name2", price: 42
      redis_key = test2.redis_model_key_val
      RedissifyModel::REDIS.del redis_key
      expect(Test.get_redis_ins(test2.id)).to eq(test2)
    end

    it "should add key if record created" do
      test3 = Test.create name: "test_name3", price: 45
      expect(Test.get_redis_ins(test3.id)).not_to be_nil
    end
  end
end
