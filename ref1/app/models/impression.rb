class Impression < ActiveRecord::Base
  @@hits ||= 0
  
  def self.hit
    @@hits += 1
  end
  
  def self.total
    @@hits
  end
end
