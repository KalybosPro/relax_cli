import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return switch (state) {
            SettingsInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
            SettingsLoaded() => const Center(
                child: Text('Settings'),
              ),
          };
        },
      ),
    );
  }
}
