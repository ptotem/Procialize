module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  # custom options for this calendar
  def event_calendar_opts
    {
        :year => @year,
        :month => @month,
        :event_strips => @event_strips,
        :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
        :previous_month_text => "<< " + month_link(@shown_month.prev_month),
        :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def meeting_calendar_opts
    {
        :year => @year,
        :month => @month,
        :event_strips => @event_strips,
        :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
        :previous_month_text => "<< " + month_link(@shown_month.prev_month),
        :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options

    calendar event_calendar_opts do |args|
      event = args[:events]

      %(<a href="/events/#{event.id}/#{event.event_day}" title="#{h(event.event_day)}">#{h(event.event_day)}</a>)
      #%(<a href="/meetings/#{event.id}" title="#{h(event.meeting_name)}">#{h(event.meeting_name)}</a>)
    end
    #calendar meeting_calendar_opts do |args|
    #  meeting = args[:meeting]
    #  %(<a href="/meetings/#{meeting.id}" title="#{h(meeting.meeting_name)}">#{h(meeting.meeting_name)}</a>)
    #end
  end

  #def meeting_calendar
  #  # args is an argument hash containing :event, :day, and :options
  #  calendar meeting_calendar_opts do |args|
  #    meeting = args[:meeting]
  #    %(<a href="/meetings/#{meeting.id}" title="#{h(meeting.name)}">#{h(meeting.name)}</a>)
  #  end
  #end

end
