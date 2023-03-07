Rails.application.routes.draw do



  # Routes for the Story resource:

  # CREATE
  post("/insert_story", { :controller => "stories", :action => "create" })
          
  # READ
  get("/stories", { :controller => "stories", :action => "index" })
  
  get("/stories/:path_id", { :controller => "stories", :action => "show" })
  
  # UPDATE
  
  post("/modify_story/:path_id", { :controller => "stories", :action => "update" })
  
  # DELETE
  get("/delete_story/:path_id", { :controller => "stories", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
