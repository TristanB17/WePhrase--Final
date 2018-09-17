class AddSubjectsAndFocusToPhrases < ActiveRecord::Migration[5.2]
  def change
    add_column :phrases, :subject, :string
    add_column :phrases, :focus, :string
  end
end
