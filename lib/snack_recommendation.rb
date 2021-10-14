module SnackRecommendation
  def recommend_snacks
    other_users = self.class.where.not(id: self.id)

    recommended = Hash.new(0)

    other_users.each do |user|
      common_snacks = user.snacks.joins(:reviews).where('reviews.likes = ?', true) & self.snacks.joins(:reviews).where('reviews.likes = ?', true)

      weight = common_snacks.size.to_f / user.snacks.size

      (user.snacks.joins(:reviews).where('reviews.likes = ?', true) - common_snacks).each do |snack|
        recommended[snack] += weight
      end
    end

    new = recommended.sort_by {|key,value| value}.reverse.flatten.find_all do |variable|
    variable.class == Snack
    end
  end
end
