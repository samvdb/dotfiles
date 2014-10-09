-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
        { rule = { class = "URxvt" },
          properties = { opacity = 0.99 } },

    { rule = { class = "jetbrains-phpstorm" },
        properties = { tag = tags[primaryMonitor][1] } },

    { rule = { class = "sun-awt-X11-XDialogPeer" },
        properties = { tag = tags[primaryMonitor][1] } },

    { rule = { class = "sun-awt-X11-XFramePeer" },
        properties = { tag = tags[primaryMonitor][1] } },

    { rule = { class = "Pidgin" },
        properties = { tag = tags[1][7] } },

    { rule = { class = "Spotify" },
        properties = { tag = tags[1][5] } },

    { rule = { class = "google-chrome-stable" },
        properties = { tag = tags[1][2] } },


}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
