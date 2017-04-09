module LazyLoad
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace LazyLoad::Rails

      initializer 'lazy_load-rails.action_controller' do |app|
        ActiveSupport.on_load :action_controller do
          helper LazyLoad::Rails::ApplicationHelper
        end
      end
    end
  end
end
