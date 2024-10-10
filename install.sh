#!/bin/bash

# Define colors
RESET="\033[0m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"

# Display the installation header
echo -e "${YELLOW}📦 Install Dependencies for Yametti${RESET}"

# Function to check internet connection
check_internet() {
    if ping -c 1 google.com &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Check internet connection
if ! check_internet; then
    echo -e "${RED}[ ! ] No internet connection detected! Please check your connection and try again.${RESET}"
    exit 1
fi

# Define the required dependencies
DEPENDENCIES=(
    "curl"
    "jq"
    "nmap"
    "git"
)

# Function to install a package
install_package() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}[ + ] $1 is already installed.${RESET}"
    else
        echo -e "${YELLOW}[ + ] Installing $1...${RESET}"
        if sudo apt-get install -y "$1" > /dev/null 2>&1; then
            echo -e "${GREEN}[ + ] $1 installed successfully.${RESET}"
        else
            echo -e "${RED}[ ! ] Failed to install $1! Please check your package manager.${RESET}"
        fi
    fi
}

# Function to install Go
install_go() {
    if command -v go &> /dev/null; then
        echo -e "${GREEN}[ + ] Go is already installed.${RESET}"
    else
        echo -e "${YELLOW}[ + ] Installing Go...${RESET}"
        if sudo apt-get install -y golang > /dev/null 2>&1; then
            echo -e "${GREEN}[ + ] Go installed successfully.${RESET}"
        else
            echo -e "${RED}[ ! ] Failed to install Go! Please check your package manager.${RESET}"
            exit 1
        fi
    fi
}

# Update package list
echo -e "${YELLOW}[ + ] Updating package list...${RESET}"
if sudo apt-get update > /dev/null 2>&1; then
    echo -e "${GREEN}[ + ] Package list updated successfully.${RESET}"
else
    echo -e "${RED}[ ! ] Failed to update package list! Please check your internet connection or package manager.${RESET}"
    exit 1
fi

# Install required dependencies
for pkg in "${DEPENDENCIES[@]}"; do
    install_package "$pkg"
done

# Install Go
install_go

# Install puredns
if ! command -v puredns &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing puredns...${RESET}"
    if go install github.com/d3mondev/puredns/v2@latest > /dev/null 2>&1; then
        echo -e "${GREEN}[ + ] puredns installed successfully.${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install puredns! Please ensure you have Go installed and configured properly.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] puredns is already installed!${RESET}"
fi

# Install subfinder
if ! command -v subfinder &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing subfinder...${RESET}"
    if go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest > /dev/null 2>&1; then
        echo -e "${GREEN}[ + ] subfinder installed successfully.${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install subfinder! Please ensure you have Go installed and configured properly.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] subfinder is already installed!${RESET}"
fi

# Install assetfinder
if ! command -v assetfinder &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing assetfinder...${RESET}"
    if go install github.com/tomnomnom/assetfinder@latest > /dev/null 2>&1; then
        echo -e "${GREEN}[ + ] assetfinder installed successfully.${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install assetfinder! Please ensure you have Go installed and configured properly.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] assetfinder is already installed!${RESET}"
fi

# Install amass
if ! command -v amass &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing Amass...${RESET}"
    if go install -v github.com/owasp-amass/amass/v4/...@master > /dev/null 2>&1; then
        echo -e "${GREEN}[ + ] Amass installed successfully.${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install Amass! Please ensure you have Go installed and configured properly.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] Amass is already installed!${RESET}"
fi

# Install fierce using pip
if ! python3 -m pip show fierce &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing fierce...${RESET}"
    if python3 -m pip install fierce > /dev/null 2>&1; then
        echo -e "${GREEN}[ + ] fierce installed successfully.${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install fierce! Please check your Python installation.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] fierce is already installed!${RESET}"
fi

# Install Sublist3r using pip
if ! python3 -m pip show sublist3r &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing Sublist3r...${RESET}"
    if python3 -m pip install sublist3r > /dev/null 2>&1; then
        echo -e "${GREEN}[ + ] Sublist3r installed successfully.${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install Sublist3r! Please check your Python installation.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] Sublist3r is already installed!${RESET}"
fi

# Install Findomain
if ! command -v findomain &> /dev/null; then
    echo -e "${YELLOW}[ + ] Installing Findomain...${RESET}"
    if curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip && unzip findomain-linux-i386.zip && chmod +x findomain && sudo mv findomain /usr/bin/findomain; then
        echo -e "${GREEN}[ + ] Findomain installed successfully!${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to install Findomain! Please check the download link or your permissions.${RESET}"
    fi
else
    echo -e "${GREEN}[ + ] Findomain is already installed!${RESET}"
fi

# Download Yametti from GitHub and move it to /bin
YAMETTI_URL="https://raw.githubusercontent.com/LunarLumos/yametti/refs/heads/main/yametti"
YAMETTI_BIN="/bin/yametti"

if command -v yametti &> /dev/null; then
    echo -e "${GREEN}[ + ] Yametti is already installed!${RESET}"
else
    echo -e "${YELLOW}[ + ] Downloading Yametti...${RESET}"
    if sudo wget -q "$YAMETTI_URL" -O "$YAMETTI_BIN"; then
        sudo chmod +x "$YAMETTI_BIN"
        echo -e "${GREEN}[ + ] Yametti downloaded and installed successfully!${RESET}"
    else
        echo -e "${RED}[ ! ] Failed to download Yametti! Please check the URL.${RESET}"
    fi
fi

# Final message
echo -e "${GREEN}[ + ] All dependencies installed! 🎉${RESET}"
echo -e "${GREEN}👉 Type 'yametti' to run the tool!${RESET}"
