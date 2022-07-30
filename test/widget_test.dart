// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GridView.builder respects findChildIndexCallback',
      (WidgetTester tester) async {
    bool finderCalled = false;
    int itemCount = 7;
    // ignore: unused_local_variable
    late StateSetter stateSetter;

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          stateSetter = setState;
          return GridView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext _, int index) => Container(
              key: Key('$index'),
              height: 2000.0,
            ),
            findChildIndexCallback: (Key key) {
              finderCalled = true;
              return null;
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
          );
        },
      ),
    ));
    expect(finderCalled, false);
  });
}
