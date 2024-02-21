Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get("/", { :controller => "articles", :action => "index" })

   # Define the root path route ("/")
   root "places#index"

   # Defines routes for Places
   resources :places do
     # Nested routes for Entries within Places, for creating new entries
     resources :entries, only: [:new, :create]
   end
   
   # Separate routes for Entries to handle actions like show, edit, update, and destroy directly
   resources :entries, only: [:show, :edit, :update, :destroy]
 
   # You can also define other custom routes here
 end
