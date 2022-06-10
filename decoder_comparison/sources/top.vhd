library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
  port (
    clk : in std_logic;
    reset : in std_logic;

    din : in std_logic;
    en : in std_logic;

    led : out std_logic_vector(1 downto 0)
    );
end entity top;

architecture RTL of top is

  attribute keep : string;

  signal value0_0 : std_logic_vector(31 downto 0);
  signal value1_0 : std_logic_vector(31 downto 0);
  signal value2_0 : std_logic_vector(31 downto 0);
  signal value3_0 : std_logic_vector(31 downto 0);
  signal value4_0 : std_logic_vector(31 downto 0);
  signal value5_0 : std_logic_vector(31 downto 0);
  signal value6_0 : std_logic_vector(31 downto 0);
  signal value7_0 : std_logic_vector(31 downto 0);
  signal valid_0  : std_logic;

  attribute keep of value0_0 : signal is "true";
  attribute keep of value1_0 : signal is "true";
  attribute keep of value2_0 : signal is "true";
  attribute keep of value3_0 : signal is "true";
  attribute keep of value4_0 : signal is "true";
  attribute keep of value5_0 : signal is "true";
  attribute keep of value6_0 : signal is "true";
  attribute keep of value7_0 : signal is "true";
  attribute keep of valid_0  : signal is "true";

  signal value0_1 : std_logic_vector(31 downto 0);
  signal value1_1 : std_logic_vector(31 downto 0);
  signal value2_1 : std_logic_vector(31 downto 0);
  signal value3_1 : std_logic_vector(31 downto 0);
  signal value4_1 : std_logic_vector(31 downto 0);
  signal value5_1 : std_logic_vector(31 downto 0);
  signal value6_1 : std_logic_vector(31 downto 0);
  signal value7_1 : std_logic_vector(31 downto 0);
  signal valid_1  : std_logic;

  attribute keep of value0_1 : signal is "true";
  attribute keep of value1_1 : signal is "true";
  attribute keep of value2_1 : signal is "true";
  attribute keep of value3_1 : signal is "true";
  attribute keep of value4_1 : signal is "true";
  attribute keep of value5_1 : signal is "true";
  attribute keep of value6_1 : signal is "true";
  attribute keep of value7_1 : signal is "true";
  attribute keep of valid_1  : signal is "true";

  component decoder0
    port (
      clk : in std_logic;
      reset : in std_logic;

      din : in std_logic;
      en : in std_logic;

      dout : out std_logic;
      en_o : out std_logic;
    
      value0 : out std_logic_vector(31 downto 0);
      value1 : out std_logic_vector(31 downto 0);
      value2 : out std_logic_vector(31 downto 0);
      value3 : out std_logic_vector(31 downto 0);
      value4 : out std_logic_vector(31 downto 0);
      value5 : out std_logic_vector(31 downto 0);
      value6 : out std_logic_vector(31 downto 0);
      value7 : out std_logic_vector(31 downto 0);
      valid  : out std_logic
      );
  end component decoder0;
    
  component decoder1
    port (
      clk : in std_logic;
      reset : in std_logic;

      din : in std_logic;
      en : in std_logic;

      dout : out std_logic;
      en_o : out std_logic;
    
      value0 : out std_logic_vector(31 downto 0);
      value1 : out std_logic_vector(31 downto 0);
      value2 : out std_logic_vector(31 downto 0);
      value3 : out std_logic_vector(31 downto 0);
      value4 : out std_logic_vector(31 downto 0);
      value5 : out std_logic_vector(31 downto 0);
      value6 : out std_logic_vector(31 downto 0);
      value7 : out std_logic_vector(31 downto 0);
      valid  : out std_logic
      );
  end component decoder1;

  component ila_0
    port (
      clk : in std_logic;
      probe0 : in std_logic_vector(256 downto 0);
      probe1 : in std_logic_vector(256 downto 0)
      );
  end component ila_0;
  
  signal din_t : std_logic;
  signal en_t : std_logic;

begin

  decoder0_i : decoder0 port map(
    clk => clk,
    reset => reset,
    
    din => din,
    en => en,
    
    dout => din_t,
    en_o => en_t,
    
    value0 => value0_0,
    value1 => value1_0,
    value2 => value2_0,
    value3 => value3_0,
    value4 => value4_0,
    value5 => value5_0,
    value6 => value6_0,
    value7 => value7_0,

    valid => valid_0
    );
    
  decoder1_i : decoder1 port map(
    clk => clk,
    reset => reset,
    
    din => din_t,
    en => en_t,
    
    dout => led(0),
    en_o => led(1),
    
    value0 => value0_1,
    value1 => value1_1,
    value2 => value2_1,
    value3 => value3_1,
    value4 => value4_1,
    value5 => value5_1,
    value6 => value6_1,
    value7 => value7_1,

    valid => valid_1
    );
  
  ila_0_i : ila_0
    port map(
      clk => clk,
      probe0 => valid_0 &
                value0_0 &
                value1_0 &
                value2_0 &
                value3_0 &
                value4_0 &
                value5_0 &
                value6_0 &
                value7_0,
      probe1 => valid_1 &
                value0_1 &
                value1_1 &
                value2_1 &
                value3_1 &
                value4_1 &
                value5_1 &
                value6_1 &
                value7_1
      );

end RTL;
