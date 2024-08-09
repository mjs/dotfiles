-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.xcursor_theme = "Adwaita"
config.hide_tab_bar_if_only_one_tab = true

-- Have alt work normally on both sides
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Light' })

-- config.color_scheme = 'Moonfly (Gogh)'
config.color_scheme = 'ayu'

config.window_background_gradient = {
  orientation = 'Horizontal',

  colors = {
    '#0f0f0f',
    '#171717',
  },
}

config.window_frame = {
  -- The font used in the tab bar.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,
}

config.colors = {
  tab_bar = {
    -- The active tab is the one that has focus in the window
    active_tab = {
      bg_color = '#555',
      fg_color = '#d0d0d0',
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#222',
      fg_color = '#a0a0a0',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#222',
      fg_color = '#c0c0c0',
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#555',
      fg_color = '#d0d0d0',
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}


config.keys = {
  -- Tabs
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) },

  -- Splits
  { mods = 'CTRL|ALT', key = 'd', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { mods = 'CTRL|SHIFT|ALT', key = 'd', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

  -- Pane switching
  { mods = 'CTRL|ALT', key = '.', action = act.ActivatePaneDirection 'Next' },
  { mods = 'CTRL|ALT', key = 's', action = act.PaneSelect },
  { mods = 'CTRL|ALT', key = 'o', action = act.RotatePanes 'Clockwise' },

  -- Pane resizing
  { mods = 'CTRL|ALT', key = 'r', action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
  }},
}

config.key_tables = {
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 3 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 3 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 3 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 3 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 3 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 3 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 3 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 3 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
  },
}

return config
