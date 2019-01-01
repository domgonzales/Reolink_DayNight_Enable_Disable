#!/bin/bash


APITOKEN=`curl -sk -X POST http://camera.ip.address.xxx/cgi-bin/api.cgi?cmd=Login -d '[{"cmd":"Login","action":0,"param":{"User":{"userName":"USERNAME_GOES_HERE","password":"PASWORD_GOES_HERE"}}}]' | jq -r '.[] | .value | .Token | .name'`
#echo "$APITOKEN"
curl -sk  -H "Content-Type: application/json" -X POST "http://camera.ip.address.xxx/cgi-bin/api.cgi?cmd=SetIsp&token=$APITOKEN" -d '[{"cmd":"SetIsp","action":0,"param":{"Isp":{"channel":0,"antiFlicker":"60HZ","exposure":"Auto","gain":{"min":1,"max":62},"shutter":{"min":0,"max":125},"blueGain":128,"redGain":128,"whiteBalance":"Auto","dayNight":"Auto","backLight":"DynamicRangeControl","blc":128,"drc":79,"rotation":0,"mirroring":0,"nr3d":1}}}]' > /dev/null 2>&1
