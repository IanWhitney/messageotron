class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :content

  def author
    user.email
  end

  def posted_on
    created_at.to_formatted_s(:long)
  end
end
