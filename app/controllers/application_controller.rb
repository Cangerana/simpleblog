class ApplicationController < ActionController::Base
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def send_error_info
    erro_info = params.merge(client_ip: request.remote_ip,
                             at: DateTime.now)

    ErrorInfoMailer.with(error_info: erro_info).catch_error.deliver_now!

    redirect_to root_path
  end
end
