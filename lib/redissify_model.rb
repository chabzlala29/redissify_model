require "redissify_model/version"

module RedissifyModel
  def self.included(base)
    base.extend ClassMethods
  end


  def redis_model_key_val
    "#{self.class.redis_model}:#{self.id}"
  end

  module ClassMethods
    def get_redis_ins(id)
      redis_key = "#{V1::Models::Wallet.redis_model}:#{id}"
      redis_query = JSON.parse(App::REDIS.get redis_key)

      if redis_query
        p_id = redis_query["id"]
        redis_query.delete "id" # Need to delete key id to prevent throwing a restricted primary key assignment on Sequel Model
        wallet_ins = V1::Models::Wallet.new(redis_query)
        wallet_ins.id = p_id
        wallet_ins
      else
        V1::Models::Wallet[id]
      end
    end

    def redis_model
      "#{Redissify::Config.project_name}:#{self.class.downcase}"
    end
  end
end
