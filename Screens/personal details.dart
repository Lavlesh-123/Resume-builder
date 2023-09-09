import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personalDetails extends StatefulWidget {
  personalDetails({Key? key}) : super(key: key);

  @override
  State<personalDetails> createState() => _personalDetailsState();
}

class _personalDetailsState extends State<personalDetails> {
  TextEditingController NameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController NumberController = TextEditingController();

  void _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> _getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> _updateTextFieldValue() async {
    String? name = await _getData('user_Name');
    String? email = await _getData('user_Email');
    String? mobileNo = await _getData('user_Mobile_No');
    String? address = await _getData('user_Address');
    if (name != null) {
      NameController.text = '$name';
    } else {
      NameController.text = ' ';
    }

    if (email != null) {
      EmailController.text = '$email';
    } else {
      EmailController.text = '';
    }

    if (address != null) {
      AddressController.text = '$address';
    } else {
      AddressController.text = ' ';
    }

    if (mobileNo != null) {
      NumberController.text = '$mobileNo';
    } else {
      NumberController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateTextFieldValue();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Personal Details'),
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
                  controller: NameController,
                  onSaved: (value) =>
                      NameController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter name',
                    hintText: 'Enter name',
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
                  controller: AddressController,
                  onSaved: (value) =>
                      AddressController = value! as TextEditingController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      labelText: 'Enter address',
                      hintText: 'Enter address',
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) =>
                      EmailController = value! as TextEditingController,
                  decoration: const InputDecoration(
                      labelText: 'Enter the email',
                      hintText: 'Enter the email',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: NumberController,
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      NumberController = value! as TextEditingController,
                  decoration: const InputDecoration(
                    labelText: 'Enter mobile number',
                    hintText: 'Enter mobile number', // Hint Text
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
                    _saveData('user_Name', NameController.text);
                    _saveData('user_Address', AddressController.text);
                    _saveData('user_Email', EmailController.text);
                    _saveData('user_Mobile_No', NumberController.text);
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
