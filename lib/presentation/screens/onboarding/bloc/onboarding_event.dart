abstract class OnboardingEvent {}

class NextStepEvent extends OnboardingEvent {}

class PreviousStepEvent extends OnboardingEvent {}

class UpdatePhoneEvent extends OnboardingEvent {
  final String phone;
  UpdatePhoneEvent(this.phone);
}

class UpdateNameEvent extends OnboardingEvent {
  final String name;
  UpdateNameEvent(this.name);
}

class UpdateAgeEvent extends OnboardingEvent {
  final int age;
  UpdateAgeEvent(this.age);
}

class UpdateGenderEvent extends OnboardingEvent {
  final String gender;
  UpdateGenderEvent(this.gender);
}

class UpdateIntrerestEvent extends OnboardingEvent {
  final List<String> interests;
  UpdateIntrerestEvent(this.interests);
}