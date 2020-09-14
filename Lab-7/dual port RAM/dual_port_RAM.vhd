library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dual_port_ram is
	generic
	(
		W : integer;
		C : integer
	);
	port
	(
		data_a	: inout std_logic_vector(W-1 downto 0);
		data_b	: inout std_logic_vector(W-1 downto 0);
		address_a	: in std_logic_vector(C-1 downto 0);
		address_b	: in std_logic_vector(C-1 downto 0);
		wr_a		: in std_logic;
		wr_b		: in std_logic;
		rd_a		: in std_logic;
		rd_b		: in std_logic;
		reset		: in std_logic;
		clk		: in std_logic
	);
	
end entity;

architecture rtl of dual_port_ram is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector(W-1 downto 0);
	type memory_t is array((2**C)-1 downto 0) of word_t;
	
	-- Declare the RAM signal.
	signal ram : memory_t;
	
	-- Register to hold the address
	signal addr_reg : std_logic_vector(C-1 downto 0);

begin

	process(clk, reset)
	begin
		if(reset = '0') then 
			for I in 0 to (2**C-1) loop
				ram(I) <= std_logic_vector(to_unsigned(I, word_t'length));
			end loop;
		end if;
		if(rising_edge(clk)) then
			if(wr_a = '1') then
				ram(to_integer(unsigned(address_a))) <= data_a;
			elsif(rd_a = '1') then
				data_a <= ram(to_integer(unsigned(address_a)));
			end if;
			if(wr_b = '1') then
				ram(to_integer(unsigned(address_b))) <= data_b;
			elsif(rd_b = '1') then
				data_b <= ram(to_integer(unsigned(address_b)));
			end if;
		end if;
	end process;
end rtl;