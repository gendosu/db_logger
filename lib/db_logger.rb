# DbLogger
module DbLogger
  def db_logger
    Log.create(:controller => params[:controller], :action => params[:action], :method => request.request_method.to_s)
  end
end