#!/bin/bash

# Default Pantheon Terminal Pallet
default_palette='#303030:#e1321a:#6ab017:#ffc005:#004f9e:#ec0048:#2aa7e7:#f2f2f2:#5d5d5d:#ff361e:#7bc91f:#ffd00a:#0071ff:#ff1d62:#4bb8fd:#a020f0'

# Default solarized palette (I think)
base0='#838394949696'
base1='#9393a1a1a1a1'
base3='#fdfdf6f6e3e3'
base00='#65657b7b8383'
base01='#58586e6e7575'
base03='#00002B2B3636'
solarized_palette='#070736364242:#DCDC32322F2F:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3'

# Altered a few colors.
# base0:  
# base1:  
# base3:  
# base00: 
# base01: 
# base03: #00001B1B2626 - darker blue terminal background
# 0:  
# 1:  
# 2:  
# 3:  
# 4:  #26264B4BB2B2 - darker blue, makes `menu configurations` a little easier to see 
# 5:  
# 6:  
# 7:  
# 8:  
# 9:  
# 10: 
# 11: 
# 12: 
# 13: 
# 14: 
# 15: 
customized_base0='#838394949696'
customized_base1='#9393a1a1a1a1'
customized_base3='#fdfdf6f6e3e3'
customized_base00='#65657b7b8383'
customized_base01='#58586e6e7575'
customized_base03='#00001B1B2626'
customized_solarized_palette='#070736364242:#DCDC32322F2F:#858599990000:#B5B589890000:#26264B4BB2B2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3'

case $1 in
    def* )
        echo "Changing to Default Scheme (Pantheon)"
        gsettings set org.pantheon.terminal.settings background '#101010'
        gsettings set org.pantheon.terminal.settings foreground '#f2f2f2'
        gsettings set org.pantheon.terminal.settings cursor-color '#FFFFFF'
        gsettings set org.pantheon.terminal.settings palette $default_palette
        ;;
    light|Light ) # light
        echo "Changing to Light Scheme (Solarized)"
        gsettings set org.pantheon.terminal.settings background $base3
        gsettings set org.pantheon.terminal.settings foreground $base00
        gsettings set org.pantheon.terminal.settings cursor-color $base00
        gsettings set org.pantheon.terminal.settings palette $solarized_palette
        ;;
    dark|Dark ) # dark
        echo "Changing to Dark Scheme (Solarized)"
        gsettings set org.pantheon.terminal.settings background $base03
        gsettings set org.pantheon.terminal.settings foreground $base0
        gsettings set org.pantheon.terminal.settings cursor-color $base0
        gsettings set org.pantheon.terminal.settings palette $solarized_palette
        ;;
    cus*l*|l*cus* ) # customized light
        echo "Changing to Customized Light Scheme (Solarized)"
        gsettings set org.pantheon.terminal.settings background $customized_base3
        gsettings set org.pantheon.terminal.settings foreground $customized_base00
        gsettings set org.pantheon.terminal.settings cursor-color $customized_base00
        gsettings set org.pantheon.terminal.settings palette $customized_solarized_palette
        ;;
    cus*d*|d*cus* ) # customized dark
        echo "Changing to Customized Dark Scheme (Solarized)"
        gsettings set org.pantheon.terminal.settings background $customized_base03
        gsettings set org.pantheon.terminal.settings foreground $customized_base0
        gsettings set org.pantheon.terminal.settings cursor-color $customized_base0
        gsettings set org.pantheon.terminal.settings palette $customized_solarized_palette
        ;;
    * ) # default
        NC='\e[0m'
        WHITE='\e[1;37m'
        clear
        echo -e $WHITE"Usage: ./changeColor.sh [scheme]"$NC
        echo
        echo -e $WHITE"Available Schemes"$NC
        echo "  default"
        echo "  light"
        echo "  dark"
        echo "  customized_light"
        echo "  customized_dark"
        echo
        echo -e $WHITE"Examples:"$NC
        echo "  ./changeColor.sh default"
        echo "  ./changeColor.sh customized_light"
        echo -e $WHITE"You can abrievate a little:"$NC
        echo "  ./changeColor.sh cust_dark"
        echo
        echo -e $WHITE"Use the ./showColor.sh script to view your artwork!:"$NC
        echo
        ;;
esac
