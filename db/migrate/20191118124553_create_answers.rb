class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :quetion, index: true

      t.timestamps
    end
  end
end