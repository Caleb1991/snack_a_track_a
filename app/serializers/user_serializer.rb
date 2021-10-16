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

  def self.single_user(user)
    {data:
      {
        id: user.id,
        type: 'User',
        attributes: user
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
          id: user_attributes.id,
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

  def self.snack_recs(user_id, snacks)
    {data:
      {
        id: user_id,
        type: 'User',
        attributes:
        {
          snacks: snacks
        }
      }
    }
  end

  def self.successful_login(user)
    {data:
      {
        id: user.id,
        type: 'User',
        attributes:
        {
          message: 'You have successfully logged in!'
        }
      }
    }
  end

  def self.unsuccessful_login
    {data:
      {
        id: nil,
        type: 'User',
        attributes:
        {
          message: 'Your username or password is incorrect.'
        }
      }
    }
  end

  def self.user_logged_out
    {data:
      {
        id: nil,
        type: 'User',
        attributes:
        {
          message: 'You have successfully logged out.'
        }
      }
    }
  end
end
