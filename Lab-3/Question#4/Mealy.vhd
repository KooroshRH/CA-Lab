library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy_machine is
port(
	input : in std_logic;
	output : out std_logic;
	clk : in std_logic
);
end mealy_machine;

architecture Behavioral of mealy_machine is
	type state_t is (s0 , s1 , s2, s3);
	signal state : state_t := s0;
	signal next_state : state_t := s0;
begin

CMB:process(state, input)
	begin
		case state is
			when s0=>
				output<='0';
			when s1=>
				output<='0';
			when s2=>
				output<='0';
			when s3=>
				if(input='1') then
					output<='1';
				else
					output<='0';
				end if;
		end case;
	end process;
	REG:process(clk)
		begin
		if(rising_edge(clk)) then
			case state is
			when s0=>
				if(input='1') then
					state<=s1;
				end if;
			when s1=>
				if(input='0') then
					state<=s0;
				else
					state<=s2;
				end if;
			when s2=>
				if(input='0') then
					state<=s3;
				end if;
			when s3=>
				if(input='1') then
					state<=s1;
				else
					state<=s0;
				end if;
			end case;
		end if;
		end process;
end behavioral;