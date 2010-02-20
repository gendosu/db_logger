class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %>, :id => false do |t|
      t.string :controller
      t.string :action
      t.string :method

      t.timestamps
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
