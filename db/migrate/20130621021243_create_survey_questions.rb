class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.text :quest
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d

      t.timestamps
    end
  end
end
