jum = JumiaScraper.new
product = jum.get_category_urls
Product.create_product(product)