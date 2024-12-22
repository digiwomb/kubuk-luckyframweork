FROM digiwomb/kubuk:1.1.0

RUN apt-get update && apt upgrade -y && apt-get install -y \
    crystal \
    libc6-dev \
    libevent-dev \
    libpcre2-dev \
    libpng-dev \
    libssl-dev \
    libyaml-dev \
    zlib1g-dev

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install luckyframework/homebrew-lucky/lucky

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install mailpit

RUN sudo -u kasm-user /bin/bash -c "code --install-extension crystal-lang-tools.crystal-lang \
    && code --install-extension stephendolan.lucky"

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install postgresql@17

RUN /bin/bash -c "echo 'deb [signed-by=/usr/share/keyrings/beekeeper.gpg] https://deb.beekeeperstudio.io stable main' | tee /etc/apt/sources.list.d/beekeeper-studio-app.list"

RUN "sudo wget -O- https://deb.beekeeperstudio.io/beekeeper.key | gpg --dearmor | sudo tee /usr/share/keyrings/beekeeper.gpg"

RUN apt install -y beekeeper-studio