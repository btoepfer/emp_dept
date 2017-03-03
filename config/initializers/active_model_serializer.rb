ActiveSupport.on_load(:action_controller) do
  require 'active_model_serializers/register_jsonapi_renderer'
end

ActiveModel::Serializer.config.adapter = :json_api


# Notwendig?
#ActiveModelSerializers.config.key_transform = :unaltered


