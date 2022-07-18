class UserController < ApplicationController
  before_action :authenticate_user!
  def generate_link
    @token = current_user.generate_token
    respond_to do |format|
      format.js {}
    end
  end
end
