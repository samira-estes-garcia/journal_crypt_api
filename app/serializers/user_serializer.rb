class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :email, :password_digest
end
