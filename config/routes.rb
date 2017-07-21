Rails.application.routes.draw do
  
  get("/", { :controller => "movies", :action => "mv_index" })
  ## Movies
  # CREATE
  get("/movies/new", { :controller => "movies", :action => "mv_new_form" })
  get("/create_movie", { :controller => "movies", :action => "mv_create_row" })
  # READ
  get("/movies", { :controller => "movies", :action => "mv_index" })
  get("/movies/:id", { :controller => "movies", :action => "mv_show" })
  # UPDATE
  get("/movies/:id/edit", { :controller => "movies", :action => "mv_edit_form" })
  get("/update_movie/:id", { :controller => "movies", :action => "mv_update_row" })
  # DELETE
  get("/delete_movie/:id", { :controller => "movies", :action => "mv_destroy_row" })
  
  ## Actors
  # CREATE
  get("/actors/new", { :controller => "actors", :action => "ac_new_form" })
  get("/create_actor", { :controller => "actors", :action => "ac_create_row" })
  # READ
  get("/actors", { :controller => "actors", :action => "ac_index" })
  get("/actors/:id", { :controller => "actors", :action => "ac_show" })
  # UPDATE
  get("/actors/:id/edit", { :controller => "actors", :action => "ac_edit_form" })
  get("/update_actor/:id", { :controller => "actors", :action => "ac_update_row" })
  # DELETE
  get("/delete_actor/:id", { :controller => "actors", :action => "ac_destroy_row" })
  
  ## Directors
  # CREATE
  get("/directors/new", { :controller => "directors", :action => "dr_new_form" })
  get("/create_director", { :controller => "directors", :action => "dr_create_row" })
  # READ
  get("/directors", { :controller => "directors", :action => "dr_index" })
  get("/directors/:id", { :controller => "directors", :action => "dr_show" })
  # UPDATE
  get("/directors/:id/edit", { :controller => "directors", :action => "dr_edit_form" })
  get("/update_director/:id", { :controller => "directors", :action => "dr_update_row" })
  # DELETE
  get("/delete_director/:id", { :controller => "directors", :action => "dr_destroy_row" })
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
