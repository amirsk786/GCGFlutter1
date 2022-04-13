import 'package:GCG_ES/pages/detailPages/detailPage.dart';
import 'package:GCG_ES/pages/enquiry.dart';
import 'package:GCG_ES/pages/home.dart';
import 'package:GCG_ES/pages/invoice.dart';
import 'package:flutter/material.dart';
import 'model/testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Image Loader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Poppins',
        // primaryColor: Colors.white,
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   elevation: 0,
        //   foregroundColor: Colors.white,
        // ),
        textTheme: const TextTheme(
            // headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
            // headline2: TextStyle(
            //   fontSize: 24.0,
            //   fontWeight: FontWeight.w700,
            //   color: Colors.redAccent,
            // ),
            // bodyText1: TextStyle(
            //   fontSize: 14.0,
            //   fontWeight: FontWeight.w400,
            //   color: Colors.blueAccent,
            // ),
            ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromARGB(255, 229, 147, 147)),
      ),
      home: //Enquiry(),
          MyHomePage(),
      //  DetailsPage()
    );
  }
}
