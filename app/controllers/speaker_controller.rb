class SpeakerController < ApplicationController
  def index
    @speak=Speaker.all
    @speak_id=Array.new
    @tracker=Array.new
    @speak.each do |s|
      @speak_id<<s.id
    end
    @speaker_track=TrackSpeaker.find_all_by_speaker_id(@speak_id)
    @speaker_track.each do |s|
      @tracker<<s.track_id
    end

     @track_name=Track.find(@tracker)

  end
end


