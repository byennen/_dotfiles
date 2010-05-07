# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch i386'

# Set macvim with flag to wait for console (git commit compat) as our EDITOR
export EDITOR="mvim -f"
