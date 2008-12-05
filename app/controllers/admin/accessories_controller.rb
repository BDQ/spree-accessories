class Admin::AccessoriesController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available, :remove]
  before_filter :initialize_product_extensions  
  before_filter :add_accessories_tab
  
  belongs_to :product

  def selected
    @accessories = @product.accessories
  end
  
  def available
    if params[:q].blank?
      @available_accessories = []
    else
      @available_accessories = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_accessories.delete_if { |accessory| @product.accessories.include?(accessory) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end
 
  
  def remove
    @product.accessories.delete(@accessory)
    @product.save
    @accessories = @product.accessories
    render :layout => false
  end  
  
  def select
    @product = Product.find_by_param!(params[:product_id])
    accessory = Product.find_by_permalink(params[:id])
    @product.accessories << accessory
    @product.save
    @accessories = @product.accessories
    render :layout => false
  end

  private 
    def add_accessories_tab
      @product_extensions << {:name => 'Accessories', :url => "selected_admin_product_accessories_url"}
    end
end
