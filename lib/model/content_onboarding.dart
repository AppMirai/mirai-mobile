class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Welcome to MiraiApp',
      image: 'assets/images/onboarding_illustration1.png',
      description:
          'Ini merupakan versi pertama pengembangan Aplikasi Mirai,\njadi mungkin ini masih belum bisa memenuhi sepenuhnya ekspektasi anda.'),
  OnboardingContent(
      title: 'Support Us!',
      image: 'assets/images/onboarding_illustration2.png',
      description:
          'Terima Kasih sudah ingin mencoba Aplikasi kami,\nmohon bantuannya untuk memberikan Rating dan Feedbacknya'),
];
