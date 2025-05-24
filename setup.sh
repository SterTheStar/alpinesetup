#!/bin/bash

# Cores para melhor visualização
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Arrays para armazenar as seleções
declare -a selected_browsers
declare -a selected_ides
declare -a selected_utilities
declare -a selected_multimedia
declare -a selected_languages
declare -a selected_games
declare -a selected_office
declare -a selected_security

# Função para obter informações do sistema
get_system_info() {
    echo -e "\n${BLUE}=== Informações do Sistema ===${NC}"
    echo -e "${YELLOW}Sistema Operacional:${NC} $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
    echo -e "${YELLOW}Kernel:${NC} $(uname -r)"
    echo -e "${YELLOW}Arquitetura:${NC} $(uname -m)"
    echo -e "${YELLOW}CPU:${NC} $(grep "model name" /proc/cpuinfo | head -n1 | cut -d':' -f2 | sed 's/^[ \t]*//')"
    echo -e "${YELLOW}Memória Total:${NC} $(free -h | awk '/^Mem:/ {print $2}')"
    echo -e "${YELLOW}Espaço em Disco:${NC} $(df -h / | awk 'NR==2 {print $4}') disponível"
}

# Função para detectar o gerenciador de pacotes
detect_package_manager() {
    if command -v apt &> /dev/null; then
        echo "debian"
    elif command -v dnf &> /dev/null; then
        echo "fedora"
    elif command -v pacman &> /dev/null; then
        echo "arch"
    elif command -v tce-load &> /dev/null; then
        echo "tinycore"
    else
        echo "unsupported"
    fi
}

# Função para instalar pacotes baseado na distribuição
install_package() {
    local package=$1
    local package_manager=$(detect_package_manager)
    
    case $package_manager in
        debian)
            sudo apt install -y "$package"
            ;;
        fedora)
            sudo dnf install -y "$package"
            ;;
        arch)
            sudo pacman -S --noconfirm "$package"
            ;;
        tinycore)
            tce-load -wi "$package"
            ;;
        *)
            echo -e "${RED}Sistema operacional não suportado${NC}"
            exit 1
            ;;
    esac
}

# Função para mostrar o menu de navegadores
browser_menu() {
    echo -e "\n${BLUE}=== Navegadores ===${NC}"
    echo "1) Firefox"
    echo "2) Google Chrome"
    echo "3) Chromium"
    echo "4) Opera"
    echo "5) Brave"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione os navegadores (ex: 1 3 5) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_browsers+=("firefox");;
                2) selected_browsers+=("google-chrome");;
                3) selected_browsers+=("chromium");;
                4) selected_browsers+=("opera");;
                5) selected_browsers+=("brave-browser");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de IDEs
ide_menu() {
    echo -e "\n${BLUE}=== IDEs e Editores de Texto ===${NC}"
    echo "1) Visual Studio Code"
    echo "2) Sublime Text"
    echo "3) Atom"
    echo "4) PyCharm Community"
    echo "5) IntelliJ IDEA Community"
    echo "6) Eclipse"
    echo "7) Vim"
    echo "8) Neovim"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione as IDEs (ex: 1 3 7) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_ides+=("code");;
                2) selected_ides+=("sublime-text");;
                3) selected_ides+=("atom");;
                4) selected_ides+=("pycharm-community");;
                5) selected_ides+=("intellij-community");;
                6) selected_ides+=("eclipse");;
                7) selected_ides+=("vim");;
                8) selected_ides+=("neovim");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de utilitários
utilities_menu() {
    echo -e "\n${BLUE}=== Utilitários ===${NC}"
    echo "1) Git"
    echo "2) Docker"
    echo "3) Node.js"
    echo "4) Python3"
    echo "5) Java JDK"
    echo "6) Build Essential / Base Devel"
    echo "7) Curl"
    echo "8) Wget"
    echo "9) htop"
    echo "10) Terminator"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione os utilitários (ex: 1 3 7) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_utilities+=("git");;
                2) selected_utilities+=("docker");;
                3) selected_utilities+=("nodejs");;
                4) selected_utilities+=("python3");;
                5) selected_utilities+=("openjdk");;
                6) selected_utilities+=("build-essential");;
                7) selected_utilities+=("curl");;
                8) selected_utilities+=("wget");;
                9) selected_utilities+=("htop");;
                10) selected_utilities+=("terminator");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de multimídia
