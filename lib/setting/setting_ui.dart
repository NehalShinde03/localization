import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixes/setting/setting_cubit.dart';
import 'package:mixes/setting/setting_state.dart';

class SettingUi extends StatefulWidget {
  const SettingUi({super.key});


  static const String routeName = "/setting_ui";
  static Widget builder(BuildContext context) => BlocProvider(
    create: (context) => SettingCubit(SettingState()),
    child: const SettingUi(),
  );

  @override
  State<SettingUi> createState() => _SettingUiState();
}

class _SettingUiState extends State<SettingUi> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
