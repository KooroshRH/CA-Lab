library IEEE; 
use IEEE.STD_LOGIC_1164.all;  

entity basic_computer is 
   port( 
      	clk: in std_logic;
	res: out std_logic_vector(15 downto 0)
   ); 
end basic_computer;  

architecture behavioral of basic_computer is 
component adder16bit
    PORT (  a, b : IN  std_logic_vector(15 DOWNTO 0);
            cin  : IN  STD_LOGIC;
            sum1 : OUT std_logic_vector(15 DOWNTO 0);
            cout : OUT std_logic);
END component;

component decoder3to8
Port ( input : in STD_LOGIC_VECTOR (2 downto 0);
output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component decoder4to16
PORT ( input : IN STD_LOGIC_VECTOR(3 downto 0);
output : OUT STD_LOGIC_VECTOR(15 downto 0));
END component;

component memory
	port
	(
		input	: in std_logic_vector(15 downto 0);
		output  : out std_logic_vector(15 downto 0);
		res     : out std_logic_vector(15 downto 0);
		address	: in std_logic_vector(15 downto 0);
		wr		: in std_logic;
		rd		: in std_logic;
		Clk		: in std_logic
	);
end component;

component register16bit
port ( 
	D : IN std_logic_vector(15 downto 0);
	load : IN std_logic;
	increament : in std_logic;
	reset : IN std_logic;
	Clk : IN std_logic;
	Q : OUT std_logic_vector(15 downto 0)
	 );
end component;

component sequence_counter
 port (
 	Clk : in STD_LOGIC;
	clear : in STD_LOGIC;
 	output : out STD_LOGIC_VECTOR(3 downto 0)
 );
end component;

signal T, IR_data, bus_data, PC_data, AR_data, DR_data, sum_adder, AC_data, mem_out: std_logic_vector(15 downto 0) := "0000000000000000";
signal De: std_logic_vector(7 downto 0) := "00000000"; -- baraye inke ghati nashe ba D register
--AR_register
signal AR_load, out_and_I_T3, I : std_logic := '0'; 
--Seq_counter
signal out_SC : std_logic_vector(3 downto 0) := "0000";
signal SC_clear, out_and_De2_T5, out_and_De1_T5, out_and_De3_T4 : std_logic := '0';
--memory
signal mem_write, mem_read : std_logic := '0';

signal out_and_De2_T4, out_and_De1_T4 : std_logic := '0';

signal out_or_S : std_logic_vector(2 downto 0) := "000";

signal DR_load : std_logic := '0';

signal AC_load : std_logic := '0';

signal adder_E : std_logic := '0';
begin 

IR_register: register16bit port map (D => bus_data, load => T(1), increament => '0', reset => '0', Clk => clk, Q => IR_data);
PC_register : register16bit port map (D => bus_data, load => '0', increament => T(1), reset => '0', Clk => clk, Q => PC_data);

out_and_I_T3 <= I and T(3);
AR_load <= T(0) or T(2) or out_and_I_T3;
AR_register : register16bit port map (D => bus_data, load => AR_load, increament => '0', reset => '0', Clk => clk, Q => AR_data);

out_and_De2_T5 <= De(2) and T(5);
out_and_De1_T5 <= De(1) and T(5);
out_and_De3_T4 <= De(3) and T(4);
SC_clear <= out_and_De2_T5 or out_and_De1_T5 or out_and_De3_T4;
Seq_counter : sequence_counter port map (Clk => clk, clear => SC_clear, output => out_SC);

dec3to8 : decoder3to8 port map (input => IR_data(14 downto 12), output => De);--momkene baraks bekhad
dec4to16 : decoder4to16 port map (input => out_SC, output => T);

out_and_De2_T4 <= De(2) and T(4);
out_and_De1_T4 <= De(2) and T(4);
mem_write <= De(3) and T(4);
mem_read <= T(1) or out_and_De2_T4 or out_and_De1_T4 or out_and_I_T3;
mem : Memory port map (input => bus_data, output => mem_out, res => res, address => AR_data, wr => mem_write, rd => mem_read, Clk => clk);

out_or_S(2) <= T(1) or T(2) or out_and_De3_T4 or out_and_De2_T4 or out_and_De1_T4 or out_and_I_T3;
out_or_S(1) <= T(0) or T(1) or out_and_De2_T4 or out_and_De1_T4 or out_and_I_T3;
out_or_S(0) <= T(1) or T(2) or out_and_De2_T4 or out_and_De1_T4 or out_and_I_T3;

DR_load <= out_and_De2_T4 or out_and_De1_T4;
DR_register : register16bit port map(D => bus_data, load => DR_load, increament => '0', reset => '0', Clk => clk, Q => DR_data);

AC_load <= out_and_De1_T5 or out_and_De2_T5;
AC_register : register16bit port map(D => sum_adder, load => AC_load, increament => '0', reset => out_and_De2_T4, Clk => clk, Q => AC_data);

adder : adder16bit port map(a => DR_data, b => AC_data, cin => '0', sum1 => sum_adder, cout => adder_E);

process(out_or_S) begin
	if(out_or_S="111") then
		bus_data <= mem_out;
	elsif(out_or_S="001") then
		bus_data <= AR_data;
	elsif(out_or_S="010") then
		bus_data <= PC_data;
	elsif(out_or_S="011") then
		bus_data <= DR_data;
	elsif(out_or_S="100") then
		bus_data <= AC_data;
	elsif(out_or_S="101") then
		bus_data <= IR_data; 
	end if;
end process;
end behavioral;


