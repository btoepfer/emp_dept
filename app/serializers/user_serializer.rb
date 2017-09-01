class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :nickname, :email, :last_sign_in_at, :role, :token
  link(:self) { user_url(object) }
end
