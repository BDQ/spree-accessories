# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class AccessoriesExtension < Spree::Extension
  version "1.0"
  description "Add Accessories to Products"
  url "http://yourwebsite.com/spree_accessories"

  def activate
    # admin.tabs.add "Spree Accessories", "/admin/spree_accessories", :after => "Layouts", :visibility => [:all]
    
    Product.class_eval do
      has_and_belongs_to_many :accessories, :class_name => "Product", :join_table => "accessories" , :association_foreign_key => "accessory_product_id"
    end
    
    # register Accessories product tab
    Admin::BaseController.class_eval do
      before_filter :add_accessories_tab
      
      private
      def add_accessories_tab
        @product_admin_tabs << {:name => t('accessories'), :url => "selected_admin_product_accessories_url"}
      end
    end
 
  end
end