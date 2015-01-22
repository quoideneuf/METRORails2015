class AddImpressionsTable < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.integer :hits
      t.datetime :time
    end
  end
end
