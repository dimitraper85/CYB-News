module ApplicationHelper
  def navigation_bar_title
    case current_screen
    when 'home'
      'All News'
    when 'articles'
      'Latest Articles'
    when 'article'
      # custom title
      @article.title
    when 'about'
      'About Us'
    when 'new_article'
      'CYB Checker'
    when 'user_articles'
      'My Checked Articles'
    when 'user_profile'
      'Profile'
    when 'bookmarks'
      'My Saved Articles'
    else
      link_to 'CYB News', root_path # Default title
    end
  end

  def current_screen
    # Based on route helpers
    if current_page?(root_path)
      'home'
    # elsif current_page?(about_path)
    #   'about'
    elsif current_page?(new_user_article_path)
      'new_article'
    elsif current_page?(user_articles_path)
      'user_articles'
    elsif current_page?(profile_path)
      'user_profile'
    elsif current_page?(bookmarks_path)
      'bookmarks'
    else
      'Default Page'
    end
  end
end
