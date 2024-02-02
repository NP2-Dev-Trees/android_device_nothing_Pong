#!/vendor/bin/sh

setprop dylanakp.script.started 1
until [[ "$(getprop gsm.sim.state)" != "" ]]; do
  sleep 1
  setprop dylanakp.gsm.last.state "$(getprop gsm.sim.state)"
done
setprop dylanakp.gsm.after.state "$(getprop gsm.sim.state)"

sleep 3
output1=$(service call phone 187 i32 0 i32 0)
setprop dylanakp.service.call.off "$output1"

sleep 2
output2=$(service call phone 187 i32 0 i32 1)
setprop dylanakp.service.call.on "$output2"

setprop dylanakp.script.finished 1
