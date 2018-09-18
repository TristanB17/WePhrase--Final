class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.text :body
      t.text :computer_translation
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
