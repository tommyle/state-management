import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_management/common/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Data persistence',
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
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = 'Vancouver';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gallery,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 130, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: AppColors.bunting,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                controller: _controller,
              ),
              SizedBox(
                width: 250,
                child: Image.asset('assets/sun.png'),
              ),
              Text(
                '29°',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 90,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bunting,
                ),
              ),
              const Text(
                'Cloudy',
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.bunting,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
