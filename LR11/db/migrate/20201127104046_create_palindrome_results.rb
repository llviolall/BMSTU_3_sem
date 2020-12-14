class CreatePalindromeResults < ActiveRecord::Migration[6.0]
  def change
    create_table :palindrome_results do |t|
      t.integer :num
      t.text :result

      t.timestamps
    end
  end
end
