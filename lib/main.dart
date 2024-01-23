import 'package:flutter/material.dart';
import 'package:themoviedb_app/theme/app_colors.dart';
import 'package:themoviedb_app/widgets/auth/auth_widget.dart';
import 'package:themoviedb_app/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('Произошла ошибка навигации'),
              ),
            );
          },
        );
      },
    );
  }
}

class ExamplWidget extends StatefulWidget {
  const ExamplWidget({super.key});

  @override
  State<ExamplWidget> createState() => _ExamplWidgetState();
}

class _ExamplWidgetState extends State<ExamplWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TMDB',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
