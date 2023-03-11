// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_health_code_challenge/Model/home_model_entity.dart';
import 'package:flutter_health_code_challenge/data/remote/response/Status.dart';
import 'package:flutter_health_code_challenge/ui/MyHomePage.dart';
import 'package:flutter_health_code_challenge/ui/detailsPage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'notifier/HomeNotifier.dart';
import 'ui/MyHomePage.dart';
import 'ui/detailsPage.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final homeNotifier = MockHomeNotifier();

    await homeNotifier.getHomeList();

    expect(homeNotifier.homeList.value.status, Status.COMPLETED);
    expect((homeNotifier.homeList.value.data?.articles.length ?? 0) != 0, true);

    /// testing gridview and children in Home screen
    await tester.pumpWidget(MockMyHomePage());
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('GridView')), findsOneWidget);

    expect(find.image(AssetImage("assets/images/ic_grid.png")), findsOneWidget);
    await tester.tap(find.image(AssetImage("assets/images/ic_grid.png")));

    final itemFinder = find.byKey(const ValueKey('title_text'));
    expect(itemFinder, findsWidgets);

    await tester.tap(itemFinder.first);

    /// testing detailpage
    await tester.pumpWidget(MockDetailsPage("title text", "description"));
    await tester.pumpAndSettle();
    expect(find.text("title text"), findsOneWidget);
    expect(find.text("description"), findsOneWidget);


  });
}
