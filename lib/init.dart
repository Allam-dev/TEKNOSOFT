part of 'main.dart';

Future<void> _initialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    LocalizationService.init(),
  ]);
}
