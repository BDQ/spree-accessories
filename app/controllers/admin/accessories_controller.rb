class Admin::AccessoriesController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available, :remove]
  
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
end
