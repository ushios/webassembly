.PHONY: build serve


build:
	GOOS=js GOARCH=wasm go build -o main.wasm

serve: wasm_exec.js build
	goexec 'http.ListenAndServe(":8080", http.FileServer(http.Dir(".")))'

wasm_exec.js:
	cp "`go env GOROOT`/misc/wasm/wasm_exec.js" .
