# Script de Configuração Linux

Este é um script interativo para configuração e instalação de software em sistemas Linux. O script suporta as seguintes distribuições:
- Debian/Ubuntu (usando apt)
- Fedora (usando dnf)
- Arch Linux (usando pacman)
- TinyCore Linux (usando tce-load)

## Recursos

### Configurações do Sistema
- Configuração automática do OpenSSH com opções de segurança
- Configuração do Firewall (UFW) com regras personalizadas
- Sistema de backup automático com agendamento
- Gerenciamento de memória swap
- Otimização do sistema e limpeza
- Exibição de informações detalhadas do sistema

### Instalação de Software
O script oferece instalação das seguintes categorias de software:
- Navegadores web (Firefox, Chrome, Chromium, Opera, Brave)
- IDEs e editores de texto (VS Code, Sublime Text, Atom, PyCharm, IntelliJ IDEA, Eclipse, Vim, Neovim)
- Utilitários (Git, Docker, Node.js, Python3, Java JDK, ferramentas de compilação, etc.)
- Software Multimídia (VLC, MPV, Audacious, GIMP, Kdenlive, OBS Studio, Blender, Krita, Audacity)
- Linguagens de Programação (Python, Java, Node.js, Go, Rust, PHP, Ruby, .NET Core, Kotlin, Swift)
- Jogos e Gaming (Steam, Lutris, Wine, PlayOnLinux, Discord, RetroArch, GameMode, MangoHud)
- Aplicativos de Escritório (LibreOffice, OnlyOffice, Thunderbird, Evolution, Okular, Evince, Calibre, Zotero)
- Ferramentas de Segurança (UFW, ClamAV, KeePassXC, Cryptomator, Wireshark, Tor Browser, VeraCrypt, Rkhunter)

## Funcionalidades

### Configuração do Sistema
- Configuração segura do OpenSSH
  - Alteração da porta padrão
  - Desativação de login root
  - Configuração de autenticação por chave
  - Geração automática de chaves SSH
- Configuração do Firewall
  - Regras básicas de segurança
  - Liberação seletiva de portas
  - Suporte a HTTP/HTTPS
- Sistema de Backup
  - Agendamento flexível (diário/semanal/mensal)
  - Uso do rsync para backups eficientes
  - Backup incremental automatizado
- Gerenciamento de Swap
  - Criação automática de arquivo swap
  - Dimensionamento inteligente baseado na RAM
  - Otimização de swappiness
- Otimização do Sistema
  - Limpeza de pacotes não utilizados
  - Otimizações para SSD
  - Ajustes de performance do sistema

### Instalação de Software
- Interface interativa com menus coloridos
- Detecção automática da distribuição Linux
- Atualização do sistema antes da instalação
- Exibição de informações do sistema
- Resumo das seleções antes da instalação
- Seleção múltipla de pacotes em cada categoria
- Confirmação antes de iniciar a instalação

## Como usar

1. Clone ou baixe este repositório
2. Torne o script executável:
   ```bash
   chmod +x setup.sh
   ```
3. Execute o script:
   ```bash
   ./setup.sh
   ```
4. Escolha entre configurar o sistema ou instalar aplicativos
5. Siga as instruções na tela para cada opção escolhida

## Notas importantes

- O script deve ser executado como usuário normal (não root)
- Sudo será solicitado quando necessário
- Certifique-se de ter uma conexão com a internet ativa
- Backups são importantes antes de fazer alterações no sistema
- Algumas opções podem não estar disponíveis em todas as distribuições
- Configurações de sistema podem requerer reinicialização

## Requisitos

- Sistema operacional Linux (Debian, Fedora, Arch ou TinyCore)
- Acesso sudo
- Conexão com a internet
- Espaço em disco suficiente

## Solução de problemas

Se encontrar algum problema:
1. Verifique se seu sistema é uma das distribuições suportadas
2. Confirme que você tem privilégios sudo
3. Verifique sua conexão com a internet
4. Certifique-se de que os repositórios do sistema estão funcionando
5. Verifique se há espaço em disco suficiente
6. Consulte os logs de erro
7. Verifique as permissões dos arquivos de configuração
8. Certifique-se de que os serviços necessários estão em execução 