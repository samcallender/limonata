class User < ActiveRecord::Base
	has_secure_password

	validates :username, :name, presence: true;
end
