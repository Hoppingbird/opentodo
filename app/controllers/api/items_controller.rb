class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    list = List.find(params[:list_id])
    items = list.items
    render json: items, each_serializer: ItemSerializer
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def complete
    item = Item.find(params[:id])
    if item.complete!
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

 private

  def item_params
    params.require(:item).permit(:name)
  end

end