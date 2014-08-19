module RedissifyModel
  module Config
    class << self
      attr_accessor :project_name

      def reset
        @project_name = ""
      end
    end
  end
end
