import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/app/app.dart';

void main() {
  testWidgets('app boots and renders the authentication screen', (tester) async {
    await tester.pumpWidget(const AnimaAidApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to AnimaAid'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });
}