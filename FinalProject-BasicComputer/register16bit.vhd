library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity register16bit is
port ( 
	D : IN std_logic_vector(15 downto 0);
	load : IN std_logic;
	reset : IN std_logic;
	increament : in std_logic;
	Clk : IN std_logic;
	Q : OUT std_logic_vector(15 downto 0):= (others => '0')
	 );
end register16bit;
architecture Behavioral of register16bit is
	signal regQ: std_logic_vector(15 downto 0) := (others => '0');
begin
	process(clk,load, reset)
	begin
		if(reset='1') then
			Q <= (others => '0');
		end if;
		if(load='1' and clk='1')then
			Q <= D;
			regQ <= D;
		elsif(increament='1' and clk='1') then
			Q <= std_logic_vector(to_unsigned(to_integer(unsigned(regQ)) + 1, regQ'length));
		end if;
	end process;
end Behavioral;