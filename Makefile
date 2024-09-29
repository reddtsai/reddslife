.PHONY: gen-env
gen-env:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: run
run:
	flutter run lib/main.dart
