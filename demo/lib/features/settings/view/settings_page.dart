import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';
import 'settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc()..add(const SettingsStarted()),
      child: const SettingsView(),
    );
  }
}
