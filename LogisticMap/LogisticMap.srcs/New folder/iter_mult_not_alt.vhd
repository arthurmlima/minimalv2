library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  -- keeps your pv := pv + pc working
use ieee.numeric_std.all;         -- only for unsigned <-> slv conversions

entity iter_mult_not_alt is
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;                 -- synchronous reset (matches iter_mult_not)
    en        : in  std_logic;                 -- iterate when '1'
    load_seed : in  std_logic;                 -- load seed when '1'
    seed      : in  unsigned(63 downto 0);     -- initial value
    x_out     : out unsigned(63 downto 0)      -- current state
  );
end entity;

architecture arch of iter_mult_not_alt is

  signal r_reg, r_next : std_logic_vector(63 downto 0);

  ------------------------------------------------------------------------------------------------------------------------
  -- (UNCHANGED function: same structure/types/loops/slice)
  function mult_bb (io : std_logic_vector(63 downto 0)) return std_logic_vector is
    variable pv, pc : std_logic_vector(127 downto 0);
    variable s      : std_logic_vector(63 downto 0);
  begin
    pv := (others => '0');
    pc := (others => '0');
    -- logica observada no algortimo multiplicativo
    for n in 0 to 63 loop
      for m in 0 to 63 loop
        if m > n then
          pc(m+n) := (io(m) xor io(n));
        else
          pc(m+n) := '0';
        end if;
        pv := pv + pc;
        pc := (others => '0');
      end loop;
    end loop;
    s := pv(125 downto 62);
    return s;
  end mult_bb;
  ------------------------------------------------------------------------------------------------------------------------

begin

  -- State register (sync reset, like iter_mult_not)
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r_reg <= (others => '0');
      else
        r_reg <= r_next;
      end if;
    end if;
  end process;

  -- Next-state logic with same priority as iter_mult_not:
  -- reset handled in reg process, then: load_seed > en > hold
  process(r_reg, load_seed, en, seed)
  begin
    r_next <= r_reg;  -- hold by default

    if load_seed = '1' then
      r_next <= std_logic_vector(seed);
    elsif en = '1' then
      r_next <= mult_bb(r_reg);
    end if;
  end process;

  -- Output (current state)
  x_out <= unsigned(r_reg);

end arch;