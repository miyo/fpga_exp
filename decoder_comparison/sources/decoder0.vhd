library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder0 is
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
end entity decoder0;

architecture RTL of decoder0 is

  signal counter : unsigned(31 downto 0) := (others => '0');

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
      if reset = '1' then
      else
        if en = '1' then
          case to_integer(counter(31 downto 5)) is
            when 0 => value0(to_integer(counter(4 downto 0))) <= din;
            when 1 => value1(to_integer(counter(4 downto 0))) <= din;
            when 2 => value2(to_integer(counter(4 downto 0))) <= din;
            when 3 => value3(to_integer(counter(4 downto 0))) <= din;
            when 4 => value4(to_integer(counter(4 downto 0))) <= din;
            when 5 => value5(to_integer(counter(4 downto 0))) <= din;
            when 6 => value6(to_integer(counter(4 downto 0))) <= din;
            when 7 => value7(to_integer(counter(4 downto 0))) <= din;
            when others => null;
          end case;
        end if;
      end if;
    end if;
  end process;
  
end RTL;
