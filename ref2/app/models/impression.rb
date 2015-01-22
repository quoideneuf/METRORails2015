class Impression < ActiveRecord::Base
  self.table_name = "impressions"

  def self.hit
    record = self.new(:time => Time.now)
    record.save
  end
  
  def self.total
    self.count
  end
end
