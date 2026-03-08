import 'package:mood_tracker/app/app.dart';
import 'package:mood_tracker/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
