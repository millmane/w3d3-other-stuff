class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, :presence => true
  validates :short_url, :presence => true, :uniqueness => true

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url:long_url,
      short_url: ShortenedUrl.random_code
     )
  end

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :submitter_id,
    primary_key: :id

  has_many(
    :visits,
    class_name: :Visit,
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :user
  )

end
