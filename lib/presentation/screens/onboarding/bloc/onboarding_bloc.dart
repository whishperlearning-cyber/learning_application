import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_event.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(const OnboardingState(currentIndex: 0)) {
    on<NextStepEvent>((event, emit) {
      if (state.currentIndex < 4) {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });

    on<PreviousStepEvent>((event, emit) {
      if (state.currentIndex > 0) {
        emit(state.copyWith(currentIndex: state.currentIndex - 1));
      }
    });

    on<UpdatePhoneEvent>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<UpdateNameEvent>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<UpdateAgeEvent>((event, emit) {
      emit(state.copyWith(age: event.age));
    });

    on<UpdateGenderEvent>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

  on<UpdateIntrerestEvent>((event, emit) {
  emit(state.copyWith(interests: event.interests));
});
  }
}