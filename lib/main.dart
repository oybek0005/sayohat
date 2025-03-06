import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayohat/screen/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Transparent or any color
    statusBarIconBrightness: Brightness.light, // White icons
    statusBarBrightness: Brightness.light, // For iOS
  ));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031F2B),
      body:  Center(
        child: Column(
            children: [
              Spacer(flex: 2,),
              Image.asset("assets/image/splash.png"),
              SizedBox(height: 20,),
              Text(
                "Oddiy hayotdan qoching",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Atrofingizdagi ajoyib tajribalarni kashf eting\nva sizni qiziqarli yashashga majbur qiling!",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 2,),
              SizedBox(height: 50)
,              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF5EDFFF),
                  foregroundColor: Color(0xFF263238),
                  minimumSize: Size(311, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Boshladik",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(flex: 1)

            ],
          ),
      ),
    );
  }
}
