-- Testbench for iter_mult_not
-- Assumes VHDL-2008 (works in Vivado/ModelSim/etc.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_iter_mult_not is
end entity;

architecture sim of tb_iter_mult_not is
  constant N : positive := 8;

  signal clk       : std_logic := '0';
  signal rst       : std_logic := '0';
  signal en        : std_logic := '0';
  signal load_seed : std_logic := '0';
  signal seed      : unsigned(N-1 downto 0) := (others => '0');
  signal x_out     : unsigned(N-1 downto 0);

  -- One iteration step: x_next = (x * not(x)) truncated to N LSBs
  function step(x : unsigned) return unsigned is
    variable full_prod : unsigned(2*x'length - 1 downto 0);
  begin
    full_prod := x * (not x);
    return full_prod(x'length-1 downto 0);  -- keep LSBs (mod 2^N)
  end function;

begin
  -- DUT
  dut : entity work.iter_mult_not
    generic map (
      N => N
    )
    port map (
      clk       => clk,
      rst       => rst,
      en        => en,
      load_seed => load_seed,
      seed      => seed,
      x_out     => x_out
    );

  -- Clock: 100 MHz (10 ns period)
  clk_proc : process
  begin
    while true loop
      clk <= '0'; wait for 5 ns;
      clk <= '1'; wait for 5 ns;
    end loop;
  end process;

  -- Stimulus + self-check
  stim_proc : process
    variable expected : unsigned(N-1 downto 0);
    type int_vec is array (natural range <>) of integer;
    constant seeds_to_try : int_vec := (128, 1, 187, 3, 187, 16, 127, 128, 200, 255);
  begin
    -- init
    rst       <= '1';
    en        <= '0';
    load_seed <= '0';
    seed      <= (others => '0');

    -- hold reset a few cycles (sync reset)
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    rst <= '0';
    wait until rising_edge(clk);

    -- Try multiple seeds
    for s in seeds_to_try'range loop
      -- load seed
      seed      <= to_unsigned(seeds_to_try(s), N);
      load_seed <= '1';
      wait until rising_edge(clk);
      load_seed <= '0';

      expected := to_unsigned(seeds_to_try(s), N);

      -- Give a delta cycle for x_out to update, then check load
      wait for 0 ns;
      assert x_out = expected
        report "Seed load mismatch. seed=" & integer'image(seeds_to_try(s)) &
               " got=" & integer'image(to_integer(x_out))
        severity error;

      -- iterate for some cycles
      en <= '1';
      for k in 1 to 20 loop
        wait until rising_edge(clk);
        expected := step(expected);

        wait for 0 ns; -- allow signal update after rising edge
        assert x_out = expected
          report "Mismatch at seed=" & integer'image(seeds_to_try(s)) &
                 " iter=" & integer'image(k) &
                 " expected=" & integer'image(to_integer(expected)) &
                 " got=" & integer'image(to_integer(x_out))
          severity error;
      end loop;
      en <= '0';

      report "OK seed=" & integer'image(seeds_to_try(s)) &
             " final=" & integer'image(to_integer(x_out));
      wait until rising_edge(clk);
    end loop;

    report "All tests finished." severity note;
    wait;
  end process;

end architecture;
