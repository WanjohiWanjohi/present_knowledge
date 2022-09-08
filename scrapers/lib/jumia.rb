require 'nokogiri'
require 'open-uri'
require 'pry'

class JumiaScraper
    attr_accessor :urls
    DOMAIN_NAME = 'https://www.jumia.co.ke'
    
    def get_page
        page = Nokogiri::HTML(open(DOMAIN_NAME))
    end

    def get_categories
        categories ={}
        all_categories = get_page.css("a[role='menuitem']")
        all_categories.each do | category|
            categories[category.text.to_sym ] = category["href"]
        end
        @urls = categories
        return categories
    end

    def get_category_urls
        get_categories.each do | category|
            category_name = category[0].to_s
            category_url = construct_url(category[1].to_s)
            parse_category_products(url, category_name)
            binding.pry
        end
    end

    def parse_category_products(url, category_name)

    end

    def construct_url(url)
        if url.start_with?("https")
            return url
        else
            return DOMAIN_NAME + url
        end
    end
end

jum = JumiaScraper.new()
jum.get_category_urls