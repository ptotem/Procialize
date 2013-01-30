class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.email=="moderator@procialize.com"
    #     can :access, :questionables
    #
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities


       user ||= User.new
       case user.email= "organizer@procialize.com"
         when "organizer@procialize.com"
           can :access, :questionables # grant access to rails_admin
           #can :dashboard
           #can :manage, :all
         #when "Projects"
         #  can :access, :rails_admin # grant access to rails_admin
         #  can :dashboard
         #  can :manage, [Project, Task, User, Page, Feature, TaskAsset, TaskCompetence, Competence]
         #when "DevTeam"
         #  can [:read, :edit], Task
         #  can :read, Guideline
         #  can :manage, TaskAsset
         #  can :access, :rails_admin # grant access to rails_admin
         #  can :dashboard
         else
           cannot :manage, :all
           can :access, :rails_admin # grant access to rails_admin
           can :dashboard

       end

  end
end
