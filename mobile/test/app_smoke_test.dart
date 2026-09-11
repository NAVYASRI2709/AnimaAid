import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/app/app.dart';

void main() {
  testWidgets('app boots and renders the home page', (tester) async {
    await tester.pumpWidget(const AnimaAidApp());
    await tester.pumpAndSettle();

    expect(find.text('Hello, Animal Hero 👋'), findsOneWidget);
    expect(find.text('Animal in danger?'), findsOneWidget);
    expect(find.text('Request Rescue'), findsOneWidget);

    // Bottom navigation shell is present.
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}