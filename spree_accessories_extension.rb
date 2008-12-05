# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SpreeAccessoriesExtension < Spree::Extension
  version "1.0"
  description "Add Accessories to Products"
  url "http://yourwebsite.com/spree_accessories"

  def activate
    # admin.tabs.add "Spree Accessories", "/admin/spree_accessories", :after => "Layouts", :visibility => [:all]
    
    Product.class_eval do
      has_and_belongs_to_many :accessories, :class_name => "Product", :join_table => "accessories" , :association_foreign_key => "accessory_product_id"
    end
    
    # register Accessories product tab
    Admin::ProductsController.class_eval do
      include Spree::Accessories
      before_filter :add_accessories_tab
    end
    # register Accessories product tab
    Admin::VariantsController.class_eval do
      include Spree::Accessories
      before_filter :add_accessories_tab
    end
    # register Accessories product tab
    Admin::OptionTypesController.class_eval do
      include Spree::Accessories
      before_filter :add_accessories_tab
    end
    # register Accessories product tab
    Admin::ProductPropertiesController.class_eval do
      include Spree::Accessories
      before_filter :add_accessories_tab
    end
    # register Accessories product tab
    Admin::TaxonsController.class_eval do
      include Spree::Accessories
      before_filter :add_accessories_tab
    end
  end
end