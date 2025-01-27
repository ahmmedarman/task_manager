import 'package:flutter/material.dart';
import 'package:task_manager/ui/Screens/forgot_password_verify_otp_screen.dart';
import 'package:task_manager/ui/Screens/forgot_password_verify_screen.dart';
import 'package:task_manager/ui/Screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/Screens/reset_password_screen.dart';
import 'package:task_manager/ui/Screens/sign_in_screen.dart';
import 'package:task_manager/ui/Screens/sign_up_screen.dart';
import 'package:task_manager/ui/Screens/splash_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
              style:  ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == SignInScreen.name) {
          widget = const SignInScreen();
        }else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        }else if(settings.name == ForgotPasswordVerifyScreen.name){
          widget = const ForgotPasswordVerifyScreen();
        } else if(settings.name == ForgotPasswordVerifyOtpScreen.name){
           widget = const ForgotPasswordVerifyOtpScreen();
        } else if(settings.name == ResetPasswordScreen.name){
          widget = const ResetPasswordScreen();
        } else if(settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        }


    return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}
