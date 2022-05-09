class Form::ScheduleCollection < Form::Base
  attribute :date, :datetime
  attribute :event_id, :integer
  attr_accessor :schedules

  def initialize(attributes = {}, event_id)
    super attributes

    # > attributes
    # => <ActionController::Parameters {"schedules"=>["2022-04-04,2022-04-05"]} permitted: true>
    # > attributes[:schedules]
    # => ["2022-04-04,2022-04-05"]
    # > collection
    # => ["2022-04-04", "2022-04-05"]
    collection = attributes[:schedules].flat_map { |s| s.split(',') }
    self.schedules = collection.map { |v| Schedule.new(date: v, event_id: event_id) }
  end

  def save
    Schedule.transaction do
      self.schedules.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end
