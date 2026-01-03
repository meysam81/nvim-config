# Fedora
sudo dnf install -y neovim ripgrep fd-find lua-language-server

# Language servers
go install golang.org/x/tools/gopls@latest
npm install -g typescript typescript-language-server @vue/language-server @tailwindcss/language-server

# Fonts
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/FiraCodeNerdFont-Regular.ttf https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf
fc-cache -fv
