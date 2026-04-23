on run argv
  set theTitle to item 1 of argv
  set startTimeStr to item 2 of argv
  
  set theDate to (current date)
  set AppleScript's text item delimiters to ":"
  set theHours to text item 1 of startTimeStr
  set theMinutes to text item 2 of startTimeStr
  set hours of theDate to theHours
  set minutes of theDate to theMinutes
  set seconds of theDate to 0
  set endDate to (theDate + (1 * 60 * 60))
  
  tell application "Calendar"
    try
      set targetCal to calendar "Work"
    on error
      make new calendar with properties {name:"Work"}
      set targetCal to calendar "Work"
    end try
    
    tell targetCal
      make new event with properties {summary:theTitle, start date:theDate, end date:endDate}
    end tell
  end tell
end run