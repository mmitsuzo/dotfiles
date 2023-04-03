FROM ubuntu:latest

ARG USERNAME="user"
ARG GROUPNAME="user"
ARG PASSWORD="user"
ARG UID=1000
ARG GID=1000
ARG HOME_DIR="/home/"${USERNAME}
ARG LANG="C.UTF-8"

ENV LANG ${LANG}
RUN apt update && apt upgrade -y
RUN yes | unminimize
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:jonathonf/vim
RUN add-apt-repository -y ppa:neovim-ppa/unstable
RUN apt install -y apt-utils apt-file \
	sudo \
	psmisc \
	neovim \
	vim vim-doc vim-scripts \
	tmux \
	universal-ctags \
	wget curl \
	git git-doc \
	man-db manpages manpages-dev manpages-posix manpages-posix-dev \
	language-pack-ja manpages-ja manpages-ja-dev \
	bzip2 bzip2-doc file w3m lynx \
	zip unzip \
	nkf \
	gawk gawk-doc \
	sqlite3 sqlite3-doc \
	iproute2 iproute2-doc \
	iputils-ping traceroute \
	python3 python3-doc python3-venv

#RUN apt install binutils binutils-doc gcc gcc-doc gdb gdb-doc make make-doc
#RUN apt install texlive-latex-recommended texlive-latex-extra \
#   texlive-fonts-recommended texlive-fonts-extra texlive-lang-japanese \
#   texlive-lang-cjk

# Node.js and aws-cdk install
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install -y nodejs && \
	npm install -g aws-cdk typescript

RUN groupadd -g ${GID} ${GROUPNAME}
RUN useradd -m -s /bin/bash -u ${UID} -g ${GID} -d ${HOME_DIR} -G sudo ${USERNAME}
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd

USER ${USERNAME}
WORKDIR ${HOME_DIR}
ENV HOME ${HOME_DIR}
ENV LANG ${LANG}
ENV PATH ${PATH}:${HOME_DIR}/.local/bin

# Install DENO
RUN curl -fsSL https://deno.land/x/install/install.sh | sh
RUN echo '' >> ~/.bashrc
RUN echo '# DENO setting' >> ~/.bashrc
RUN echo 'export DENO_INSTALL="/home/user/.deno"' >> ~/.bashrc
RUN echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc

# aws-cli in local
RUN mkdir -p ${HOME_DIR}/.local/bin
RUN mkdir -p ${HOME_DIR}/.local/src
RUN cd ${HOME_DIR}/.local/src && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	cd ${HOME_DIR}/.local/src && unzip awscliv2.zip && \
	./aws/install -i ${HOME_DIR}/.local/aws-cli -b ${HOME_DIR}/.local/bin

# vim-plug for Vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=user:user dotfiles/dot.vimrc ${HOME_DIR}/.vimrc
# vim-plug for Neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p ~/.config/nvim
COPY --chown=user:user dotfiles/dot.vimrc ${HOME_DIR}/.config/nvim/init.vim
# tmux config
COPY --chown=user:user dotfiles/dot.tmux.conf ${HOME_DIR}/.tmux.conf
# emacs config
COPY --chown=user:user dotfiles/dot.emacs.d ${HOME_DIR}/.emacs.d
# skk dictionary for skkeleton
RUN mkdir -p ~/.skk && cd ~/.skk && wget https://skk-dev.github.io/dict/SKK-JISYO.L.gz && gunzip SKK-JISYO.L.gz

