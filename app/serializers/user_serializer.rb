class UserSerializer
  def self.new_user(user_attributes)
    {data:
      {
        id: user_attributes.id,
        type: 'User',
        attributes:
        {
          username: user_attributes.username,
          first_name: user_attributes.first_name,
          last_name: user_attributes.last_name,
          email: user_attributes.email
        }
      }
    }
  end

  def self.new_user_errors(user)
    {data:
      {
        id: nil,
        type: 'User Errors',
        attributes:
        {
          errors: user.errors.full_messages
        }
      }
    }
  end
end
