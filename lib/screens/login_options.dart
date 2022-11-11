import 'package:flutter/material.dart';
import 'package:login_flow/assets.dart';
import 'package:login_flow/components/clipped_rectangle.dart';
import 'package:login_flow/components/login_form.dart';
import 'package:login_flow/components/rounded_button.dart';

import 'home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showLoginFormState = StateProvider<bool>((ref) => false);

class LoginOptions extends ConsumerWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

          Consumer(builder: (context, ref, _){
            return AnimatedPositioned(
                left: 10,
                duration: const Duration(milliseconds: 500),
                bottom: ref.watch(showLoginFormState) ? size.height / 3 + 100 : size.height / 3 + 20,
                child: const Hero(
                    tag: "car",
                    child: Image(image: AssetImage(Assets.car), height: 100,)));
          }),

          Consumer(builder: (context, ref, _){
            return Positioned(
              // bottom: _showLoginForm ? size.height * 0.14 : size.height * 0.15,
              bottom: size.height * 0.14,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation){
                  return ScaleTransition(scale: animation, child: child,);
                },
                child: ref.watch(showLoginFormState) == false ?
                SizedBox(
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RoundedButton(
                        onPress: (){
                          ref.read(showLoginFormState.notifier).state = true;
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
                    ref.read(showLoginFormState.notifier).state = false;
                  },
                ),
              ),
            );
          })



        ],
      ),
    );
  }
}



