import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/change_local/change_local_ui.dart';
import 'package:mixes/splash/splash_cubit.dart';
import 'package:mixes/splash/splash_state.dart';

class SplashUi extends StatefulWidget {
  const SplashUi({super.key});

  static const String routeName = "/splash_ui";
  static Widget builder(BuildContext context) => BlocProvider(
    create: (context) => SplashCubit(SplashState()),
    child: const SplashUi(),
  );

  @override
  State<SplashUi> createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashUi> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() => Navigator.pushNamed(context, ChangeLocalUi.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
