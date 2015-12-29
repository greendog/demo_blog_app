Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'core/registrations'}

  mount Core::Engine => "/"
  mount BackOffice::Engine, at: "/"#, as: 'admin'
  mount FrontOffice::Engine => "/"
end
