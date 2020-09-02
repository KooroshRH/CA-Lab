LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tff_Test IS
END tff_Test;

architecture test of tff_Test is
component T_FF is
port(
	T : in std_logic;
	Clock : in std_logic;
	reset : in  std_logic;
	Q : out std_logic;
	Qn : out std_logic
);
end component;

signal qo, cl, res, din, nq : std_logic;
begin
tff : T_FF port map (Q => qo, Clock => cl, reset => res, T => din, Qn => nq);
res <= '0', '1' after 800 ns;
din <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
cl <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns, '0' after 600 ns, '1' after 700 ns;

end test;