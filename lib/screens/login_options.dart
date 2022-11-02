import 'package:flutter/material.dart';
import 'package:login_flow/assets.dart';
import 'package:login_flow/components/clipped_rectangle.dart';
import 'package:login_flow/components/rounded_button.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          const Image(image: AssetImage(Assets.city), fit: BoxFit.cover, height: double.infinity, width: double.infinity,),

          const Align(
            alignment: Alignment.bottomCenter,
            child: ClippedRectangle()
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 28, left: 8),
              child: Text("Hello", style: Theme.of(context).textTheme.headline1?.apply(fontWeightDelta: 2),),
            ),
          ),

          Positioned(
              left: 10,
              bottom: MediaQuery.of(context).size.height / 3 + 20,
              child: const Image(image: AssetImage(Assets.car), height: 100,)),

          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedButton(onPress: (){}, text: "Login Here",),
                RoundedButton(onPress: (){}, text: "Skip Login", color: Colors.white54, textColor: Colors.black87,),
              ],
            )
          ),



        ],
      ),
    );
  }
}



