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
end
