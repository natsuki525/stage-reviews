module ControllerMacros
	def login_admin
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			sign_in FactoryBot.create(:admin)
		end
	end

	def login_user
		before(:each) do
		# allow(request.env['warden']).to receive(:authenticate!).and_return(user) 
		# allow(controller).to receive(:current_user).and_return(user)
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryBot.create(:user)
			sign_in user
		end
	end
end