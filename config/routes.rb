Rails.application.routes.draw do



  # Routes for the Offer resource:

  # CREATE
  post("/insert_offer", { :controller => "offers", :action => "create" })
          
  # READ
  get("/offers", { :controller => "offers", :action => "index" })
  
  get("/offers/:path_id", { :controller => "offers", :action => "show" })
  
  # UPDATE
  
  post("/modify_offer/:path_id", { :controller => "offers", :action => "update" })
  
  # DELETE
  get("/delete_offer/:path_id", { :controller => "offers", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Furniture resource:
  get("/", { :controller => "furnitures", :action => "index" })

  # CREATE
  post("/insert_furniture", { :controller => "furnitures", :action => "create" })
          
  # READ
  get("/furnitures", { :controller => "furnitures", :action => "index" })
  
  get("/furnitures/:path_id", { :controller => "furnitures", :action => "show" })
  
  # UPDATE
  
  post("/modify_furniture/:path_id", { :controller => "furnitures", :action => "update" })
  
  # DELETE
  get("/delete_furniture/:path_id", { :controller => "furnitures", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # READ
  # get("/users", { :controller => "users", :action => "index" })
  get("/users/:user_id", { :controller => "users", :action => "show" })

  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
