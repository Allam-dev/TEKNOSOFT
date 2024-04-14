# for build_runner
flutter pub run build_runner build --delete-conflicting-outputs

# for localization 
flutter pub run easy_localization:generate -S assets/localization -O lib/core/services/localization -f keys -o locale_keys.g.dart
flutter pub run easy_localization:generate -S assets/localization -O lib/core/services/localization

