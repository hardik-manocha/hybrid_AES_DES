--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:09:52 07/28/2014
-- Design Name:   
-- Module Name:   D:/vlsi/hybrid_aes_des/tb_key_g.vhd
-- Project Name:  hybrid_aes_des
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_generation
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
 
ENTITY tb_key_g IS
END tb_key_g;
 
ARCHITECTURE behavior OF tb_key_g IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_generation
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_generation PORT MAP (
          a => a,
          y => y
        );

   -- Clock process definitions
  --- process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
   process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			a<="01011010010010111011110111101101";
      --wait for <clock>_period*10;
		wait for 100 ns;
      -- insert stimulus here 

      --wait;
   end process;

END architecture;
