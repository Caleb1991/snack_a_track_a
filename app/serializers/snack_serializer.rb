class SnackSerializer

  def self.new_snack(snack)
    {data:
      {
        id: snack.id,
        type: 'Snack',
        attributes: snack
      }
    }
  end

  def self.creation_error(snack)
    {data:
      {
        id: nil,
        type: 'Snack Error',
        attributes:
        {
          errors: snack.errors.full_messages
        }
      }
    }
  end

  def self.updates_to_snack(snack_attributes, snack_id)
    {data:
      {
        id: snack_id,
        type: 'Snack updates',
        attributes:
        {
          updates: snack_attributes
        }
      }
    }
  end

  def self.snack_not_found
    {data:
      {
        id: nil,
        type: 'Snack error',
        attributes:
        {
          message: 'Snack not found for given id.'
        }
      }
    }
  end

  def self.deleted_snack
    {data:
      {
        id: nil,
        type: 'Deleted snack',
        attributes:
        {
          message: 'Snack successfully deleted.'
        }
      }
    }
  end

  def self.all_snacks(snacks)
    {data:
      {
        id: nil,
        type: 'All Snacks',
        attributes:
        {
          snacks: snacks
        }
      }
    }
  end

  def self.single_snack(snack)
    {data:
      {
        id: snack.id,
        type: 'Snack',
        attributes: snack
      }
    }
  end

  def self.all_users_snacks(user)
    {data:
      {
        id: user.id,
        type: "User's Snacks",
        attributes:
        {
          snacks: user.snacks
        }
      }
    }
  end
end
