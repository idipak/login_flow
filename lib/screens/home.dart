import 'package:flutter/material.dart';
import 'package:login_flow/assets.dart';

import '../components/scroll_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Image(image: AssetImage(Assets.car), height: 200, width: double.infinity,),

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

class PriceCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const PriceCard({Key? key, required this.text1, required this.text2, required this.text3, required this.text4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8)
      ),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text1, style: Theme.of(context).textTheme.headline5,),
            const SizedBox(height: 4,),
            Text(text2, style: Theme.of(context).textTheme.caption,),
            const Spacer(),
            Text(text3, style: Theme.of(context).textTheme.caption,),
            const SizedBox(height: 4,),
            Text(text4, style: Theme.of(context).textTheme.headline5,),
          ],
        ),
      ),
    );
  }
}

