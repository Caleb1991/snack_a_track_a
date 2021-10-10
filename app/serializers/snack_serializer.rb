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
end
