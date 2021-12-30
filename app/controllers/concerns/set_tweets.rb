module SetTweets
  extend ActiveSupport::Concern

  included do
    before_action :set_tweets
  end

  def set_tweets
    @tweets = SocialTool.twitter_search
  end
end
