--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:39 07/25/2014
-- Design Name:   
-- Module Name:   D:/vlsi/hybrid_aes_des/tb_main_module.vhd
-- Project Name:  hybrid_aes_des
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main_module
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
 
ENTITY tb_main_module IS
END tb_main_module;
 
ARCHITECTURE behavior OF tb_main_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main_module
    PORT(
         pt : IN  std_logic_vector(63 downto 0);
         key : IN  std_logic_vector(31 downto 0);
         ct : OUT  std_logic_vector(63 downto 0);
			--a1: out  STD_LOGIC_VECTOR (31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal pt : std_logic_vector(63 downto 0) := (others => '0');
   signal key : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal ct : std_logic_vector(63 downto 0);
	--signal a1 :  STD_LOGIC_VECTOR (31 downto 0);

   -- Clock period definitions
   --constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main_module PORT MAP (
          pt => pt,
          key => key,
          ct => ct,
			 --a1=>a1,
			-- l3=>l3,
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
      wait for 100 ns;	
			pt<="0001101000000110100001101001000001000011010001101010100110101010";
		wait for 100 ns;	
			key<="01110010101110110110110110110110";
		wait for 100 ns;	
     -- wait for clk_period*10;
			
      -- insert stimulus here 

     -- wait;
   end process;

END;
