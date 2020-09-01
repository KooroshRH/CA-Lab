LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dflipflop_Test IS
END dflipflop_Test;

architecture test of dflipflop_Test is
component RisingEdge_DFlipFlop_AsyncResetLow is
port(
	Q : out std_logic;
	Clk : in std_logic;
	sync_reset : in  std_logic;
	D : in std_logic
);
end component;

signal qo, cl, sync, din : std_logic;
begin
risingedgeF : RisingEdge_DFlipFlop_AsyncResetLow port map (Q => qo, Clk => cl, sync_reset => sync, D => din);
sync <= '1', '0' after 200 ns;
din <= '1';
cl <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns;

end test;
