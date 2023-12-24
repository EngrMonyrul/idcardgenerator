import 'package:flutter/material.dart';
import 'package:flutter_credit_card_detector/flutter_credit_card_detector.dart';
import 'package:idcardgenerator/views/cameraPage/camera_page_view.dart';
import 'package:idcardgenerator/views/cameraPage/providers/camera_page_provider.dart';
import 'package:idcardgenerator/views/homePage/home_page_view.dart';
import 'package:idcardgenerator/views/homePage/providers/home_page_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => CameraPageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: const CameraPageView(),
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
