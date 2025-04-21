require 'ruby_llm'
require 'pry'

module RubyLLM
  class Configuration
    attr_accessor :glm_api_key
  end

  module Providers
    module Glm
      extend OpenAI

      module_function

      def completion_url
        'api/paas/v4/chat/completions'
      end

      def api_base
        'https://open.bigmodel.cn'
      end

      def headers
        {
          'Authorization' => "Bearer #{RubyLLM.config.glm_api_key}"
        }
      end

      def capabilities
        DeepSeek::Capabilities
      end

      def slug
        'glm'
      end

      def configuration_requirements
        %i[]
      end
    end
  end

  [
    {
      "id" => "glm-4-flash-250414",
      "created_at" => nil,
      "display_name" => "GLM-4-Flash-250414",
      "provider" => "glm",
      "context_window" => 64000,
      "max_tokens" => 8192,
      "type" => "chat",
      "family" => "chat",
      "supports_vision" => false,
      "supports_functions" => true,
      "supports_json_mode" => false,
      "input_price_per_million" => 0.27,
      "output_price_per_million" => 1.1,
      "metadata" => {
        "object" => "model",
        "owned_by" => "glm"
      }
    },
  ].each do |model|
    Models.instance.all << ModelInfo.new(model.transform_keys(&:to_sym))
  end

  module Provider
    register :glm, Providers::Glm
  end
end

pry
