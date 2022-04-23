on run argv

  set link to item 1 of argv
  tell application "System Events"
    set Chrome to the front window of application process "Google Chrome"
    set iTerm to the front window of application process "iTerm2"

    set dockProperties to properties of dock preferences
    set dockWidth to 50
    
    get the size of scroll area 1 of application process "Finder"
    set Display to {width:item 1, height:item 2} of the result
    
    set position of iTerm to [dockWidth, 0]
    set size of iTerm to [the Display's width, the Display's height]
    
    set [_w, _h] to the size of iTerm
    set [_x, _y] to the position of iTerm
    
    if ((link as string) is not equal to "close") then
      set position of Chrome to [_x + _w / 2, _y]
      set size of Chrome to [_w / 2, _h]
      
      set size of iTerm to [_w / 2, _h]
      
      tell application process "Google Chrome"
        open location link
        delay 1
        set frontmost to true
      end tell
      tell application process "iTerm2"
        delay 1
        set frontmost to true
      end tell
    end if
  end tell
end run
