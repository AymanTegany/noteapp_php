import 'package:flutter/material.dart';
import 'package:noteapp_php/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              sharedPref.clear();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil("login", (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "images/logo.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text("note Titile"),
                        subtitle: Text("note content"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
