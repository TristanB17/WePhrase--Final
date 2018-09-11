class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.text :output
      t.references :user, foreign_key: true
      t.references :phrase, foreign_key: true
      t.text :computer_translation

      t.timestamps
    end
  end
end
