class WikisController < ApplicationController
  def index
      if current_user == nil
        @wikis = Wiki.visible_to_all
      else
        @wikis = policy_scope(Wiki)
      end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.create(wiki_params)
    @wiki.user_id = current_user.id 
    
    if @wiki.save
      flash[:notice] = "You've successfully posted a Wiki!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error with your Wiki...Try again later"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Your Wiki has been updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error updating...Try again later!"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\"was deleted successfully."
      redirect_to home_index_path
    else
      flash.now[:alert] = "There was an error deleting your wiki...Try again later!"
      render :show
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end