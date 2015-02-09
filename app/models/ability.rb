class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :new, :index, :create, :destroy, :upload_files, :to => :crud_manage
    alias_action :profile, :update_profile, :update, :to => :profile_manage
    user ||= User.new # guest user (not logged in)
    if user.is_a? SuperAdmin
      can :profile_manage, SuperAdmin
      can :crud_manage, Admin
      can :manage, User
    elsif user.is_a? Admin
      can :profile_manage, Admin
      can :manage, User
    elsif user.is_a? User
      can :profile_manage, User
    else
     # can :read, :all
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
