import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/modules/dashboard/dashboard_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: const DashboardView(),
      ),
    );
  }
}
