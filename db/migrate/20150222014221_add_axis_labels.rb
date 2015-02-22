class AddAxisLabels < ActiveRecord::Migration
  def change
    add_column :graphs, :x_axis_label, :string
    add_column :graphs, :y_axis_label, :string
  end
end
