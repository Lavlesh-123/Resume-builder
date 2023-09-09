import 'package:flutter/material.dart';
import 'package:resume_builder/Screens/Education.dart';
import 'package:resume_builder/Screens/Experience.dart';
import 'package:resume_builder/Screens/Skills.dart';
import 'package:resume_builder/Screens/pdf_screen.dart';
import 'package:resume_builder/Screens/personal%20details.dart';
import 'package:resume_builder/utils/list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'objective.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(fontFamily: 'Schyler'),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.deepOrange]
            )
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Itemlist(
                        listName: 'Personal Details',
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => personalDetails()));
                        }),
                    const SizedBox(height: 20),
                    Itemlist(
                      listName: 'Education',
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Education()));
                      },
                    ),
                    const SizedBox(height: 20),
                    Itemlist(
                      listName: 'Experience',
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Experience()));
                      },
                    ),
                    const SizedBox(height: 20),
                    Itemlist(
                      listName: 'Skills',
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Skills()));
                      },
                    ),
                    const SizedBox(height: 20),
                    Itemlist(
                      listName: 'Objective',
                      onpressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Objective()));
                      },
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => PdfPage()));
                        },
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin:Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.purpleAccent,Colors.lightBlueAccent]
                              ),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'View Pdf',
                              style: TextStyle(
                                fontSize: 30,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
