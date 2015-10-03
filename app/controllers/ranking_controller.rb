class RankingController < ApplicationController
    
    def index
    end
    
    def want
        @item_id = Want.group(:item_id).order("count_item_id desc").limit(10).count(:item_id).keys
        @items = Item.find(@item_id).sort_by {|item| @item_id.index(item.id) }
    end
    
    def have
        @item_id = Have.group(:item_id).order("count_item_id desc").limit(10).count(:item_id).keys
        @items = Item.find(@item_id).sort_by {|item| @item_id.index(item.id) }
    end
end
