# Begin_DVE_Session_Save_Info
# DVE reload session
# Saved on Mon Jul 9 02:41:21 2018
# Designs open: 1
#   V1: /ws/rakeshku-bgl/fpga/vcdplus.vpd
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: 
#   Wave.1: 17 signals
#   Group count = 9
#   Group Group1 signal count = 0
#   Group Group2 signal count = 0
#   Group Group3 signal count = 0
#   Group Group4 signal count = 23
#   Group Group5 signal count = 21
#   Group Group6 signal count = 3
#   Group Group7 signal count = 21
#   Group Group8 signal count = 22
#   Group Group9 signal count = 17
# End_DVE_Session_Save_Info

# DVE version: N-2017.12-SP2
# DVE build date: Jun  5 2018 20:55:50


#<Session mode="Reload" path="/ws/rakeshku-bgl/fpga/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Reload
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all
gui_clear_window -type Wave
gui_clear_window -type List

# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

set TopLevel.1 TopLevel.1

# Docked window settings
set HSPane.1 HSPane.1
set Hier.1 Hier.1
set DLPane.1 DLPane.1
set Data.1 Data.1
set Console.1 Console.1
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 Source.1
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

set TopLevel.2 TopLevel.2

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 Wave.1
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 359} {child_wave_right 1101} {child_wave_colname 234} {child_wave_colvalue 121} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/ws/rakeshku-bgl/fpga/vcdplus.vpd}] } {
	gui_open_db -design V1 -file /ws/rakeshku-bgl/fpga/vcdplus.vpd -nosource
}
gui_set_precision 1s
gui_set_time_units 1s
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {packet_parser_top_tb.DUT.loop[2].packet_parser_top}
gui_load_child_values {packet_parser_top_tb.DUT.loop[3].packet_parser_top}
gui_load_child_values {packet_parser_top_tb.DUT.loop[0].packet_parser_top}
gui_load_child_values {packet_parser_top_tb.DUT.loop[1].packet_parser_top}


set _session_group_207 Group1
gui_sg_create "$_session_group_207"
set Group1 "$_session_group_207"


set _session_group_208 Group2
gui_sg_create "$_session_group_208"
set Group2 "$_session_group_208"


set _session_group_209 Group3
gui_sg_create "$_session_group_209"
set Group3 "$_session_group_209"


set _session_group_210 Group4
gui_sg_create "$_session_group_210"
set Group4 "$_session_group_210"

gui_sg_addsignal -group "$_session_group_210" { {packet_parser_top_tb.DUT.loop[0].packet_parser_top.Clk} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.Rst} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataSop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataEop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataValid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_Mod} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_Data} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Valid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.error_offset_or_size} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.state} packet_parser_top_tb.field0_is_ready packet_parser_top_tb.field1_is_ready packet_parser_top_tb.field2_is_ready packet_parser_top_tb.field3_is_ready packet_parser_top_tb.OutBus_AllValues_Ready packet_parser_top_tb.OutBus_Field_muxed packet_parser_top_tb.OutBus_Valid_muxed {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[2].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[3].packet_parser_top.OutBus_Field} packet_parser_top_tb.queue_out }

set _session_group_211 Group5
gui_sg_create "$_session_group_211"
set Group5 "$_session_group_211"

gui_sg_addsignal -group "$_session_group_211" { {packet_parser_top_tb.DUT.loop[0].packet_parser_top.Clk} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.Rst} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataSop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataEop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataValid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_Mod} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_Data} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Valid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.error_offset_or_size} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.word_count} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.field_found} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.pending_bytes} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.state} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.byte_valid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.DATA_WIDTH} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE_MAX} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_OFFSET} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.IDLE} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.PARSE} }
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.DATA_WIDTH}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.DATA_WIDTH}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE_MAX}}
gui_set_radix -radix {twosComplement} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE_MAX}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_OFFSET}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_OFFSET}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.IDLE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.IDLE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.PARSE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.PARSE}}

set _session_group_212 Group6
gui_sg_create "$_session_group_212"
set Group6 "$_session_group_212"

gui_sg_addsignal -group "$_session_group_212" { {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataSop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataEop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataValid} }

set _session_group_213 Group7
gui_sg_create "$_session_group_213"
set Group7 "$_session_group_213"

