--[[
                                      
     Multicolor Awesome WM config 2.0 
     github.com/copycat-killer        
                                      
--]]
-- Override awesome.quit when we're using GNOME
    _awesome_quit = awesome.quit
    awesome.quit = function()
        if os.getenv("DESKTOP_SESSION") == "awesome-gnome" then
           os.execute("/usr/bin/gnome-session-quit")
        else
	    _awesome_quit()
        end
    end

-- {{{ Required libraries
gears     = require("gears")
awful     = require("awful")
awful.rules     = require("awful.rules")
require("awful.autofocus")
wibox     = require("wibox")
beautiful = require("beautiful")
naughty   = require("naughty")
drop      = require("scratchdrop")
lain      = require("lain")
menubar   = require("menubar")

-- Load Debian menu entries
--debian_menu = require("debian_menu")


-- }}}

-- Paths
homepath="/home/"..os.getenv("USER")
configpath=homepath.."/.config/awesome/"
iconpath= configpath.."icons/"
package.path = package.path .. ";" .. homepath .. "/.config/awesome-custom/?.lua"

require('error')

-- beautiful init
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/multicolor/theme.lua")

-- Global Variables
require("global")
--testwallpaper                     = homepath .. "/.config/awesome-custom/wall.jpg"

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
        -- gears.wallpaper.maximized(testwallpaper, s, true)
    end
end
-- }}}

require("layouts")

-- Defines top bar and widgets inside it.
require("top-bar")

-- Defines Keybindings
require("keybindings")

-- Multi Monitor script
require("multi-monitors")

-- Defines Rules and Signals
require("rules-signals")

-- Autostart
require("autostart")
