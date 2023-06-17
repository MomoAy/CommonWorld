import 'package:flutter/material.dart';

import '../repositery/common_world.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<FormState> keyForm = GlobalKey();
  String? firstWorld = '';
  String? secondWorld = '';
  TextEditingController firstWorldController = TextEditingController();
  TextEditingController secondWorldController = TextEditingController();
  String? common;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
        title: const Text(
          "KOF_WORLD",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key : keyForm,
            child: Column(
          children: [
            SizedBox(height: 30),
            TextFormField(
              controller: firstWorldController,
              decoration: const InputDecoration(
                hintText: "Tapez le premier mot",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Le champ ne peut être vide';
                }
                return null;
              },
              onChanged: (value) {
                firstWorld = value;
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: secondWorldController,
              decoration: const InputDecoration(
                hintText: "Tapez le deuxième mot",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Le champ ne peut être vide';
                }
                return null;
              },
              onChanged: (value) {
                secondWorld = value;
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 114, 242, 49),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      common = commonWorld(firstWorld!, secondWorld!);
                      setState(() {
                        firstWorldController.clear();
                        secondWorldController.clear();
                      });
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Alerte"),
                                content: Text("La plus grande chaine commune est :$common!"),
                              ));
                    }
                  },
                  child: const Text('Valider'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 114, 242, 49),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      firstWorldController.clear();
                      secondWorldController.clear();
                    });
                  },
                  child: const Text('Effacer'),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
