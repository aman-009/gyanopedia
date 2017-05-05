class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :article       
end

  def feed
    feed_articles = Article.includes(:user).where("user_id in (?)", users)
    feed_articles.order(created_at: :desc)
  end

