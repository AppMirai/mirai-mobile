class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Welcome',
      image: 'assets/images/onboarding_illustration1.png',
      description:
          'Mirai merupakan Aplikasi yang memiliki fitur yang bisa mengaplikasikan produk Makeup secara virtual'),
  OnboardingContent(
      title: 'Explore',
      image: 'assets/images/onboarding_illustration2.png',
      description: 'Tersedia berbagai produk Makeup yang bisa anda cari'),
  OnboardingContent(
      title: 'Augmented Reality',
      image: 'assets/images/onboarding_illustration3.png',
      description:
          'Fitur mengaplikasikan produk Makeup secara virtual dengan AR'),
];
