class ProductsController < ApplicationController
    skip_before_action :protect_pages, only: [:index, :show]
    def index
      @categories = Category.order(name: :asc).load_async     
      @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 8)
    end

    def show
       product 
    end

    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
    
        if @product.save
          redirect_to products_path, notice: t('.created')
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit      
        approved! product # product.user_id == Currebt.user.id
    end
    
    def update       
        approved! product
        if product.update(product_params)
          redirect_to products_path, notice:  t('.updated')
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        approved! product
        product.destroy
    
        redirect_to products_path, notice: t('.destroyed'), status: :see_other
    end

      private
    
      def product_params
        params.require(:product).permit(:title, :description, :price, :image, :category_id)
      end

      def product_params_index
        params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :favorites, :user_id)
      end

      def product
        @product ||= Product.find(params[:id])
      end
    
  end