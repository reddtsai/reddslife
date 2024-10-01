.PHONY: gen-env
gen-env:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: encrypt-env
encrypt-env:
	openssl base64 -in .env -out env.base64

.PHONY: decrypt-env
decrypt-env:
	openssl base64 -d -in env.base64 -out .env

.PHONY: run
run:
	flutter run lib/main.dart

.PHONY: clean
clean:
	flutter clean

.PHONY: doctor
doctor:
	flutter doctor

.PHONY: test
test:
	flutter test