gui_sg_addsignal -group "$_session_group_213" { {packet_parser_top_tb.DUT.loop[0].packet_parser_top.word_count} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.state} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.pending_bytes} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.field_found} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.error_offset_or_size} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.byte_valid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.Rst} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.PARSE} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Valid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_Mod} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_Data} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataValid} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataSop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.InBus_DataEop} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.IDLE} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE_MAX} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_OFFSET} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.DATA_WIDTH} {packet_parser_top_tb.DUT.loop[0].packet_parser_top.Clk} }
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.PARSE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.PARSE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.IDLE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.IDLE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE_MAX}}
gui_set_radix -radix {twosComplement} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE_MAX}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_SIZE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_OFFSET}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.FIELD_OFFSET}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.DATA_WIDTH}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[0].packet_parser_top.DATA_WIDTH}}

set _session_group_214 Group8
gui_sg_create "$_session_group_214"
set Group8 "$_session_group_214"

gui_sg_addsignal -group "$_session_group_214" { {packet_parser_top_tb.DUT.loop[1].packet_parser_top.word_count} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.state} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.pending_bytes} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.field_found} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.error_offset_or_size} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.byte_valid} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.Rst} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.PARSE} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.OutBus_Valid} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.OutBus_Field} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.InBus_Mod} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.InBus_Data} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.InBus_DataValid} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.InBus_DataSop} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.InBus_DataEop} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.IDLE} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_SIZE_MAX} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_SIZE} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_OFFSET} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.DATA_WIDTH} {packet_parser_top_tb.DUT.loop[1].packet_parser_top.Clk} packet_parser_top_tb.queue_out }
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.PARSE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.PARSE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.IDLE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.IDLE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_SIZE_MAX}}
gui_set_radix -radix {twosComplement} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_SIZE_MAX}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_SIZE}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_SIZE}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_OFFSET}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.FIELD_OFFSET}}
gui_set_radix -radix {decimal} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.DATA_WIDTH}}
gui_set_radix -radix {unsigned} -signals {{V1:packet_parser_top_tb.DUT.loop[1].packet_parser_top.DATA_WIDTH}}

set _session_group_215 Group9
gui_sg_create "$_session_group_215"
set Group9 "$_session_group_215"

gui_sg_addsignal -group "$_session_group_215" { packet_parser_top_tb.queue_out packet_parser_top_tb.OutBus_Field_muxed packet_parser_top_tb.InBus_DataSop packet_parser_top_tb.InBus_Mod packet_parser_top_tb.InBus_Data packet_parser_top_tb.InBus_DataValid packet_parser_top_tb.InBus_DataSop packet_parser_top_tb.InBus_DataEop packet_parser_top_tb.OutBus_AllValues_Ready packet_parser_top_tb.OutBus_Valid_muxed packet_parser_top_tb.FIELD_OFFSET packet_parser_top_tb.FIELD_SIZE packet_parser_top_tb.field0 packet_parser_top_tb.field1 packet_parser_top_tb.field2 packet_parser_top_tb.field3 packet_parser_top_tb.push_queue }
gui_set_radix -radix {hex} -signals {V1:packet_parser_top_tb.FIELD_OFFSET}
gui_set_radix -radix {unsigned} -signals {V1:packet_parser_top_tb.FIELD_OFFSET}
gui_set_radix -radix {hex} -signals {V1:packet_parser_top_tb.FIELD_SIZE}
gui_set_radix -radix {unsigned} -signals {V1:packet_parser_top_tb.FIELD_SIZE}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 594



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*} -force
gui_change_design -id ${Hier.1} -design V1
catch {gui_list_select -id ${Hier.1} {packet_parser_top_tb}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*InB*}
gui_list_show_data -id ${Data.1} {packet_parser_top_tb}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {packet_parser_top_tb.InBus_Mod packet_parser_top_tb.InBus_Data packet_parser_top_tb.InBus_DataValid packet_parser_top_tb.InBus_DataSop packet_parser_top_tb.InBus_DataEop }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1} binary_search_tb.v -startline 1 -replace
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_wv_zoom_timerange -id ${Wave.1} 52 642
gui_list_add_group -id ${Wave.1} -after {New Group} {Group9}
gui_list_select -id ${Wave.1} {packet_parser_top_tb.OutBus_AllValues_Ready }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group Group9  -item packet_parser_top_tb.InBus_DataEop -position below

gui_marker_move -id ${Wave.1} {C1} 594
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DLPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

