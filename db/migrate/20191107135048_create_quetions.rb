class CreateQuetions < ActiveRecord::Migration[6.0]
  def change
    create_table :quetions do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
