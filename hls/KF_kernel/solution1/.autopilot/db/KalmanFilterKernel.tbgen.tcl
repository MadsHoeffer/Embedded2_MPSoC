set moduleName KalmanFilterKernel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {KalmanFilterKernel}
set C_modelType { void 0 }
set C_modelArgList {
	{ din int 32 regular {array 6 { 1 } 1 1 }  }
	{ dout int 32 regular {array 6 { 0 } 0 1 }  }
	{ q float 32 regular {axi_slave 0}  }
	{ r float 32 regular {axi_slave 0}  }
	{ countin int 24 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "din", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "din","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "dout", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "dout","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "q", "interface" : "axi_slave", "bundle":"AXI_CPU","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "q","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "r", "interface" : "axi_slave", "bundle":"AXI_CPU","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "r","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "countin", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "countin","cData": "int24","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ din_address0 sc_out sc_lv 3 signal 0 } 
	{ din_ce0 sc_out sc_logic 1 signal 0 } 
	{ din_q0 sc_in sc_lv 32 signal 0 } 
	{ dout_address0 sc_out sc_lv 3 signal 1 } 
	{ dout_ce0 sc_out sc_logic 1 signal 1 } 
	{ dout_we0 sc_out sc_logic 1 signal 1 } 
	{ dout_d0 sc_out sc_lv 32 signal 1 } 
	{ countin sc_in sc_lv 24 signal 4 } 
	{ s_axi_AXI_CPU_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_AXI_CPU_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXI_CPU_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXI_CPU_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_AXI_CPU_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXI_CPU_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXI_CPU_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXI_CPU_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXI_CPU_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "AWADDR" },"address":[{"name":"KalmanFilterKernel","role":"start","value":"0","valid_bit":"0"},{"name":"KalmanFilterKernel","role":"continue","value":"0","valid_bit":"4"},{"name":"KalmanFilterKernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"q","role":"data","value":"16"},{"name":"r","role":"data","value":"24"}] },
	{ "name": "s_axi_AXI_CPU_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "AWVALID" } },
	{ "name": "s_axi_AXI_CPU_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "AWREADY" } },
	{ "name": "s_axi_AXI_CPU_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "WVALID" } },
	{ "name": "s_axi_AXI_CPU_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "WREADY" } },
	{ "name": "s_axi_AXI_CPU_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "WDATA" } },
	{ "name": "s_axi_AXI_CPU_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "WSTRB" } },
	{ "name": "s_axi_AXI_CPU_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "ARADDR" },"address":[{"name":"KalmanFilterKernel","role":"start","value":"0","valid_bit":"0"},{"name":"KalmanFilterKernel","role":"done","value":"0","valid_bit":"1"},{"name":"KalmanFilterKernel","role":"idle","value":"0","valid_bit":"2"},{"name":"KalmanFilterKernel","role":"ready","value":"0","valid_bit":"3"},{"name":"KalmanFilterKernel","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_AXI_CPU_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "ARVALID" } },
	{ "name": "s_axi_AXI_CPU_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "ARREADY" } },
	{ "name": "s_axi_AXI_CPU_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "RVALID" } },
	{ "name": "s_axi_AXI_CPU_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "RREADY" } },
	{ "name": "s_axi_AXI_CPU_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "RDATA" } },
	{ "name": "s_axi_AXI_CPU_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "RRESP" } },
	{ "name": "s_axi_AXI_CPU_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "BVALID" } },
	{ "name": "s_axi_AXI_CPU_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "BREADY" } },
	{ "name": "s_axi_AXI_CPU_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_CPU", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "din_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "din", "role": "address0" }} , 
 	{ "name": "din_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "din", "role": "ce0" }} , 
 	{ "name": "din_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "din", "role": "q0" }} , 
 	{ "name": "dout_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "dout", "role": "address0" }} , 
 	{ "name": "dout_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dout", "role": "ce0" }} , 
 	{ "name": "dout_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "dout", "role": "we0" }} , 
 	{ "name": "dout_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dout", "role": "d0" }} , 
 	{ "name": "countin", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "countin", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "28", "32", "35", "38", "40", "42", "44", "46", "47", "48", "49", "50", "51", "52", "53"],
		"CDFG" : "KalmanFilterKernel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10511", "EstimateLatencyMax" : "11424",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "din", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "dout", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "q", "Type" : "None", "Direction" : "I"},
			{"Name" : "r", "Type" : "None", "Direction" : "I"},
			{"Name" : "countin", "Type" : "None", "Direction" : "I"},
			{"Name" : "prev_count_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "guard_variable_for_KalmanFilterKernel_float_float_float_float_ap_uint_24_x_hat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "x_hat", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "P_hat", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_matMultiply_float_6_6_6_s_fu_1595", "Port" : "mat_in_L"},
					{"ID" : "42", "SubInstance" : "grp_matMultiply_float_6_6_6_7_fu_1618", "Port" : "mat_in_L"}]},
			{"Name" : "B", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_matMultiply_float_6_6_6_2_fu_1566", "Port" : "mat_in_L"}]},
			{"Name" : "H", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_matMultiply_float_6_6_6_6_fu_1626", "Port" : "mat_in_L"},
					{"ID" : "38", "SubInstance" : "grp_matMultiply_float_6_6_6_5_fu_1603", "Port" : "mat_in_L"},
					{"ID" : "32", "SubInstance" : "grp_matMultiply_float_6_6_6_1_fu_1587", "Port" : "H"}]},
			{"Name" : "H_T", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "28", "SubInstance" : "grp_matMultiply_float_6_6_6_4_fu_1576", "Port" : "H_T"}]},
			{"Name" : "I", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_hat_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.P_hat_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.A_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.B_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.H_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.I_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_CPU_s_axi_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.din_s_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dout_s_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Q_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.R_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.P_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_minus_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.P_minus_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_plus_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.P_plus_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tmp_mat_1_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tmp_mat_2_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tmp_mat_3_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mat_out_assign_2_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.S_inv_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_2_fu_1566", "Parent" : "0", "Child" : ["25", "26", "27"],
		"CDFG" : "matMultiply_float_6_6_6_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "169", "EstimateLatencyMax" : "169",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_in_R_0_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "mat_in_R_1_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "mat_in_R_2_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_2_fu_1566.fmul_32ns_32ns_32_4_max_dsp_1_U8", "Parent" : "24"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_2_fu_1566.mux_32_32_1_1_U9", "Parent" : "24"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_2_fu_1566.facc_32ns_32ns_1ns_32_3_no_dsp_1_U10", "Parent" : "24"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_4_fu_1576", "Parent" : "0", "Child" : ["29", "30", "31"],
		"CDFG" : "matMultiply_float_6_6_6_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "457", "EstimateLatencyMax" : "913",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "L", "Type" : "None", "Direction" : "I"},
			{"Name" : "H_T", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_4_fu_1576.H_T_U", "Parent" : "28"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_4_fu_1576.fmul_32ns_32ns_32_4_max_dsp_1_U32", "Parent" : "28"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_4_fu_1576.facc_32ns_32ns_1ns_32_3_no_dsp_1_U33", "Parent" : "28"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_1_fu_1587", "Parent" : "0", "Child" : ["33", "34"],
		"CDFG" : "matMultiply_float_6_6_6_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "949", "EstimateLatencyMax" : "949",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "H", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_1_fu_1587.H_U", "Parent" : "32"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_1_fu_1587.facc_32ns_32ns_1ns_32_3_no_dsp_1_U44", "Parent" : "32"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_s_fu_1595", "Parent" : "0", "Child" : ["36", "37"],
		"CDFG" : "matMultiply_float_6_6_6_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1813", "EstimateLatencyMax" : "1813",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_in_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_s_fu_1595.fmul_32ns_32ns_32_4_max_dsp_1_U17", "Parent" : "35"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_s_fu_1595.facc_32ns_32ns_1ns_32_3_no_dsp_1_U18", "Parent" : "35"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_5_fu_1603", "Parent" : "0", "Child" : ["39"],
		"CDFG" : "matMultiply_float_6_6_6_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "907", "EstimateLatencyMax" : "907",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_in_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_5_fu_1603.facc_32ns_32ns_1ns_32_3_no_dsp_1_U28", "Parent" : "38"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_3_fu_1611", "Parent" : "0", "Child" : ["41"],
		"CDFG" : "matMultiply_float_6_6_6_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "481", "EstimateLatencyMax" : "481",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_in_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_3_fu_1611.facc_32ns_32ns_1ns_32_3_no_dsp_1_U39", "Parent" : "40"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_7_fu_1618", "Parent" : "0", "Child" : ["43"],
		"CDFG" : "matMultiply_float_6_6_6_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "313", "EstimateLatencyMax" : "313",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_in_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_7_fu_1618.facc_32ns_32ns_1ns_32_3_no_dsp_1_U2", "Parent" : "42"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_6_fu_1626", "Parent" : "0", "Child" : ["45"],
		"CDFG" : "matMultiply_float_6_6_6_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "157", "EstimateLatencyMax" : "157",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mat_in_L", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_in_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mat_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matMultiply_float_6_6_6_6_fu_1626.facc_32ns_32ns_1ns_32_3_no_dsp_1_U23", "Parent" : "44"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U48", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_10_no_dsp_1_U49", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32s_32_4_no_dsp_1_U50", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fptrunc_64ns_32_2_no_dsp_1_U51", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U52", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_6_max_dsp_1_U53", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_32_1_1_U54", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U55", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	KalmanFilterKernel {
		din {Type I LastRead 33 FirstWrite -1}
		dout {Type O LastRead -1 FirstWrite 97}
		q {Type I LastRead 32 FirstWrite -1}
		r {Type I LastRead 32 FirstWrite -1}
		countin {Type I LastRead 0 FirstWrite -1}
		prev_count_V {Type IO LastRead -1 FirstWrite -1}
		guard_variable_for_KalmanFilterKernel_float_float_float_float_ap_uint_24_x_hat {Type IO LastRead -1 FirstWrite -1}
		x_hat {Type IO LastRead -1 FirstWrite -1}
		P_hat {Type IO LastRead -1 FirstWrite -1}
		A {Type IO LastRead -1 FirstWrite -1}
		B {Type IO LastRead -1 FirstWrite -1}
		H {Type I LastRead -1 FirstWrite -1}
		H_T {Type I LastRead -1 FirstWrite -1}
		I {Type I LastRead -1 FirstWrite -1}}
	matMultiply_float_6_6_6_2 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_in_R_0_read {Type I LastRead 0 FirstWrite -1}
		mat_in_R_1_read {Type I LastRead 0 FirstWrite -1}
		mat_in_R_2_read {Type I LastRead 0 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}}
	matMultiply_float_6_6_6_4 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}
		L {Type I LastRead 0 FirstWrite -1}
		H_T {Type I LastRead -1 FirstWrite -1}}
	matMultiply_float_6_6_6_1 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}
		H {Type I LastRead -1 FirstWrite -1}}
	matMultiply_float_6_6_6_s {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_in_R {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}}
	matMultiply_float_6_6_6_5 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_in_R {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}}
	matMultiply_float_6_6_6_3 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_in_R {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}}
	matMultiply_float_6_6_6_7 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_in_R {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}}
	matMultiply_float_6_6_6_6 {
		mat_in_L {Type I LastRead 3 FirstWrite -1}
		mat_in_R {Type I LastRead 3 FirstWrite -1}
		mat_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "10511", "Max" : "11424"}
	, {"Name" : "Interval", "Min" : "10512", "Max" : "11425"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
	{"Pipeline" : "6", "EnableSignal" : "ap_enable_pp6"}
	{"Pipeline" : "7", "EnableSignal" : "ap_enable_pp7"}
	{"Pipeline" : "8", "EnableSignal" : "ap_enable_pp8"}
	{"Pipeline" : "9", "EnableSignal" : "ap_enable_pp9"}
	{"Pipeline" : "10", "EnableSignal" : "ap_enable_pp10"}
	{"Pipeline" : "11", "EnableSignal" : "ap_enable_pp11"}
]}

set Spec2ImplPortList { 
	din { ap_memory {  { din_address0 mem_address 1 3 }  { din_ce0 mem_ce 1 1 }  { din_q0 mem_dout 0 32 } } }
	dout { ap_memory {  { dout_address0 mem_address 1 3 }  { dout_ce0 mem_ce 1 1 }  { dout_we0 mem_we 1 1 }  { dout_d0 mem_din 1 32 } } }
	countin { ap_none {  { countin in_data 0 24 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
