library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types_pkg.all;

entity move is
    Port ( clk100MHz  : in std_logic;
           myboard : buffer board;
           key     : buffer std_logic_vector(3 downto 0)
    );
end move;

architecture Behavioral of move is
    component falling is
        Port (
                 clk100MHz  : in std_logic;
                 myboard : buffer board;
                 blocks : in std_logic_vector(2 downto 0)
        );
    end component;

    -- clk1Hz
    signal clk1Hz  : std_logic := '0';
    signal counter : integer := 0;
    signal blocks : std_logic_vector(2 downto 0) := "000";
begin
    
FALL: falling port map (
        clk100MHz => clk100MHz,
        myboard => myboard,
        blocks => blocks
);
end Behavioral;
