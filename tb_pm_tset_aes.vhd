--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:31:05 07/28/2014
-- Design Name:   
-- Module Name:   D:/vlsi/hybrid_aes_des/tb_pm_tset_aes.vhd
-- Project Name:  hybrid_aes_des
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: portmapping_aes
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
 
ENTITY tb_pm_tset_aes IS
END tb_pm_tset_aes;
 
ARCHITECTURE behavior OF tb_pm_tset_aes IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT portmapping_aes
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         y : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal y : std_logic_vector(31 downto 0);

   -- Clock period definitions
  -- constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: portmapping_aes PORT MAP (
          a => a,
          b => b,
          y => y,
          clk => clk
        );

   -- Clock process definitions
  process
   begin
		clk <= '0';
		--wait for clk_period/2;
			wait for 1000 ns;
		clk <= '1';
			 wait for 1000 ns;
		--wait for clk_period/2;
   end process;

   -- Stimulus process
   process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
				a<="11100111101111001011100101010101";
      --wait for clk_period*10;
		 wait for 20 ns;	
				b<="11100101111001011110010111100101";	
      -- insert stimulus here 

      wait;
   end process;

END;
