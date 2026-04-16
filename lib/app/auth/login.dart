import 'package:flutter/material.dart';
import 'package:noteapp_php/components/customtextform.dart';

class Login extends StatefulWidget {

   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formstate,
            child: Column(    
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset("images/logo.png",width: 200, height: 200),
                const SizedBox(height: 25,),
                 Customtextform(labelText: "Email", controller: emailController),
                 const SizedBox(height: 20,),
                 Customtextform(labelText: "Password", controller: passwordController),
                  const SizedBox(height: 20,),
            
                  ElevatedButton(
                    onPressed: (){
                       Navigator.of(context).pushNamed("home");
                    }, 
                    child: const Text("Login")),

                    SizedBox(height: 50,),
                    ElevatedButton(
                      onPressed: (){
                       Navigator.of(context).pushNamed("signup");
                        
                      },
                      child: const Text("Sign Up page")
                    )
               ],
            ),
          ),
        ),
      ),
    );
  }
}