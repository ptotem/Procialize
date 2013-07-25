class SurveyAnswer < ActiveRecord::Base
  attr_accessible :ans, :survey_question_id, :user_id

  belongs_to :survey_question
end
