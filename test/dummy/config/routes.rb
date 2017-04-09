Rails.application.routes.draw do
  mount LazyLoad::Rails::Engine => "/lazy_load-rails"
end
