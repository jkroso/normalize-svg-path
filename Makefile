REPORTER=dot

serve: node_modules
	@node_modules/serve/bin/serve -Slojp 0

test: node_modules
	@sed "s/'normalize-svg-path'/'.\/'/" < Readme.md | node_modules/jsmd/bin/jsmd
	@node_modules/mocha/bin/_mocha -b $@/*.test.js \
		--reporter $(REPORTER) \
		--timeout 500 \
		--check-leaks

node_modules: *.json
	@packin install -Re \
		--meta deps.json,package.json,component.json \
		--folder node_modules

.PHONY: serve test
