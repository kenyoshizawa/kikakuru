class Form::ScheduleCollection < Form::Base
  attribute :date, :datetime
  attribute :event_id, :integer
  attr_accessor :schedules

  validates :date, presence: true

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
    return false unless valid?
    Schedule.transaction { self.schedules.map(&:save!) }
    true
  end

  def valid?
    if self.schedules.empty?
      # self.errors[attribute] << (options[:message] || 'を１つ以上選択してください')
      # self.errors.add(:date, '日付を１つ以上選択してください')
      return false
    end
    self.schedules.map(&:valid?)
  end
end
