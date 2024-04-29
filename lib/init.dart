part of 'main.dart';

Future<void> _initialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    initGetIt(),
    LocalizationService.init(),
    ScreenUtil.ensureScreenSize(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);
}
