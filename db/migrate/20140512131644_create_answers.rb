class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body


      t.timestamps
    end
    add_column :answers, :question_id, :integer
    add_index :answers, :question_id
  end
end
