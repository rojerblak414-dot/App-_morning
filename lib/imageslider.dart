import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _imageUrls = const [
    'assets/images/image_1.jpg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpg',
    'assets/images/image_4.jpg',
    'assets/images/image_5.jpeg',
  ];
  void _nextPage() {
    if (_currentPage < _imageUrls.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: _currentPage > 0 ? _previousPage : null,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: _currentPage < _imageUrls.length - 1
                    ? _nextPage
                    : null,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 600,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  _imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Image not found. Check pubspec.yaml and path.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _imageUrls.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentPage == index ? 10.0 : 8.0,
              height: _currentPage == index ? 10.0 : 8.0,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.red : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _currentPage > 0 ? _previousPage : null,
              child: const Text('« Previous'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _currentPage < _imageUrls.length - 1
                  ? _nextPage
                  : null,
              child: const Text('Next »'),
            ),
          ],
        ),
      ],
    );
  }
}
