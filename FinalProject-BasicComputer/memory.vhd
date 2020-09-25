library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory is
	port
	(
		input	: in std_logic_vector(15 downto 0);
		output  : out std_logic_vector(15 downto 0);
		res     : out std_logic_vector(15 downto 0);
		address	: in std_logic_vector(15 downto 0);
		wr		: in std_logic;
		rd		: in std_logic
	);
	
end entity;

architecture rtl of memory is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector(15 downto 0);
	type memory_t is array((2**16)-1 downto 0) of word_t;
	
	-- Declare the RAM signal.
	signal ram : memory_t;

begin
	res <= ram(12); -- result must be saved in 12 place of memory and the result is 24
	process(wr, rd)
	begin
		if(falling_edge(wr)) then
			ram(to_integer(unsigned(address))) <= input;
		end if;
		if(rd = '1') then
			output <= ram(to_integer(unsigned(address)));
		end if;
	end process;
end rtl;