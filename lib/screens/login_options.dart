import 'package:flutter/material.dart';
import 'package:login_flow/assets.dart';
import 'package:login_flow/components/clipped_rectangle.dart';

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

          Align(
            alignment: Alignment.bottomCenter,
            child: ClippedRectangle()
          ),



        ],
      ),
    );
  }
}



