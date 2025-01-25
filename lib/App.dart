import 'package:flutter/material.dart';
import 'package:task_manager/ui/Screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == '/') {
          widget = const SplashScreen();
        }

        return MaterialPageRoute(builder: (_) => widget);
      },

    );
  }
}


