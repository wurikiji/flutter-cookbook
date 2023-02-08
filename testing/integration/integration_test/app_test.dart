import 'package:flutter_test/flutter_test.dart';
import 'package:integration/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('e2e test', () {
    testWidgets(
      'tap on the floating action button, verify counter',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        expect(find.text('0'), findsOneWidget);
        final fab = find.byTooltip('Increment');
        await tester.tap(fab);
        await tester.pumpAndSettle();
        expect(find.text('1'), findsOneWidget);
      },
    );
  });
}
