#!/bin/bash

declare -A icons=(
    ["directory"]=""
    ["executable"]=""
    
    ["txt"]=""
    ["md"]=""
    ["rst"]=""
    ["org"]=""
    ["pdf"]=""
    ["epub"]=""
    ["tex"]="󰙩"
    
    ["jpg"]="󰋩"
    ["jpeg"]="󰋩"
    ["png"]="󰋩"
    ["gif"]="󰋩"
    ["bmp"]="󰋩"
    ["svg"]="󰋩"
    ["webp"]="󰋩"
    ["mp4"]="󰕧"
    ["avi"]="󰕧"
    ["mkv"]="󰕧"
    ["mov"]="󰕧"
    ["webm"]="󰕧"
    ["mp3"]=""
    ["wav"]=""
    ["flac"]=""
    ["ogg"]=""
    ["m4a"]=""
    
    ["zip"]="󰗄"
    ["tar"]="󰗄"
    ["gz"]="󰗄"
    ["bz2"]="󰗄"
    ["xz"]="󰗄"
    ["7z"]="󰗄"
    ["rar"]="󰗄"
    
    ["py"]="󰌠"
    ["js"]="󰌞"
    ["ts"]="󰛦"
    ["java"]="󰬷"
    ["c"]="󰙱"
    ["cpp"]="󰙲"
    ["cc"]="󰙲"
    ["cxx"]="󰙲"
    ["rs"]=""
    ["go"]="󰟓"
    ["php"]="󰌟"
    ["rb"]="󰴭"
    ["swift"]="󰛥"
    ["kt"]="󰴙"
    ["scala"]="󰭷"
    ["hs"]="󰲒"
    ["lhs"]="󰲒"
    ["lua"]="󰢱"
    ["pl"]="󰩯"
    ["pm"]="󰩯"
    ["r"]="󰟔"
    ["m"]="󰈬"
    ["jl"]="󰠔"
    ["cr"]="󰯤"
    ["ex"]="󰴭"
    ["exs"]="󰴭"
    ["elm"]="󰬌"
    ["clj"]="󰝊"
    ["cljs"]="󰝊"
    ["cljc"]="󰝊"
    ["edn"]="󰝊"
    ["fs"]="󰧈"
    ["fsx"]="󰧈"
    ["fsi"]="󰧈"
    ["sql"]="󰆼"
    ["sh"]="󰈙"
    ["bash"]="󰈙"
    ["zsh"]="󰈙"
    ["fish"]="󰈙"
    ["ps1"]="󰨞"
    ["vim"]="󰈙"
    ["vimrc"]="󰈙"
    ["lisp"]="󰘧"
    ["scm"]="󰘧"
    ["ss"]="󰘧"
    ["rkt"]="󰘧"
    
    ["html"]="󰌝"
    ["htm"]="󰌝"
    ["css"]="󰌜"
    ["sass"]="󰿄"
    ["scss"]="󰿄"
    ["jsx"]="󰜈"
    ["tsx"]="󰛦"
    ["vue"]="󰡄"
    ["svelte"]="󰎁"
    
    ["json"]="󰘦"
    ["xml"]="󰗀"
    ["yaml"]="󰗀"
    ["yml"]="󰗀"
    ["toml"]="󰓅"
    ["ini"]="󰞇"
    ["cfg"]="󰞇"
    ["conf"]="󰞇"
    ["env"]="󰀉"
    
    ["pptx"]="󰈬"
    ["ppt"]="󰈬"
    ["docx"]="󰈬"
    ["doc"]="󰈬"
    ["xlsx"]="󰈬"
    ["xls"]="󰈬"
)

selection=$(fd --type f --type d --exclude node_modules --exclude .git --exclude Games --exclude target --exclude games --exclude go --exclude config-bk | \
while IFS= read -r item; do
    if [[ -d "$item" ]]; then
        echo "${icons["directory"]} $item"
    elif [[ -x "$item" ]]; then
        echo "${icons["executable"]} $item"
    else
        ext="${item##*.}"
        if [[ "$ext" == "$item" ]]; then
            echo " $item"
        else
            echo "${icons["$ext"]:-} $item"
        fi
    fi
done | fuzzel --dmenu | sed 's/^[^ ]* //')

if [[ -z "$selection" ]]; then
    exit 0
fi

if [[ -d "$selection" ]]; then
    exo-open "$selection"
elif [[ -f "$selection" ]]; then
    mime_type=$(file --mime-type -b "$selection")
    if [[ "$mime_type" == text/* ]]; then
        alacritty -e nvim "$selection"
    else
        exo-open "$selection"
    fi
fi
