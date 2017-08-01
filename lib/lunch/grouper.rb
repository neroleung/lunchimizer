class Lunch::Grouper
  class NotEnoughUsersError < StandardError
  end

  attr_reader :user_names

  DEFAULT_MIN = 3
  DEFAULT_MAX = 5

  def initialize(user_names)
    @user_names = user_names
  end

  def run(min: DEFAULT_MIN, max: DEFAULT_MAX)
    unless user_names.count >= min * 2
      raise NotEnoughUsersError, "Requires at least #{min * 2} users. Please add more users."
    end

    groups_count = (user_names.count / max) + 1
    groups       = groups_count.times.map { [] }
    i            = 0

    user_names.shuffle.each do |name|
      groups[i] << name

      i += 1

      i = 0 if i == groups_count
    end

    groups
  end
end
