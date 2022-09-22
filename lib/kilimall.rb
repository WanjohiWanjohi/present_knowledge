require 'nokogiri'
require 'open-uri'
require 'pry'
# require_relative '../app/models/product'

class KilimallScraper
    attr_accessor :urls , :products
    vendor = "Kilimall"
    DOMAIN_NAME = 'https://www.kilimall.co.ke/new/'
    def initialize
        @products =[]
    end
    def get_page
        page_content = Nokogiri::HTML(open(DOMAIN_NAME))
        page_content
    end

    def get_categories(page_content)
        category_urls_list = []
        category_urls = page_content.xpath("//div[contains(@class, 'memo_div')]//div[contains(@class, 'content')]//a/@href").each do |url|
            category_urls_list << url.value.to_s
        end
        category_urls_list.each do |cat_url|
            full_url = construct_url(cat_url)
            parse_category_products(full_url)
        end
    end

    def parse_category_products(url)
        product_item = {}
        category_content = Nokogiri::HTML(open(url))

        product_card  = category_content.at_xpath("//div[contains(@class, 'el-col-6')]")
        binding.pry
        product_card.each do |prod|
            binding.pry
            product_href = prod.at_xpath("./a/@href").to_s
            product_item[:product_href] = construct_url(product_href)
            product_item[:price_effective] = prod.at_xpath("./div[contains(@class, 'wordwrap-price')]/span[1]/text()").to_s
            product_item[:price_full] = prod.at_xpath("./div[contains(@class, 'wordwrap-price')]/span[2]/text()")
            product_item[:product_image] = prod.at_xpath("./a//img/@src")
            product_item[:product_name] = prod.at_xpath("./a//img/@alt")
            @products << product_item
        end
        binding.pry
#TODO: Add pagination
    end

    
    def construct_url(url)
        if url.start_with?("/new/")
            return "https://www.kilimall.co.ke" + url 
        end
    end
end


kil = KilimallScraper.new()
content = kil.get_page
kil.get_categories(content)