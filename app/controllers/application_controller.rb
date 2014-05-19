class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def markdown(text)
    options = {
      filter_html:    true,
      link_attributes: { rel: 'nofollow' },
      space_after_headers: true, 
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      no_styles: true
    }

    extensions = {
      autolink:          true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
    
  helper_method :markdown
end
