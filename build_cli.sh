#!/usr/bin/env bash
set -x
CWD=$(pwd)
go-bindata -pkg generator -nomemcopy -o $GOPATH/src/github.com/gen0cide/gscript/generator/bindata.go -prefix 'generator' generator/templates/...
go run generator/cmd/gscript-generator/main.go generate --config $GOPATH/src/github.com/gen0cide/gscript/functions.yml --out $GOPATH/src/github.com/gen0cide/gscript/engine/vm_functions.go --docs $GOPATH/src/github.com/gen0cide/gscript/FUNCTIONS.md
cd $GOPATH/src/github.com/gen0cide/gscript/cmd/gscript
go-bindata -pkg compiler -nomemcopy -o $GOPATH/src/github.com/gen0cide/gscript/compiler/bindata.go -prefix '../..' ../../templates/...
go build -o $GOPATH/bin/gscript
cd $CWD
