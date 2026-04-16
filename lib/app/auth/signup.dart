import 'package:flutter/material.dart';
import 'package:noteapp_php/components/crud.dart';
import 'package:noteapp_php/components/customtextform.dart';
import 'package:noteapp_php/constant/linkapi.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Crud _crud = Crud();
  bool isloading = false;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signup() async {
    isloading = true;
    setState(() {});
    var response = await _crud.postRequest(LinkSignup, {
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });
    if (response["status"] == "success") {
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    } else {
      isloading = false;
      print("Signup fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: isloading == true
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formstate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/logo.png", width: 200, height: 200),
                      const SizedBox(height: 25),

                      Customtextform(
                        labelText: "Username",
                        controller: usernameController,
                      ),
                      const SizedBox(height: 20),
                      Customtextform(
                        labelText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      Customtextform(
                        labelText: "Password",
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () async {
                          await signup();
                        },
                        child: const Text("Signup"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("login");
                        },
                        child: const Text("Log In page"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
