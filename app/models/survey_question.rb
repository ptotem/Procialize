class SurveyQuestion < ActiveRecord::Base
  attr_accessible :option_a, :option_b, :option_c, :option_d, :quest

  has_many :survey_answers,:dependent => :destroy
end