multimedia_menu() {
    echo -e "\n${BLUE}=== Software Multimídia ===${NC}"
    echo "1) VLC Media Player"
    echo "2) MPV"
    echo "3) Audacious"
    echo "4) GIMP"
    echo "5) Kdenlive"
    echo "6) OBS Studio"
    echo "7) Blender"
    echo "8) Krita"
    echo "9) Audacity"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione os programas multimídia (ex: 1 3 5) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_multimedia+=("vlc");;
                2) selected_multimedia+=("mpv");;
                3) selected_multimedia+=("audacious");;
                4) selected_multimedia+=("gimp");;
                5) selected_multimedia+=("kdenlive");;
                6) selected_multimedia+=("obs-studio");;
                7) selected_multimedia+=("blender");;
                8) selected_multimedia+=("krita");;
                9) selected_multimedia+=("audacity");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de linguagens de programação
languages_menu() {
    echo -e "\n${BLUE}=== Linguagens de Programação ===${NC}"
    echo "1) Python (com pip)"
    echo "2) Java Development Kit"
    echo "3) Node.js (com npm)"
    echo "4) Go"
    echo "5) Rust"
    echo "6) PHP"
    echo "7) Ruby"
    echo "8) .NET Core SDK"
    echo "9) Kotlin"
    echo "10) Swift"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione as linguagens (ex: 1 3 5) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_languages+=("python3-pip");;
                2) selected_languages+=("openjdk-latest");;
                3) selected_languages+=("nodejs npm");;
                4) selected_languages+=("golang");;
                5) selected_languages+=("rust");;
                6) selected_languages+=("php");;
                7) selected_languages+=("ruby");;
                8) selected_languages+=("dotnet-sdk");;
                9) selected_languages+=("kotlin");;
                10) selected_languages+=("swift");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de jogos e ferramentas de gaming
games_menu() {
    echo -e "\n${BLUE}=== Jogos e Ferramentas de Gaming ===${NC}"
    echo "1) Steam"
    echo "2) Lutris"
    echo "3) Wine"
    echo "4) PlayOnLinux"
    echo "5) Discord"
    echo "6) RetroArch"
    echo "7) GameMode"
    echo "8) MangoHud"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione os programas (ex: 1 3 5) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_games+=("steam");;
                2) selected_games+=("lutris");;
                3) selected_games+=("wine");;
                4) selected_games+=("playonlinux");;
                5) selected_games+=("discord");;
                6) selected_games+=("retroarch");;
                7) selected_games+=("gamemode");;
                8) selected_games+=("mangohud");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de aplicativos de escritório
office_menu() {
    echo -e "\n${BLUE}=== Aplicativos de Escritório ===${NC}"
    echo "1) LibreOffice"
    echo "2) OnlyOffice"
    echo "3) Thunderbird"
    echo "4) Evolution"
    echo "5) Okular"
    echo "6) Evince"
    echo "7) Calibre"
    echo "8) Zotero"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione os programas (ex: 1 3 5) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_office+=("libreoffice");;
                2) selected_office+=("onlyoffice-desktopeditors");;
                3) selected_office+=("thunderbird");;
                4) selected_office+=("evolution");;
                5) selected_office+=("okular");;
                6) selected_office+=("evince");;
                7) selected_office+=("calibre");;
                8) selected_office+=("zotero");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para mostrar o menu de segurança
security_menu() {
    echo -e "\n${BLUE}=== Ferramentas de Segurança ===${NC}"
    echo "1) UFW (Firewall)"
    echo "2) ClamAV (Antivírus)"
    echo "3) KeePassXC"
    echo "4) Cryptomator"
    echo "5) Wireshark"
    echo "6) Tor Browser"
    echo "7) VeraCrypt"
    echo "8) Rkhunter"
    echo "0) Voltar"
    
    while true; do
        read -p "Selecione as ferramentas (ex: 1 3 5) ou 0 para voltar: " choices
        
        if [[ $choices == "0" ]]; then
            return
        fi
        
        for choice in $choices; do
            case $choice in
                1) selected_security+=("ufw");;
                2) selected_security+=("clamav");;
                3) selected_security+=("keepassxc");;
                4) selected_security+=("cryptomator");;
                5) selected_security+=("wireshark");;
                6) selected_security+=("torbrowser-launcher");;
                7) selected_security+=("veracrypt");;
                8) selected_security+=("rkhunter");;
                *) echo "Opção inválida: $choice";;
            esac
        done
        break
    done
}

