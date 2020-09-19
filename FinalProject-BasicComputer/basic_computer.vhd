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

component and_gate
	Port(
	A, B: in std_logic;
	C : out std_logic
	);
End component;

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
		data	: inout std_logic_vector(15 downto 0);
		address	: in std_logic_vector(15 downto 0);
		wr		: in std_logic;
		rd		: in std_logic;
		clk		: in std_logic
	);
end component;

component or_gate
Port(
A, B: in std_logic;
C : out std_logic
);
End component;

component register16bit
port ( 
	D : IN std_logic_vector(15 downto 0);
	load : IN std_logic;
	increament : in std_logic;
	Clk : IN std_logic;
	Q : OUT std_logic_vector(15 downto 0)
	 );
end component;

component sequence_counter
 port (
 	clk : in STD_LOGIC;
	clear : in STD_LOGIC;
 	output : out STD_LOGIC_VECTOR(3 downto 0)
 );
end component;


begin 
   
end behavioral;