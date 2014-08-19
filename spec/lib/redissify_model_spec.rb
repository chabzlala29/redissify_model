require "spec_helper"

describe RedissifyModel do
  RedissifyModel::Config.project_name = "test_project"
  class Test <  Sequel::Model
    include RedissifyModel
  end

  context "#redis_model_key_val" do
    it "should return model key val" do
      test = Test.create
      expect(test.redis_model_key_val).to match(/bla/)
    end
  end
end
