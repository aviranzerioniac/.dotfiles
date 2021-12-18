import os
import subprocess

from typing import List
from libqtile.config import ScratchPad, DropDown, Group, Match, Key
from libqtile import widget
from libqtile import hook, layout
from libqtile import extension
from libqtile.config import Click, Drag
from libqtile.lazy import lazy

from colors import nord_fox
from bar import widget_defaults, screens
from keybindings import browser, terminal, keys, mod

file_browser = 'nemo'
home = os.path.expanduser("~")

# Define Groups
group_names=[
        ("  ", {}),
        ("  ", {}),
        ("  ", { }),
        ("  ", { }),
        ("  ", { }),
    ]

groups = [Group(name, **kwargs) for name, kwargs in group_names]
for i, (name, kwargs) in enumerate(group_names, 1):
        keys.append(Key([mod], str(i), lazy.group[name].toscreen())),
        keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))),

layouts = [
    layout.MonadTall(
        margin=3,
        border_normal=nord_fox['black'],
        border_focus='#3ef7eb',
        border_width=2,
        single_border_width = 2,
        single_margin=1
        ),
    layout.MonadWide(
         margin = 3,
        border_normal=nord_fox['black'],
        border_focus='#3ef7eb',
        border_width=2,
        single_border_width = 2,
        single_margin=1,
        name = "Wide"),
    layout.Max(
        margin = 3,
        border_normal=nord_fox['black'],
        border_focus='#3ef7eb',
        border_width=2,
        single_border_width = 2,
        single_margin=1,
        name = "Max",
        ),
    layout.Stack(
        margin = 3,
        border_normal=nord_fox['black'],
        border_focus='#3ef7eb',
        border_width=2,
        single_border_width = 2,
        single_margin=0,
        num_stacks=3),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(
    #     name = "BSP",
    #     ),
    # layout.Columns(
    #     name = "Columns",
    #     ),
    # layout.Matrix(
    #     name = "Matrix",
    #     ),
    #     layout.RatioTile(),
    # layout.Tile(
    #     name = "Tile",
    #     ),
    # layout.TreeTab(
    #     name = "Tree",
    #     ),
    # layout.VerticalTile(
    #     name = "VTile",
    #     ),
    # # layout.RatioTile(),
    # layout.Tile()
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='blueman-manager'),
    Match(wm_class=file_browser),
    Match(wm_class='pavucontrol'),
    Match(wm_class='zoom'),
    Match(wm_class='xarchiver'),
    Match(wm_class='bitwarden'),
    Match(wm_class='mictray'),
    Match(wm_class='Msgcompose'),

    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    ],
    border_focus=nord_fox['magenta'],
    border_width=2)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

wmname = "Qtile"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
