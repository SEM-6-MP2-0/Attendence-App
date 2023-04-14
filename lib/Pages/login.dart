// ignore_for_file: use_build_context_synchronously

import 'package:attendenceapp/Pages/Utils/loading.dart';
import 'package:attendenceapp/Pages/home.dart';
import 'package:attendenceapp/Repository/Auth/login.dart';
import 'package:attendenceapp/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Provider/user.dart';
import '../Styles/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          const SizedBox(height: 50),
          InputField(
            controller: emailController,
            icon: Icon(
              Icons.person,
              color: CusColors.yellowD!,
            ),
            text: "Email",
          ),
          const SizedBox(height: 20),
          PasswordInputField(controller: passwordController),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              showDialog(
                barrierDismissible: false, 
                context: context,
                builder: (BuildContext context) {
                  return const LoadingDialog();
                },
              );
              final res =
                  await login(emailController.text, passwordController.text);
              Navigator.pop(context);
              if (res != null) {
                Provider.of<UserProvider>(context, listen: false).setUser(res);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const HomePage()));
              } else {
                Fluttertoast.showToast(msg: "Login Failed");
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  final Widget? actions;
  const InputField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.text,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CusColors.yellowD!,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CusColors.yellowD!,
                  ),
                ),
                prefixIcon: icon,
                filled: true,
                fillColor: Colors.white,
                labelText: text,
                labelStyle: TextStyle(color: CusColors.yellowD!),
              ),
            ),
          ),
          if (actions != null) actions!,
        ],
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInputField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        obscureText: isHidden,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: isHidden
                ? Icon(
                    Icons.visibility,
                    color: CusColors.yellowD,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: CusColors.yellowD,
                  ),
            onPressed: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: CusColors.yellowD!,
              ),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: CusColors.yellowD!,
          )),
          prefixIcon: Icon(Icons.lock, color: CusColors.yellowD!),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Password',
          labelStyle: TextStyle(color: CusColors.yellowD!),
        ),
      ),
    );
  }
}
