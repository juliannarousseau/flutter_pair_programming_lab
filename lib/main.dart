import 'package:flutter/material.dart';
import 'package:flutter_pair_programming_lab/src/commons/di/injection.dart';
import 'package:flutter_pair_programming_lab/src/presentation/routes/actions_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pair Programming Lab',
      onGenerateRoute: (_) => ActionsRoute.route(),
    );
  }
}
