--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:46:30 02/15/2016
-- Design Name:   
-- Module Name:   U:/Project-1-Datapath-Design-Part-A/reg16_tb.vhd
-- Project Name:  Project-1-Datapath-Design-Part-A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg16
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reg16_tb IS
END reg16_tb;
 
ARCHITECTURE behavior OF reg16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg16
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         Clk : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16 PORT MAP (
          D => D,
          load => load,
          Clk => Clk,
          Q => Q
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
