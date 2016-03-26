Rails.application.routes.draw do
  resources :profanes
  resources :primes
  devise_for :users
  get'/check2', :controller=>'profanes', :action=>'checkprofanes'
  post'/validate2', :controller=>'profanes', :action=>'isprofane'
  get'/check', :controller=>'primes', :action=>'checkprime'
  post'/validate', :controller=>'primes', :action=>'isprime'
 
  
  
  
  resources :posts do # adds the routes for our posts 
    collection do 
      get 'search'
    end
    member do # member block 
      get "like", to: "posts#upvote" # define these in your post controller
      get "dislike", to: "posts#downvote"
    end
    resources :comments # nested as comment should only be seen within a post 
  end 
  root 'posts#index' # root of the application go to post to the post controller index action 
end
   