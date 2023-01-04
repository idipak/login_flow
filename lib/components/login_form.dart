import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_flow/components/rounded_button.dart';
import 'package:login_flow/screens/home.dart';

import '../models/user.dart';

final userProvider = Provider<User>((ref) => User());

class LoginForm extends ConsumerWidget {
  final Function() onCloseButtonTap;
  const LoginForm({Key? key, required this.onCloseButtonTap}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      child: Card(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Login here:", style: Theme.of(context).textTheme.headline5,),
                    const Spacer(),
                    IconButton(onPressed: onCloseButtonTap, icon: const Icon(Icons.close))
                  ],
                ),
                const Spacer(),
                TextFormField(
                  validator: _emptyValidate,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email Id"
                  ),
                  onChanged: (value){
                    ref.read(userProvider).email = value;
                  },
                ),
                TextFormField(
                  validator: _emptyValidate,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "Password"
                  ),
                ),
                const Spacer(),
                RoundedButton(onPress: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
                  }
                }, text: "Submit",),

                const Spacer(),


              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _emptyValidate(String? text){
    if(text == null || text.isEmpty){
      return "Cannot be empty";
    }
    return null;
  }


}
