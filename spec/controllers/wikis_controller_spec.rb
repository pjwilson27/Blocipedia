require 'rails_helper'
require 'faker'

RSpec.describe WikiController, type: :controller do
  
  let(:my_wiki) { Wiki.create!(title: "New Wiki Title", body: "Wiki Body") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: my_wiki.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_wiki to @wiki" do
      get :show, {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      expect(response).to render_template :new
    end
    
    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "assigns the new wiki to @wiki" do
      post :create, wiki: {title: "New Wiki Title", body: "Wiki Body", private: false}
      expect(assigns(:wiki)).to eq Wiki.last
    end
    
    it "Redirects to the new wiki" do
      post :create, post: {title: "New Wiki Title", body: "Wiki Body", private: false}
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, {id: my_wiki.id}
      expect(response).to render_template :edit
    end
    
    it "assigns wiki to be updated to @wiki" do
      get :edit, {id: my_wiki.id}
      
      wiki_instance = assigns(:wiki)
      
      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
      expect(wiki_instance.private).to eq my_wiki.private
    end
  end
  
  describe "PUT update" do
    #LOGIC GOES HERE
  end

  describe "DELETE #destroy" do
    it "deletes the wiki" do
      delete :destroy, {id: my_wiki.id}
    end
    
    it "redirects to wiki index" do
      delete :destroy, {id: my_wiki.id}
      expect(response).to redirect_to wiki_index_path
    end
  end
end
