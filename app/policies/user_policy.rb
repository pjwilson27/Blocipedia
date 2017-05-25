class UserPolicy
    attr_reader :current_user, :model
    
    def initialize(current_user, model)
        @current_user = current_user
        @user = model
    end
    
    def index?
        false
    end
    
    def show?
    end
    
    def new?
    end
    
    def create?
    end
    
    def edit?
    end
    
    def update?
        user.present?
    end
    
    def destroy?
    end
    
end