# Reolink_DayNight_Enable_Disable

A simple set of bash scripts to grab an API Key from Reolink Cameras and Enable/Disable Auto Day Night Mode

I couldn't let the camera handle this function anymore after I installed new lighting that caused the Audo Day Night mode to say in Day mode. This isn't a problem with the camera, but with the new lighting.

Since I wanted to force the Black&White mode from SunSet and re-enable the Auto (color) Mode for during the day. 
I tested this with curl first and then added my curl commands to a bash script calling the token for auth.

Once I had the scripts working I moved them over to Home-Assistant to manage the automations for turning the Day Night mode on/off. 
(you can put the files anywhere as long as homeassistant can get to them)

I used the Shell Command and added this to my configuration.yaml:

shell_command:
  daynighton: sh /home/homeassistant/.homeassistant/customscripts/daynighton.sh
  daynightoff: sh /home/homeassistant/.homeassistant/customscripts/daynightoff.sh
  
  I then created two automations for sunset and sunrise through the Web UI.
  Here is what they look like in the automations.yaml file:
    
  - id: '1546242767080'
  alias: Driveway Camera Daynight Off
  trigger:
  - event: sunset
    platform: sun
  condition: []
  action:
  - alias: ''
    data: {}
    service: shell_command.daynightoff
- id: '1546242822471'
  alias: Driveway Camera Day Night On
  trigger:
  - event: sunrise
    platform: sun
  condition: []
  action:
  - service: shell_command.daynighton
