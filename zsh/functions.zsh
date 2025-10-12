# -----------------------------------------------------------------
# Plugins from chris@machine
# -----------------------------------------------------------------

# Function to source additional Zsh files
function zsh_add_file() {
    # Function to source files if they exist
    [ -f ~/$1 ] && source ~/$1
}

# Function to add Zsh plugins
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d ~/plugins/$PLUGIN_NAME ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" ~/plugins/$PLUGIN_NAME
    fi
}
