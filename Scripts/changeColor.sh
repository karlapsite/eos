#!/bin/bash

base0='#838394949696'
base1='#9393a1a1a1a1'
base3='#fdfdf6f6e3e3'
base00='#65657b7b8383'
base01='#58586e6e7575'
base03='#00002B2B3636'
solarized_palette='#070736364242:#DCDC32322F2F:#858599990000:#B5B589890000:#26264B4BB2B2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3'
default_palette='#303030:#e1321a:#6ab017:#ffc005:#004f9e:#ec0048:#2aa7e7:#f2f2f2:#5d5d5d:#ff361e:#7bc91f:#ffd00a:#0071ff:#ff1d62:#4bb8fd:#a020f0'

echo $1

case $1 in
    light|Light ) # light
        gsettings set org.pantheon.terminal.settings background $base3
        gsettings set org.pantheon.terminal.settings foreground $base00
        gsettings set org.pantheon.terminal.settings cursor-color $base00
        gsettings set org.pantheon.terminal.settings palette $solarized_palette
        ;;
    dark|Dark ) # dark
        gsettings set org.pantheon.terminal.settings background $base03
        gsettings set org.pantheon.terminal.settings foreground $base0
        gsettings set org.pantheon.terminal.settings cursor-color $base0
        gsettings set org.pantheon.terminal.settings palette $solarized_palette
        ;;
    * ) # default
        gsettings set org.pantheon.terminal.settings background '#101010'
        gsettings set org.pantheon.terminal.settings foreground '#f2f2f2'
        gsettings set org.pantheon.terminal.settings cursor-color '#FFFFFF'
        gsettings set org.pantheon.terminal.settings palette $default_palette
esac
