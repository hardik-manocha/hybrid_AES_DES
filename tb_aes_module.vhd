--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:44:42 07/26/2014
-- Design Name:   
-- Module Name:   D:/vlsi/hybrid_aes_des/tb_aes_module.vhd
-- Project Name:  hybrid_aes_des
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aes_module
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
 
ENTITY tb_aes_module IS
END tb_aes_module;
 
ARCHITECTURE behavior OF tb_aes_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aes_module
    PORT(
         ip : IN  std_logic_vector(31 downto 0);
         key : IN  std_logic_vector(31 downto 0);
         op : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ip : std_logic_vector(31 downto 0) := (others => '0');
   signal key : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal op : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aes_module PORT MAP (
          ip => ip,
          key => key,
          op => op,
          clk => clk
        );

   -- Clock process definitions
   process
   begin
		--clk <= '0';
		clk <= not clk;
			wait for 400 ns;
		--wait for clk_period/2;
		--clk <= '1';
	---	wait for clk_period/2;
   end process;
 

   -- Stimulus process
   process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
				ip<="01010101011101011101101011101101";
      --wait for clk_period*10;
		wait for 100 ns;
				key<="00101110110110101110110101011101";
      -- insert stimulus here 
		wait for 100 ns;
  --    wait;
   end process;

END;
