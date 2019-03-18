class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      added_attrs = [:phonenumber, :email, :username, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: [:phonenumber, :email, :username, :password,
                                                                :password_confirmation, :remember_me, :education,
                                                                :video_url, :age, :body, :avatar, :remove_avatar,
                                                                :image1, :image2, :image3, :image4, :image5, :image6,
                                                                :image7, :image8, :image9, :image10]
    end
end
