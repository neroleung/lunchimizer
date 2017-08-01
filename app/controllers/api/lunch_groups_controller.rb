module Api
  class LunchGroupsController < BaseController
    def index
      users = User.pluck(:name)

      render json: {groups: Lunch::Grouper.new(users).run}
    rescue Lunch::Grouper::NotEnoughUsersError => e
      render json: {message: e.message}, status: :unprocessable_entity
    end
  end
end
