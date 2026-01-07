library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_MariusMethod_32 is
end entity;

architecture sim of tb_MariusMethod_32 is
  constant K          : positive := 32;
  constant CLK_PERIOD : time     := 10 ns;

  signal clk  : std_logic := '0';
  signal rst  : std_logic := '0';
  signal load : std_logic := '0';
  signal en   : std_logic := '0';

  signal a_tb : std_logic_vector(K-1 downto 0) := (others => '0');
  signal s_tb : std_logic_vector(K-1 downto 0);

begin
  -- clock
  clk <= not clk after CLK_PERIOD/2;

  -- DUT
  dut: entity work.MariusMethod
    port map (
      clk  => clk,
      rst  => rst,
      load => load,
      en   => en,
      a    => a_tb,
      s    => s_tb
    );

  stim: process
    procedure do_reset is
    begin
      rst  <= '1';
      load <= '0';
      en   <= '0';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      rst  <= '0';
      wait until rising_edge(clk);
    end procedure;

    procedure load_seed(seed : std_logic_vector(K-1 downto 0)) is
    begin
      a_tb <= seed;
      load <= '1';
      wait until rising_edge(clk);
      load <= '0';
      wait until rising_edge(clk);
    end procedure;

    procedure run_iters(n : natural) is
    begin
      en <= '1';
      for i in 1 to n loop
        wait until rising_edge(clk);
      end loop;
      en <= '0';
      wait until rising_edge(clk);
    end procedure;

  begin
    -- reset
    do_reset;

    -- Seed 1 (explicit 32-bit binary)
    load_seed("00010010001101000101011001111000"); -- 0x12345678
    run_iters(20);

    -- Seed 2 (explicit 32-bit binary)
    load_seed("10101011110011011110111100000001"); -- 0xABCDEF01
    run_iters(20);

    -- Seed 3 (explicit 32-bit binary)
    load_seed("11111111111111110000000000000000"); -- 0xFFFF0000
    run_iters(20);

    -- Seed 4 (explicit 32-bit binary)
    load_seed("00000000000000000000000000000001"); -- 0x00000001
    run_iters(20);

    -- stop
    wait;
  end process;

end architecture;