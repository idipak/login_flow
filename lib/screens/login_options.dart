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

          AnimatedPositioned(
              left: 10,
              duration: const Duration(milliseconds: 500),
              bottom: _showLoginForm ? size.height / 3 + 100 : size.height / 3 + 20,
              child: const Hero(
                tag: "car",
                  child: Image(image: AssetImage(Assets.car), height: 100,))),

          Positioned(
            // bottom: _showLoginForm ? size.height * 0.14 : size.height * 0.15,
            bottom: size.height * 0.14,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation){
                return ScaleTransition(scale: animation, child: child,);
            },
            child: !_showLoginForm ?
                SizedBox(
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RoundedButton(
                        onPress: (){
                        setState(() {
                          _showLoginForm = true;
                        });
                      }, text: "Login Here",),

                      RoundedButton(
                        onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                      }, text: "Skip Login", color: Colors.white54, textColor: Colors.black87,),

                    ],
                  ),
                )
                : LoginForm(
                    onCloseButtonTap: (){
                        setState(() {
                          _showLoginForm = false;
                        });
                      },
                  ),
            ),
          ),



        ],
      ),
    );
  }
}



