class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :standard
  end
  
  def set_to_public
   self.wikis.update_all(private: false)
  end
         
end
