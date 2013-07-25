class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :survey_question_id
      t.integer :user_id
      t.string :ans

      t.timestamps
    end
  end
end
