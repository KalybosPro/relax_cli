import 'package:chapchap/app/app.dart';
import 'package:chapchap/bootstrap.dart';
import 'package:env/env.dart';

void main() {
  bootstrap(() => App(),env: AppFlavor.production().getEnv);
}
