all:
	clang -emit-llvm --target=wasm32 -Oz hello.c -c -o hello.bc 
	llc -asm-verbose=false -o hello.s hello.bc
	s2wasm hello.s > hello.wast
	wast2wasm -o hello.wasm hello.wast
	
