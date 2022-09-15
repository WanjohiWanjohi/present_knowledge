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
        return page_content
        # rescue => e
        # puts (e.class.inspect)
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

        product_card  = category_content.xpath("//div[contains(@class, 'el-col-6')]")
        product_card.each do |prod|
            product_href = prod.xpath("//a/@href")
            product_item[:product_href] = construct_url(product_href)
            product_item[:price_effective] = prod.xpath("//div[contains(@class, 'wordwrap-price')]/span[1]/text()")
            product_item[:price_full] = prod.xpath("//div[contains(@class, 'wordwrap-price')]/span[2]/text()")
            product_item[:product_image] = prod.xpath("//a//img/@src")
            product_item[:product_name] = prod.xpath("//a//img/@alt")
            return product_item
        end

    end
    
    def parse_product_image
    end
    
    def parse_product_info
    end
    
    
    def construct_url(url)
        if url.start_with?("/new/")
            return "https://www.kilimall.co.ke" + url 
        end
    end
end