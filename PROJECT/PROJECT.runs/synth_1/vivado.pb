
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/samridh/PROJECT/PROJECT.srcs/utils_1/imports/synth_1/OV7670_top_verilog.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2V
TC:/Users/samridh/PROJECT/PROJECT.srcs/utils_1/imports/synth_1/OV7670_top_verilog.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
n
Command: %s
53*	vivadotcl2=
;synth_design -top OV7670_top_verilog -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
�The '%s' target of the following IPs are stale, please generate the output products using the generate_target or synth_ip command before running synth_design.
%s160*	vivadotcl2
	Synthesis2U
SC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
Z4-393h px� 
�
IP '%s' is locked:
%s
1260*coregen2
blk_mem_gen_02�
* Current project part 'xc7a100tcsg324-1' and the part 'xc7k70tfbv676-1' used to customize the IP 'blk_mem_gen_0' do not match.Z19-2162h px�
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
13924Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:09 . Memory (MB): peak = 1056.984 ; gain = 469.785
h px� 
�
synthesizing module '%s'%s4497*oasys2
OV7670_top_verilog2
 2L
HC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/OV7670_top_verilog.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

debounce2
 2B
>C:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/debounce.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

debounce2
 2
02
12B
>C:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/debounce.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
vga2
 2=
9C:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/vga.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
vga2
 2
02
12=
9C:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/vga.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
blk_mem_gen_02
 2f
bC:/Users/samridh/PROJECT/PROJECT.runs/synth_1/.Xil/Vivado-8804-PCSAM/realtime/blk_mem_gen_0_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
blk_mem_gen_02
 2
02
12f
bC:/Users/samridh/PROJECT/PROJECT.runs/synth_1/.Xil/Vivado-8804-PCSAM/realtime/blk_mem_gen_0_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ov7670_capture_verilog2
 2P
LC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/ov7670_capture_verilog.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ov7670_capture_verilog2
 2
02
12P
LC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/ov7670_capture_verilog.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ov7670_controller_verilog2
 2S
OC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/ov7670_controller_verilog.v2
28@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
ov7670_registers_verilog2
 2R
NC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/ov7670_registers_verilog.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ov7670_registers_verilog2
 2
02
12R
NC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/ov7670_registers_verilog.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
i2c_sender_verilog2
 2L
HC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/i2c_sender_verilog.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
i2c_sender_verilog2
 2
02
12L
HC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/i2c_sender_verilog.v2
28@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ov7670_controller_verilog2
 2
02
12S
OC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/ov7670_controller_verilog.v2
28@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
clocking_verilog2
 2J
FC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/clocking_verilog.v2
28@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
clocking_verilog2
 2
02
12J
FC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/clocking_verilog.v2
28@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
OV7670_top_verilog2
 2
02
12L
HC:/Users/samridh/PROJECT/PROJECT.srcs/sources_1/new/OV7670_top_verilog.v2
38@Z8-6155h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[7]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[6]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[5]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[4]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[3]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[2]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[1]2
i2c_sender_verilogZ8-7129h px� 
z
9Port %s in module %s is either unconnected or has no load4866*oasys2
id[0]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[7]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[6]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[5]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[4]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[3]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[2]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[1]2
i2c_sender_verilogZ8-7129h px� 
|
9Port %s in module %s is either unconnected or has no load4866*oasys2	
rega[0]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[7]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[6]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[5]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[4]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[3]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[2]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[1]2
i2c_sender_verilogZ8-7129h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2

value[0]2
i2c_sender_verilogZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1167.906 ; gain = 580.707
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1167.906 ; gain = 580.707
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 1167.906 ; gain = 580.707
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0042

1167.9062
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2n
jc:/Users/samridh/PROJECT/PROJECT.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2
fb1	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2n
jc:/Users/samridh/PROJECT/PROJECT.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2
fb1	8Z20-847h px� 

