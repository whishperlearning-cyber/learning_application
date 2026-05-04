import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/presentation/screens/landing_screen/bloc/landing_screen_event.dart';
import 'package:learning_app/presentation/screens/landing_screen/bloc/landing_screen_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitial()) {
    on<LandingStarted>((event, emit) {
      emit(LandingNavigateNext());
    });
  }
}