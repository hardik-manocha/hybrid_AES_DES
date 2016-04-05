----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:48 07/28/2014 
-- Design Name: 
-- Module Name:    portmapping_aes - Behavioral 
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

entity portmapping_aes is
    Port ( a,b : in  STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end portmapping_aes;

architecture Behavioral of portmapping_aes is

component aes_module is
    Port ( ip,key : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  op : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;


begin
l1 : aes_module port map (a,b,clk,y);

end Behavioral;

