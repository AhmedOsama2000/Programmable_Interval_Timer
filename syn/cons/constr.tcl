################################    Design Constraints   ################################
#########################################################################################
################################ 1- Define Paramaters    ################################
#########################################################################################

## Define Master Clock
set Master_CLK       wb_clk_i
set Design_CLK_Name  wb_clk_i

## Define Clock Period
set CLK_PER          1.25

## Define I/O Delay Ratios
set Max_In_Delay     0.25
set MAX_Out_Delay    0.25

set Min_In_Delay     0.15
set Min_Out_Delay    0.15

## Define I/O Delay
set Max_Input_Delay     [expr $CLK_PER * $Max_In_Delay]
set Max_Output_Delay    [expr $CLK_PER * $MAX_Out_Delay]

set Min_Input_Delay     [expr $CLK_PER * $Min_In_Delay]
set Min_Output_Delay    [expr $CLK_PER * $Min_Out_Delay]

## Define Clock uncertainties , Assume 5% of CLK period
set CLK_JITTER       0.05

## Define Environment Parameters (e.g. Load Cap 50ps)
## Assume Maximum Transition is 15% of CLK period
## Assume Input Transistion is 3% of CLK period (Both rise and Fall)
set Driving_Load     50.0
set MAX_Trans        0.15
set In_Trans_Delay   0.03

set max_trans_delay [expr $MAX_Trans      * $CLK_PER]
set In_Transition   [expr $In_Trans_Delay * $CLK_PER]

set Max_Fanout       10

#########################################################################################
################################ 2- Define Constraints   ################################
#########################################################################################

## Create Master Clock
create_clock -name $Master_CLK -period $CLK_PER [get_ports $Design_CLK_Name]

## Create Clock Uncertainities
set_clock_uncertainty -setup $CLK_JITTER        [get_clocks $Design_CLK_Name]

## I/O Delays
set_input_delay  -max $Max_Input_Delay \
                 -clock $Design_CLK_Name \
                 [remove_from_collection [all_inputs] [get_ports $Design_CLK_Name]]

set_output_delay -max $Max_Output_Delay \
                 -clock $Design_CLK_Name \
                 [all_outputs]

set_input_delay  -min $Min_Input_Delay  \
                 -clock $Design_CLK_Name \
                 [remove_from_collection [all_inputs] [get_ports $Design_CLK_Name]]


set_output_delay -min $Min_Output_Delay \
                 -clock $Design_CLK_Name \
                 [all_outputs]

## Load Constraints
set_load   $Driving_Load [all_outputs]

## Signals Transitions
set_input_transition    $In_Transition   [remove_from_collection [all_inputs] [get_ports {wb_clk_i wb_rst_i arst_i}  ]]
set_max_transition      $max_trans_delay [remove_from_collection [all_inputs] [get_ports {wb_clk_i wb_rst_i arst_i} ] ]

## Prevent the tool from optimizing Clock/reset signals
set_dont_touch_network [get_ports $Design_CLK_Name]
set_dont_touch_network [get_ports wb_rst_i]
set_dont_touch_network [get_ports arst_i]
