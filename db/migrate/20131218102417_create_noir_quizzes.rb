class CreateNoirQuizzes < ActiveRecord::Migration
  def change
    create_table :noir_quizzes do |t|
      t.integer :user_id
      t.string :noir_answer
      t.string :noir_question

      t.timestamps
    end
  end
end
