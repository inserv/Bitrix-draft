Bitrix0App::Application.routes.draw do
    
    resource :user_session
    resource :agents
    resources :accounts do
      resources :users
      resources :groups
      resources :phone_numbers do
        resource :call_times
        resource :call_menus
        resource :call_queues
      end
    end
    
    match "/login",  :controller => "user_sessions", :action => "new"
    match "/logout", :controller => "user_sessions", :action => "destroy"

end

