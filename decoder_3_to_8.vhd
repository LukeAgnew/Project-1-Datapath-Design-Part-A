----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:39 02/12/2016 
-- Design Name: 
-- Module Name:    decoder_2_to_4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_3_to_8 is
    Port (
           A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
			  A2 : in STD_LOGIC;
           D0 : out  STD_LOGIC;
           D1 : out  STD_LOGIC;
           D2 : out  STD_LOGIC;
           D3 : out  STD_LOGIC;
			  D4 : out  STD_LOGIC;
			  D5 : out  STD_LOGIC;
			  D6 : out  STD_LOGIC;
			  D7 : out  STD_LOGIC);
			  
end decoder_3_to_8;

architecture dataflow_1 of decoder_3_to_8 is

signal not_A0, not_A1, not_A2:std_logic;
begin
	not_A0 <= not A0;
	not_A1 <= not A1;
	not_A2 <= not A2;
	
	D0 <= not (not_A0 and not_A1 and not_A2) after 5ns;
	D1 <= not (A0 and not_A1 and not_A2) after 5ns;
	D2 <= not (not_A0 and A1 and not_A2) after 5ns;
	D3 <= not (A0 and A1 and not_A2) after 5ns;
	D4 <= not (not_A0 and not_A1 and A2) after 5ns;
	D5 <= not (A0 and not_A1 and A2) after 5ns;
	D6 <= not (not_A0 and A1 and A2) after 5ns;
	D7 <= not (A0 and A1 and A2) after 5ns;
end dataflow_1;

