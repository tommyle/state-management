import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:state_management/common/app_colors.dart';
import 'package:state_management/weather_provider.dart';
import 'package:state_management/models/weather.dart';

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
      home: ChangeNotifierProvider(
        create: (_) => WeatherProvider(),
        child: const MyHomePage(),
      ),
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().fetchWeather(city: _controller.text);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gallery,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 130, 40, 0),
        child: SingleChildScrollView(
          child: Consumer<WeatherProvider>(builder: (context, provider, _) {
            final weather = provider.weather;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.words,
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
                  onFieldSubmitted: (value) {
                    provider.fetchWeather(city: _controller.text);
                  },
                  onTap: () {
                    _controller.clear();
                  },
                ),
                Visibility(
                  visible: weather != null,
                  child: SizedBox(
                    width: 250,
                    child: Image.asset(weather?.image ?? ''),
                  ),
                ),
                Text(
                  weather?.degrees != null ? '${weather?.degrees}°' : '--',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 90,
                    fontWeight: FontWeight.w700,
                    color: AppColors.bunting,
                  ),
                ),
                Text(
                  weather?.desc.toUpperCase() ?? 'Not found',
                  style: const TextStyle(
                    fontSize: 25,
                    color: AppColors.bunting,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
