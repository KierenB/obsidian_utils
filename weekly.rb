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

weekly_template = <<~WEEKLY
  # #{this_week}
  #{links}
  links: [[#{(today-7).strftime('%G-wk%V')}|last week]] | [[#{(today+7).strftime('%G-wk%V')}|next week]] | [[+000 Index|index]]
  days: [[#{this_week_monday.strftime('%Y%m%d')}|Mon]] | [[#{this_week_monday.next_day.strftime('%Y%m%d')}|Tue]] | [[#{this_week_monday.next_day(2).strftime('%Y%m%d')}|Wed]] | [[#{this_week_monday.next_day(3).strftime('%Y%m%d')}|Thu]] | [[#{this_week_monday.next_day(4).strftime('%Y%m%d')}|Fri]] | [[#{this_week_monday.next_day(5).strftime('%Y%m%d')}|Sat]] | [[#{this_week_monday.next_day(6).strftime('%Y%m%d')}|Sun]]
  tags: #weekly-note

  --- 

  ## Top priorities
  1. 
  2. 
  3. 
    
  ## Last week [[#{(today-7).strftime('%G-wk%V')}]]
  ### Tasks:
  - Add meetings from last week to contacts and events
  - Make sure all [[TODO]] items have been transferred into Things
  - Conduct weekly review [[202007231243 Weekly review process]]
    
  ### Biggest wins:
  - 

  ### How far did you get on last week's big 3?
  1. 
  2. 
  3. 

  ### What worked? What didn't?
  - 

  ### What will you keep, improve, start, or stop based on the above?
  - 
WEEKLY

unless File.exist?("#{filepath}#{week_filename}") 
  File.open("#{filepath}#{week_filename}", 'w') { |f| f.write "#{weekly_template}" }
  puts "Wrote weekly template to #{filepath}#{week_filename}"
end