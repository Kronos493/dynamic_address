class AddVariablesToZones < ActiveRecord::Migration
  def change
    add_column :zones, :variables, :hstore
  end
end
