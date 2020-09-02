LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Rcounter_Test IS
END Rcounter_Test;

architecture test of Rcounter_Test is
component fourbit_counter is
 port (
 	clk_50 : in STD_LOGIC;
	reset4 : in STD_LOGIC;
 	Q4 : out STD_LOGIC_VECTOR(3 downto 0)
 );
end component;

signal cl, res : std_logic;
signal qo : std_logic_vector(3 downto 0);

begin
fourbitCounter : fourbit_counter port map (Q4 => qo, clk_50 => cl, reset4 => res);
res <= '0';
cl <= '0', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns, '0' after 300 ns, '1' after 350 ns, '0' after 400 ns, '1' after 450 ns, '0' after 500 ns, '1' after 550 ns, '0' after 600 ns, '1' after 650 ns;

end test;