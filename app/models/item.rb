class Item < ActiveRecord::Base
  belongs_to :list

  def complete!
    update_attribute(:completed, true)
  end
end
