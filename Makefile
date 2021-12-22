REBAR ?= $(shell which rebar3 2>/dev/null || which ./rebar)
.PHONY: all edoc test clean proper

all:
	cp -f ./rebar.main.config ./rebar.config
	$(REBAR) dialyzer get-deps compile

edoc:
	cp -f ./rebar.main.config ./rebar.config
	$(REBAR) doc

test:
	cp -f ./rebar.main.config ./rebar.config
	$(REBAR) xref
	$(REBAR) eunit

proper:
	cp -f ./rebar.proper.config ./rebar.config
	$(REBAR) compile
	$(REBAR) xref
	$(REBAR) eunit

clean:
	cp -f ./rebar.main.config ./rebar.config
	$(REBAR) clean
