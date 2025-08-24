# config/routes.rb
Rails.application.routes.draw do
  # Sets the root path of the application to the home action of the PagesController.
  root "pages#home"

  # Defines RESTful routes for the Post resource.
  # Nested comments means comment routes will be like /posts/:post_id/comments
  resources :posts do
    # Defines RESTful routes for comments, but only for 'create' and 'destroy' actions.
    resources :comments, only: [:create, :destroy]
  end
end
