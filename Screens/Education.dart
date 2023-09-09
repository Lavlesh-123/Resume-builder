import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Education extends StatefulWidget {
  Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  TextEditingController degreeController = TextEditingController();
  TextEditingController degreeMarksController = TextEditingController();
  TextEditingController degreePassingYearController = TextEditingController();
  TextEditingController twelfthMarksController = TextEditingController();
  TextEditingController twelfthPassingYearController = TextEditingController();
  TextEditingController highSchoolMarksController = TextEditingController();
  TextEditingController highSchoolPassingYearController =
      TextEditingController();

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> _getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> _updateTextFieldValue() async {
    String? degree = await _getData('user_degree');
    String? degreeMarks = await _getData('user_degreeMarks');
    String? degreeYear = await _getData('user_degreePassingYear');
    String? twelfthMarks = await _getData('user_twelfthMarks');
    String? twelfthYear = await _getData('user_twelfthPassingYear');
    String? highSchoolMarks = await _getData('user_highSchoolMarks');
    String? highSchoolYear = await _getData('user_highSchoolPassingYear');
    if (degree != null) {
      degreeController.text = degree;
    } else {
      degreeController.text = ' ';
    }
    if (degreeMarks != null) {
      degreeMarksController.text = degreeMarks;
    } else {
      degreeMarksController.text = ' ';
    }
    if (degreeYear != null) {
      degreePassingYearController.text = degreeYear;
    } else {
      degreePassingYearController.text = ' ';
    }

    if (twelfthMarks != null) {
      twelfthMarksController.text = twelfthMarks;
    } else {
      twelfthMarksController.text = '';
    }
    if (twelfthYear != null) {
      twelfthPassingYearController.text = twelfthYear;
    } else {
      twelfthPassingYearController.text = '';
    }

    if (highSchoolMarks != null) {
      highSchoolMarksController.text = highSchoolMarks;
    } else {
      highSchoolMarksController.text = ' ';
    }

    if (highSchoolYear != null) {
      highSchoolPassingYearController.text = highSchoolYear;
    } else {
      highSchoolPassingYearController.text = ' ';
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateTextFieldValue();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Education'),
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
                  controller: degreeController,
                  onSaved: (value) =>
                      degreeController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter name of degree',
                    hintText: 'Enter name of degree',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: degreeMarksController,
                  onSaved: (value) =>
                      degreeMarksController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter the marks of graduation out of 100',
                    hintText: 'Enter the marks of graduation out of 100',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: degreePassingYearController,
                  onSaved: (value) => degreePassingYearController =
                      value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter starting and ending year of graduation',
                    hintText: 'Enter starting and ending year of graduation',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: twelfthMarksController,
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      twelfthMarksController = value! as TextEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Enter the marks of 12th out of 100',
                      hintText: 'Enter the marks of 12th out of 100',
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: twelfthPassingYearController,
                  onSaved: (value) => twelfthPassingYearController =
                      value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter starting and ending year of 12th',
                    hintText: 'Enter starting and ending year of 12th',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: highSchoolMarksController,
                  keyboardType: TextInputType.number,
                  onSaved: (value) => highSchoolMarksController =
                      value! as TextEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Enter the marks of 10th out of 100',
                      hintText: 'Enter the marks of 10th out of 100',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: highSchoolPassingYearController,
                  onSaved: (value) => highSchoolPassingYearController =
                      value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter starting and ending year of 10th',
                    hintText: 'Enter starting and ending year of 10th',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _saveData('user_degree', degreeController.text);
                    _saveData('user_degreeMarks', degreeMarksController.text);
                    _saveData('user_degreePassingYear',
                        degreePassingYearController.text);
                    _saveData('user_twelfthMarks', twelfthMarksController.text);
                    _saveData('user_twelfthPassingYear',
                        twelfthPassingYearController.text);
                    _saveData(
                        'user_highSchoolMarks', highSchoolMarksController.text);
                    _saveData('user_highSchoolPassingYear',
                        highSchoolPassingYearController.text);
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
