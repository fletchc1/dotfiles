sh -c "if amixer get Capture,0 | grep -q '\[on\]' ; then amixer -q set Capture,0 nocap ; else amixer -q set Capture,0 cap; fi"

