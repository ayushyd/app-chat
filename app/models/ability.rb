class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.persisted?
      can :manage, :all
    else
      can :read, :all
      can :create, Artice if user.persisted?
      can :update, Artice do |article|
        article.user_id == user.id
      end
      can :destroy, Artice do |article|
        article.user_id == user.id
      end
    end
  end
end