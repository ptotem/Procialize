class NoirQuiz < ActiveRecord::Base
  attr_accessible :noir_answer, :noir_question, :user_id
end
