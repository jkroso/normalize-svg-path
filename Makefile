serve: node_modules
	@node_modules/serve/bin/serve -Slojp 0

test: node_modules
	@node_modules/jsmd/bin/jsmd Readme.md
	@node_modules/hydro/bin/_hydro test/*.test.js \
		--formatter node_modules/hydro-dot \
		--plugins $$PWD/node_modules/hydro-bdd

node_modules: package.json
	@packin install -m $<,component.json -f $@
	@ln -sfn .. $@/normalize-svg-path

.PHONY: serve test
