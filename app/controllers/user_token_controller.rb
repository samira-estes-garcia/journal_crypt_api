class UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token, raise: false

    def create
        render json: {
        jwt: auth_token.token,
        userDetails: User.find(auth_token.payload[:sub])
             }, status: :created
    end

end
