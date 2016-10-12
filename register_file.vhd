----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:01 02/12/2016 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
    Port ( 
			src_s0 : in  STD_LOGIC;
         src_s1 : in  STD_LOGIC;
			src_s2 : in STD_LOGIC;
         des_A0 : in  STD_LOGIC;
         des_A1 : in  STD_LOGIC;
			des_A2 : in STD_LOGIC; 
         Clk : in  STD_LOGIC;
         data_src : in  STD_LOGIC;
         data : in  STD_LOGIC_VECTOR (15 downto 0);
         reg0 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg1 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg2 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg3 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg4 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg5 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg6 : out  STD_LOGIC_VECTOR (15 downto 0);
         reg7 : out  STD_LOGIC_VECTOR (15 downto 0)
			);
end register_file;

architecture Behavioral of register_file is

COMPONENT reg16
PORT(
		D:in STD_LOGIC_VECTOR(15 downto 0);
		load: in STD_LOGIC;
		Clk: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(15 downto 0)
	  );
END COMPONENT;

COMPONENT decoder_3_to_8
PORT(
			A0 : in STD_LOGIC;
			A1 : in STD_LOGIC;
			A2 : in STD_LOGIC;
			D0 : out  STD_LOGIC;
         D1 : out  STD_LOGIC;
         D2 : out  STD_LOGIC;
         D3 : out  STD_LOGIC;
			D4 : out  STD_LOGIC;
			D5 : out  STD_LOGIC;
			D6 : out  STD_LOGIC;
			D7 : out  STD_LOGIC
		);
END COMPONENT;

COMPONENT mux2_16bit
PORT(
			in0 : in  STD_LOGIC_VECTOR (15 downto 0);
         in1 : in  STD_LOGIC_VECTOR (15 downto 0);
         s : in  STD_LOGIC;
         z : out  STD_LOGIC_VECTOR (15 downto 0)
		);
END COMPONENT;

COMPONENT mux8_16bit
PORT(		  
			in0 : in  STD_LOGIC_VECTOR (15 downto 0);
         in1 : in  STD_LOGIC_VECTOR (15 downto 0);
         in2 : in  STD_LOGIC_VECTOR (15 downto 0);
         in3 : in  STD_LOGIC_VECTOR (15 downto 0);
			in4 : in  STD_LOGIC_VECTOR (15 downto 0);
			in5 : in  STD_LOGIC_VECTOR (15 downto 0);
			in6 : in  STD_LOGIC_VECTOR (15 downto 0);
			in7 : in  STD_LOGIC_VECTOR (15 downto 0);
         s0 : in  STD_LOGIC;
         s1 : in  STD_LOGIC;
			s2 : in STD_LOGIC;
         z : out  STD_LOGIC_VECTOR (15 downto 0)
	);
END COMPONENT;

signal load_reg0,load_reg1,load_reg2,load_reg3,load_reg4,load_reg5,load_reg6,load_reg7: std_logic;
signal reg0_q,reg1_q,reg2_q,reg3_q,reg4_q,reg5_q,reg6_q,reg7_q,data_src_mux_out,src_reg:std_logic_vector(15 downto 0);

begin

reg00: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg0,
			Clk => Clk,
			Q => reg0_q
);			

reg01: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg1,
			Clk => Clk,
			Q => reg1_q
);		

reg02: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg2,
			Clk => Clk,
			Q => reg2_q
);		

reg03: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg3,
			Clk => Clk,
			Q => reg3_q
);		

reg04: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg4,
			Clk => Clk,
			Q => reg4_q
);	
	
reg05: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg5,
			Clk => Clk,
			Q => reg5_q
);

reg06: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg6,
			Clk => Clk,
			Q => reg6_q
);		

reg07: reg16 PORT MAP(
			D => data_src_mux_out,
			load => load_reg7,
			Clk => Clk,
			Q => reg7_q
);		

des_decoder_3_to_8: decoder_3_to_8 PORT MAP(
		A0 => des_A0,
		A1 => des_A1,
		A2 => des_A2,
		D0 => load_reg0,
		D1 => load_reg1,
		D2 => load_reg2,
		D3 => load_reg3,		D4 => load_reg4,
		D5 => load_reg5,
		D6 => load_reg6,
		D7 => load_reg7
);

data_src_mux2_16bit: mux2_16bit PORT MAP(
				in0 => data,
				in1 => src_reg,
				s => data_src,
				z => data_src_mux_out
);

Inst_mux8_16bit: mux8_16bit PORT MAP(
			in0 => reg0_q,
			in1 => reg1_q,
			in2 => reg2_q,
			in3 => reg3_q,
			in4 => reg4_q,
			in5 => reg5_q,
			in6 => reg6_q,
			in7 => reg7_q,
			s0 => src_s0,
			s1 => src_s1,
			s2 => src_s2,
			z => src_reg
);
reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;

end Behavioral;

