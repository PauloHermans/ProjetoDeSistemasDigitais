library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2_1bit is
-- empty
end tb_mux2_1bit;

architecture arch_1 of tb_mux2_1bit is

-- DUT component
component mux2_1bit is
port ( i_SEL : in std_logic;   -- selector
       i_A   : in std_logic;   -- data input
       i_B   : in std_logic;   -- data input
       o_S   : out std_logic); -- data output
end component;

signal w_SEL, w_A, w_B, w_S : std_logic;

begin
 -- Connect DUT
  u_DUT: mux2_1bit port map(i_SEL => w_SEL,
                            i_A => w_A,
                            i_B => w_B,
                             o_S => w_S);
  process
  begin

    w_SEL <= '0';
    w_A <= '0';
    w_B <= '0';
    wait for 1 ns;
    assert(w_S='0') report "Fail @ 000" severity error;

    w_SEL <= '0';
    w_A <= '0';
    w_B <= '1';
    wait for 1 ns;
    assert(w_S='0') report "Fail @ 001" severity error;

    w_SEL <= '0';
    w_A <= '1';
    w_B <= '0';
    wait for 1 ns;
    assert(w_S='1') report "Fail @ 010" severity error;
 
    w_SEL <= '0';
    w_A <= '1';
    w_B <= '1';
    wait for 1 ns;
    assert(w_S='1') report "Fail @ 011" severity error;

    w_SEL <= '1';
    w_A <= '0';
    w_B <= '0';
    wait for 1 ns;
    assert(w_S='0') report "Fail @ 100" severity error;

    w_SEL <= '1';
    w_A <= '0';
    w_B <= '1';
    wait for 1 ns;
    assert(w_S='1') report "Fail @ 101" severity error;

    w_SEL <= '1';
    w_A <= '1';
    w_B <= '0';
    wait for 1 ns;
    assert(w_S='0') report "Fail @ 110" severity error;

    w_SEL <= '1';
    w_A <= '1';
    w_B <= '1';
    wait for 1 ns;
    assert(w_S='1') report "Fail @ 111" severity error;

    -- Clear inputs
    w_SEL <= '0';
    w_A <= '0';
    w_B <= '0';
    assert false report "Test done." severity note;
    wait;
  end process;
end arch_1;
