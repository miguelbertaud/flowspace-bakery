class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true

  after_create_commit :cookie_in_the_oven

  validates :storage, presence: true

  enum cook_status: [:cooking, :cooked]

  def cookie_in_the_oven
    CookingJob.set(wait: 10.seconds).perform_later(id)
  end
end
