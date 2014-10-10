class TimelinesController < ApplicationController
  before_action :login_required

  def index
    client = current_user.twitter_client
    @timelines = client.search(nil, geocode: "#{params[:latitude]},#{params[:longitude]},1km")

    @colors = Color.request(@timelines.map(&:text).sample(1).first.try(:first, 20))
  end
end
