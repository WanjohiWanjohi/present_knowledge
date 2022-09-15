require 'nokogiri'
require 'open-uri'
require 'pry'
# require_relative '../app/models/product'

class KilimallScraper
    attr_accessor :urls
    vendor = "Kilimall"
    DOMAIN_NAME = 'https://www.kilimall.co.ke/new/'
    
    def get_page
        page_content = Nokogiri::HTML(open(DOMAIN_NAME))
        get_categories(page_content)
    end

    def get_categories(page_content)
        categories 
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