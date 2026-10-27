import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animation_showcase/main.dart';

void main() {
  testWidgets('Showcase home lists animation demos', (tester) async {
    await tester.pumpWidget(const AnimationShowcaseApp());

    expect(find.text('Animation Showcase'), findsWidgets);
    expect(find.text('Implicit animations'), findsOneWidget);
    expect(find.text('Hero transition'), findsOneWidget);
  });
}
