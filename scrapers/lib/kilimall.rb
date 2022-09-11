require 'nokogiri'
require 'open-uri'
require 'pry'
# require_relative '../app/models/product'

class JumiaScraper
    attr_accessor :urls
    vendor = "Kilimall"
    DOMAIN_NAME = 'https://www.kilimall.co.ke/new/'
    
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

kil = KilimallScraper.new()
kil.get_category_urls