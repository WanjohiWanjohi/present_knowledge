require 'nokogiri'
require 'open-uri'
require 'pry'

class JumiaScraper 
    attr_accessor :urls
    
    vendor = "Jumia"
    DOMAIN_NAME = 'https://www.jumia.co.ke/'
    
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
            get_pages(category_url, category_name)
        end
    end

    def get_pages(page_url, category_name)
        page = Nokogiri::HTML(open(page_url))
        next_page_element = page.xpath("//a[contains(@aria-label, 'Next Page')]")
        next_page_url = next_page_element.attribute('href').value
        if !next_page_url.nil?
            next_page_url  = construct_url(next_page_url)
            parse_category_products(next_page_url, category_name)
        end
    end

    def parse_category_products(url, category_name)
        
        page = Nokogiri::HTML(open(url))
        product_cards = page.css(".aim .card .core")
        product_cards.each do |product_card|
            href = product_card.attributes['href'].value
            categories = product_card.attributes['data-category'].value
            # # # TODO: Split categories using the /
            product_id = product_card.attributes['data-id'].value

            product_image_section  = product_card.css('.img-c')
            image_url = parse_product_image(product_image_section)
            
            product_info_section = product_card.css('.info')
            product_info = parse_product_info(product_info_section)

            #TODO: add to product_details (add to cart link)cd
            # product = {}
            product = Product.new
            prod = prod.create(product_id:product_info[:name], product_name:product_info[:name])

        end
    end
    
    def parse_product_image(html_section)
        html_section.children.attribute('data-src').value
    end
    
    def parse_product_info(html_section)
        
        product_info = {}
        product_info[:name] = html_section.children.children[1]
        product_info[:price_effective] = html_section.children.children[2]
        product_info[:price_full] = html_section.children.children[3].children[0].to_s
        return product_info
    end
    
    
    def construct_url(url)
        if url.start_with?("https")
            return url
        elsif url.start_with?("/")
                url[0] = ''
            return DOMAIN_NAME + url
        end
    end
end

jum = JumiaScraper.new
jum.get_category_urls