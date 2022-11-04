import 'package:flutter/material.dart';
import 'package:login_flow/assets.dart';
import 'package:login_flow/components/clipped_rectangle.dart';
import 'package:login_flow/components/login_form.dart';
import 'package:login_flow/components/rounded_button.dart';

import 'home.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {

  bool _showLoginForm = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              child: Text("Carzz", style: Theme.of(context).textTheme.headline1?.apply(fontWeightDelta: 2),),
            ),
          ),

          Positioned(
              left: 10,
              bottom: size.height / 3 + 20,
              child: const Image(image: AssetImage(Assets.car), height: 100,)),

          !_showLoginForm ?
          Positioned(
            // alignment: Alignment.bottomCenter,
            bottom: size.height * 0.15,
            child: SizedBox(
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  RoundedButton(onPress: (){
                    setState(() {
                      _showLoginForm = true;
                    });
                  }, text: "Login Here",),
                  RoundedButton(onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                  }, text: "Skip Login", color: Colors.white54, textColor: Colors.black87,),
                ],
              ),
            )
          )
              : Positioned(
            bottom: size.height * 0.14,
            child: LoginForm(onCloseButtonTap: (){
              setState(() {
                _showLoginForm = false;
              });
            },)
          )

        ],
      ),
    );
  }
}



