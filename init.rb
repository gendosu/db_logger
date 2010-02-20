# Include hook code here
#require File.dirname(__FILE__) + '/lib/db_logger'
#require File.dirname(__FILE__) + '/lib/log'

ActionController::Base.send :include, DbLogger
ActionController::Base.send :before_filter, :db_logger
