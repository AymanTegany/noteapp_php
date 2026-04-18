import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:noteapp_php/app/auth/signup.dart';
import 'package:noteapp_php/components/crud.dart';
import 'package:noteapp_php/components/customtextform.dart';
import 'package:noteapp_php/components/valid.dart';
import 'package:noteapp_php/constant/linkapi.dart';
import 'package:noteapp_php/main.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Crud crud = Crud();
  bool isLoading = false;

  login() async {
    if (formstate.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      var response = await crud.postRequest(LinkLogin, {
        "email": emailController.text,
        "password": passwordController.text,
      });
      if (response["status"] == "success") {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("username", response['data']['username']);
        sharedPref.setString("email", response['data']['email']);
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        setState(() {
          isLoading = false;
        });
        AwesomeDialog(
          context: context,
          title: "تنبيه",
          body: const Text("خطأ في تسجيل الدخول "),
          btnCancel: const Text("حسنا"),
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                padding: const EdgeInsets.all(18.0),
                width: 600,
                height: 600,
                child: Form(
                  key: formstate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/logo.png", width: 200, height: 200),
                      const SizedBox(height: 25),
                      Customtextform(
                        valid: (val) {
                          return validInput(val!, 5, 50, "email");
                        },
                        labelText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      Customtextform(
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        labelText: "Password",
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await login();
                            },
                            child: const Text("Login"),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: const Text("Sign Up page"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
