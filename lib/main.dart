import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: demo_data.length,
                  itemBuilder: (context, index) => OnboardingContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: primaryColor,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : primaryColor.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
    image: 'assets/images/image_1.png',
    title: 'Find the item you\'ve \nbeen looking for',
    description:
        'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.',
  ),
  Onboard(
    image: 'assets/images/image_2.png',
    title: 'Find the item you\'ve \nbeen looking for',
    description:
        'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.',
  ),
  Onboard(
    image: 'assets/images/image_3.png',
    title: 'Find the item you\'ve \nbeen looking for',
    description:
        'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.',
  ),
  Onboard(
    image: 'assets/images/image_1.png',
    title: 'Find the item you\'ve \nbeen looking for',
    description:
        'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.',
  ),
  Onboard(
    image: 'assets/images/image_2.png',
    title: 'Find the item you\'ve \nbeen looking for',
    description:
        'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.',
  ),
  Onboard(
    image: 'assets/images/image_3.png',
    title: 'Find the item you\'ve \nbeen looking for',
    description:
        'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.',
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
