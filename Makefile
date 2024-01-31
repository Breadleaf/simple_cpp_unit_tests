source_files = $(shell ls examples/*.cpp)

test_linux_compatibility:
	@for file in $(source_files); do \
		echo "Testing $$file with clang++..."; \
		clang++ -I./ -o test $$file; \
		./test; \
		rm test; \
	done

test_windows_compatibility:
	@for file in $(source_files); do \
		echo "Testing $$file with x86_64-w64-mingw32-g++..."; \
		x86_64-w64-mingw32-g++ --static -I./ -o test.exe $$file; \
		wine test.exe; \
		rm test.exe; \
	done

.PHONY: test_linux_compatibility test_windows_compatibility
