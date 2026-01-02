library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multxor is
  generic (
    N : integer := 8
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

architecture rtl of multxor is
  signal x : unsigned(N-1 downto 0);

  -- Your multxor algorithm rewritten with numeric_std/unsigned
  function mult_bb (io : unsigned(N-1 downto 0)) return unsigned is
    variable pv, pc : unsigned(2*N-1 downto 0);
    variable s      : unsigned(N-1 downto 0);
  begin
    pv := (others => '0');
    pc := (others => '0');

    for n in 0 to N-1 loop
      for m in 0 to N-1 loop
        if m > n then
          pc(m+n) := io(m) xor io(n);
        else
          pc(m+n) := '0';
        end if;

        pv := pv + pc;
        pc := (others => '0');
      end loop;
    end loop;

    -- Discard the 2 MSBs of the 2N-bit result, then take the next N MSBs
    s := pv;
    return s;
  end function;

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        x <= (others => '0');
      elsif load_seed = '1' then
        x <= seed;
      elsif en = '1' then
        x <= mult_bb(x);
      end if;
    end if;
  end process;

  x_out <= x;
end architecture;