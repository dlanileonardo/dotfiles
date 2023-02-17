install:
	bundle
	bundle exec rake dot:setup

themer:
	pnpm exec themer \
		--colors themes/themer/oxocarbon.yaml \
		--template @themerdev/iterm \
		--template @themerdev/vim \
		--template themer-tmux \
		--template @themerdev/wallpaper-block-wave \
		--template @themerdev/wallpaper-burst \
		--template @themerdev/wallpaper-circuits \
		--template @themerdev/wallpaper-dot-grid \
		--template @themerdev/wallpaper-octagon \
		--out themes/themer/output

base16:
	cd themes/base16 && \
	../../node_modules/.bin/base16-builder update
	
generate:
	mkdir -p ./themes/base16/output/$(theme)/

	cat ./themes/base16/$(theme).yaml | \
		pnpm exec base16-builder \
		--template ./themes/base16/sources/templates/iterm2/templates/default.mustache > ./themes/base16/output/$(theme)/$(theme).itermcolors

	cat ./themes/base16/$(theme).yaml | \
		pnpm exec base16-builder \
		--template ./themes/base16/sources/templates/fzf/templates/default.mustache > ./themes/base16/output/$(theme)/fzf.theme

	cat ./themes/base16/$(theme).yaml | \
		pnpm exec base16-builder \
		--template ./themes/base16/sources/templates/fzf/templates/fish.mustache > ./themes/base16/output/$(theme)/fzf.fish

	cat ./themes/base16/$(theme).yaml | \
		pnpm exec base16-builder \
		--template ./themes/base16/sources/templates/neovim/templates/default.mustache > ./themes/base16/output/$(theme)/$(theme).lua

all:
	rm -rf ./themes/base16/output/*
	make generate theme=oxocarbon-dark
	make generate theme=twilight
	make generate theme=synth-midnight-dark
	make generate theme=rose-pine
	make generate theme=rose-pine-dawn
	make generate theme=rose-pine-moon
