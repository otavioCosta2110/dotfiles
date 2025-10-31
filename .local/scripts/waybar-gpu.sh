#!/bin/bash
# For AMD GPUs (requires radeontop)
GPU_INFO=$(timeout 1 radeontop -d - -l 1 2>/dev/null | tail -n 1)

if [[ $GPU_INFO =~ gpu\ ([0-9]+\.[0-9]+)% ]]; then
    USAGE=${BASH_REMATCH[1]}
    # Remove decimal part for cleaner display
    USAGE_INT=$(echo "$USAGE" | awk -F. '{print $1}')
    
    # Extract VRAM usage
    if [[ $GPU_INFO =~ vram\ ([0-9]+\.[0-9]+)% ]]; then
        VRAM=${BASH_REMATCH[1]}
        VRAM_INT=$(echo "$VRAM" | awk -F. '{print $1}')
        echo "{\"text\": \"󰾲 ${USAGE_INT}% ${VRAM_INT}%\", \"tooltip\": \"GPU: ${USAGE}%\\nVRAM: ${VRAM}%\"}"
    else
        echo "{\"text\": \"󰾲 ${USAGE_INT}%\", \"tooltip\": \"GPU Usage: ${USAGE}%\"}"
    fi
else
    echo "{\"text\": \"󰾲 N/A\", \"tooltip\": \"GPU information unavailable\"}"
fi
