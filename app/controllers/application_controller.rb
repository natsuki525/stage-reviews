class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :set_seach

def after_sign_in_path_for(resource)
	case resource
		when Admin
			admin_root_path
		when User
			root_path
			user_path(current_user)
	end
end


def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
end

def set_seach
    @search = Review.ransack(params[:q])
    @search_reviews = @search.result
end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :is_deleted])
  end
end
