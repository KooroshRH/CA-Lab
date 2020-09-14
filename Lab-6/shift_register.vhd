library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
 port(
 clk, reset, load : in std_logic;
 parallel_in : in std_logic_vector(3 downto 0);
 lr: in std_logic_vector(1 downto 0);
 reg_out : out std_logic_vector(3 downto 0) );
end shift_register;

architecture arch of shift_register is
 signal tmp_req : std_logic_vector(3 downto 0);
begin
 process (clk)
 begin
 if reset = '1' then
 	tmp_req <= "0000";
 elsif (CLK'event and CLK='1') then
	if load = '1' then
		case lr is
			when "00" =>
				tmp_req <= parallel_in;
			when "11" => -- arithmetic and logical left shift
				tmp_req(3 downto 1) <= tmp_req(2 downto 0);
				tmp_req(0) <= '0';
			when "10" => -- arithmetic right shift
				tmp_req(2 downto 0) <= tmp_req(3 downto 1);
				tmp_req(3) <= '1';
			when "01" => -- logical right shift
				tmp_req(2 downto 0) <= tmp_req(3 downto 1);
				tmp_req(3) <= '0';
			when others =>
		end case;
	end if;
 end if;
 reg_out <= tmp_req;
 end process;
end arch;

