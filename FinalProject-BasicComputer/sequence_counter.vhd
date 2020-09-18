library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_counter is
 port (
 	clk : in STD_LOGIC;
	clear : in STD_LOGIC;
 	output : out STD_LOGIC_VECTOR(3 downto 0)
 );
end sequence_counter;

architecture behavioral of sequence_counter is
component T_FF
 port (
 	T : in STD_LOGIC;
 	Clock : in STD_LOGIC;
 	reset : in STD_LOGIC;
 	Q : out STD_LOGIC;
	Qn : out STD_LOGIC
 );
end component;

signal all_T, q0, q1, q2, q3 : STD_LOGIC;
begin

all_T <= '1';

TFF0: T_FF port map (T => all_T, Clock => clk, reset => clear, Q => output(0), Qn => q0);
TFF1: T_FF port map (T => all_T, Clock => q0, reset => clear, Q => output(1), Qn => q1);
TFF2: T_FF port map (T => all_T, Clock => q1, reset => clear, Q => output(2), Qn => q2);
TFF3: T_FF port map (T => all_T, Clock => q2, reset => clear, Q => output(3), Qn => q3);

end behavioral;