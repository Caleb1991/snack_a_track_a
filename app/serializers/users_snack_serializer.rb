class UsersSnackSerializer
  def self.new_users_snack(attributes)
    {data:
      {
        id: attributes.id,
        type: 'UsersSnack',
        attributes: attributes
      }
    }
  end

  def self.creation_error(errors)
    {data:
      {
        id: nil,
        type: 'UsersSnack Errors',
        attributes:
        {
          errors: errors.errors.full_messages
        }
      }
    }
  end

  def self.users_snack_not_found
    {data:
      {
        id: nil,
        type: 'UsersSnack Error',
        attributes:
        {
          message: 'Users snack not found for given id.'
        }
      }
    }
  end

  def self.succesfully_deleted
    {data:
      {
        id: nil,
        type: 'UsersSnack',
        attributes:
        {
          message: 'Users snack successfully deleted.'
        }
      }
    }
  end
end
