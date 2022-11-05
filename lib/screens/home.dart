import 'package:flutter/material.dart';
import 'package:login_flow/assets.dart';

import '../components/price_card.dart';
import '../components/scroll_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Hero(
                tag: "car",
                child: Image(image: AssetImage(Assets.car), height: 200, width: double.infinity,)),

            ScrollText(),
            SizedBox(height: 12,),

            PriceCard(
              text1: "Diesel Variant",
              text2: "Mileage : 20 Km/litre",
              text3: "Ex-showroom price in Patna",
              text4: "₹ 14.45 lakh",
            ),

            PriceCard(
              text1: "Petrol Variant",
              text2: "Mileage : 18 Km/litre",
              text3: "Ex-showroom price in Patna",
              text4: "₹ 12.45 lakh",
            ),

          ],
        ),
      ),
    );
  }
}
