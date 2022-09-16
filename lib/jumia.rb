require 'nokogiri'
require 'open-uri'
require 'pry'

class JumiaScraper 
    attr_accessor :urls, :product_details
    def initialize
        @product_details = []
    end 
    vendor = "Jumia"
    DOMAIN_NAME = 'https://www.jumia.co.ke/'
   
  
    def get_page
        page = Nokogiri::HTML(open(DOMAIN_NAME))
        return page
    end

    def get_categories
        categories =[]
        all_categories = get_page.css("a[role='menuitem']")
        all_categories.each do | category|
           categories << category["href"].to_s
        end
        @urls = categories
    end

    def get_category_urls
        @urls.each do | category|
            category_url = construct_url(category.to_s)
            get_pages(category_url)
        end
    end

    def get_pages(page_url)
        if !page_url.nil?
            page = Nokogiri::HTML(open(page_url))

            next_page_element = page.xpath("//a[contains(@aria-label, 'Next Page')]")
            next_page_url = next_page_element.attribute('href').value
            unless next_page_url.nil?
                next_page_url  = construct_url(next_page_url)
                parse_category_products(next_page_url)
            end
        end
       
    end

    def parse_category_products(url)
        
        page = Nokogiri::HTML(open(url))
        product_cards = page.css(".aim .card .core")
        product_cards.each do |product_card|
            product_info = {}
            product_info[:href] = construct_url(product_card.xpath("//@href")[0].value.to_s)
            product_info[:categories] = product_card.attributes['data-category']&.value.to_s
            # # # TODO: Split categories using the /
            product_info[:product_id] = 'jumia_' + product_card.attributes['data-id']&.value.to_s

            product_image_section  = product_card.css('.img-c')
            product_info[:image_url] = parse_product_image(product_image_section).to_s
            
            product_info_section = product_card.css('.info')
            parse_product_info(product_info_section , product_info)
        end
    end
    
    def parse_product_image(html_section)
        url = html_section&.children.attribute('data-src')&.value
       
    end
    
    def parse_product_info(html_section, product_info)
        product_info[:name] = html_section.at_xpath("//h3/text()")
        product_info[:price_effective] = html_section.at_xpath("//div[@class='prc']/text()")
        product_info[:price_full] = html_section.at_xpath("//div[@class='prc']//div[@class='old']/text()")
        @product_details << product_info
    end
    
    
    def construct_url(url)
        if url.start_with?("https") && !url.nil?
            return url
        elsif url.start_with?("/") && !url.nil?
                url[0] = ''
            return DOMAIN_NAME + url
        end
    end
end