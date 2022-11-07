import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_flow/components/price_card.dart';
import 'package:login_flow/screens/home.dart';

Widget buildHome() => const MaterialApp(home: Home(),);

main(){

  group("Widget testing for home screen", () {

    testWidgets(
        "GIVEN user logged in"
        "WHEN home screen opens"
        "THEN show all the required components on screen", (widgetTester) async{
          //given
      
      //when
      await widgetTester.pumpWidget(buildHome());
      
      //then
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(PriceCard), findsAtLeastNWidgets(1));

    });

  });

}