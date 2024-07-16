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
    else
      'Default Page'
    end
  end
end
