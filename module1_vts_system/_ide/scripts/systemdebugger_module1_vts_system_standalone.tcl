# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/thayer/workspace/module1_vts_system/_ide/scripts/systemdebugger_module1_vts_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/thayer/workspace/module1_vts_system/_ide/scripts/systemdebugger_module1_vts_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AF242FA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AF242FA-13722093-0"}
fpga -file /home/thayer/workspace/module1_vts/_ide/bitstream/module1_hw_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/thayer/workspace/module1_hw_wrapper/export/module1_hw_wrapper/hw/module1_hw_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/thayer/workspace/module1_vts/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/thayer/workspace/module1_vts/Debug/module1_vts.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
