########################################
##                                    ##
##                                    ##
##          qtile config              ##
##                                    ##
##                                    ##
## 2020 @ Lokesh Dhakal               ##
##                                    ##
##                                    ##
########################################

from sys import prefix
from typing import List  # noqa: F401

import os
import re
import socket
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [

    # Switch between windows
    Key ([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key ([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key ([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key ([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key ([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key ([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key ([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key ([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key ([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key ([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key ([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key ([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key ([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key ([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key ([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key ([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key ([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Essentials
    Key ([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key ([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key ([mod], "b", lazy.hide_show_bar(), desc="Hide top bar"),
    Key ([mod], "d", lazy.spawn('rofi -show drun'), desc="Spawn a rofi"),
    Key ([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle Fullscreen"),
    Key ([mod], "n", lazy.spawn('nemo'), desc="Open File Browser"),
    Key ([mod], "c", lazy.spawn("vivaldi-stable"), desc="Open Web Browser"),
    Key ([mod], "e", lazy.spawn('emacsclient -c'), desc="Open Emacs"),

    # Media Control

    Key ([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"),),
    Key ([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"),),
    Key ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),),
   ## Key ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),),
   ## Key ([], "XF86AudioNext", lazy.spawn("playerctl next"),),
   ## Key ([], "XF86AudioPrev", lazy.spawn("playerctl previous"),),
]


group_names = [("", {'layout': 'bsp'}),
               ("", {'layout': 'max'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'bsp'}),
               ("", {'layout': 'max'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'floating'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {"border_width": 4,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

layouts = [
    layout.Max(margin=1),
    layout.Bsp(margin=3, border_focus='#3ef7eb'),
    layout.MonadTall(margin=3, border_focus='#268c56', ratio=0.4),
    layout.Floating(),

    # Try more layouts by unleashing below layouts.
    # layout.Columns(border_focus_stack='#d75f5f', margin=3),
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
    markup=True,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(hide_unused='True', rounded='True', active = "5e81ac", inactive = "b48ead", this_current_screen_border = "bf616a", highlight_method = "line", highlight_color=["2e3440", "2e3440"], center_aligned=True,),
                widget.WindowName(show_state='True', markup='True'),

                ## widget.Prompt(),
                ## widget.TextBox("default config", name="default"),
                ## widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Pomodoro(length_long_break=20, length_short_break=5, length_pomodori=35, notification_on='True', num_pomodori=3, prefix_inactive='Pomo', prefix_pause='Pause', update_interval=1),
                widget.Systray(icon_size=15),
                widget.Clock(format='%A %d %b, %H:%M'),
               widget.CurrentLayoutIcon(scale=0.6),
            ],
           size=24, opacity=0.5
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])

auto_fullscreen = True
focus_on_window_activation = "smart"

## Startup Applications
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qt!l3"
