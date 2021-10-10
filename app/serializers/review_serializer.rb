class ReviewSerializer
  def self.new_review(review_attributes)
    {data:
      {
        id: review_attributes.id,
        type: 'Review',
        attributes: review_attributes
      }
    }
  end

  def self.creation_error(errors)
    {data:
      {
        id: nil,
        type: 'Review Errors',
        attributes:
        {
          errors: errors.errors.full_messages
        }
      }
    }
  end
end
