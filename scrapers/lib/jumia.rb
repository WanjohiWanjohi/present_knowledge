require 'nokogiri'
require 'open-uri'

def get_page
    page = Nokogiri::HTML(open('https://www.jumia.co.ke/'))
end

def get_categories
    category_names = []
    category_urls = []
    all_categories = page_get_page.css("a[role='menuitem']")
    all_categories.each do | category|
        
    end
end