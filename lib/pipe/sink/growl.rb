require "appscript"

class Pipe::Sink::Growl
  
  GROWL_APP_ID = "com.Growl.GrowlHelperApp"
  
  class GrowlNotFound < Exception; end
  class GrowlNotRunning < Exception; end
  
  def initialize(options={})
    @options = options
    register
  end
  
  def post
    @app.notify(title: app_name, application_name: app_name, description: @options[:message], 
                sticky: sticky, priority: priority, with_name: notifications.first)
  end
  
  private
  
  def register
    @app = Appscript.app.by_id(GROWL_APP_ID)
    raise GrowlNotFound if @app.nil?
    raise GrowlNotRunning unless @app.is_running?
    @app.register(all_notifications:notifications, default_notifications: notifications,
                  as_application: app_name)
  end
  
  def notifications
    ['pIpe notifications']
  end
  
  def app_name
    @options[:app_name] || 'pIpe'
  end
  
  def sticky
    @options[:sticky] || true
  end
  
  def priority
    @options[:priority] || 0
  end
  
end