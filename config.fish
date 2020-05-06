# alias
alias ll "lsd -al"
alias cat "bat"
alias vim "nvim"
alias rosrun "rlwrap ros run"

# dockertoolbox
alias fig "docker-compose"
alias exechttpd "docker exec -it httpd /bin/bash"
function dtb
  /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh $argv
end

# golang
set -U GOPATH $HOME/go
set -U fish_user_paths $GOPATH/bin

# nodejs
set -U fish_user_paths $HOME/.nodebrew/current/bin $fish_user_paths

# flutter
set -U fish_user_paths $HOME/my-flutter/flutter/bin $fish_user_paths

# android
set -U ANDROID_HOME /Users/akita/Library/Android/sdk
set -U ANDROID_SDK_ROOT /Users/akita/Library/Android/sdk
set -U ANDROID_AVD_HOME /Users/akita/.android/avd

# pyenv
set -U fish_user_paths $HOME/.pyenv/shims $fish_user_paths

# .local
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U RUST_SRC_PATH $HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src

# roswell
set -U fish_user_paths $HOME/.roswell/bin $fish_user_paths

# fish
set -g fish_prompt_pwd_dir_length 0 # ディレクト名を短縮しない
set -g theme_newline_cursor yes # カーソルを改行する
set -g theme_display_date no # 実行時間を表示しない
