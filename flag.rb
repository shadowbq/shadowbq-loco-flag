#!/usr/bin/env ruby
require 'rubygems'
require 'ncurses'


def flag (c='0', d='1')
    stars_a = '* * * * * * '
    stars_b = ' * * * * * *'
    short_c = ""
    43.times { short_c += c}

    short_d = ""
    43.times do
        short_d += d
    end
    long_c = ""

    55.times do
        long_c += c
    end
    long_d = ""
    55.times do
        long_d += d
    end
    str = [stars_a+short_c, stars_b+short_d, stars_a+short_c, stars_b+short_d, stars_a+short_c, stars_b+short_d, stars_a+short_c, long_d, long_c, long_d, long_c,long_d, long_c ]

    return str
end


Ncurses.initscr
if (Ncurses.has_colors?)
  bg = Ncurses::COLOR_BLACK
  Ncurses.start_color
  if (Ncurses.respond_to?("use_default_colors"))
    if (Ncurses.use_default_colors == Ncurses::OK)
      bg = -1
    end
  end
  Ncurses.init_pair(1, Ncurses::COLOR_BLUE, bg);
  Ncurses.init_pair(2, Ncurses::COLOR_RED, bg);
  Ncurses.init_pair(3, Ncurses::COLOR_WHITE, bg);
end
Ncurses.nl()
Ncurses.noecho()
Ncurses.curs_set(0)

while true do

    Ncurses.refresh
    a = ['1','2','3'].sample
    b = ['9','8'].sample
    flag.each_with_index {|line, index|
        i = [1,2,3].sample
        Ncurses.stdscr.color_set(i, nil)
        Ncurses.mvaddstr(index + 4, 19, flag(a, b)[index]);
    }
    Ncurses.refresh

    sleep(2.5)
end

Ncurses.endwin
