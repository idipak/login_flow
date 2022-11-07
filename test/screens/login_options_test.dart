import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_flow/screens/login_options.dart';

Widget buildScreen() => const MaterialApp(home: LoginOptions(),);

main(){

  group("Widget test for Login option screen", () {

    testWidgets(
        "GIVEN user opens the app"
        "WHEN login options screen shows up"
        "THEN user should find login and skip button", (widgetTester) async{
          //given

      //when
      await widgetTester.pumpWidget(buildScreen());

      //then
      expect(find.text("Login Here"), findsOneWidget);
      expect(find.text("Skip Login"), findsOneWidget);
        });

    testWidgets(
        "GIVEN user on login option screen"
        "WHEN user tap on login button"
        "THEN login dialog shown", (widgetTester) async{
          //given
      await widgetTester.pumpWidget(buildScreen());
      
      //when
      await widgetTester.tap(find.text("Login Here"));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));
      
      //then
      expect(find.byType(TextFormField), findsNWidgets(2));
        });

    testWidgets(
        "GIVEN login form is opened"
        "WHEN user taps on login button"
        "THEN show validation error", (widgetTester) async{
          //given
      await widgetTester.pumpWidget(buildScreen());
      await widgetTester.tap(find.text("Login Here"));
      await widgetTester.pumpAndSettle(const Duration(milliseconds: 500));

      //when
      await widgetTester.tap(find.text("Submit"));
      await widgetTester.pump(const Duration(milliseconds: 100));
      //then
      expect(find.text("Cannot be empty"), findsAtLeastNWidgets(1));

        });


  });

}