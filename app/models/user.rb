class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password_digest, presence: true
    has_many :entries

    def to_token_payload
        {
            sub: id,
            email: email
        }
    end

end
