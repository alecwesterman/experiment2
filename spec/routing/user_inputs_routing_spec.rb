require "spec_helper"

describe UserInputsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_inputs").should route_to("user_inputs#index")
    end

    it "routes to #new" do
      get("/user_inputs/new").should route_to("user_inputs#new")
    end

    it "routes to #show" do
      get("/user_inputs/1").should route_to("user_inputs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_inputs/1/edit").should route_to("user_inputs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_inputs").should route_to("user_inputs#create")
    end

    it "routes to #update" do
      put("/user_inputs/1").should route_to("user_inputs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_inputs/1").should route_to("user_inputs#destroy", :id => "1")
    end

  end
end
