module ProductsHelper
  def current_user_authorized?
    current_user && current_user.admin?
  end
end
