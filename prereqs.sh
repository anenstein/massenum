#!/bin/bash

echo -e "\n[*] Installing Go-based tools..."

TOOLS=(
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    "github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
    "github.com/projectdiscovery/httpx/cmd/httpx@latest"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
    "github.com/tomnomnom/assetfinder@latest"
    "github.com/tomnomnom/waybackurls@latest"
)

# Check if Go is installed
if ! command -v go >/dev/null; then
    echo "[!] Go is not installed. Please install Go (https://go.dev/dl/) and re-run this script."
    exit 1
fi

# Install tools
for tool in "${TOOLS[@]}"; do
    echo "[+] Installing: $tool"
    go install -v "$tool"
done

# Add Go bin to PATH if not already
GOBIN="$HOME/go/bin"
if [[ ":$PATH:" != *":$GOBIN:"* ]]; then
    echo -e "\n[*] Adding $GOBIN to your PATH..."
    
    # Pick shell config
    if [[ -n "$ZSH_VERSION" ]]; then
        SHELLRC="$HOME/.zshrc"
    elif [[ -n "$BASH_VERSION" ]]; then
        SHELLRC="$HOME/.bashrc"
    elif [[ -f "$HOME/.bashrc" ]]; then
        SHELLRC="$HOME/.bashrc"
    elif [[ -f "$HOME/.zshrc" ]]; then
        SHELLRC="$HOME/.zshrc"
    else
        SHELLRC="$HOME/.profile"
    fi

    echo "export PATH=\"\$PATH:$GOBIN\"" >> "$SHELLRC"
    echo "[+] Added to $SHELLRC. Run 'source $SHELLRC' or restart your terminal."
fi

echo -e "\n[*] Installing OS packages (Debian/Ubuntu)..."
sudo apt update && sudo apt install -y nmap gowitness jq

echo -e "\n[*] Verifying tools..."
for t in subfinder dnsx httpx naabu assetfinder waybackurls; do
    if command -v "$t" >/dev/null; then
        echo "[+] $t is installed"
    else
        echo "[X] $t not found — something went wrong"
    fi
done

echo -e "\n[+] All done!"
