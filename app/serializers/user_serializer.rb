class UserSerializer

  def self.all_users(users)
    {data:
      {
        id: 'All users',
        type: 'All users',
        attributes:
        {
          users: users
        }
      }
    }
  end

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

  def self.updated_user(user_attributes, user_id)
    {data:
      {
        id: user_id,
        type: 'Updated User',
        attributes:
        {
          updates: user_attributes
        }
      }
    }
  end

  def self.no_user_found
    {data:
      {
        id: nil,
        type: 'User Errors',
        attributes:
        {
          errors: 'No user found for given id.'
        }
      }
    }
  end

  def self.deleted_user
    {data:
      {
        id: nil,
        type: 'Deleted User',
        attributes:
        {
          message: 'User has been deleted.'
        }
      }
    }
  end
end
