library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.my_types_pkg.all;

entity display is
    port(
        clk100MHz      : in  std_logic;
        hsync,vsync    : out std_logic;
        red,green,blue : out std_logic_vector(3 downto 0);
        myboard        : in  board
    );
end display;

architecture Behavioral of display is

-- row constants
constant H_TOTAL: integer:=800-1;
constant H_SYNC: integer:=96-1;
constant H_BACK: integer:=48-1;
constant H_START: integer:=96+48-1;
constant H_ACTIVE: integer:=640-1;
constant H_END: integer:=800-16-1;
constant H_FRONT: integer:=16-1;

-- column constants
constant V_TOTAL: integer:=524-1;
constant V_SYNC: integer:=2-1;
constant V_BACK: integer:=31-1;
constant V_START: integer:=2+31-1;
constant V_ACTIVE: integer:=480-1;
constant V_END: integer:=524-11-1;
constant V_FRONT: integer:=11-1;

--tetris board constants
constant B_HSTART: integer:=363;
constant B_HEND: integer:=563;
constant B_VSTART: integer:=72;
constant B_VEND: integer:=472;

signal clk50MHz, clk25MHz, clk25KHz: std_logic;
signal hcount, vcount: std_logic_vector(11 downto 0);
signal counter: integer := 0;

--for board element
signal data : std_logic;

begin

-- generate 50MHz clock
vga_clk_gen_proc1: process(clk100MHz)
begin
    if( rising_edge(clk100MHz) ) then
        clk50MHz <= not clk50MHz;
    end if;
end process vga_clk_gen_proc1;

-- generate 25MHz clock
vga_clk_gen_proc2: process(clk50MHz)
begin
    if( rising_edge(clk50MHz) ) then
        clk25MHz <= not clk25MHz;
    end if;
end process vga_clk_gen_proc2;

-- generate 25KHz clock
vga_clk_gen_proc3: process(clk25MHz)
begin
    if( rising_edge(clk25MHz) ) then
        if(counter = 1000/2-1) then
            clk25KHz <= not clk25KHz;
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
    end if;
end process vga_clk_gen_proc3;

-- horizontal counter
pixel_count_proc: process(clk25MHz)
begin
    if( rising_edge(clk25MHz) ) then
        if(hcount = H_TOTAL) then
            hcount <= (others => '0');
        else
            hcount <= hcount + 1;
        end if;
    end if;
end process pixel_count_proc;

-- generate hsync
hsync_gen_proc: process(hcount) begin
    if(hcount > H_SYNC) then
        hsync <= '1';
    else
        hsync <= '0';
    end if;
end process hsync_gen_proc;

-- vertical counter
line_count_proc: process(clk25MHz)
begin
    if( rising_edge(clk25MHz) ) then
        if(hcount = H_TOTAL) then
            if(vcount = V_TOTAL) then
                vcount <= (others => '0');
            else
                vcount <= vcount + 1;
            end if;
        end if;
    end if;
end process line_count_proc;

-- generate vsync
vsync_gen_proc: process(vcount)
begin
    if(vcount > V_SYNC) then
        vsync <= '1';
    else
        vsync <= '0';
    end if;
end process vsync_gen_proc;

-- generate RGB signals for 640x480 display area
data_output_proc: process(hcount, vcount, myboard)
begin
    -- size of addressable video
    if( (hcount>=H_START and hcount<H_END) and (vcount >= V_START and vcount<V_TOTAL) ) then
        -- inside the monitor
        -- size of tetris board and tetris border
        if (hcount>=B_HSTART-5 and hcount<B_HEND+5) and (vcount>=B_VSTART-5 and vcount<B_VEND+5) then
            -- inside the outer bolder
            -- size of tetris board
            if (hcount>=B_HSTART and hcount<B_HEND) and (vcount>=B_VSTART and vcount<B_VEND) then
                --inside the board
                data <= myboard(to_integer(unsigned(vcount-B_VSTART))/20)(to_integer(unsigned(hcount-B_HSTART))/20);
                if data = '1' then
                    red   <= "1111";
                    green <= "0000";
                    blue  <= "0000";
                else
                    red   <= "0000";
                    green <= "0000";
                    blue  <= "0000";
                end if;
            else
                red   <= "1111";
                green <= "1111";
                blue  <= "1111";
            end if;
        else
            red   <= "0000";
            green <= "0000";
            blue  <= "0000";
        end if;
    else
        red   <= "0000";
        green <= "0000";
        blue  <= "0000";
    end if;
end process data_output_proc;

end Behavioral;