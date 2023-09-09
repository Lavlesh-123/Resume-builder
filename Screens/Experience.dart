import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Experience extends StatefulWidget {
  Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobTitlesController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> _getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> _updateTextFieldValue() async {
    String? companyName = await _getData('user_companyName');
    String? jobTitle = await _getData('user_jobTitle');
    String? startDate = await _getData('user_startDate');
    String? endDate = await _getData('user_endDate');
    String? details = await _getData('user_details');
    if (companyName != null) {
      companyNameController.text = '$companyName';
    } else {
      companyNameController.text = ' ';
    }

    if (jobTitle != null) {
      jobTitlesController.text = '$jobTitle';
    } else {
      jobTitlesController.text = '';
    }

    if (startDate != null) {
      startDateController.text = '$startDate';
    } else {
      startDateController.text = ' ';
    }

    if (endDate != null) {
      endDateController.text = '$endDate';
    } else {
      endDateController.text = '';
    }
    if (details != null) {
      detailsController.text = '$details';
    } else {
      detailsController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateTextFieldValue();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Experience'),
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
                  controller: companyNameController,
                  onSaved: (value) =>
                      companyNameController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'Company Name',
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
                  controller: jobTitlesController,
                  onSaved: (value) =>
                      jobTitlesController = value! as TextEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Job Title',
                      hintText: 'Job Title',
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: startDateController,
                  onSaved: (value) =>
                      startDateController = value! as TextEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Start Date',
                      hintText: 'Start Date',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: endDateController,
                  onSaved: (value) =>
                      endDateController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'End Date',
                    hintText: 'End Date', // Hint Text
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: detailsController,
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  onSaved: (value) =>
                      detailsController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Details',
                    hintText: 'Details', // Hint Text
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
                    _saveData('user_companyName', companyNameController.text);
                    _saveData('user_jobTitle', jobTitlesController.text);
                    _saveData('user_startDate', startDateController.text);
                    _saveData('user_endDate', endDateController.text);
                    _saveData('user_details', detailsController.text);
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
