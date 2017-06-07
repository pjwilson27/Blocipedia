class User < ActiveRecord::Base
  has_many :wikis
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :standard
  end
  
  def find_private
    self.wikis.where(:private, true)
  end
  
  def set_to_public
    self.wikis.each do |x|
      if x.find_private
        x.update_attribute(:private, false)
      end
    end
  end
         
end
