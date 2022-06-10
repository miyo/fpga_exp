library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder1 is
  port (
    clk : in std_logic;
    reset : in std_logic;

    din : in std_logic;
    en : in std_logic;

    dout : out std_logic;
    en_o : out std_logic := '0';
    
    value0 : out std_logic_vector(31 downto 0);
    value1 : out std_logic_vector(31 downto 0);
    value2 : out std_logic_vector(31 downto 0);
    value3 : out std_logic_vector(31 downto 0);
    value4 : out std_logic_vector(31 downto 0);
    value5 : out std_logic_vector(31 downto 0);
    value6 : out std_logic_vector(31 downto 0);
    value7 : out std_logic_vector(31 downto 0);
    valid  : out std_logic := '0'
    );
end entity decoder1;

architecture RTL of decoder1 is

  signal counter : unsigned(31 downto 0) := (others => '0');
  signal din_r : std_logic_vector(32*8-1 downto 0);

begin

  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        counter <= (others => '0');
        valid   <= '0';
        en_o    <= '0';
      else
        if en = '1' then
          if counter < (32*8) then
            counter <= counter + 1;
            valid <= '0';
            en_o <= '0';
          else
            valid <= '1';
            en_o <= '1';
          end if;
        else
          en_o <= '0';
        end if;
      end if;
      dout <= din;
    end if;
  end process;
  
  process(clk)
  begin
    if rising_edge(clk) then
      if en = '1' then
        if counter < (32*8) then
          din_r  <= din_r(din_r'high-1 downto 0) & din;
        end if;
      end if;
    end if;
  end process;

  value0 <= din_r(32*8-1 downto 32*7);
  value1 <= din_r(32*7-1 downto 32*6);
  value2 <= din_r(32*6-1 downto 32*5);
  value3 <= din_r(32*5-1 downto 32*4);
  value4 <= din_r(32*4-1 downto 32*3);
  value5 <= din_r(32*3-1 downto 32*2);
  value6 <= din_r(32*2-1 downto 32*1);
  value7 <= din_r(32*1-1 downto 32*0);

end RTL;
