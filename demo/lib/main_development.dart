import 'package:demo/app/app.dart';
import 'package:demo/bootstrap.dart';
import 'package:env/env.dart';

void main() {
  bootstrap(() => const App(), env: AppFlavor.development().getEnv);
}
