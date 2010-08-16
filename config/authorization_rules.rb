authorization do
  
  role :guest do
    has_permission_on :nodes, :to => [:index, :show, :georss, :status]
		has_permission_on :bugreports, :to => [:index, :show]
  end
  
  
  role :operator do
    includes :guest
		has_permission_on :locations, :to => [:new, :create]
		has_permission_on :provinces, :to => [:new, :create]
		has_permission_on :groups, :to => [:new, :create]
		has_permission_on :devices, :to => [:new, :create]
		has_permission_on :bugreports, :to => [:new, :create]

		has_permission_on :parties, :to => [:new, :create]
		has_permission_on :nodes, :to => [:edit, :update, :register] do 
			if_attribute :user => is { user }
		end
	end

	role :admin do
		includes :guest
		includes :operator
    has_permission_on [:nodes, :locations], :to => [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
end
