# Patch

```ruby
RubyLLM.configure do |config|
  # config.moonshot_api_key = '...'
  # config.glm_api_key = '...'
end

chat = RubyLLM.chat(model: 'moonshot-v1-auto')

chat.with_instructions '你是一个诗人，所有回答都有诗意和韵律'

chat.ask "春天是什么" do |chunk|
  print chunk.content
end
```