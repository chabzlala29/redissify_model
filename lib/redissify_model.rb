require "redissify_model/version"
require "redissify_model/config"
require "redissify_model/redis"
require "redissify_model/sequel"
require "json"

module RedissifyModel
  def self.included(base)
    base.extend ClassMethods
  end


  def redis_model_key_val
    "#{self.class.redis_model}:#{self.id}"
  end

  module ClassMethods
    def get_redis_ins(id)
      redis_key = "#{self.redis_model}:#{id}"
      redis_query = RedissifyModel::REDIS.get(redis_key)

      if redis_query
        redis_query = JSON.parse(redis_query)
        p_key = self.primary_key.to_s
        p_id = redis_query[p_key]
        redis_query.delete p_key # Need to delete key id to prevent throwing a restricted primary key assignment on Sequel Model
        ins = self.new(redis_query)
        ins.id = p_id
        ins
      else
        self[id]
      end
    rescue
      nil
    end

    def redis_model
      "#{RedissifyModel::Config.project_name}:#{self.to_s.downcase}"
    end
  end
end
