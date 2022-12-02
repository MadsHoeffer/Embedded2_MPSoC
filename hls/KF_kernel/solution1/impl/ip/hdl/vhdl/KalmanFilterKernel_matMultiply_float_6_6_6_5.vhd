-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity KalmanFilterKernel_matMultiply_float_6_6_6_5 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mat_in_L_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    mat_in_L_ce0 : OUT STD_LOGIC;
    mat_in_L_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    mat_in_R_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    mat_in_R_ce0 : OUT STD_LOGIC;
    mat_in_R_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    mat_out_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    mat_out_ce0 : OUT STD_LOGIC;
    mat_out_we0 : OUT STD_LOGIC;
    mat_out_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3117_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3117_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3117_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3117_p_ce : OUT STD_LOGIC );
end;


architecture behav of KalmanFilterKernel_matMultiply_float_6_6_6_5 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal add_ln13_fu_137_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln13_reg_283 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal empty_fu_173_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal empty_reg_291 : STD_LOGIC_VECTOR (5 downto 0);
    signal icmp_ln13_fu_143_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln17_fu_179_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln17_reg_296 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln17_fu_183_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln17_reg_301 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal zext_ln17_fu_189_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln17_reg_306 : STD_LOGIC_VECTOR (5 downto 0);
    signal mat_out_addr_reg_314 : STD_LOGIC_VECTOR (5 downto 0);
    signal icmp_ln17_fu_193_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln23_fu_209_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln23_reg_319 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal icmp_ln23_fu_219_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_fu_271_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_reg_337 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_fu_131_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_reg_352 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_fu_277_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal i_reg_86 : STD_LOGIC_VECTOR (1 downto 0);
    signal k_reg_97 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_reg_108 : STD_LOGIC_VECTOR (2 downto 0);
    signal add1913_reg_119 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln20_fu_204_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_fu_230_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_4_fu_266_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_131_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_131_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_shl_fu_149_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal p_shl1_fu_161_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal p_shl_cast_fu_157_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal p_shl1_cast_fu_169_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln20_fu_199_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln23_fu_215_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln27_fu_225_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal shl_ln27_1_fu_243_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal shl_ln_fu_235_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln27_3_fu_251_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sub_ln27_fu_255_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln27_3_fu_261_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal grp_fu_131_ce : STD_LOGIC;
    signal grp_fu_277_in_valid : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_277_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component KalmanFilterKernel_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component KalmanFilterKernel_facc_32ns_32ns_1ns_32_3_no_dsp_1 IS
    generic (
        DWIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        in_data : IN STD_LOGIC_VECTOR (31 downto 0);
        in_last : IN STD_LOGIC_VECTOR (0 downto 0);
        in_valid : IN STD_LOGIC;
        out_data : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    facc_32ns_32ns_1ns_32_3_no_dsp_1_U28 : component KalmanFilterKernel_facc_32ns_32ns_1ns_32_3_no_dsp_1
    generic map (
        DWIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        ce => ap_const_logic_1,
        in_data => mul_reg_352,
        in_last => icmp_ln27_reg_337,
        in_valid => grp_fu_277_in_valid,
        out_data => grp_fu_277_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    add1913_reg_119_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln17_fu_193_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                add1913_reg_119 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
                add1913_reg_119 <= grp_fu_277_p3;
            end if; 
        end if;
    end process;

    i_reg_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_86 <= ap_const_lv2_0;
            elsif (((icmp_ln17_fu_193_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                i_reg_86 <= add_ln13_reg_283;
            end if; 
        end if;
    end process;

    j_reg_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln17_fu_193_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                j_reg_108 <= ap_const_lv3_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
                j_reg_108 <= add_ln23_reg_319;
            end if; 
        end if;
    end process;

    k_reg_97_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_143_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                k_reg_97 <= ap_const_lv3_0;
            elsif (((icmp_ln23_fu_219_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                k_reg_97 <= add_ln17_reg_301;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln13_reg_283 <= add_ln13_fu_137_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                add_ln17_reg_301 <= add_ln17_fu_183_p2;
                    zext_ln17_reg_306(2 downto 0) <= zext_ln17_fu_189_p1(2 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                add_ln23_reg_319 <= add_ln23_fu_209_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_143_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    empty_reg_291(5 downto 1) <= empty_fu_173_p2(5 downto 1);
                    trunc_ln17_reg_296(4 downto 1) <= trunc_ln17_fu_179_p1(4 downto 1);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln23_fu_219_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                icmp_ln27_reg_337 <= icmp_ln27_fu_271_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln17_fu_193_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                mat_out_addr_reg_314 <= sext_ln20_fu_204_p1(6 - 1 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then
                mul_reg_352 <= grp_fu_3117_p_dout0;
            end if;
        end if;
    end process;
    empty_reg_291(0) <= '0';
    trunc_ln17_reg_296(0) <= '0';
    zext_ln17_reg_306(5 downto 3) <= "000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_143_p2, ap_CS_fsm_state3, icmp_ln17_fu_193_p2, ap_CS_fsm_state4, icmp_ln23_fu_219_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln13_fu_143_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((icmp_ln17_fu_193_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if (((icmp_ln23_fu_219_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;
    add_ln13_fu_137_p2 <= std_logic_vector(unsigned(i_reg_86) + unsigned(ap_const_lv2_1));
    add_ln17_fu_183_p2 <= std_logic_vector(unsigned(k_reg_97) + unsigned(ap_const_lv3_1));
    add_ln20_fu_199_p2 <= std_logic_vector(unsigned(zext_ln17_fu_189_p1) + unsigned(empty_reg_291));
    add_ln23_fu_209_p2 <= std_logic_vector(unsigned(j_reg_108) + unsigned(ap_const_lv3_1));
    add_ln27_3_fu_261_p2 <= std_logic_vector(unsigned(sub_ln27_fu_255_p2) + unsigned(zext_ln17_reg_306));
    add_ln27_fu_225_p2 <= std_logic_vector(unsigned(zext_ln23_fu_215_p1) + unsigned(trunc_ln17_reg_296));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_143_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((icmp_ln13_fu_143_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln13_fu_143_p2)
    begin
        if (((icmp_ln13_fu_143_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_fu_173_p2 <= std_logic_vector(unsigned(p_shl_cast_fu_157_p1) - unsigned(p_shl1_cast_fu_169_p1));
    grp_fu_131_ce <= ap_const_logic_1;
    grp_fu_131_p0 <= mat_in_L_q0;
    grp_fu_131_p1 <= mat_in_R_q0;
    grp_fu_131_p2 <= grp_fu_3117_p_dout0;

    grp_fu_277_in_valid_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            grp_fu_277_in_valid <= ap_const_logic_1;
        else 
            grp_fu_277_in_valid <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_3117_p_ce <= ap_const_logic_1;
    grp_fu_3117_p_din0 <= mat_in_L_q0;
    grp_fu_3117_p_din1 <= mat_in_R_q0;
    icmp_ln13_fu_143_p2 <= "1" when (i_reg_86 = ap_const_lv2_3) else "0";
    icmp_ln17_fu_193_p2 <= "1" when (k_reg_97 = ap_const_lv3_6) else "0";
    icmp_ln23_fu_219_p2 <= "1" when (j_reg_108 = ap_const_lv3_6) else "0";
    icmp_ln27_fu_271_p2 <= "1" when (add_ln23_fu_209_p2 = ap_const_lv3_6) else "0";
    mat_in_L_address0 <= zext_ln27_fu_230_p1(5 - 1 downto 0);

    mat_in_L_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_in_L_ce0 <= ap_const_logic_1;
        else 
            mat_in_L_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_in_R_address0 <= zext_ln27_4_fu_266_p1(6 - 1 downto 0);

    mat_in_R_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_in_R_ce0 <= ap_const_logic_1;
        else 
            mat_in_R_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_out_address0 <= mat_out_addr_reg_314;

    mat_out_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_out_ce0 <= ap_const_logic_1;
        else 
            mat_out_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_out_d0 <= add1913_reg_119;

    mat_out_we0_assign_proc : process(ap_CS_fsm_state4, icmp_ln23_fu_219_p2)
    begin
        if (((icmp_ln23_fu_219_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            mat_out_we0 <= ap_const_logic_1;
        else 
            mat_out_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_shl1_cast_fu_169_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl1_fu_161_p3),6));
    p_shl1_fu_161_p3 <= (i_reg_86 & ap_const_lv1_0);
    p_shl_cast_fu_157_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl_fu_149_p3),6));
    p_shl_fu_149_p3 <= (i_reg_86 & ap_const_lv3_0);
        sext_ln20_fu_204_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln20_fu_199_p2),64));

    shl_ln27_1_fu_243_p3 <= (j_reg_108 & ap_const_lv1_0);
    shl_ln_fu_235_p3 <= (j_reg_108 & ap_const_lv3_0);
    sub_ln27_fu_255_p2 <= std_logic_vector(unsigned(shl_ln_fu_235_p3) - unsigned(zext_ln27_3_fu_251_p1));
    trunc_ln17_fu_179_p1 <= empty_fu_173_p2(5 - 1 downto 0);
    zext_ln17_fu_189_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_reg_97),6));
    zext_ln23_fu_215_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_reg_108),5));
    zext_ln27_3_fu_251_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln27_1_fu_243_p3),6));
    zext_ln27_4_fu_266_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln27_3_fu_261_p2),64));
    zext_ln27_fu_230_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln27_fu_225_p2),64));
end behav;
