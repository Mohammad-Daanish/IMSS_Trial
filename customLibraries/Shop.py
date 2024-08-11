from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __int__(self):
        self.SelLib = BuiltIn().get_library_instance("SeleniumLibrary")

    # Methods are used to derive user defined custom keywords

    @keyword
    def Hello_World(self):
        print("Hello To The Whole World")

    @keyword
    def add_multiple_card_for_checkout(self, Listofproducts):
        # ${elements}=    Get WebElements    css:.card-title
        i = 1
        products_titles = self.SelLib.get_webelements("css:.card-title")
        for productsTitle in products_titles:
            if productsTitle.text in Listofproducts:
                self.SelLib.click_button("xpath:(//div[@class='card-footer'])[" + str(i) + "]/button")
            i = i + 1

