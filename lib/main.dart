import 'package:dealsdrayinterview/controller/auth/state/auth_state.dart';
import 'package:dealsdrayinterview/controller/auth_controller.dart';
import 'package:dealsdrayinterview/view/pages/log_in.dart';
import 'package:dealsdrayinterview/view/pages/otp_ver.dart';
import 'package:dealsdrayinterview/view/pages/register_page.dart';
import 'package:dealsdrayinterview/view/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider (
            create: (BuildContext context) => AuthBloc(),
          ),
        ],
        child: MaterialApp(
          routes: {
            '/': (context) => SplashScreen(),
            '/home': (context) => WelcomePage(),
            '/login': (context) => LoginPage(),
            '/otp': (context) => const OTPVerification(),
            '/register': (context) => const RegistrationPage(),
          },
          initialRoute: "/",
          // home: WelcomePage(),
        ));
  }
}
