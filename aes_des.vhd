--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package aes_des_package is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

function xoring(signal p,q:std_logic_vector(31 downto 0))return std_logic_vector;
function mux1(signal p:std_logic_vector(7 downto 0))return std_logic_vector;
function mux2(signal p:std_logic_vector(7 downto 0))return std_logic_vector;
function mux3(signal p:std_logic_vector(7 downto 0))return std_logic_vector;
function mux4(signal p:std_logic_vector(7 downto 0))return std_logic_vector;
function key_gen(signal ip:std_logic_vector(31 downto 0))return std_logic_vector;
function sbox(signal a:std_logic_vector(1 downto 0))return std_logic_vector;
function mixcol(signal a:std_logic_vector(7 downto 0))return std_logic_vector;






end aes_des_package;

package body aes_des_package is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;


function xoring(signal p,q:std_logic_vector(31 downto 0))return std_logic_vector is
variable a : std_logic_vector(31 downto 0);
begin
	a:= p xor q;
return a;
end function xoring;	



function mux1(signal p:std_logic_vector(7 downto 0))return std_logic_vector is
	variable a: std_logic_vector(1 downto 0);
	begin
		a:= p(7 downto 6);
			report"first two bits taken";
	return a;
end function mux1;	



function mux2(signal p:std_logic_vector(7 downto 0))return std_logic_vector is
	variable a: std_logic_vector(1 downto 0);
	begin
		a:= p(5 downto 4);
			report"second two bits taken";
	return a;
end function mux2;



function mux3(signal p:std_logic_vector(7 downto 0))return std_logic_vector is
	variable a: std_logic_vector(1 downto 0);
	begin
		a:= p(3 downto 2);
			report"third two bits taken";
	return a;
end function mux3;



function mux4(signal p:std_logic_vector(7 downto 0))return std_logic_vector is
	variable a: std_logic_vector(1 downto 0);
	begin
		a:= p(1 downto 0);
			report"fourth two bits taken";
	return a;
end function mux4;



function key_gen(signal ip: std_logic_vector(31 downto 0))  return std_logic_vector is
	variable op: std_logic_vector(31 downto 0);
	
	variable en : std_logic_vector(2 downto 0) :=(others=>'0');
	variable t1,t2,t3,t4: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
	variable rst : std_logic:='1';
	
	
	begin
--	if(rst='1')then 
		--report"first case of if rst=1";
		--if(en="000") then
				--report"en is 000";
			--t1:=ip(31 downto 24) xor ip(7 downto 0);
			--en:="001";
				--report"en is made 001";

			--elsif(en="001") then
				--report"checked en as 001";
			--t2:=t1 xor ip(23 downto 16);
			--en:="010";
				--report"en made 010";

			--elsif(en="010") then
				--report"checked en as 010";
			--t3:=t2 xor ip(15 downto 8);
			--en:="011";
				--report"en made 011";
	
			--elsif(en="011") then
				--report"checked en as 011";
			--t4:=t3 xor ip(7 downto 0);
			--en:="100";
				--report" en made 100";
			--rst:='0';	
		--else
				--report"now to develop value for op";
			--op(31 downto 24):=t1;
			--op(23 downto 16):=t2;
			--op(15 downto 8):=t3;
			--op(7 downto 0):=t4;
	--end if;
		--return op;
		--rst:='0';
			--report"rst made 0 first time";
	--else
		--return op;
		--rst:='0';
			--report"rst made 0 second time";
	--end if;
for i in 4 downto 0 loop	
case en is 	
	
	when "000" =>
		t1:=ip(31 downto 24) xor ip(7 downto 0);
			en:="001";
			
			
	when "001" =>
		t2:=t1 xor ip(23 downto 16);
			en:="010";
			
	when "010" =>
		t3:=t2 xor ip(15 downto 8);
			en:="011";
	
	when "011" =>
		t4:=t3 xor ip(7 downto 0);
			en:="100";
	
	when "100" =>
		op(31 downto 24):=t1;
		op(23 downto 16):=t2;
		op(15 downto 8):=t3;
		op(7 downto 0):=t4;
		
	when others =>
		rst:='0';	
			
end case;	
end loop;
	
return op;
end function key_gen;


function sbox(signal a:std_logic_vector(1 downto 0))return std_logic_vector is
	variable op:std_logic_vector(1 downto 0);
	variable p : std_logic_vector(1 downto 0);
	begin
		p:=a;
		case p is
			when "00" =>
				op:="10";
					report" output is made 10";
			when "01" =>
				op:="00";
					report" output is made 00";
			when "10" =>
				op:="11";
					report" output is made 11";
			when "11" =>
				op:="01";
					report" output is made 01";
			when others =>
				op:="00";
		end case;
		
		--if(p="00")then 
			--op:="10";
				--report" output is made 10";
		
		--elsif(p="01")then
				--op:="00";
					--report" output is made 00";

		--elsif(p="10")then
				--op:="11";
					--report" output is made 11";
		
		--else
			--op:="00";
				--report" output is made 00";
		--end if;
		
	return op;
end function sbox;	


function mixcol(signal a:std_logic_vector(7 downto 0))return std_logic_vector is
	variable op : std_logic_vector(7 downto 0);
	variable q : std_logic_vector(7 downto 0);
	variable en : std_logic_vector(1 downto 0):=(others=>'0');
	begin
		for i in 3 downto 0 loop
		case en is
			when "00" =>
				q:=a;
				en:="01";
			when "01" =>
				q(2):='1';
					report" third bit changed";
				q(3):='0';
					report" fourth bit changed";
				q(7):='0';
					report" last bit changed";
				en:="10";
			when "10" =>
				op:=q;
				en:="11";
			when "11" =>
				q(3):='0';
				op:=q;
			when others =>
				q(3):='0';
				op:=q;
		end case;
		end loop;
	return op;	
end function mixcol;

 
end aes_des_package;
