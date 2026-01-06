library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_iter_mult_not is
end entity;

architecture sim of tb_iter_mult_not is
  constant N : positive := 64;

  signal clk       : std_logic := '0';
  signal rst       : std_logic := '0';
  signal en        : std_logic := '0';
  signal load_seed : std_logic := '0';
  signal seed      : unsigned(N-1 downto 0) := (others => '0');
  signal x_out     : unsigned(N-1 downto 0);

begin

  -- DUT
  dut : entity work.iter_mult_not_alt
    port map (
      clk       => clk,
      rst       => rst,
      en        => en,
      load_seed => load_seed,
      seed      => seed,
      x_out     => x_out
    );

  -- Clock: 10 ns period
  clk <= not clk after 5 ns;

  -- Stimulus only (watch in waveform)
  stim_proc : process
  begin
    -- reset (synchronous)
    rst       <= '1';
    en        <= '0';
    load_seed <= '0';
    seed      <= (others => '0');

    wait until rising_edge(clk);
    wait until rising_edge(clk);
    wait until rising_edge(clk);

    rst <= '0';
    wait until rising_edge(clk);

    -- load the 64-bit seed for one clock
    seed      <= x"3C00FFF03C00FFF0";
    load_seed <= '1';
    wait until rising_edge(clk);
    load_seed <= '0';

    -- run iterations
    en <= '1';
    wait for 500 ns;   -- adjust as you like to see more cycles
    en <= '0';

    wait;
  end process;

end architecture;