class ProductsController < ApplicationController
	def index
		@products = Product.latest
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to products_path
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		@product.save
		redirect_to products_path
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to :back
	end

	private
		def product_params
			params.require(:product).permit(:id, :title, :description, :price, :category_id, :status, :user_id)
		end
end