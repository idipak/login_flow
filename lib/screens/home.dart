import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_flow/assets.dart';

import '../components/login_form.dart';
import '../components/price_card.dart';
import '../components/scroll_text.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Home, ${user.email.split("@").first}")),
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
