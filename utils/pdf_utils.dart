import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';

Future<Uint8List> generatePdf(final PdfPageFormat format) async {
  final doc = pw.Document(title: 'Flutter School');

  Future<String?> _getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  final font =
      await rootBundle.load('assets/OpenSans-VariableFont_wdth,wght.ttf');
  final ttf = pw.Font.ttf(font);

  final pageTheme = await _myPageTheme(format);

  String? name = await _getData('user_Name');
  String? address = await _getData('user_Address');
  String? mobile_no = await _getData('user_Mobile_No');
  String? email = await _getData('user_Email');
  String? degree = await _getData('user_degree');
  String? degreeMarks = await _getData('user_degreeMarks');
  String? degreeYear = await _getData('user_degreePassingYear');
  String? twelfth = await _getData('user_twelfthMarks');
  String? twelfthYear = await _getData('user_twelfthPassingYear');
  String? highSchoolMarks = await _getData('user_highSchoolMarks');
  String? highSchoolYear = await _getData('user_highSchoolPassingYear');
  String? companyName = await _getData('user_companyName');
  String? jobTitle = await _getData('user_jobTitle');
  String? startDate = await _getData('user_startDate');
  String? endDate = await _getData('user_endDate');
  String? details = await _getData('user_details');
  String? skills = await _getData('user_skills');
  String? objective = await _getData('user_objective');

  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      build: (final context) => [
            pw.SizedBox(height: 80),
            pw.Container(
                padding: pw.EdgeInsets.only(left: 30, bottom: 20),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('$name',
                                style: const pw.TextStyle(
                                  fontSize: 20,
                                )),
                            pw.SizedBox(height: 5),
                            pw.Text('Address:-' + '$address'),
                            pw.Text('Email:-' + '$email'),
                            pw.Text('Mobile No:-' + '$mobile_no'),
                            pw.SizedBox(height: 20),
                            pw.Text('Education',
                                style: const pw.TextStyle(
                                    fontSize: 15,
                                    decoration: pw.TextDecoration.underline)),
                            pw.SizedBox(height: 10),
                            pw.Text('Graduation:-' + '$degree'),
                            pw.Text('Percent:- ' + '$degreeMarks' + '%'),
                            pw.Text('Graduation Year:-' + '$degreeYear'),
                            pw.Text('Twelfth Score:-' + '$twelfth' + '%'),
                            pw.Text('Twelfth Year:-' + '$twelfthYear'),
                            pw.Text('High School Marks:-' +
                                '$highSchoolMarks' +
                                '%'),
                            pw.Text('High School Year:-' + '$highSchoolYear'),
                            pw.SizedBox(height: 20),
                            pw.Text('Experience',
                                style: pw.TextStyle(
                                    fontSize: 15,
                                    decoration: pw.TextDecoration.underline)),
                            pw.SizedBox(height: 10),
                            pw.Text('Company Name:-' + '$companyName'),
                            pw.Text('Job title:-' + '$jobTitle'),
                            pw.Text('Joining Date:-' + '$startDate'),
                            pw.Text('Leaving Date' + '$endDate'),
                            pw.Text('Details:-' + '$details'),
                            pw.SizedBox(height: 20),
                            pw.Text('Skills',
                                style: pw.TextStyle(
                                    fontSize: 15,
                                    decoration: pw.TextDecoration.underline)),
                            pw.SizedBox(height: 10),
                            pw.Text('$skills'),
                            pw.SizedBox(height: 20),
                            pw.Text('Objective',
                                style: pw.TextStyle(
                                    fontSize: 15,
                                    decoration: pw.TextDecoration.underline)),
                            pw.SizedBox(height: 10),
                            pw.Text('$objective'),
                            pw.SizedBox(height: 20),
                          ])
                    ]))
          ]));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final logoImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/flutterImage.png')).buffer.asUint8List(),
  // );

  return pw.PageTheme(
      margin: const pw.EdgeInsets.symmetric(
          horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
      textDirection: pw.TextDirection.ltr,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (final context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Opacity(
            opacity: 0.5,
            // child: pw.Image(
            //   alignment: pw.Alignment.center,
            //   logoImage,
            //   fit: pw.BoxFit.cover
            // )
          )));
}

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('save as file ${file.path}...');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document printed successfully')));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document shared successfully')));
}
