import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:mobile/features/emergency_report/presentation/emergency_case_details_page.dart';
import 'package:mobile/features/emergency_report/presentation/emergency_report_page.dart';
import 'package:mobile/features/emergency_report/presentation/issue_resolved_page.dart';

Widget _pumpReportPage(WidgetTester tester) {
  final router = GoRouter(
    initialLocation: '/emergency-report',
    routes: [
      GoRoute(
        path: '/emergency-report',
        builder: (context, state) => const EmergencyReportPage(),
      ),
    ],
  );

  return MaterialApp.router(routerConfig: router);
}

void main() {
  testWidgets('emergency report shows inline validation errors on empty submit',
      (tester) async {
    await tester.pumpWidget(_pumpReportPage(tester));
    await tester.pumpAndSettle();

    expect(find.text('Report an Animal Emergency'), findsOneWidget);

    final submitButton = find.text('Submit Rescue Request');
    await tester.ensureVisible(submitButton);
    await tester.pumpAndSettle();

    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.text('Please describe the situation.'), findsOneWidget);
    expect(find.text('Please enter a contact number.'), findsOneWidget);
  });

  testWidgets('emergency report requires a rescue location before submit',
      (tester) async {
    await tester.pumpWidget(_pumpReportPage(tester));
    await tester.pumpAndSettle();

    // Select animal type (form is at top, dropdowns are visible).
    final animalDropdown =
        find.byType(DropdownButtonFormField<String>).at(0);
    final severityDropdown =
        find.byType(DropdownButtonFormField<String>).at(1);

    await tester.tap(animalDropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dog').last);
    await tester.pumpAndSettle();

    await tester.tap(severityDropdown);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Critical').last);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Describe the situation'),
      'A stray dog needs urgent help near the park.',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Contact Number'),
      '9876543210',
    );

    final submitButton = find.text('Submit Rescue Request');
    await tester.ensureVisible(submitButton);
    await tester.pumpAndSettle();

    await tester.tap(submitButton);
    await tester.pump(const Duration(milliseconds: 500));

    expect(
      find.text('Please select the rescue location on the map.'),
      findsOneWidget,
    );
  });

  testWidgets('case details page reflects the submitted case data',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EmergencyCaseDetailsPage(
          caseId: '#ER-12345',
          animalType: 'Dog',
          severity: 'Critical',
          description: 'Stray dog needs urgent help near the park.',
          contact: '9876543210',
          locationLabel: '13.0827, 80.2707',
          isEmergency: true,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('#ER-12345'), findsOneWidget);
    expect(find.text('Stray dog needs urgent help near the park.'),
        findsOneWidget);
    expect(find.text('9876543210'), findsOneWidget);
    expect(find.text('13.0827, 80.2707'), findsOneWidget);
    expect(find.text('Urgent'), findsOneWidget);
    expect(find.text('Open Live Chat'), findsOneWidget);
    expect(find.text('Confirm Issue Resolved'), findsOneWidget);
  });

  testWidgets('issue resolved flow confirms and shows success view',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: IssueResolvedPage(caseId: '#ER-12345')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Confirm Rescue Resolution'), findsOneWidget);

    await tester.tap(find.text('Confirm Issue Resolved'));
    await tester.pumpAndSettle();

    expect(find.text('Issue Resolved'), findsOneWidget);
    expect(
      find.text('Case #ER-12345 has been marked as resolved.'),
      findsOneWidget,
    );
  });
}