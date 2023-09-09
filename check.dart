import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> generatePDFResume({
  required String fullName,
  required String email,
  required String phoneNumber,
  // Add other fields as needed
}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(fullName, style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Text(email),
              pw.SizedBox(height: 10),
              pw.Text(phoneNumber),
              // Add other fields and sections
            ],
          ),
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File('${output.path}/resume.pdf');
  await file.writeAsBytes(await pdf.save());

  print('PDF resume generated at: ${file.path}');
}

class ResumeForm extends StatefulWidget {
  @override
  _ResumeFormState createState() => _ResumeFormState();
}

class _ResumeFormState extends State<ResumeForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generator'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Full Name'),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          ElevatedButton(
            onPressed: () async {
              await generatePDFResume(
                fullName: _nameController.text,
                email: _emailController.text,
                phoneNumber: _phoneController.text,
              );
            },
            child: Text('Generate PDF Resume'),
          ),
        ],
      ),
    );
  }
}
