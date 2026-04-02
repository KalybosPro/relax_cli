import 'package:flutter_test/flutter_test.dart';

import 'package:example/app/app.dart';

void main() {
  testWidgets('App renders HomePage', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Example'), findsOneWidget);
  });
}
