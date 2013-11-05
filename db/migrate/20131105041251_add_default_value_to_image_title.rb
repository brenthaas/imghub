class AddDefaultValueToImageTitle < ActiveRecord::Migration
  def change
    change_column :images, :title, :string, :limit => 255, :null => false, :default => ''
  end
end
