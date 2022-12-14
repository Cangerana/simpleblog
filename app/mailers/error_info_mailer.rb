class ErrorInfoMailer < ApplicationMailer
  before_action :load_error

  def catch_error
    if ENV['MONITOR_ERROS']
      mail to: User.find_by(is_admin: true).email,
           subject: "Error was catched"
    end
  end

  private

  def load_error
    @error_info = params[:error_info]
  end
end