# Função para configurar OpenSSH
configure_ssh() {
    echo -e "\n${BLUE}=== Configuração do OpenSSH ===${NC}"
    
    # Detectar a distribuição
    local distro=$(detect_package_manager)
    
    # Verificar se o OpenSSH está instalado
    case $distro in
        tinycore)
            if ! command -v /usr/local/sbin/sshd &> /dev/null; then
                echo -e "${YELLOW}OpenSSH não está instalado. Instalando...${NC}"
                tce-load -wi openssh
            fi
            SSHD_CONFIG="/usr/local/etc/ssh/sshd_config"
            SSHD_PATH="/usr/local/sbin/sshd"
            ;;
        *)
            if ! command -v sshd &> /dev/null; then
                echo -e "${YELLOW}OpenSSH não está instalado. Instalando...${NC}"
                install_package "openssh-server"
            fi
            SSHD_CONFIG="/etc/ssh/sshd_config"
            SSHD_PATH="$(command -v sshd)"
            ;;
    esac
    
    # Backup do arquivo de configuração original
    if [ -f "$SSHD_CONFIG" ]; then
        sudo cp "$SSHD_CONFIG" "${SSHD_CONFIG}.backup"
    else
        echo -e "${RED}Arquivo de configuração SSH não encontrado em $SSHD_CONFIG${NC}"
        return 1
    fi
    
    # Solicitar nova porta
    read -p "Digite a porta SSH desejada (padrão: 22): " ssh_port
    ssh_port=${ssh_port:-22}
    
    # Solicitar se deseja permitir login root
    read -p "Permitir login como root? (s/N): " allow_root
    allow_root=${allow_root:-n}
    
    # Configurar SSH
    sudo sed -i "s/#Port 22/Port $ssh_port/" "$SSHD_CONFIG"
    
    if [[ $allow_root =~ ^[Nn]$ ]]; then
        sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' "$SSHD_CONFIG"
    fi
    
    # Configurações adicionais de segurança
    sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' "$SSHD_CONFIG"
    sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' "$SSHD_CONFIG"
    
    # Gerar chaves SSH se não existirem
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo -e "\n${YELLOW}Gerando novo par de chaves SSH...${NC}"
        ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
    fi
    
    # Reiniciar serviço SSH baseado na distribuição
    case $distro in
        tinycore)
            # No TinyCore, precisamos garantir que o diretório /var/run/sshd existe
            sudo mkdir -p /var/run/sshd
            
            # Parar qualquer instância existente do sshd
            if pgrep -x "sshd" > /dev/null; then
                sudo killall sshd
            fi
            
            # Iniciar o sshd com o caminho completo
            sudo "$SSHD_PATH"
            
            # Adicionar ao bootlocal.sh para iniciar no boot
            if [ -f /opt/bootlocal.sh ]; then
                if ! grep -q "$SSHD_PATH" /opt/bootlocal.sh; then
                    echo "mkdir -p /var/run/sshd" | sudo tee -a /opt/bootlocal.sh
                    echo "$SSHD_PATH" | sudo tee -a /opt/bootlocal.sh
                fi
            else
                echo "#!/bin/sh" | sudo tee /opt/bootlocal.sh
                echo "mkdir -p /var/run/sshd" | sudo tee -a /opt/bootlocal.sh
                echo "$SSHD_PATH" | sudo tee -a /opt/bootlocal.sh
                sudo chmod +x /opt/bootlocal.sh
            fi
            ;;
        *)
            sudo systemctl restart sshd
            sudo systemctl enable sshd
            ;;
    esac
    
    echo -e "${GREEN}Configuração do SSH concluída!${NC}"
    echo -e "Porta SSH: $ssh_port"
    echo -e "Sua chave pública SSH:"
    cat "$HOME/.ssh/id_rsa.pub"
    
    # Mostrar status do serviço
    case $distro in
        tinycore)
            if pgrep -x "sshd" > /dev/null; then
                echo -e "\n${GREEN}Serviço SSH está em execução${NC}"
                echo -e "Configurado para iniciar automaticamente no boot via /opt/bootlocal.sh"
            else
                echo -e "\n${RED}Serviço SSH não está em execução${NC}"
            fi
            ;;
        *)
            echo -e "\nStatus do serviço SSH:"
            sudo systemctl status sshd | head -n 3
            ;;
    esac
}

