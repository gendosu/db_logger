# DbLogger
module DbLogger
  def db_logger
    p request.referer
    Log.create(
      :controller => params[:controller],
      :action => params[:action],
      :method => request.request_method.to_s,
      :referer => request.referer)
  end
end
