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
end
