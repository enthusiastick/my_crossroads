class ProfessionLink < ApplicationRecord
  belongs_to :profession
  validates_presence_of :name
  validates_format_of :url, with: URI::regexp(["http", "https"]), message: "must be a valid URL"
end
