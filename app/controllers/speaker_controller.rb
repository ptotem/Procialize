class SpeakerController < ApplicationController
  def index
    @speak=Speaker.all
  end
end


