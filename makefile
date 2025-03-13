format-package-list:
	@sort --unique packages.txt --output packages.txt
	@echo "Formatted package list"
