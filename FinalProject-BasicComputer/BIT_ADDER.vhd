library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity BIT_ADDER is
PORT( a, b, cin  : IN  STD_LOGIC;
                sum, cout  : OUT STD_LOGIC
        );
end BIT_ADDER;
 
architecture gate_level of BIT_ADDER is
 
begin
 
 sum <= a XOR b XOR cin ;
 cout <= (a AND b) OR (cin AND a) OR (cin AND b) ;
 
end gate_level;