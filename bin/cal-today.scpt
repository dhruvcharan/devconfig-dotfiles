set today to (current date)
set time of today to 0
set tomorrow to today + (24 * 60 * 60)
tell application "Calendar"
  set allEvents to {}
  repeat with cal in calendars
    set theEvents to (every event of cal whose start date is greater than or equal to today and start date is less than tomorrow)
    repeat with evt in theEvents
      copy (summary of evt & " | " & (time string of (get start date of evt))) to end of allEvents
    end repeat
  end repeat
  return allEvents
end tell