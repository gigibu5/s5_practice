import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/questions_cubit.dart';
import 'home_screen.dart';
import 'quiz/cubit/quiz_cubit.dart';
import 'quiz/quiz_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => QuestionsCubit()..load(),
        child: MaterialApp(
          title: 'Izpitna vprašanja za radioamaterje',
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (context) => const HomeScreen(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/quiz' && settings.arguments is QuizState) {
              return MaterialPageRoute(
                builder: (context) =>
                    QuizScreen(quizState: settings.arguments as QuizState),
                settings: settings,
              );
            }

            return null;
          },
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      );
}
