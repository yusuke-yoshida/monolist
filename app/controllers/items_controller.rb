class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show, :want_users, :have_users]

  def new
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
    end
  end

  def show
  end
  
  def wanting
    @want_users = @item.want_users
  end

  def haveing
    @have_users = @item.have_users
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