Parsing XDC File [%s]
179*designutils2>
:C:/Users/samridh/PROJECT/PROJECT.srcs/constrs_1/new/ov.xdc8Z20-179h px� 
�
No nets matched '%s'.
507*	planAhead2
OV7670_PCLK_IBUF2>
:C:/Users/samridh/PROJECT/PROJECT.srcs/constrs_1/new/ov.xdc2
718@Z12-507h px�
�
Finished Parsing XDC File [%s]
178*designutils2>
:C:/Users/samridh/PROJECT/PROJECT.srcs/constrs_1/new/ov.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2<
:C:/Users/samridh/PROJECT/PROJECT.srcs/constrs_1/new/ov.xdc2&
$.Xil/OV7670_top_verilog_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2<
:C:/Users/samridh/PROJECT/PROJECT.srcs/constrs_1/new/ov.xdc2&
$.Xil/OV7670_top_verilog_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1252.6882
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0082

1252.6882
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 1252.688 ; gain = 665.488
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 1252.688 ; gain = 665.488
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 1252.688 ; gain = 665.488
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
iRegister %s driving address of a ROM cannot be packed in BRAM/URAM because of presence of initial value.
4359*oasys2
address_reg_repZ8-6040h px� 
v
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
i2c_sender_verilogZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                                0 |                            00000
h p
x
� 
y
%s
*synth2a
_                   START |                                1 |                            00001
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2
i2c_sender_verilogZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:18 ; elapsed = 00:00:21 . Memory (MB): peak = 1252.688 ; gain = 665.488
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 3     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               19 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 19    
h p
x
� 
&
%s
*synth2
+---ROMs : 
h p
x
� 
>
%s
*synth2&
$	                    ROMs := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   4 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 10    
h p
x
� 
F
%s
*synth2.
,	  36 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
x
+design %s has port %s driven by constant %s3447*oasys2
OV7670_top_verilog2
OV7670_RESET2
1Z8-3917h px� 
w
+design %s has port %s driven by constant %s3447*oasys2
OV7670_top_verilog2
OV7670_PWDN2
0Z8-3917h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:24 . Memory (MB): peak = 1252.688 ; gain = 665.488
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:32 ; elapsed = 00:00:37 . Memory (MB): peak = 1362.270 ; gain = 775.070
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:32 ; elapsed = 00:00:37 . Memory (MB): peak = 1362.492 ; gain = 775.293
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:32 ; elapsed = 00:00:37 . Memory (MB): peak = 1391.145 ; gain = 803.945
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |blk_mem_gen_0 |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
7
%s*synth2
+------+------------+------+
h px� 
7
%s*synth2
|      |Cell        |Count |
h px� 
7
%s*synth2
+------+------------+------+
h px� 
7
%s*synth2
|1     |blk_mem_gen |     1|
h px� 
7
%s*synth2
|2     |BUFG        |     4|
h px� 
7
%s*synth2
|3     |CARRY4      |    15|
h px� 
7
%s*synth2
|4     |LUT1        |     8|
h px� 
7
%s*synth2
|5     |LUT2        |    13|
h px� 
7
%s*synth2
|6     |LUT3        |    15|
h px� 
7
%s*synth2
|7     |LUT4        |    10|
h px� 
7
%s*synth2
|8     |LUT5        |    15|
h px� 
7
%s*synth2
|9     |LUT6        |    21|
h px� 
7
%s*synth2
|10    |FDRE        |   206|
h px� 
7
%s*synth2
|11    |IBUF        |    15|
h px� 
7
%s*synth2
|12    |OBUF        |    19|
h px� 
7
%s*synth2
|13    |OBUFT       |     1|
h px� 
7
%s*synth2
+------+------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:42 ; elapsed = 00:00:47 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 4 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:32 ; elapsed = 00:00:45 . Memory (MB): peak = 1588.758 ; gain = 916.777
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:42 ; elapsed = 00:00:48 . Memory (MB): peak = 1588.758 ; gain = 1001.559
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0082

1597.9382
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
15Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1601.5742
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

9d1d014bZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
422
312
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:492

00:01:212

1601.5742

1220.023Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0102

1601.5742
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2F
DC:/Users/samridh/PROJECT/PROJECT.runs/synth_1/OV7670_top_verilog.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2o
mreport_utilization -file OV7670_top_verilog_utilization_synth.rpt -pb OV7670_top_verilog_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Jun 22 17:45:36 2025Z17-206h px� 


End Record