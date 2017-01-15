class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.enum_collection(attribute)
    collection = Array.new
    send(attribute).keys.each { |a| collection << [a.titleize, a] }
    collection
  end
end
