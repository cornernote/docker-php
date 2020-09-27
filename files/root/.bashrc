# git bash prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=TruncatedPwd_WindowTitle_Ubuntu
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Text to ASCII Art Generator (TAAG) - patorjk.com
# http://patorjk.com/software/taag/#p=display&h=1&v=1&f=Small&t=AFI%20CoRNeRNoTe%0Adocker-php
cat <<'MSG'
  _____     ___  _  __    ___  _  __   ______
 / ___/__  / _ \/ |/ /__ / _ \/ |/ /__/_  __/__
/ /__/ _ \/ , _/    / -_) , _/    / _ \/ / / -_)
\___/\___/_/|_/_/|_/\__/_/|_/_/|_/\___/_/  \__/
 ___/ /__  ____/ /_____ ___________  / /  ___
/ _  / _ \/ __/  '_/ -_) __/___/ _ \/ _ \/ _ \
\_,_/\___/\__/_/\_\\__/_/     / .__/_//_/ .__/
                             /_/       /_/

Docker image cornernote/docker-php

Available commands:

PHP:                MYSQL:              NETWORKING:         OTHER:
 composer            mysql               certbot             wkhtmltopdf
 codecept            mydumper            ping                lockrun
 robo                percona-toolkit     curl
 psysh                                   wget
 pecl
 pear

MSG
