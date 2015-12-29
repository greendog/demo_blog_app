Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get '/admin/autocomplete_tags', to: 'admin/posts#autocomplete_tags', as: 'autocomplete_tags'
end

BackOffice::Engine.routes.draw do

end
