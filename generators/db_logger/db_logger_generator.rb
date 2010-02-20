class DbLoggerGenerator < Rails::Generator::NamedBase
  default_options :skip_migration => false,
                  :skip_routes    => false,
                  :old_passwords  => false,
                  :include_activation => false

  attr_reader   :model_controller_name
  
  def initialize(runtime_args, runtime_options = {})
    super
    
    @model_controller_name = @name.pluralize
  end
  
  def manifest
    recorded_session = record do |m|
      unless options[:skip_migration]
        m.migration_template 'migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
        }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
      end

      m.template 'model.rb',
                  File.join('app/models',
                            class_path,
                            "#{file_name}.rb")
    end
    
    recorded_session
  end
  
protected

  # Override with your own usage banner.
  def banner
    "Usage: #{$0} db_logger ModelName"
  end
  
  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--skip-migration",
      "Don't generate a migration file for this model")           { |v| options[:skip_migration] = v }
    opt.on("--skip_routes",
      "Don't edit a routes.rb file")                              { |v| options[:skip_routes] = v }
  end
end
