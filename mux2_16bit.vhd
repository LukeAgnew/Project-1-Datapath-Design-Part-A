----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:56 02/12/2016 
-- Design Name: 
-- Module Name:    mux2_16bit - Behavioral 
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

entity mux2_16bit is
    Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           s : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux2_16bit;

architecture Behavioral of mux2_16bit is

begin
z <= in0 after 5ns when s = '0' else
	  in1 after 5ns when s = '1' else
	  "0000000000000000" after 5ns;

end Behavioral;

