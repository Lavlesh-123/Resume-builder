import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Objective extends StatefulWidget {
  Objective({Key? key}) : super(key: key);

  @override
  State<Objective> createState() => _ObjectiveState();
}

class _ObjectiveState extends State<Objective> {
  TextEditingController objectiveController = TextEditingController();

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> _getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> _updateTextFieldValue() async {
    String? objective = await _getData('user_objective');

    if (objective != null) {
      objectiveController.text = '$objective';
    } else {
      objectiveController.text = ' ';
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateTextFieldValue();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Objective'),
        ),
        body: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: objectiveController,
                  maxLines: 5,
                  onSaved: (value) =>
                      objectiveController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Objective',
                    hintText: 'Objective',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _saveData('user_objective', objectiveController.text);

                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(
                      'Save',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
