require 'net/http'
require 'uri'
require 'json'
require 'httpclient'

module Shangrila

  class Sana
    URL = 'http://api.moemoe.tokyo/anime/v1/twitter'

    def initialize
    end

    # @param [Array] accounts データ取得対象のアニメTwitter公式アカウント
    # @return [Hash] アカウント群をキーとしたハッシュ
    def follower_status(accounts)
      response = HTTPClient.get(sprintf('%s/follower/status?accounts=%s', URL, accounts.join(',')))
      JSON.load(response.body)
    end

    # @param [Array] account データ取得対象のアニメTwitter公式アカウント
    # @param [int] end_date 検索対象の終了日時 where update_at < end_date)
    # @return [Array] フォロワー数と更新日時のハッシュの配列
    def follower_history(account, end_date = nil)
      response = nil
      if end_date.nil?
        response = HTTPClient.get(sprintf('%s/follower/history?account=%s', URL, account))
      else
        response = HTTPClient.get(sprintf('%s/follower/history?account=%s&end_date=%d', URL, account, end_date))
      end

      JSON.load(response.body)
    end

  end

end