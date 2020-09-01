library ieee;
use ieee.std_logic_1164.all;
  
  entity tff_async_reset is
      port (
          data  :in  std_logic;
          clk   :in  std_logic;
          reset :in  std_logic;
          q     :out std_logic 
  
      );
  end entity;
  
  architecture rtl of tff_async_reset is
      signal t :std_logic;
  begin
      process (clk, reset) begin
          if (reset = '0') then
              t <= '0';
          elsif (rising_edge(clk)) then
              t <= not t;
          end if;
      end process;
      q <= t;
  end architecture;