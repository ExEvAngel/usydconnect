require "spec_helper"
# This file checks all the routing is correct!
# Reference to routes.rb, where all the routes are! 
  describe "routing" do

    it "routes to #create" do
      post("/login").should route_to("static_pages#create")
    end
    it "routes to #help" do
      get("/help").should route_to("static_pages#help")
    end
    it "routes to #about" do
      get("/about").should route_to("static_pages#about")
    end
    it "routes to #policy" do
      get("/policy").should route_to("static_pages#policy")
    end
    it "routes to #destroy" do
      delete("/signout").should route_to("static_pages#destroy")
    end
    it "routes to #results" do
      get("/results").should route_to("static_pages#results")
    end
    it "routes to #follow" do
      get("/follow").should route_to("static_pages#follow")
    end
    it "routes to #uft" do
      post("/follow/uft").should route_to("static_pages#uft")
    end
    it "routes to #ft" do
      post("/follow/ft").should route_to("static_pages#ft")
    end
    it "routes to #ufu" do
      post("/follow/ufu").should route_to("static_pages#ufu")
    end
    it "routes to #fu" do
      post("/follow/fu").should route_to("static_pages#fu")
    end



    it "routes to #follow" do
      post("/user/follow").should route_to("users#follow")
    end
    it "routes to #unfollow" do
      post("/user/unfollow").should route_to("users#unfollow")
    end
    it "routes to #ban" do
      post("/user/ban").should route_to("users#ban")
    end
    it "routes to #unban" do
      post("/user/unban").should route_to("users#unban")
    end
    it "routes to #profile" do
      get("/profile").should route_to("users#profile")
    end
    it "routes to #create" do
      post("/new").should route_to("users#create")
    end
    it "routes to #new" do
      get("/signup").should route_to("users#new")
    end
    it "routes to #change_password" do
      post("/change_password").should route_to("users#change_password")
    end




    it "routes to #thread" do
      get("/thread").should route_to("thread#thread")
    end
    it "routes to #new" do
      get("/thread/new").should route_to("thread#new")
    end
    it "routes to #create" do
      post("/thread/submit").should route_to("thread#create")
    end



    
    it "routes to #createcomments" do
      post("/thread/submitc").should route_to("thread#createcomments")
    end
    
    it "routes to #follow" do
      post("/thread/follow").should route_to("thread#follow")
    end
    
    it "routes to #unfollow" do
      post("/thread/unfollow").should route_to("thread#unfollow")
    end
    
    it "routes to #like" do
      post("/thread/like").should route_to("thread#like")
    end
    
    it "routes to #unlike" do
      post("/thread/unlike").should route_to("thread#unlike")
    end
    
    it "routes to #flag" do
      post("/thread/flag").should route_to("thread#flag")
    end
    
    it "routes to #unflag" do
      post("/thread/unflag").should route_to("thread#unflag")
    end
    
    it "routes to #close" do
      post("/thread/close").should route_to("thread#close")
    end
    

    





  end
