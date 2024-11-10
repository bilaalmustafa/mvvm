import 'package:flutter/material.dart';
import 'package:mvvm/res/components/Button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/util.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> obsecurepassword = ValueNotifier<bool>(true);

  FocusNode EmailNode = FocusNode();
  FocusNode PasswordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authViewProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailcontroller,
            focusNode: EmailNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded border
              ),
              labelText: 'Enter email',
              prefixIcon: const Icon(Icons.person), // Prefix icon
              suffixIcon: const Icon(Icons.edit), // Postfix icon
              filled: true,
              fillColor: Colors.grey[200],
              // Background color
            ),
            onSubmitted: (value) {
              Utils.focusNodeChange(context, EmailNode, PasswordNode);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
              valueListenable: obsecurepassword,
              builder: (context, value, child) {
                return TextField(
                  controller: passwordController,
                  focusNode: PasswordNode,
                  obscureText: obsecurepassword.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded border
                    ),
                    labelText: 'Enter password',
                    prefixIcon: const Icon(Icons.password), // Prefix i
                    suffixIcon: InkWell(
                        onTap: () {
                          obsecurepassword.value = !obsecurepassword.value;
                        },
                        child: const Icon(Icons.visibility)), // Postfix icon
                    filled: true,
                    fillColor: Colors.grey[200], // Background color
                  ),
                );
              }),
          Center(
              child: RoundButton(
            loading: authViewProvider.loading,
            title: 'Click',
            onTap: () {
              if (emailcontroller.text.isEmpty) {
                Utils.flutterErrorMessage('Please enter email', context);
              } else if (passwordController.text.isEmpty) {
                Utils.flutterErrorMessage('Please enter password', context);
              } else if (passwordController.text.length < 6) {
                Utils.flutterErrorMessage('Please 6 digits password', context);
              } else {
                Map data = {
                  'rmail': emailcontroller.text.toString(),
                  'password': passwordController.text.toString()
                };
                authViewProvider.loginApi(data, context);
                print('api hit');
              }
              //  Utils.toastMessage('no Internet connection');
              // Navigator.pushNamed(context, RoutesName.home);
            },
          ))
        ],
      ),
    ));
  }
}
