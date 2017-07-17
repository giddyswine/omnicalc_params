Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/flexible/square/:a_number", { :controller => "calculations", :action => "flex_square" })
  get("/flexible/square_root/:a_number", { :controller => "calculations", :action => "flex_square_root" })
  get("/flexible/payment/:a_number/:b_number/:c_number", { :controller => "calculations", :action => "flex_payment" })
  get("/flexible/random/:a_number/:b_number", { :controller => "calculations", :action => "flex_random" })

  get("/square/new", { :controller => "calculations", :action => "square_form" })
  get("/square/results", { :controller => "calculations", :action => "square_form_results" })
  



  mount WebGit::Engine, at: "/rails/git"
end
