class ApplicationController < ActionController::Base
  def home
    render '/home'
    # flash[:notice] = 'qqqq'
  end
end
