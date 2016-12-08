require 'net/http'
require 'uri'
require 'json'
require 'httpclient'

module Shangrila

  class Sora
    URL = 'http://api.moemoe.tokyo/anime/v1/master'

    def initialize
    end

    # @param [Int] year データ取得対象のアニメの年
    # @param [Int] cours データ取得対象のアニメの年のクール番号 1-4
    # @return [JSON] アニメのマスターデータすべて
    def get_master_data_raw(year, cours)
      response = HTTPClient.get(sprintf("%s/%s/%s", URL, year, cours))
      response.body
    end

    # @param [Int] year データ取得対象のアニメの年
    # @param [Int] cours データ取得対象のアニメの年のクール番号 1-4
    # @return [JSON->RubyHash] アニメのマスターデータすべて
    def get_master_data(year, cours)
      response = HTTPClient.get(sprintf("%s/%s/%s", URL, year, cours))
      JSON.load(response.body)
    end

    # @param [Int] year データ取得対象のアニメの年
    # @param [Int] cours データ取得対象のアニメの年のクール番号 1-4
    # @return [JSON] アニメのマスターデータのタイトルリスト
    def get_title_list(year, cours)
      master_list = get_master_data(year, cours)
      master_list.map{|master| master['title']}
    end

    # @param [Int] year データ取得対象のアニメの年
    # @param [Int] cours データ取得対象のアニメの年のクール番号 1-4
    # @param [property] データ取得対象のプロパティ
    # @return [HASH] タイトルをkey、propertyに対応する値をValueとしたハッシュ
    def get_map_with_key_title(year, cours, property)
      master_list = get_master_data(year, cours)

      master_map = {}

      master_list.each{|master| master_map[master['title']] = master[property]}

      master_map
    end

    # @param [Int] year データ取得対象のアニメの年
    # @param [Int] cours データ取得対象のアニメの年のクール番号 1-4
    # @return [HASH] idをkeyとしたハッシュデータ
    def get_map_key_id(year, cours)
      master_list = get_master_data(year, cours)

      master_map = {}

      master_list.each{|master| master_map[master['id']] = master}

      master_map
    end

    # @param [Int] year データ取得対象のアニメの年
    # @param [Int] cours データ取得対象のアニメの年のクール番号 1-4
    # @param [property] データ取得対象のプロパティリスト
    # @return [Array] 1タイトル1配列としたフラット配列
    def get_flat_data(year, cours, property_list)
      master_list = get_master_data(year, cours)
      records = master_list.map{|master| property_list.map{|p|master[p]} }

      records
    end

  end

end