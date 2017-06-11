class CollaboratorsController < ApplicationController
    
    before_action :wiki_set
    
    
    def new
        @collaborator = Collaborator.new
    end
    
    def create
        @collaborator = Collaborator.new(wiki_id: @wiki_id, user_id: params[:user_id])
        
        if @collaborator.save
            flash[:notice] = "You've added a new collaborator!"
            redirect_to @wiki
        else
            flash[:error] = "There was a problem..Try again later."
            render :show
        end
    end
    
    def destroy
        @collaborator = Collaborator.find(params[:id])
        
        if @collaborator.destroy
            flash[:notice] = "You've deleted a collaborator from the wiki."
            redirect_to @wiki
        else
            flash[:error] = "There was a problem...Try again later."
            render :show
        end
    end
    
    private
    
    def wiki_set
        @wiki = Wiki.find(params[:wiki_id])
    end
    
end
