class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
			t.string :name, :null => true
			t.string :page_route, :null => true
			t.text :content
			t.boolean :is_active, :default => true
			t.references :language
      t.timestamps
    end
  end
end
