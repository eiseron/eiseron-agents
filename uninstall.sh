#!/bin/bash
set -e

EISERON_DIR="$HOME/.eiseron-agents"

remove_repository() {
    if [ -d "$EISERON_DIR" ]; then
        echo "🗑️ Removing repository from $EISERON_DIR..."
        rm -rf "$EISERON_DIR"
    else
        echo "✅ Repository not found at $EISERON_DIR. Skipping..."
    fi
}

remove_auto_update_cronjob() {
    if crontab -l 2>/dev/null | grep -q "$EISERON_DIR"; then
        echo "⏳ Removing auto-update cronjob..."
        crontab -l 2>/dev/null | grep -v "$EISERON_DIR" | crontab -
    else
        echo "✅ Cronjob not found. Skipping..."
    fi
}

remove_global_rules() {
    local target_file="$1"
    local pointer="# --- EISERON GLOBAL POINTER ---"
    
    if [ -f "$target_file" ] && grep -q "$pointer" "$target_file"; then
        echo "🧹 Removing Eiseron rules from $target_file..."
        sed -i.bak "/$pointer/,+1d" "$target_file"
        rm -f "${target_file}.bak"
    else
        echo "✅ Eiseron rules not found in $target_file. Skipping..."
    fi
}

remove_global_agent_contexts() {
    echo "⚙️ Cleaning up Global Agent Contexts..."
    remove_global_rules "$HOME/.cursorrules"
    remove_global_rules "$HOME/.windsurfrules"
}

main() {
    echo "🛡️ Uninstalling Eiseron Engineering Constitution..."
    
    remove_global_agent_contexts
    remove_auto_update_cronjob
    remove_repository
    
    echo ""
    echo "🎉 Eiseron Engineering Constitution uninstalled successfully!"
}

main
