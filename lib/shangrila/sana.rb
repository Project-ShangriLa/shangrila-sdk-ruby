require 'net/http'
require 'uri'
require 'json'
require 'httpclient'

module Shangrila

  class Sana

    def initialize(hostname = 'api.moemoe.tokyo')
      @url = "http://#{hostname}/anime/v1/twitter"
    end

    # @param [Array] accounts データ取得対象のアニメTwitter公式アカウント
    # @param [boolean] is_to_json JSONをRubyHashにして返すかどうか
    # @return [Hash] アカウント群をキーとしたハッシュ
    def follower_status(accounts, is_to_json)
      response = HTTPClient.get(sprintf('%s/follower/status?accounts=%s', @url, accounts.join(',')))
      is_to_json ? JSON.load(response.body) : response.body
    end

    # @param [String] account データ取得対象のアニメTwitter公式アカウント
    # @param [int] end_date 検索対象の終了日時 where update_at < end_date)
    # @return [Array] フォロワー数と更新日時のハッシュの配列
    def follower_history(account, end_date = nil)
      response = nil
      if end_date.nil?
        response = HTTPClient.get(sprintf('%s/follower/history?account=%s', @url, account))
      else
        response = HTTPClient.get(sprintf('%s/follower/history?account=%s&end_date=%d', @url, account, end_date))
      end

      JSON.load(response.body)
    end

    # /anime/v1/twitter/follower/history/daily
    # @param [String] account データ取得対象のアニメTwitter公式アカウント
    # @param [int] days 取得日数
    # @return [Array] フォロワー数と更新日時のハッシュの配列
    def follower_history_daily(account, days = nil)
      response = HTTPClient.get(sprintf('%s/follower/history/daily?account=%s&days=%s', @url, account, days))

      JSON.load(response.body)
    end
  end

end