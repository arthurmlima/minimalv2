library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity iter_mult_not is
  generic (
    N : positive := 8
  );
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;                -- synchronous reset
    en        : in  std_logic;                -- iterate when '1'
    load_seed : in  std_logic;                -- load seed when '1'
    seed      : in  unsigned(N-1 downto 0);   -- initial value
    x_out     : out unsigned(N-1 downto 0)    -- current state
  );
end entity;

architecture rtl of iter_mult_not is
  signal x : unsigned(N-1 downto 0);
begin
  process(clk)
    variable full_prod : unsigned(2*N-1 downto 0);
  begin
    if rising_edge(clk) then
      if rst = '1' then
        x <= (others => '0');
      elsif load_seed = '1' then
        x <= seed;
      elsif en = '1' then
        -- Multiply x by bitwise NOT(x) (both N-bit), get 2N-bit product
        full_prod := x * (not x);

        -- Truncate to N bits (keep LSBs => mod 2^N)
        x <= full_prod(full_prod'high-2 downto full_prod'high-9);
      end if;
    end if;
  end process;

  x_out <= x;
end architecture;
