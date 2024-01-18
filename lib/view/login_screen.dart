

import 'package:flutter/material.dart';
import 'package:mvvmarc/res/components/rounded_button.dart';
import 'package:mvvmarc/utils/routes/routes_name.dart';
import 'package:mvvmarc/utils/utils.dart';
import 'package:mvvmarc/view_model/auth_view_model.dart';
import 'package:mvvmarc/view_model/servies/splash_services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController  _emailController  = TextEditingController();
  TextEditingController  _passwordController  = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel  >(context);
    SplashServices splashServices = SplashServices();
    final height = MediaQuery.of(context).size.height *1 ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                focusNode: emailFocusNode,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange
                    (context, emailFocusNode, passwordFocusNode);
                }
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword.value,
                      obscuringCharacter: "*",
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                            onTap: () {
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            child: _obscurePassword.value ?
                            Icon(Icons.visibility_off): Icon(Icons.visibility),
                          ),
                      ),
                    );
                  }),
              SizedBox(height: height * 0.08,),
              RoundedButton(
                  title: "Login",
                  loading: authViewModel.loading,
                  onPress: (){
                    if(_emailController.value.text.isEmpty) {
                      Utils.flushBarErrorMessage("Enter Email", context);
                    }
                    else if (_passwordController.value.text.isEmpty) {
                      Utils.flushBarErrorMessage("Enter password", context);
                    }
                    else if (_passwordController.value.text.length < 6) {
                      Utils.flushBarErrorMessage("Password should be greater than 6 charcter", context);
                    }
                    else {
                      Map data = {
                        'email': _emailController.text.toString(),
                        'password': _passwordController.text.toString(),
                      };

                      authViewModel.loginApi(data, context);
                      print("Api Hit");
                    }
              }),
              SizedBox(height: height * 0.02,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signUp);
                },
                child: Text("Dont' have Account, Sign Up"),
              ),
            ],
          )
      )
    );
  }
}
