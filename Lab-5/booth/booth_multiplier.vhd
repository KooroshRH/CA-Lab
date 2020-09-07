library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
 
entity Boot is
    port(x, y: in std_logic_vector(3 downto 0);
         O: out std_logic_vector(7 downto 0));
end Boot;
   
architecture boot of Boot is
    begin
           
        process(x, y)
         variable a: std_logic_vector(8 downto 0);
         variable s,p : std_logic_vector(3 downto 0);
         variable i:integer;


            begin
                a := "000000000";
                s := y;
                a(4 downto 1) := x;
                   
                for i in 0 to 3 loop
                   if(a(1) = '1' and a(0) = '0') then
                      p := (a(8 downto 5));
                      a(8 downto 5) := (p - s);
                         
                   elsif(a(1) = '0' and a(0) = '1') then
                      p := (a(8 downto 5));
                      a(8 downto 5) := (p + s);
                         
                   end if;
                     
                   a(7 downto 0) := a(8 downto 1);
                     
                end loop;
                   
                O(7 downto 0) <= a(8 downto 1);
                   
            end process;
               
        end boot;