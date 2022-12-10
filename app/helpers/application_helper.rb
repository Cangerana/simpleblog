module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end

  def user_is_admin?
    user_signed_in? and current_user.is_admin?
  end
end
