library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory is
	port
	(
		input	: in std_logic_vector(15 downto 0);
		ram0 : in std_logic_vector(15 downto 0);
		ram1 : in std_logic_vector(15 downto 0);
		ram2 : in std_logic_vector(15 downto 0);
		ram10 : in std_logic_vector(15 downto 0);
		ram11 : in std_logic_vector(15 downto 0);
		output  : out std_logic_vector(15 downto 0);
		res     : out std_logic_vector(15 downto 0);
		address	: in std_logic_vector(15 downto 0);
		wr		: in std_logic;
		rd		: in std_logic;
		Clk		: in std_logic
	);
	
end entity;

architecture rtl of memory is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector(15 downto 0);
	type memory_t is array((2**16)-1 downto 0) of word_t;
	
	-- Declare the RAM signal.
	signal ram : memory_t;
	
	-- Register to hold the address
	signal addr_reg : std_logic_vector(15 downto 0) := (others => '0');

begin
	ram(0) <= ram0; -- set LDA in 0 place of memory and address is 10
	ram(1) <= ram1; -- set ADD in 1 place of memory and address is 11
	ram(2) <= ram2; -- set STA in 2 place of memory and address is 12
	ram(10) <= ram10; -- first number for adding in 10 place is 15
	ram(11) <= ram11; -- second number for adding in 11 place is 9
	res <= ram(12); -- result must be saved in 12 place of memory and the result is 24
	process(Clk)
	begin
		if(rising_edge(Clk)) then
			if(wr = '1') then
				ram(to_integer(unsigned(address))) <= input;
			elsif(rd = '1') then
				output <= ram(to_integer(unsigned(address)));
			end if;
		end if;
	end process;
end rtl;