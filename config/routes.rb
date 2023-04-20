Rails.application.routes.draw do



  # Routes for the Daily monitoring resource:

  # CREATE
  post("/insert_daily_monitoring", { :controller => "daily_monitorings", :action => "create" })
          
  # READ
  get("/daily_monitorings", { :controller => "daily_monitorings", :action => "index" })
  
  get("/daily_monitorings/:path_id", { :controller => "daily_monitorings", :action => "show" })
  
  # UPDATE
  
  post("/modify_daily_monitoring/:path_id", { :controller => "daily_monitorings", :action => "update" })
  
  # DELETE
  get("/delete_daily_monitoring/:path_id", { :controller => "daily_monitorings", :action => "destroy" })

  #------------------------------

  # Routes for the Hospital resource:

  # CREATE
  post("/insert_hospital", { :controller => "hospitals", :action => "create" })
          
  # READ
  get("/hospitals", { :controller => "hospitals", :action => "index" })
  
  get("/hospitals/:path_id", { :controller => "hospitals", :action => "show" })
  
  # UPDATE
  
  post("/modify_hospital/:path_id", { :controller => "hospitals", :action => "update" })
  
  # DELETE
  get("/delete_hospital/:path_id", { :controller => "hospitals", :action => "destroy" })

  #------------------------------

  # Routes for the Medicine resource:

  # CREATE
  post("/insert_medicine", { :controller => "medicines", :action => "create" })
          
  # READ
  get("/medicines", { :controller => "medicines", :action => "index" })
  
  get("/medicines/:path_id", { :controller => "medicines", :action => "show" })
  
  # UPDATE
  
  post("/modify_medicine/:path_id", { :controller => "medicines", :action => "update" })
  
  # DELETE
  get("/delete_medicine/:path_id", { :controller => "medicines", :action => "destroy" })

  #------------------------------

  # Routes for the Other team resource:

  # CREATE
  post("/insert_other_team", { :controller => "other_teams", :action => "create" })
          
  # READ
  get("/other_teams", { :controller => "other_teams", :action => "index" })
  
  get("/other_teams/:path_id", { :controller => "other_teams", :action => "show" })
  
  # UPDATE
  
  post("/modify_other_team/:path_id", { :controller => "other_teams", :action => "update" })
  
  # DELETE
  get("/delete_other_team/:path_id", { :controller => "other_teams", :action => "destroy" })

  #------------------------------

  # Routes for the Nurse resource:

  # CREATE
  post("/insert_nurse", { :controller => "nurses", :action => "create" })
          
  # READ
  get("/nurses", { :controller => "nurses", :action => "index" })
  
  get("/nurses/:path_id", { :controller => "nurses", :action => "show" })
  
  # UPDATE
  
  post("/modify_nurse/:path_id", { :controller => "nurses", :action => "update" })
  
  # DELETE
  get("/delete_nurse/:path_id", { :controller => "nurses", :action => "destroy" })

  #------------------------------

  # Routes for the Doctor resource:

  # CREATE
  post("/insert_doctor", { :controller => "doctors", :action => "create" })
          
  # READ
  get("/doctors", { :controller => "doctors", :action => "index" })
  
  get("/doctors/:path_id", { :controller => "doctors", :action => "show" })
  
  # UPDATE
  
  post("/modify_doctor/:path_id", { :controller => "doctors", :action => "update" })
  
  # DELETE
  get("/delete_doctor/:path_id", { :controller => "doctors", :action => "destroy" })

  #------------------------------

  # Routes for the Patient resource:

  # CREATE
  post("/insert_patient", { :controller => "patients", :action => "create" })
          
  # READ
  get("/patients", { :controller => "patients", :action => "index" })
  
  get("/patients/:path_id", { :controller => "patients", :action => "show" })
  
  # UPDATE
  
  post("/modify_patient/:path_id", { :controller => "patients", :action => "update" })
  
  # DELETE
  get("/delete_patient/:path_id", { :controller => "patients", :action => "destroy" })

  #------------------------------

  resources :todos
  #get 'welcome/index'
  root to: 'welcome#index'
  
  #get("/path1", { :controller => "medicines", :action => "create" })

  #get("/path2", { :controller => "daily_monitorings", :action => "index" })

  #get("path3", { :controller => "employees", :action => "index" })

   get("daily_monitorings", { :controller => "daily_monitorings", :action => "index" })
end
