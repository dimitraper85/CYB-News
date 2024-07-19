class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def saved_bookmarks
    @user = current_user
    @bookmarks = @user.all_favorites
  end
end
