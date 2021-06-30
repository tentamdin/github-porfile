import 'package:flutter/material.dart';
import 'package:git_profile/controllers/user_provider.dart';
import 'package:git_profile/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.black,
          accentColor: Colors.teal,
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Colors.black,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          accentColor: Colors.tealAccent,
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Colors.white,
          ),
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
