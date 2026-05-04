class OnboardingState {
  final int currentIndex;
  final String phone;
  final String name;
  final int? age;
  final String? gender;
  final List<String> interests;

  const OnboardingState({
    required this.currentIndex,
    this.phone = '',
    this.name = '',
    this.age,
    this.gender,
    this.interests = const [],
  });

  OnboardingState copyWith({
    int? currentIndex,
    String? phone,
    String? name,
    int? age,
    String? gender,
    List<String>? interests,
  }) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      interests: interests ?? this.interests,
    );
  }
}