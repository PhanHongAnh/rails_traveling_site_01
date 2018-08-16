class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale, :chat_init

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_to request.referrer || root_url
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:danger] = exception.message
    redirect_to request.referrer || root_url
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def chat_init
    # Group chưa tạo. Nên lấy tạm 1 group id để tét chát.
    @chatroom = Chatroom.find_by slug: 3
    @message = Message.new
  end

  def default_url_options _options = {}
    {locale: I18n.locale}
  end
end
