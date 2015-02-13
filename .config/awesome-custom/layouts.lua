layouts = {
    awful.layout.suit.floating, -- 1
    awful.layout.suit.tile, -- 2
    awful.layout.suit.tile.left, -- 3
    awful.layout.suit.tile.bottom, -- 4
    awful.layout.suit.tile.top, -- 5
    awful.layout.suit.fair, -- 6
    awful.layout.suit.fair.horizontal, -- 7
    awful.layout.suit.spiral, -- 8
    awful.layout.suit.spiral.dwindle, -- 9
    awful.layout.suit.max, -- 10,
    awful.layout.suit.max.fullscreen, -- 11
}
-- }}}


-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
    names = {
	{
            '☭:term',
            '⚡:chrome',
            '☠:Chat',
            '☃:sam',
            '⌥:media',
            '⌘:htop',
            '✇:other',
        },
        {
            '☭:devOps',
            '⚡:remote',
            '♨:term',
            '☠:other',
            '☃:other',
            '☃:other',
            '☃:other',
        },
    },
    layout = {
	{
            layouts[5], -- 1:term
            layouts[10], -- 2:chrome
            layouts[3], -- 3:Chat
            layouts[10], -- 4:sam
            layouts[2], -- 5:media
            layouts[11], -- 6:htop
            layouts[10], -- 7:pidgin
        },
	{
            layouts[10], -- 1:devOps
            layouts[3], -- 2:chrome
            layouts[5], -- 3:term
            layouts[10], -- 4:other
            layouts[2], -- 5:other
            layouts[10], -- 6:other
            layouts[10], -- 7:other
        },
    }
}

for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names[s], s, tags.layout[s])
end

-- }}}
