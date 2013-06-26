class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
			t.string :title
			t.string :footer_text
			t.string :logo
			t.text :front_text
      t.timestamps
    end
  end
end
