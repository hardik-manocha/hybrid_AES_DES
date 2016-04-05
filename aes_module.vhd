----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:16 07/25/2014 
-- Design Name: 
-- Module Name:    aes_module - Behavioral 
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
use work.aes_des_package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aes_module is
    Port ( ip,key : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  op : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end aes_module;

architecture Behavioral of aes_module is

signal e1,e2,e3,e4,e5,e6 : std_logic_vector(7 downto 0);
signal t1,t2,t3,t4,t5,t6,t7,t8 : std_logic_vector(1 downto 0);
signal en,d : std_logic_vector(3 downto 0):=(others=>'0');

begin

	e1<=ip(31 downto 24);
			--report" taking first eight bits";
	e2<=ip(23 downto 16);
			--report" taking second eight bits";
	e3<=ip(15 downto 8);
			--report" taking third eight bits";
	e4<=ip(7 downto 0);
			--report" taking fourth eight bits";


process(ip,key,clk)begin
	--if(rst='1')then
		--en<="0001";
	--else
		case en is 
			when "0000" =>
				t1<=mux1(e1);
					report"mux1 reached";
				t2<=mux2(e2);
					report"mux2 reached";
				t3<=mux3(e3);
					report"mux3 reached";
				t4<=mux4(e4);
					report"mux4 reached";
				en<="0001";
				
			when "0001" =>
				t5<=sbox(t1);
					report"first time s box";
				t6<=sbox(t2);
					report"second time s box";
				t7<=sbox(t3);
					report"third time s box";
				t8<=sbox(t4);
					report"fourth time s box";
				en<="0010";
			
			when "0010" =>
				e5(7 downto 6)<=t5;
					report" making first two bits of mic col input";
				e5(5 downto 4)<=t6;
					report" making second two bits of mic col input";
				e5(3 downto 2)<=t7;
					report" making third two bits of mic col input";
				e5(1 downto 0)<=t8;
					report" making fourth two bits of mic col input";
				en<="0011";
				
			when "0011" =>
				e6<=mixcol(e5);
					report"output of mix column";
				en<="0100";
			
			when "0100" =>
				op(31 downto 24)<= e6 xor key(31 downto 24);
					report" output first eight bits";
				op(23 downto 16)<= e6 xor key(23 downto 16);
						report" output second eight bits";
				op(15 downto 8)<= e6 xor key(15 downto 8);
						report" output third eight bits";
				op(7 downto 0)<= e6 xor key(7 downto 0);
						report" output fourth eight bits";
				en<="0101";
				
			when others =>
				d<="0001";	

		end case;		
		--end if;
		end process;

end Behavioral;

