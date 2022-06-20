// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) => TextFormField(
                  controller: passwordC,
                  obscureText: _obsecurePassword.value,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: () => _obsecurePassword.value =
                              !_obsecurePassword.value,
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
              ),
              SizedBox(
                height: height * 0.050,
              ),
              RoundButton(
                  title: 'SignUp',
                  loading: authViewModel.loading,
                  onPressed: () {
                    if (emailC.text.isEmpty) {
                      Utils.flushBarError('please Enter email', context);
                    } else if (passwordC.text.isEmpty) {
                      Utils.flushBarError('please Enter password', context);
                    } else if (passwordC.text.length < 6) {
                      Utils.flushBarError(
                          'password length is less than 5', context);
                    } else {
                      Map data = {
                        "email": emailC.text,
                        "password": passwordC.text,
                      };

                      authViewModel.signUpApi(data, context);
                      authViewModel.setLoading(true);
                      if (kDebugMode) {
                        print('Abi Hit');
                      }
                    }
                  }),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text('Already have an Account? Login Here'))
            ],
          ),
        ),
      ),
    );
  }
}
