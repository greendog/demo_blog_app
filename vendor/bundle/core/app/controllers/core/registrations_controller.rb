module Core
  class RegistrationsController < Devise::RegistrationsController
    after_filter :add_role

    protected

    def add_role
      if resource.persisted? # user is created successfuly
        if User.count == 1
          resource.role = :admin
          resource.save
        else
          resource.role = :user
          resource.save
        end
      end
    end
  end
end