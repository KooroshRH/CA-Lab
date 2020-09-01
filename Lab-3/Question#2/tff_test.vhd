LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tff_Test IS
END tff_Test;

architecture test of tff_Test is
component tff_async_reset is
port(
	data : in std_logic;
	clk : in std_logic;
	reset : in  std_logic;
	q : out std_logic
);
end component;

signal qo, cl, res, din : std_logic;
begin
tff : tff_async_reset port map (q => qo, clk => cl, reset => res, data => din);
res <= '1', '0' after 300 ns;
din <= '1';
cl <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns;

end test;