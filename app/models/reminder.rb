class Reminder < ApplicationRecord
  belongs_to :todo
  before_save :set_scheduled_for

  def scheduled_for_date=(date)
    @scheduled_for_date = date
  end

  def scheduled_for_time=(time)
    @scheduled_for_time = time
  end

  def scheduled_for_date
    scheduled_for&.strftime('%m/%d/%Y')
  end

  def scheduled_for_time
    scheduled_for&.strftime('%H:%M')
  end

  private

  def set_scheduled_for
    if @scheduled_for_date && @scheduled_for_time
      self.scheduled_for = Time.zone.parse("#{@scheduled_for_date} #{@scheduled_for_time}")
    end
  end
end
