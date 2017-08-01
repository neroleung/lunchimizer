module Api
  class UsersController < BaseController
    def create
      User.create(name: name)

      render json: {message: "User (#{name}) created!"}
    rescue ActionController::ParameterMissing => e
      render json: {message: e.message}, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotUnique
      render json: {message: "User with name, #{name}, already exists!"}, status: :unprocessable_entity
    end

    private

    def name
      @name ||= params.require(:name)
    end
  end
end
