Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/flex/square/:a_number", { :controller => "calculations", :action => "flex_square" })


  mount WebGit::Engine, at: "/rails/git"
end
