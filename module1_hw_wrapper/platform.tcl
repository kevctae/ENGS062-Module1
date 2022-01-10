# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/thayer/workspace/module1_hw_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/thayer/workspace/module1_hw_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {module1_hw_wrapper}\
-hw {/home/thayer/workspace/module1/module1_hw_wrapper.xsa}\
-out {/home/thayer/workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {module1_hw_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
bsp reload
domain active {zynq_fsbl}
bsp reload
platform generate
platform generate
platform active {module1_hw_wrapper}
domain active {standalone_ps7_cortexa9_0}
bsp reload
domain active {zynq_fsbl}
bsp reload
platform generate -domains 
platform active {module1_hw_wrapper}
domain active {standalone_ps7_cortexa9_0}
bsp reload
domain active {zynq_fsbl}
bsp reload
