import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  // 1.1 PageController to manage the PageView's scrolling.
  final PageController _pageController = PageController(initialPage: 0);

  // 1.1 State variable to track the current page (Useful for future additions like dot indicators)
  int _currentPage = 0;

  final List<String> imageAssets = const [
    'assets/images/image_1.jpg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpg',
    'assets/images/image_4.jpg',
    'assets/images/image_5.jpeg',
  ];

  // 2.2 Function to move to the next page
  void _nextPage() {
    if (_currentPage < imageAssets.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  // 3.3 Function to move to the previous page
  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  // 4.4 It's good practice to dispose of controllers when the widget is removed.
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Slider"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 5.5 Swipe Left or Right to Navigate,
              const Text(
                'Swipe Left or Right to Navigate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3F3747),
                ),
              ),
              const SizedBox(height: 20),
              // 6.6 The core slider component: SizedBox to limit the size.
              // This ensures the slider is NOT full screen.
              SizedBox(
                height: 600.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: PageView.builder(
                    // 7.7 Assign the controller to enable programmatic control and robust swiping
                    controller: _pageController,

                    // 8.8 Update state when the page changes
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },

                    // 9.9 ItemCount determines how many pages (images) we have
                    itemCount: imageAssets.length,

                    // 10. ItemBuilder is called to build the widget for each index (page)
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(50),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          imageAssets[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                "Error",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 11.11 ADDED: Navigation buttons for better usability on web/desktop
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _currentPage > 0 ? _previousPage : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Previous'),
                  ),

                  const SizedBox(width: 16),

                  ElevatedButton.icon(
                    onPressed: _currentPage < imageAssets.length - 1
                        ? _nextPage
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Next'),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