# Função para configurar firewall (UFW)
configure_firewall() {
    echo -e "\n${BLUE}=== Configuração do Firewall (UFW) ===${NC}"
    
    # Instalar UFW se não estiver instalado
    if ! command -v ufw &> /dev/null; then
        echo -e "${YELLOW}UFW não está instalado. Instalando...${NC}"
        install_package "ufw"
    fi
    
    # Configuração básica
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    
    # Permitir SSH
    read -p "Digite a porta SSH para liberar (padrão: 22): " ssh_port
    ssh_port=${ssh_port:-22}
    sudo ufw allow $ssh_port/tcp
    
    # Perguntar sobre serviços comuns
    read -p "Permitir HTTP (porta 80)? (s/N): " allow_http
    read -p "Permitir HTTPS (porta 443)? (s/N): " allow_https
    
    [[ $allow_http =~ ^[Ss]$ ]] && sudo ufw allow 80/tcp
    [[ $allow_https =~ ^[Ss]$ ]] && sudo ufw allow 443/tcp
    
    # Ativar firewall
    sudo ufw enable
    echo -e "${GREEN}Configuração do Firewall concluída!${NC}"
}

# Função para configurar backup automático
configure_backup() {
    echo -e "\n${BLUE}=== Configuração de Backup Automático ===${NC}"
    
    # Instalar rsync se não estiver instalado
    if ! command -v rsync &> /dev/null; then
        echo -e "${YELLOW}rsync não está instalado. Instalando...${NC}"
        install_package "rsync"
    fi
    
    # Solicitar diretório de origem
    read -p "Digite o diretório a ser backupeado (ex: /home/user/docs): " source_dir
    
    # Solicitar diretório de destino
    read -p "Digite o diretório de destino do backup (ex: /mnt/backup): " dest_dir
    
    # Criar script de backup
    backup_script="$HOME/backup_script.sh"
    echo '#!/bin/bash' > "$backup_script"
    echo "rsync -av --delete \"$source_dir\" \"$dest_dir\"" >> "$backup_script"
    chmod +x "$backup_script"
    
    # Configurar cron
    read -p "Digite a frequência do backup (diário/semanal/mensal): " backup_freq
    
    case $backup_freq in
        diário)
            cron_time="0 1 * * *"
            ;;
        semanal)
            cron_time="0 1 * * 0"
            ;;
        mensal)
            cron_time="0 1 1 * *"
            ;;
        *)
            echo "Frequência inválida. Configurando como diário."
            cron_time="0 1 * * *"
            ;;
    esac
    
    (crontab -l 2>/dev/null; echo "$cron_time $backup_script") | crontab -
    
    echo -e "${GREEN}Configuração de backup concluída!${NC}"
    echo "O backup será executado $backup_freq às 01:00"
}

