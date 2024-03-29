from libqtile import extension
from libqtile.lazy import lazy
from libqtile.config import Key

from colors import nord_fox

mod = 'mod4'
terminal = "alacritty"
browser = "vivaldi-stable"

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
    Key ([mod], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),

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
    Key ([mod], "i", lazy.spawn("intellij-idea-ultimate-edition"), desc="Intellijent"),
    Key ([mod], "m", lazy.spawn("code"), desc="VSCode"),

    # Media Control

    Key ([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"),),
    Key ([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"),),
    Key ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),),
   ## Key ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),),
   ## Key ([], "XF86AudioNext", lazy.spawn("playerctl next"),),
   ## Key ([], "XF86AudioPrev", lazy.spawn("playerctl previous"),),

]
