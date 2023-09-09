import 'package:flutter/material.dart';

class Itemlist extends StatelessWidget {
  final String listName;
  VoidCallback onpressed;
  Itemlist({required this.listName, required this.onpressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: double.infinity,
      child: InkWell(
        onTap: onpressed,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            width: double.infinity,
          child: Center(
            child: Text(listName, style: TextStyle(fontSize: 27, )),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.pinkAccent,Colors.yellow]
            )
          ),
          // Card(
          //   elevation: 21,
           // color: Colors.blue,
            // child: Center(
            //     child: Text(
            //   listName,
            //   style: TextStyle(fontSize: 27, fontFamily: 'ListsFont'),
            // )),
          ),
        ),
      ),
    );
  }
}
