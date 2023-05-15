# Personal dot files
- .tmux.conf
- .vimrc
- .emacs.d/init.el
- .docker/config.json


## TODO
- (Closed yyyy-mm-dd) `<C-j>` exists in .tmux.conf and .vimrc, so need to be adjusted.
- (Closed 2023-05-02) `<C-t>` is mapped for indenting in Vim


## UPDATE
- (yyyy-mm-dd) `<C-t>` assigned to tmux-prefix instead of `<C-j>` to avoid conflict
- (2023-05-02) `<C-a>` assigned to tmux-prefix instead of `<C-t>` to avoid conflict
- (2023-05-16) tmux default terminal changed from `tmux-256color` to `xterm-256color` to support extended keys like Ctrl-PageDown (this is the tab change key in Vim).
  - ref-URL-1 [(stack overflow)vim key-biding failing when inside of tmux](https://stackoverflow.com/questions/72483767/vim-key-biding-failing-when-inside-of-tmux)
  - ref-URL-2 [(tmux github)Issues #2186](https://github.com/tmux/tmux/issues/2186#issuecomment-622614115)


# docker files for working environment
- docker/Dockerfile
- docker/docker-compose.yml

