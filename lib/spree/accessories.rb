module Spree #:nodoc:
  module Accessories    
    private
    def add_accessories_tab
      @product_extensions << {:name => 'Accessories', :url => "selected_admin_product_accessories_url"}
    end
  end
end