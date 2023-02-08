import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration/scrolling.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('e2e scrolling jank test', () {
    testWidgets('check jank', (tester) async {
      await tester.pumpWidget(app.ScrollingApp(
        items: List<String>.generate(10000, (i) => 'Item $i'),
      ));

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('item_50_text'));

      await binding.traceAction(
        () async {
          await tester.scrollUntilVisible(
            itemFinder,
            500,
            scrollable: listFinder,
          );
        },
        reportKey: 'scrolling_timeline',
      );
    });
  });
}
