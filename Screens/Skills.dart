import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Skills extends StatefulWidget {
  Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  TextEditingController skillsController = TextEditingController();

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> _getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> _updateTextFieldValue() async {
    String? skills = await _getData('user_skills');

    if (skills != null) {
      skillsController.text = '$skills';
    } else {
      skillsController.text = ' ';
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateTextFieldValue();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Skills'),
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
                  controller: skillsController,
                  maxLines: 5,
                  onSaved: (value) =>
                      skillsController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Skills',
                    hintText: 'Skills',
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
                    _saveData('user_skills', skillsController.text);

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
