import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc
    extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial()) {
    on<SettingsStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SettingsStarted event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoaded());
  }
}
