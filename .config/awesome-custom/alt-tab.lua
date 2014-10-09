globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey, }, "Tab",
        function()
        -- awful.client.focus.history.previous()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end),

    awful.key({ modkey, "Shift" }, "Tab",
        function()
        -- awful.client.focus.history.previous()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end))