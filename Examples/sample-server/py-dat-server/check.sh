#!/bin/sh

python3 \
	-m mypy \
	--ignore-missing-imports \
	./main.py
