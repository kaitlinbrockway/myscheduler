class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    role :admin, { role: "admin" } do
      can [:create, :update, :destroy], User
    end
    # role :admin, proc { |user| user.admin? } do
    #   can [:update, :destroy], User
    # end

    # More privileged role, applies to registered users.
    #
    role :employee, proc { |user| user.employee? } do
      # can :read, User

      # can [:update, :destroy], Post do |post, user|
      #   post.author = = user
      # end
    end

    # The base role with no additional conditions.
    # Applies to every user.
    #
    role :guest do
      can :read, User
    #  can :read, Post
    #  can :read, Comment
    end
  end
end