# Função para configurar swap
configure_swap() {
    echo -e "\n${BLUE}=== Configuração de Swap ===${NC}"
    
    # Verificar swap atual
    current_swap=$(free -m | awk '/^Swap:/{print $2}' | tr -d '\n')
    
    # Verificar se current_swap é um número válido
    if ! [[ "$current_swap" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Erro ao obter o tamanho do swap${NC}"
        current_swap=0
    fi
    
    # Verificar memória RAM total
    total_mem=$(free -m | awk '/^Mem:/{print $2}' | tr -d '\n')
    
    # Verificar se total_mem é um número válido
    if ! [[ "$total_mem" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Erro ao obter o tamanho da memória RAM${NC}"
        total_mem=2048
    fi
    
    # Mostrar informações atuais
    echo -e "${YELLOW}Memória RAM total: ${total_mem}MB${NC}"
    echo -e "${YELLOW}Swap atual: ${current_swap}MB${NC}"
    
    # Calcular tamanho recomendado do swap
    if [ "$total_mem" -le 2048 ]; then
        recommended_size=$((total_mem * 2))
    else
        recommended_size=$total_mem
    fi
    
    # Se já existe swap, usar como sugestão
    if [ "$current_swap" -gt 0 ]; then
        swap_size=$current_swap
        echo -e "\n${BLUE}Você já tem ${current_swap}MB de swap configurado.${NC}"
    else
        swap_size=$recommended_size
        echo -e "\n${BLUE}Nenhum swap detectado.${NC}"
    fi
    
    echo -e "${YELLOW}Tamanho recomendado: ${recommended_size}MB${NC}"
    read -p "Digite o tamanho desejado para o swap em MB (atual: ${current_swap}MB, recomendado: ${recommended_size}MB): " custom_swap
    
    # Verificar se o valor inserido é válido
    if [[ -n "$custom_swap" ]] && [[ "$custom_swap" =~ ^[0-9]+$ ]]; then
        swap_size=$custom_swap
    fi
    
    # Se o tamanho for igual ao atual e swap já existe, perguntar se quer recriar
    if [ "$swap_size" -eq "$current_swap" ] && [ "$current_swap" -gt 0 ]; then
        read -p "O tamanho escolhido é igual ao atual. Deseja recriar o swap mesmo assim? (s/N): " recreate
        if [[ ! $recreate =~ ^[Ss]$ ]]; then
            echo -e "${GREEN}Mantendo configuração atual do swap.${NC}"
            return
        fi
    fi
    
    echo -e "${YELLOW}Criando arquivo swap de ${swap_size}MB...${NC}"
    
    # Verificar se já existe um arquivo swap
    if swapon -s | grep -q "/swapfile"; then
        echo -e "${YELLOW}Arquivo swap existente encontrado. Desativando...${NC}"
        sudo swapoff /swapfile
        sudo rm -f /swapfile
    fi
    
    # Criar arquivo swap
    if sudo fallocate -l ${swap_size}M /swapfile; then
        sudo chmod 600 /swapfile
        if sudo mkswap /swapfile; then
            if sudo swapon /swapfile; then
                # Verificar se a entrada já existe no fstab
                if ! grep -q "/swapfile none swap sw 0 0" /etc/fstab; then
                    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
                fi
                
                # Configurar swappiness
                if ! grep -q "vm.swappiness" /etc/sysctl.conf; then
                    echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
                    sudo sysctl -p
                fi
                
                echo -e "${GREEN}Configuração de swap concluída!${NC}"
                echo -e "Tamanho anterior do swap: ${current_swap}MB"
                echo -e "Novo tamanho do swap: ${swap_size}MB"
                echo -e "Swappiness configurado para: 10"
                
                # Mostrar novo status
                echo -e "\n${BLUE}Status atual do swap:${NC}"
                free -h | grep -i swap
            else
                echo -e "${RED}Erro ao ativar o arquivo swap${NC}"
            fi
        else
            echo -e "${RED}Erro ao formatar o arquivo swap${NC}"
        fi
    else
        echo -e "${RED}Erro ao criar o arquivo swap${NC}"
    fi
}

# Função para otimizar sistema
optimize_system() {
    echo -e "\n${BLUE}=== Otimização do Sistema ===${NC}"
    
    # Limpar pacotes não utilizados
    case $(detect_package_manager) in
        debian)
            sudo apt autoremove -y
            sudo apt clean
            ;;
        fedora)
            sudo dnf autoremove -y
            sudo dnf clean all
            ;;
        arch)
            sudo pacman -Sc --noconfirm
            ;;
    esac
    
    # Otimizar SSD se presente
    if [ -d "/sys/block/sda/queue/rotational" ] && [ "$(cat /sys/block/sda/queue/rotational)" -eq 0 ]; then
        echo -e "${YELLOW}SSD detectado, aplicando otimizações...${NC}"
        # Habilitar TRIM
        sudo systemctl enable fstrim.timer
        sudo systemctl start fstrim.timer
    fi
    
    # Ajustar configurações do sistema
    echo 'fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    
    echo -e "${GREEN}Otimização do sistema concluída!${NC}"
}

# Atualizar menu principal
main_menu() {
    while true; do
        echo -e "\n${GREEN}=== Menu Principal ===${NC}"
        echo "1) Instalar Aplicativos"
        echo "2) Configurar OpenSSH"
        echo "3) Configurar Firewall"
        echo "4) Configurar Backup Automático"
        echo "5) Configurar Swap"
        echo "6) Otimizar Sistema"
        echo "7) Informações do Sistema"
        echo "0) Sair"
        
        read -p "Escolha uma opção: " choice
        
        case $choice in
            1) apps_menu;;
            2) configure_ssh;;
            3) configure_firewall;;
            4) configure_backup;;
            5) configure_swap;;
            6) optimize_system;;
            7) get_system_info;;
            0) exit 0;;
            *) echo "Opção inválida";;
        esac
    done
}

# Renomear o menu antigo para apps_menu
apps_menu() {
    while true; do
        echo -e "\n${GREEN}=== Menu de Instalação de Aplicativos ===${NC}"
        echo "1) Navegadores"
        echo "2) IDEs e Editores de Texto"
        echo "3) Utilitários"
        echo "4) Software Multimídia"
        echo "5) Linguagens de Programação"
        echo "6) Jogos e Gaming"
        echo "7) Aplicativos de Escritório"
        echo "8) Ferramentas de Segurança"
        echo "9) Iniciar Instalação"
        echo "0) Voltar"
        
        read -p "Escolha uma opção: " choice
        
        case $choice in
            1) browser_menu;;
            2) ide_menu;;
            3) utilities_menu;;
            4) multimedia_menu;;
            5) languages_menu;;
            6) games_menu;;
            7) office_menu;;
            8) security_menu;;
            9) show_summary;;
            0) return;;
            *) echo "Opção inválida";;
        esac
    done
}

