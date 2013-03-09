Bitrix0App::Application.routes.draw do
    
    resource :user_session
    resource :agents
    resources :accounts do
      resources :users
      resources :phone_numbers do
        resources :call_times
        resources :call_menus
        resources :call_queues
      end
      resources :groups
    end
    
    match "/login",  :controller => "user_sessions", :action => "new"
    match "/logout", :controller => "user_sessions", :action => "destroy"

end

