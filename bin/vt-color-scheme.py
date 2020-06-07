#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Usage:
# 1. Save as `vt-color-scheme.py`
# 2. Make executable
# 3. Go to https://terminal.sexy and make your own color scheme
# 4. Export as JSON (easier to work with) and edit TANGO_SCHEME
#    with the colors you chose
# 5. Run this script (redirect to text file if it's easier for you)
# 6. Paste the output as boot option in Lilo / Elilo etc.

KERNEL_PARAMS = ['vt.default_red', 'vt.default_grn', 'vt.default_blu', ]

# MATERIAL DARK theme
# https://material-ui.com/customization/default-theme/
TANGO_SCHEME = [
    "#303030",
    "#d32f2f",
    "#388e3c",
    "#f57c00",
    "#303f9f",
    "#c51162",
    "#1976d2",
    "#bdbdbd",
    "#424242",
    "#e57373",
    "#81c784",
    "#ffb74d",
    "#7986cb",
    "#ff4081",
    "#64b5f6",
    "#f5f5f5"
  ]

def color_scheme_to_rgb_channel_data(color_scheme):
    """
    [ '#r1g1b1', '#r2g2b2', ... ] => [ [r1, r2, ...], [g1, g2, ...], [b1, b2, ...], ]
    """

    def split_to_rgb(color):
        # rgb str -> [red, green, blue]
        hex_value = int(color, 16)
        return [hex_value >> 16 & 255, hex_value >> 8 & 255, hex_value & 255]

    return zip(*[split_to_rgb(color.strip('#')) for color in color_scheme])


def prepare_param(param, channel_data):
    return '{param}={values}'.format(param=param, values=','.join(hex(byte) for byte in channel_data))


def main(colors):
    print(' '.join(prepare_param(param, channel) for param, channel in \
                   zip(KERNEL_PARAMS, color_scheme_to_rgb_channel_data(colors))))


if __name__ == '__main__':
    main(TANGO_SCHEME)
