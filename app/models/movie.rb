class Movie < ApplicationRecord
  has_attached_file :poster, styles: { medium: "400x600>", thumb:"100x150>" }, default_url: "/images/:style/missing.jpeg"
  validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/

  scope :watched, -> (bool) { where watched: bool }

  def watched?
    self.watched
  end

  def watched!
    self.update(watched: !self.watched)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :duration, :director, :rating, :description, :poster)
  end
end
