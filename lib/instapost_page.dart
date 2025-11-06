import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Mock (Local Images)',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const InstaPostPage(),
    );
  }
}

class InstaPostPage extends StatefulWidget {
  const InstaPostPage({super.key});

  @override
  State<InstaPostPage> createState() => _InstaPostPageState();
}

class _InstaPostPageState extends State<InstaPostPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _liked = false;
  bool _saved = false;
  int _likesCount = 2;
  final List<String> images = [
    'assets/images/oak.jpg',
    'assets/images/aab.jpg',
    'assets/images/frd.jpg',
    'assets/images/oak.jpg',
    'assets/images/tec.jpg',
  ];

  Widget _buildImageCarousel() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (idx) {
              setState(() {
                _currentPage = idx;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(images[index], fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (i) {
              final isActive = i == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 10 : 8,
                height: isActive ? 10 : 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.white60,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildActionsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _liked ? Icons.favorite : Icons.favorite_border,
              color: _liked ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _liked = !_liked;
                _likesCount += _liked ? 1 : -1;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.mode_comment_outlined),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.repeat), onPressed: () {}),
          IconButton(icon: const Icon(Icons.send), onPressed: () {}),
          const Spacer(),
          IconButton(
            icon: Icon(
              _saved ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _saved = !_saved;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPostInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$_likesCount likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage('assets/images/oak.jpg'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'handsome ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'Thanks for all gifts on Teacher\'s day.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text('6 October • ເບິງຄໍາແປ'),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: const [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/oak.jpg'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'handsome',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.more_horiz),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(fontFamily: 'ScriptMTBold', fontSize: 26),
        ),
        centerTitle: true,
        actions: const [SizedBox(width: 48)],
      ),
      body: ListView(
        children: [
          _buildUserHeader(),
          _buildImageCarousel(),
          _buildActionsRow(),
          _buildPostInfo(),
        ],
      ),
    );
  }
}
