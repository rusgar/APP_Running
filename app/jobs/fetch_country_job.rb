class FetchCountryJob < ApplicationJob
  queue_as :default

  def perform(user_id, ip)
    # Do something later, references not objects are passed in a background job
    country = FetchCountryService.new(ip).perform
    user = User.find(user_id)
    if country
      user.update(country: country)
    end
  end
end
