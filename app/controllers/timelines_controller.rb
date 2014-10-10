class TimelinesController < ApplicationController
  def index
    render json: Color.request(*params[:keyword].to_s.split(','))
  end
end