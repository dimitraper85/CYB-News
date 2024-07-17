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
    else
      'CYB News' # Default title
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
    else
      'Default Page'
    end
  end
end
