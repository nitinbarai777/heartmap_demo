class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
			t.string :name, :null => true
			t.string :code, :null => true
			t.string :image, :null => true
			t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
