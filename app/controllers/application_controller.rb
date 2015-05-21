# encoding: UTF-8

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :set_locale

  protected

  def authenticate_user_editor!
    authenticate_user!
    redirect_to root_path, alert: 'Somente editores ou administradores podem acessar' unless current_user.admin? || current_user.editor?
  end

  def authenticate_user_admin!
    authenticate_user!
    redirect_to root_path, alert: 'Somente administradores podem acessar' unless current_user.admin?
  end

  private

  def set_locale
    if lang = request.env['HTTP_ACCEPT_LANGUAGE']
      lang = lang[/^[a-z]{2}/]
      lang = :"pt-BR" if lang == "pt"
    end
    I18n.locale = params[:locale] || lang || I18n.default_locale
  end
end
