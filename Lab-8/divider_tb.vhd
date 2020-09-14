library ieee;
use ieee.std_logic_1164.all;
entity divider_tb is
end entity divider_tb;

architecture test of divider_tb is
component Divider is
Port (
	 clk, reset : in STD_LOGIC;
 	 start : in STD_LOGIC;
 	 m : in  STD_LOGIC_VECTOR (15 downto 0);  
         n : in  STD_LOGIC_VECTOR (7 downto 0);   
         quotient : out  STD_LOGIC_VECTOR (7 downto 0);   
         remainder : out  STD_LOGIC_VECTOR (7 downto 0);   
	 ready, ovfl : out STD_LOGIC
);
end component;
signal cl, res, st, rea, ovf :std_logic;
signal  mdividand : std_Logic_vector(15 downto 0);
signal  ndivisor, qu, remain : std_Logic_vector(7 downto 0);
begin
div : Divider port map ( clk => cl, reset => res, start => st, m => mdividand, n => ndivisor, quotient => qu, remainder => remain, ready => rea, ovfl => ovf);
res <= '0', '1' after 10 ns, '0' after 20 ns;
st <= '0', '1' after 20 ns, '0' after 30 ns;
cl <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '1' after 30 ns, '0' after 35 ns, '1' after 40 ns, '0' after 45 ns, '1' after 50 ns, '0' after 55 ns, '1' after 60 ns, '0' after 65 ns, '1' after 70 ns, '0' after 75 ns, '1' after 80 ns, '0' after 85 ns, '1' after 90 ns, '0' after 95 ns, '1' after 100 ns, '0' after 105 ns, '1' after 110 ns, '0' after 115 ns, '1' after 120 ns, '0' after 125 ns, '1' after 130 ns, '0' after 135 ns, '1' after 140 ns, '0' after 145 ns, '1' after 150 ns, '0' after 155 ns, '1' after 160 ns, '0' after 165 ns, '1' after 170 ns, '0' after 175 ns, '1' after 180 ns, '0' after 185 ns, '1' after 190 ns, '0' after 195 ns, '1' after 200 ns, '0' after 205 ns, '1' after 210 ns;
mdividand <= "0000101001110101";
ndivisor <= "00011010";
end test;