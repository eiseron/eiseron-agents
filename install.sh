#!/bin/bash
set -e

EISERON_DIR="$HOME/.eiseron-agents"
REPO_URL="https://github.com/eiseron/eiseron-agents.git"

clone_or_update_repository() {
    if [ -d "$EISERON_DIR/.git" ]; then
        echo "🔄 Repository already exists. Updating..."
        cd "$EISERON_DIR"
        git fetch origin main
        git reset --hard origin/main
        git clean -fd
    else
        echo "📥 Cloning repository to $EISERON_DIR..."
        git clone "$REPO_URL" "$EISERON_DIR"
    fi
}

setup_auto_update_cronjob() {
    local cron_cmd="*/15 * * * * cd $EISERON_DIR && git fetch origin main && git reset --hard origin/main > /dev/null 2>&1"
    
    if crontab -l 2>/dev/null | grep -q "$EISERON_DIR"; then
        echo "✅ Cronjob already configured. Skipping..."
    else
        echo "⏳ Setting up auto-update cronjob (every 15 min)..."
        (crontab -l 2>/dev/null; echo "$cron_cmd") | crontab -
    fi
}

setup_global_rules() {
    local target_file="$1"
    local pointer="# --- EISERON GLOBAL POINTER ---"
    local config="- [Eiseron SSoT](~/.eiseron-agents/00-ai-conventions.md)"
    
    if [ ! -f "$target_file" ]; then
        echo "Creating $target_file..."
        echo "$pointer" > "$target_file"
        echo "$config" >> "$target_file"
    elif grep -q "$pointer" "$target_file"; then
        echo "✅ Eiseron rules already present in $target_file. Skipping..."
    else
        echo "Appending Eiseron rules to $target_file safely..."
        echo "" >> "$target_file"
        echo "$pointer" >> "$target_file"
        echo "$config" >> "$target_file"
    fi
}

setup_global_agent_contexts() {
    echo "⚙️ Configuring Global Agent Contexts..."
    setup_global_rules "$HOME/.cursorrules"
    setup_global_rules "$HOME/.windsurfrules"
}

main() {
    echo "🛡️ Installing Eiseron Engineering Constitution..."
    
    clone_or_update_repository
    setup_auto_update_cronjob
    setup_global_agent_contexts
    
    echo ""
    echo "🎉 Eiseron Engineering Constitution installed successfully!"
    echo "AI Agents will now load global context from ~/.eiseron-agents"
}

main
