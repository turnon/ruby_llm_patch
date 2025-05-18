require 'ruby_llm'
require 'pry'

module RubyLLM
  class Configuration
    attr_accessor :glm_api_key, :moonshot_api_key
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
        %i[glm_api_key]
      end

      def format_role(role)
        role.to_s
      end
    end

    module Moonshot
      extend OpenAI

      module_function

      def api_base
        'https://api.moonshot.cn/v1'
      end

      def headers
        {
          'Authorization' => "Bearer #{RubyLLM.config.moonshot_api_key}"
        }
      end

      def capabilities
        DeepSeek::Capabilities
      end

      def slug
        'moonshot'
      end

      def configuration_requirements
        %i[moonshot_api_key]
      end

      def format_role(role)
        role.to_s
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
    {
      "id" => "moonshot-v1-auto",
      "created_at" => nil,
      "display_name" => "Moonshot-V1-Auto",
      "provider" => "moonshot",
      "context_window" => 8192,
      "max_tokens" => 100,
      "type" => "chat",
      "family" => "chat",
      "supports_vision" => false,
      "supports_functions" => true,
      "supports_json_mode" => false,
      "input_price_per_million" => 0.27,
      "output_price_per_million" => 1.1,
      "metadata" => {
        "object" => "model",
        "owned_by" => "moonshot"
      }
    },
    {
      "id" => "moonshot-v1-8k",
      "created_at" => nil,
      "display_name" => "Moonshot-V1-8k",
      "provider" => "moonshot",
      "context_window" => 8192,
      "max_tokens" => 2048,
      "type" => "chat",
      "family" => "chat",
      "supports_vision" => false,
      "supports_functions" => true,
      "supports_json_mode" => false,
      "input_price_per_million" => 0.27,
      "output_price_per_million" => 1.1,
      "metadata" => {
        "object" => "model",
        "owned_by" => "moonshot"
      }
    },
    {
      "id" => "moonshot-v1-32k",
      "created_at" => nil,
      "display_name" => "Moonshot-V1-32k",
      "provider" => "moonshot",
      "context_window" => 32768,
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
        "owned_by" => "moonshot"
      }
    },
    {
      "id" => "moonshot-v1-128k",
      "created_at" => nil,
      "display_name" => "Moonshot-V1-128k",
      "provider" => "moonshot",
      "context_window" => 131072,
      "max_tokens" => 32768,
      "type" => "chat",
      "family" => "chat",
      "supports_vision" => false,
      "supports_functions" => true,
      "supports_json_mode" => false,
      "input_price_per_million" => 0.27,
      "output_price_per_million" => 1.1,
      "metadata" => {
        "object" => "model",
        "owned_by" => "moonshot"
      }
    },
  ].each do |model|
    Models.instance.all << ModelInfo.new(model.transform_keys(&:to_sym))
  end

  module Provider
    register :glm, Providers::Glm
    register :moonshot, Providers::Moonshot
  end
end

pry
