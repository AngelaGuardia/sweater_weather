class Api::V1::SessionsController < ApplicationController
  def create
    user_info = JSON.parse(request.raw_post, symbolize_names: true)
    user = User.find_by(email: user_info[:email])
    if user && user.authenticate(user_info[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      render json: { errors: 'Bad credentials' }, status: :bad_request
      # TODO: Is bad request the right status here?
    end
  end
end
