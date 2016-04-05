----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:09 07/25/2014 
-- Design Name: 
-- Module Name:    main_module - Behavioral 
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

entity main_module is
    Port ( pt : in  STD_LOGIC_VECTOR (63 downto 0);
           key : in  STD_LOGIC_VECTOR (31 downto 0);
          ct : out  STD_LOGIC_VECTOR (63 downto 0);
           clk : in  STD_LOGIC);
end main_module;

architecture Behavioral of main_module is

component aes_module is
    Port ( ip,key : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  op : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;


--defining signals
signal en :std_logic_vector(4 downto 0):=(others=>'0');
signal l0,l1,l2:std_logic_vector(31 downto 0):=(others=>'0');
signal r0,r1,r2,r3 :std_logic_vector(31 downto 0):=(others=>'0');
signal i0,i1 :std_logic_vector(31 downto 0):=(others=>'0');
signal x0 :std_logic_vector(31 downto 0):=(others=>'0');
signal k1:std_logic_vector(31 downto 0):=(others=>'0');

--signals definition over



begin

	l0<=pt(63 downto 32);
   r0<=pt(31 downto 0);
	j1 : aes_module port map (x0,key,clk,r1);
--defining process
process(pt,key,clk)begin		--end process;


	for i in 6 downto 0 loop
		case en is								--end case;		
		when "00000" =>
					i0<= key xor r0;
						report" value of i0 taken";
							en<="00001";
							report" en made 00001";
		
		when "00001" =>
			--a1<=i0;
				--report" value of a1 taken";
			x0<=i0 xor l0;
				report"value of x0 taken here";
				en<="00010";
					report" en made 00010";
					
		when "00010" =>
			l1<=r0;
				en<="00011";
					--l3<=r1;

		when "00011" =>
			k1<=key_gen(key);
				en<="00100";
				
		when "00100" =>
			--i1<=k1 xor r1;
			r2<=r1;
			r3<=r1;	
			en<="00110";
			
		when "00110" =>
			i1<=k1 xor r1;
			en<="00101";
				
		when "00101" =>
			ct(63 downto 32)<=i1;
				report"first 32 bits of ct taken";
			ct(31 downto 0)<=r1;
				report"second 32 bits of ct taken";
			--en<="10001";
					
		when others =>
					l2<=l1 xor r1;
				


end case;
	end loop;			





end process;



--ending process
end Behavioral;

