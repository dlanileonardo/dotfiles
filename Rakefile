require "colorize"
require "tty-logger"
require "tty-spinner"
require "tty-prompt"
require 'tty-command'
require "logger"
require_relative "./scripts/string"

# LOGGER = TTY::Logger.new do |config|
#   config.types = {
#     start: {level: :info},
#     done: {level: :info}
#   }
#   config.handlers = [
#     [:console, {
#       styles: {
#         start: {
#           symbol: "🏳️",
#           label: "[OK]",
#           color: :magenta,
#           levelpad: 2
#         },
#         done: {
#           symbol: "🏁",
#           label: "[OK]",
#           color: :green,
#           levelpad: 2
#         }
#       }
#     }]
#   ]
# end

# def output(msg, type: :info, lvl: 0)
#   pre = lvl > 0 ? (" " * lvl) + "> " : ""
#   LOGGER.send(type, pre + msg)
# end

# def start(msg, lvl: 0)
#   output(msg, type: :start, lvl: lvl)
# end

# def done(msg, lvl: 0)
#   output(msg, type: :done, lvl: lvl)
# end

task :dot

desc "Dotfiles"
namespace "dot" do
  DOTFILES_ROOT = `pwd`.strip
  prompt = TTY::Prompt.new
  logger = Logger.new('./log/setup.log', level: Logger::WARN)
  @tty_logger = TTY::Logger.new
  @cmd = TTY::Command.new(output: logger)
  @multi_spinner = TTY::Spinner::Multi.new "[:spinner] Setup Dotfiles", hide_cursor: false, format: :dots
  @any_error = false

  def format_level(lvl)
    ("    " * lvl).to_s
  end

  def run_cmd(cmd, spinner = nil, lvl: 0)
    unless (spinner)
      sp1 = @multi_spinner.register format_level(lvl) + "[:spinner] Run shell: #{cmd}".truncate(80)
      sp1.auto_spin
    end

    begin
      out, err = @cmd.run(cmd, pty: true)
      sp1.success "OK".green unless spinner
      spinner.success "OK".green if spinner
    rescue
      @any_error = true
      sp1.error "NOK".red unless spinner
      spinner.error "NOK".red if spinner
    end
  end

  def link_file(src, dst, lvl: 0)
    status = ""
    dst_abs = dst.gsub("~/", ENV["HOME"] + "/")

    sp1 = @multi_spinner.register format_level(lvl) + "[:spinner] Link #{dst} => #{src}"
    sp1.auto_spin

    exists = Dir.exist?("#{dst_abs}") || File.exist?("#{dst_abs}") || File.symlink?("#{dst_abs}")

    if (exists)
      status = "SKIPPED".yellow
    else
      status = "CREATED".green
      sh "ln -s #{src} #{dst}"
    end

    sp1.success status
  end

  def run_apt_get(package, lvl: 0)
    sp1 = @multi_spinner.register format_level(lvl) + "[:spinner] Brew Install #{package}"
    sp1.auto_spin
    run_cmd "brew install #{package}", sp1, lvl: (lvl+1)
  end

  desc "Bootstrap"
  task :setup_bootstrap do |task, args|
    sp1 = @multi_spinner.register "[:spinner] Bootstrap"
    sp1.auto_spin
    # run_cmd "rm -rf #{DOTFILES_ROOT}/log/*", sp1
    sp1.success "COMPLETE".green
  end

  desc "Setup GIT"
  task :setup_gitconfig do
    sp1 = @multi_spinner.register "[:spinner] Git Config"
    sp1.auto_spin

    if ( !File.file?("#{DOTFILES_ROOT}/symlinks/.gitconfig") )
      sp1.pause
      result = prompt.collect do
        key(:name).ask('What is your github author name?', default: ENV['USER'], required: true)
        key(:email).ask('What is your github author email?', required: true)
      end
      git_credential='cache'
      if ( `uname -s` == "Darwin" )
          git_credential='osxkeychain'
      end
      sp1.resume
      run_cmd "sed -e \"s/AUTHORNAME/#{result[:name]}/g\" -e \"s/AUTHOREMAIL/#{result[:email]}/g\" -e \"s/GIT_CREDENTIAL_HELPER/#{git_credential}/g\" git/gitconfig.example > symlinks/gitconfig", sp1
    end

    sp1.success "COMPLETE".green
  end

  desc "Install all Dependencies"
  task :install_dependencies do
    sp1 = @multi_spinner.register "[:spinner] Dependencies"
    sp1.auto_spin

    run_cmd 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"', lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/zsh-autosuggestions", "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/zsh-syntax-highlighting", "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/alias-tips", "~/.oh-my-zsh/custom/plugins/alias-tips", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/history-search-multi-word", "~/.oh-my-zsh/custom/plugins/history-search-multi-word", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/git-prune", "~/.oh-my-zsh/custom/plugins/git-prune", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/oh-my-zsh-reminder", "~/.oh-my-zsh/custom/plugins/reminder", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/almostontop", "~/.oh-my-zsh/custom/plugins/almostontop", lvl: 1
    link_file "#{DOTFILES_ROOT}/zsh-plugins/zsh-autoenv", "~/.oh-my-zsh/custom/plugins/autoenv", lvl: 1

    run_apt_get "asciinema", lvl: 1
    run_apt_get "fzf", lvl: 1
    run_apt_get "bat", lvl: 1
    run_apt_get "fd", lvl: 1
    run_apt_get "git-extras", lvl: 1

    run_cmd 'gem install cocoapods bundler shenzhen fastlane'
    run_cmd 'gem install rubocop ruby-debug-ide ruby-lint reek fasterer debride solargraph rake rcodetools rb-readline'
    run cmd 'gem install did_you_mean github_changelog_generator tmuxinator colorize'
    run_cmd 'gem install docker-sync'
    run_cmd 'gem install rest-client multipart-post bumpversion nokogiri docker-compose'

    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1
    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro ExtraLight Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Extra-Light/complete/Sauce%20Code%20Pro%20ExtraLight%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1
    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro Light Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Light/complete/Sauce%20Code%20Pro%20Light%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1
    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro Medium Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Medium/complete/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1
    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro Semibold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1
    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Bold/complete/Sauce%20Code%20Pro%20Bold%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1
    run_cmd 'cd ~/Library/Fonts && curl -sfLo "Sauce Code Pro Black Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Black/complete/Sauce%20Code%20Pro%20Black%20Nerd%20Font%20Complete.ttf?raw=true', lvl: 1

    BASE16_THEME="base16-twilight.dark"

    run_cmd "cd #{DOTFILES_ROOT}/themes/base16-builder && ./base16 && open output/terminal-app", lvl: 1
    # run_cmd "pip install --user powerline-status", lvl: 1
    run_cmd "mkdir -p ~/.oh-my-zsh/custom/themes/", lvl: 1

    link_file "#{$DOTFILES_ROOT}/dependencies/powerlevel9k", "~/.oh-my-zsh/custom/themes/powerlevel9k", lvl: 1

    sp1.success "COMPLETE".green
  end

  desc "Install"
  task :install_dotfiles do
    sp1 = @multi_spinner.register "[:spinner] Dotfiles"
    sp1.auto_spin

    Dir.each_child("./symlinks").each do |filename|
      dst = "#{ENV['HOME']}/#{filename}"
      src = "#{DOTFILES_ROOT}/symlinks/#{filename}"
      link_file src, dst, lvl: 1
    end

    sp1.success "COMPLETE".green
  end

  task :install_vimplugins do
    sp1 = @multi_spinner.register "[:spinner] Setup Vim"
    sp1.auto_spin

    run_cmd 'curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh', lvl: 1

    unless (Dir.exists?(ENV['NEOBUNDLE_INSTALL_DIR'].to_s))
      run_cmd 'sh ./install.sh', lvl: 2
      run_cmd 'rm install.sh', lvl: 2
    end

    run_cmd '~/.vim/bundle/neobundle.vim/bin/neoinstall', lvl: 2

    run_cmd "wget -O codesearch.zip https://github.com/junkblocker/codesearch/releases/download/v5/codesearch_v5_darwin_amd64.zip", lvl: 1
    run_cmd "unzip -j -n codesearch.zip -d ~/bin && chmod a+x ~/bin/* && rm codesearch.zip", lvl: 2

    link_file "~/.vim/bundle/base16-vim/colors", "~/.vim/colors", lvl: 1
    link_file "$DOTFILES_ROOT/dependencies/vimfiles/doc", "~/.vim/doc", lvl: 1
    link_file "$DOTFILES_ROOT/dependencies/vimfiles/unite-menus/", "~/.vim/unite-menus", lvl: 1
    link_file "$DOTFILES_ROOT/dependencies/vimfiles/snippets/", "~/.vim/snippets", lvl: 1
    link_file "$DOTFILES_ROOT/dependencies/vimfiles/vimrc.d/", "~/.vim/vimrc.d", lvl: 1
    link_file "$DOTFILES_ROOT/dependencies/vimfiles/vimrc.plugins/", "~/.vim/vimrc.plugins", lvl: 1

    run_cmd "mkdir -p ~/.vim/.cache/unite", lvl: 1

    sp1.success "COMPLETE".green
  end

  desc "Install Configs"
  task :install_configs do
    require 'find'

    sp1 = @multi_spinner.register "[:spinner] Config Files"
    sp1.auto_spin

    Dir.each_child("./config").each do |filename|
      dst = "#{ENV['HOME']}/.config/#{filename}"
      src = "#{DOTFILES_ROOT}/config/#{filename}"
      link_file src, dst, lvl: 1
    end

    sp1.success "COMPLETE".green
  end

  desc "Setup"
  task :setup do
    @tty_logger.info "Start Setup!"
    Rake::Task["dot:setup_bootstrap"].invoke(1)
    Rake::Task["dot:setup_gitconfig"].invoke(1)
    Rake::Task["dot:install_dependencies"].invoke(1)
    Rake::Task["dot:install_dotfiles"].invoke(1)
    Rake::Task["dot:install_configs"].invoke(1)
    Rake::Task["dot:install_vimplugins"].invoke(1)
    if @any_error
      @tty_logger.error "Check log #{DOTFILES_ROOT}/log/setup.log for more info"
    else
      @tty_logger.success "Success!"
    end
  end

  task default: %w[setup]
  task run: [:setup]
end

task default: %w[dot:setup]
