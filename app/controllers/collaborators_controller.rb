class CollaboratorsController < ApplicationController
    
    def create
        @wiki = Wiki.find(params[:wiki_id])
        
        @user = User.where(email: params[:email]).take
        
        if @user == nil
            flash[:error] = "Collaborator was not found. Please refine your search."
            redirect_to edit_wiki_path(@wiki)
        elsif @wiki.collaborators.include?(@user)
            flash[:error] = "This collaborator already exists."
            redirect_to edit_wiki_path(@wiki)
        else
            collaborator = @wiki.collaborators.build(user_id: @user.id)
            
            if collaborator.save
                flash[:notice] = "Your collaborator has been added!"
                redirect_to edit_wiki_path(@wiki)
            else
                flash[:error] = "Collaborator couldn't be added..Try again."
                redirect_to edit_wiki_path(@wiki)
            end
        end
    end
            
    end
    
    def destroy
        @collaborator = Collaborator.find(params[:id])
        @wiki = @collaborator.wiki
        
        
        if @collaborator.destroy
            flash[:notice] = "You've deleted a collaborator from the wiki."
            redirect_to @wiki
        else
            flash[:error] = "There was a problem...Try again later."
            render :show
        end
    end
    
end
