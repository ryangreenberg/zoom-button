#!/usr/bin/env ruby

# TODO: Poll frequency
# When zoom is not running/not in a meeting: every 10 seconds
# When zoom is in a meeting: every 100ms

state = nil
poll_delay_sec = 0.5

while true
  new_state = `osascript ./is_muted.scpt`
  if new_state != state
    state = new_state
    puts "Zoom is #{state}"
  end
  sleep poll_delay_sec
end
