import requests
from bs4 import BeautifulSoup
import json

import re

BASE_URL = "https://www.vpcentrum.eu/soucastky-nahradni-dily/feritova-jadra/koralky-s-feritem"
MAX_PAGES = 31

def scrape_products(url):
    products = []
    page = 1
    try:

        while True:
            print("Parsing page: " + str(page))
            response = requests.get(url, params={'page': page})

            # div_content = '<div class="nameprod"><a href="https://www.vpcentrum.eu/soucastky-nahradni-dily/rele-mix/rele-spinaci-12v-40a-1" title="relé spínací 12V 40A ">relé spínací 12V 40A </a></div>'
            pattern = r'<a href="(https://www.vpcentrum.eu/[^"]+)" title="([^"]+)">'
            for match in re.findall(pattern, response.content.decode('utf-8')):
                href, title = match
                any_products = True;
                print(title, href)
                products.append({
                    'title': title,
                    'url':  href
                })
            # soup = BeautifulSoup(response.content, 'html.parser')

            # any_products = False;
            # for product_list in soup.select('.product-list'):
            #     for product in product_list.select('.nameprod a'):
            #         any_products = True;
            #         products.append({
            #             'title': product['title'],
            #             'url': product['href']
            #         })

            if any_products:
                page += 1
            else:
                print("No products found on this page! We are done here...")
                break

            if page > MAX_PAGES:
                break;

    except Exception as e:
        print(f"An error occurred: {e}")

    return products


def save_to_json(data, filename):
    with open(filename, 'w', encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)


# URL of the first page to scrape
products = scrape_products(BASE_URL)
save_to_json(products, 'litomerice_products.json')
