class SearchTerm < ActiveRecord::Base
  attr_accessor :radius

  # keywords, location_id, user_id
  belongs_to :location
  belongs_to :user
  has_many :tweets

  validates_presence_of :keywords

  def search!
    processor = TwitterSearchProcessor.new(self, user, TwitterSearcher, TwitterRestClient, Tweet)
    processor.process!
  end

end
