library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity half_adder is
  port (
    i  : in std_logic;
    j  : in std_logic;
    
    s   : out std_logic;
    co : out std_logic
    );
end half_adder;
 
architecture rtl of half_adder is
begin
  s   <= i xor j;
  co <= i and j;
end rtl;