# Função para mostrar o resumo das seleções
show_summary() {
    clear
    get_system_info
    
    echo -e "\n${BLUE}=== Resumo das Seleções ===${NC}"
    
    if [ ${#selected_browsers[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Navegadores:${NC}"
        printf '%s\n' "${selected_browsers[@]}"
    fi
    
    if [ ${#selected_ides[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}IDEs e Editores:${NC}"
        printf '%s\n' "${selected_ides[@]}"
    fi
    
    if [ ${#selected_utilities[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Utilitários:${NC}"
        printf '%s\n' "${selected_utilities[@]}"
    fi
    
    if [ ${#selected_multimedia[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Software Multimídia:${NC}"
        printf '%s\n' "${selected_multimedia[@]}"
    fi
    
    if [ ${#selected_languages[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Linguagens de Programação:${NC}"
        printf '%s\n' "${selected_languages[@]}"
    fi
    
    if [ ${#selected_games[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Jogos e Gaming:${NC}"
        printf '%s\n' "${selected_games[@]}"
    fi
    
    if [ ${#selected_office[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Aplicativos de Escritório:${NC}"
        printf '%s\n' "${selected_office[@]}"
    fi
    
    if [ ${#selected_security[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Ferramentas de Segurança:${NC}"
        printf '%s\n' "${selected_security[@]}"
    fi
    
    echo -e "\n${GREEN}Deseja prosseguir com a instalação? [S/n]${NC}"
    read -r response
    
    case $response in
        [nN][oO]|[nN])
            echo "Instalação cancelada."
            exit 0
            ;;
        *)
            start_installation
            ;;
    esac
}

# Função para iniciar a instalação
start_installation() {
    echo -e "\n${GREEN}Iniciando instalação dos pacotes selecionados...${NC}"
    
    # Atualizar o sistema primeiro
    local package_manager=$(detect_package_manager)
    case $package_manager in
        debian)
            sudo apt update && sudo apt upgrade -y
            ;;
        fedora)
            sudo dnf update -y
            ;;
        arch)
            sudo pacman -Syu --noconfirm
            ;;
        tinycore)
            tce-update
            ;;
    esac
    
    # Instalar todos os pacotes selecionados
    for browser in "${selected_browsers[@]}"; do
        echo -e "\n${BLUE}Instalando $browser...${NC}"
        install_package "$browser"
    done
    
    for ide in "${selected_ides[@]}"; do
        echo -e "\n${BLUE}Instalando $ide...${NC}"
        install_package "$ide"
    done
    
    for utility in "${selected_utilities[@]}"; do
        echo -e "\n${BLUE}Instalando $utility...${NC}"
        install_package "$utility"
    done
    
    for multimedia in "${selected_multimedia[@]}"; do
        echo -e "\n${BLUE}Instalando $multimedia...${NC}"
        install_package "$multimedia"
    done
    
    for language in "${selected_languages[@]}"; do
        echo -e "\n${BLUE}Instalando $language...${NC}"
        install_package "$language"
    done
    
    for game in "${selected_games[@]}"; do
        echo -e "\n${BLUE}Instalando $game...${NC}"
        install_package "$game"
    done
    
    for office in "${selected_office[@]}"; do
        echo -e "\n${BLUE}Instalando $office...${NC}"
        install_package "$office"
    done
    
    for security in "${selected_security[@]}"; do
        echo -e "\n${BLUE}Instalando $security...${NC}"
        install_package "$security"
    done
    
    echo -e "\n${GREEN}Instalação concluída!${NC}"
}

# Verificar se está rodando como root
if [[ $EUID -eq 0 ]]; then
    echo -e "${RED}Este script não deve ser executado como root${NC}"
    exit 1
fi

# Verificar se o sistema é suportado
if [[ $(detect_package_manager) == "unsupported" ]]; then
    echo -e "${RED}Sistema operacional não suportado${NC}"
    exit 1
fi

# Iniciar o programa
echo -e "${GREEN}Bem-vindo ao Script de Configuração Linux${NC}"
echo "Este script irá ajudá-lo a configurar e otimizar seu sistema."
main_menu 