# Notes

Want to start by figuring out how to get mute state from Zoom and control it.

Started with https://gist.github.com/tyhawkins/66d6f6ca8b3cb30c268df76d83020a64, which is an AppleScript to determine if Zoom is muted by looking at available items in menus. When the menu item is "Mute audio", we infer the current state is "Unmuted"; when the menu item is "Unmute audio" we infer the current state is "Muted".

When running this script, macOS will prompt you to enable assistive access.

Open System Preferences -> Security and Privacy -> Privacy tab. Select "Accessibility" in the left-hand panel and check the box for "Script Editor" and "Terminal" (or whatever application you are using to run the script).

```
error "System Events got an error: Script Editor is not allowed assistive access." number -25211
is_muted.scpt:155:233: execution error: System Events got an error: osascript is not allowed assistive access. (-25211)
```

When I run this script in a loop from Ruby, CPU usage of Terminal spikes to 100%. The ruby script is sleeping and it shows low CPU usage. Not sure what's going on here.

I know that Zoom creates a custom audio device (`ZoomAudioDevice` when running `system_profiler SPAudioDataType`). I wonder if we can use that to determine mute state at a lower level.