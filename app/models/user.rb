class User < ApplicationRecord
            # Include default devise modules.
            # :lockable, timeoutable and:omniauthable
            devise :database_authenticatable,
                   :confirmable,
                   :registerable,
                   :recoverable,
                   :rememberable,
                   :trackable,
                   :validatable
            include DeviseTokenAuth::Concerns::User
  belongs_to :adress, required: false
end
