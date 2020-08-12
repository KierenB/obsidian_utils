#!/usr/bin/env ruby
require 'date'

filepath = "#{ENV['HOME']}/Documents/Notes/journals/"
today = Date.today
filename = today.strftime('%Y%m%d.md')
last_year = today.prev_year.strftime('%Y%m%d')
this_week = today.strftime('%G-wk%V')
this_week_monday = today - (today.cwday-1)
week_filename = this_week + '.md'
yesterday = today.prev_day.strftime('%Y%m%d')
tomorrow = today.next_day.strftime('%Y%m%d')
links = "links: [[+100 Projects MOC|P]][[+200 Areas MOC|A]][[+300 Resources MOC|R]][[+400 Archive|A]] | [[+000 Index|index]] | [[+000 Calendar|calendar]]"\
"\n"\
"\n"\
"---"

weather_raw = `curl -s https://weather.gc.ca/rss/city/ab-52_e.xml`
today_weather_raw = weather_raw.split('<entry>').slice(3..4).join
today_weather_list = today_weather_raw.scan(/.*<title>(.*)<\/title>/).flatten

journal_template = <<~JOURNAL
  #{links}
  # #{today.strftime('%A %b %d, %Y')}
  links: [[#{yesterday}|yesterday]] | [[#{tomorrow}|tomorrow]] | [[#{this_week}|this week]] | [[+000 Index|index]]
  tags: #daily-note

  --- 

  ## Weather
  #{today_weather_list[0]}
  #{today_weather_list[1]}

  --- 

  ## Planned actions
  - 

  ## Calls
  - 

  ## Notes and actions from today
  - 
JOURNAL

File.open("#{filepath}#{filename}", 'a') { |f| f.write "#{journal_template}" }

puts "Wrote daily template to #{filepath}#{filename}"