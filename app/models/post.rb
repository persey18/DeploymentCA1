class Post < ActiveRecord::Base
  searchkick
  acts_as_votable
  belongs_to :user #a post belongs to a user 
  has_many :comments #a post has many comments 
  has_attached_file :image, styles: { medium: "700x500#", small: "350x250>" } 
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
