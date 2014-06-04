class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_presence_of :content

  def author
    user.email
  end

  def posted_on
    created_at.to_formatted_s(:long)
  end
end
