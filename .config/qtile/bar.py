from libqtile import widget
from libqtile.bar import Bar
from libqtile.config import Screen

from colors import nord_fox, nord
from unicodes import lower_left_triangle

widget_defaults = dict(
    font='TerminessTTF Nerd Font Mono',
    fontsize=13,
    background=nord_fox['bg'],
    foreground=nord_fox['fg']
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=Bar(
             [
                # display groups
                # lower_left_triangle('bg', 'fg_gutter'),
                widget.GroupBox(
                    active=nord_fox['bg'],
                    inactive=nord_fox['fg_gutter'],
                    disable_drag=True,
                    borderwidth=0,
                    margin_x=0,
                    padding_x=5,
                    highlight_method='line',
                    block_highlight_text_color=nord_fox['red'],
                    highlight_color=nord_fox['blue']),

                 widget.Spacer(),

                 widget.Pomodoro(
                     ## foreground=nord['nord0'],
                     ## background=nord['nord1'],
                     length_long_break=20, length_short_break=5,
                     length_pomodori=35, notification_on='True',
                     num_pomodori=3, prefix_inactive='',
                     prefix_pause='', update_interval=1),

                widget.Clock(
                    foreground=nord['nord0'],
                    background=nord['nord7'],
                    format=' %m-%d %a %H:%M',
                    padding=2),

                widget.Systray(
                    background=nord_fox['black'],
                    padding=2),

                widget.Spacer(length=1, background=nord_fox['black'])


            ],

            size=18,
            background=nord_fox['bg'],
            opacity=0.75

        ),
    ),
]
