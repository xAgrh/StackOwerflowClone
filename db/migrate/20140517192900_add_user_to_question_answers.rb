class AddUserToQuestionAnswers < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer
    add_column :answers, :user_id, :integer
    
    add_index :questions, :user_id
    add_index :answers, :user_id
    
    
  end
end
