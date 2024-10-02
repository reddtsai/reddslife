.PHONY: gen-env
gen-env:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: encrypt-env
encrypt-env:
	openssl base64 -in env.json -out env.base64

.PHONY: encrypt-firebase
encrypt-firebase:
	openssl base64 -in android/app/google-services.json -out google-services.base64
	openssl base64 -in ios/Runner/GoogleService-Info.plist -out GoogleService-Info.base64
	openssl base64 -in firebase.json -out firebase.base64

.PHONY: decrypt-env
decrypt-env:
	openssl base64 -d -in env.base64 -out .env

.PHONY: run
run:
	flutter run lib/main.dart --dart-define-from-file=env.json

.PHONY: clean
clean:
	flutter clean

.PHONY: doctor
doctor:
	flutter doctor

.PHONY: test
test:
	flutter test