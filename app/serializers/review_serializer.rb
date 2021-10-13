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

  def self.review_not_found
    {data:
      {
        id: nil,
        type: 'Review',
        attributes:
        {
          message: 'Review could not be found for given id.'
        }
      }
    }
  end

  def self.updated_review(attributes, review_id)
    {data:
      {
        id: review_id,
        type: 'Review',
        attributes:
        {
          updates: attributes
        }
      }
    }
  end

  def self.review_deleted
    {data:
      {
        id: nil,
        type: 'Review',
        attributes:
        {
          message: 'Review has been successfully deleted.'
        }
      }
    }
  end

  def self.all_reviews_for_snack(snack)
    {data:
      {
        id: nil,
        type: 'Reviews',
        attributes:
        {
          reviews: snack.reviews
        }
      }
    }
  end
end
