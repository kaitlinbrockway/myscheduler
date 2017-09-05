class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :employee, :guest and himself
    # - :employee has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    role :admin, { role: "admin" } do
      can [:create, :update, :destroy, :change_role], User
    end

    ##
    # More privileged role, applies to registered users.
    #
    role :employee, proc { |user| user.employee? } do
      can :read, User
      # May only edit their own user accounts
      can [:update], User do |user_updating|
        (user_updating == user)
      end
    end

    ##
    # The base role with no additional conditions.
    # Applies to every user.
    #
    role :guest do
      can :read, User
    end
  end
end
