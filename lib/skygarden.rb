require 'nokogiri'
require 'open-uri'
require 'pry'
# require_relative '../app/models/product'

class SkyGardenScraper
    attr_accessor :urls
    vendor = "Sky Garden"
    DOMAIN_NAME = 'https://sky.garden/home'
    
    def get_page
        page = Nokogiri::HTML(open(DOMAIN_NAME))
    end

    def get_categories
    end

    def get_category_urls
    end

    def parse_category_products
    end
    
    def parse_product_image
    end
    
    def parse_product_info
    end
    
    
    def construct_url
    end
end

jum = JumiaScraper.new()
jum.get_category_urls