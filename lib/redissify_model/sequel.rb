require "sequel"
require "json"

module RedissifyModel
  module Sequel
    ::Sequel::Model.class_eval do
      def after_save
        super
        ::RedissifyModel::REDIS.set self.redis_model_key_val, self.values.to_json
      end

      def around_destroy
        super
        ::RedissifyModel::REDIS.del self.redis_model_key_val
      end
    end
  end
end
