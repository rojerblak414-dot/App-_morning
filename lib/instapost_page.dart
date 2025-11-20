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
  // ປ່ຽນເສັ້ນທາງຮູບພາບເພື່ອໃຫ້ໃຊ້ໄດ້ໃນສະພາບແວດລ້ອມນີ້ (ຖ້າບໍ່ມີ assets/images ແທ້)
  // ຖ້າທ່ານມີຮູບພາບໃນໂຟເດີ assets/images ແລ້ວ, ໃຫ້ໃຊ້ຄືເກົ່າ.
  final List<String> images = [
    'assets/images/oak.jpg',
    'assets/images/aab.jpg',
    'assets/images/frd.jpg',
    'assets/images/oak.jpg',
    'assets/images/tec.jpg',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildImageCarousel() {
    // ປ່ຽນແປງ: ຫຸ້ມด้วย Center ແລະ ConstrainedBox ເພື່ອກຳນົດຂະໜາດສູງສຸດ
    return Center(
      // ກຳນົດຂະໜາດສູງສຸດຂອງໂພສຮູບພາບ (ເຊັ່ນ: 85% ຂອງຄວາມກວ້າງໜ້າຈໍ)
      // ເພື່ອໃຫ້ມັນບໍ່ເຕັມຈໍ
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 380,
          maxWidth:
              MediaQuery.of(context).size.width * 100, // ກຳນົດຄວາມກວ້າງ 85%
        ),
        child: Stack(
          children: [
            AspectRatio(
              // ກຳນົດອັດຕາສ່ວນ 1:1 (ສີ່ຫຼ່ຽມມົນ)
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
                  // ຖ້າ Image.asset ເກີດ Error, ໃຫ້ທົດແທນດ້ວຍ Container() ພ້ອມສີພື້ນຫຼັງ
                  return Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    // ຟັງຊັນຈັດການຄວາມຜິດພາດ ເພື່ອປ້ອງກັນແອັບແຕກ
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade800,
                        child: Center(
                          child: Text(
                            'Error: Image ${index + 1} not found.\nPlease check assets/images/ in pubspec.yaml',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      );
                    },
                  );
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
        ),
      ),
    );
  }

  Widget _buildActionsRow() {
    // ປັບ Padding ເພື່ອໃຫ້ມັນສອດຄ່ອງກັບຂະໜາດຮູບພາບທີ່ຖືກປັບໃໝ່
    // ຖ້າຫາກທ່ານປ່ຽນ maxWidth ເປັນ 85% ດ້ານເທິງ, ທ່ານສາມາດໃສ່ Padding ໄດ້ເຊັ່ນ:
    final double horizontalPadding =
        (MediaQuery.of(context).size.width * 0.15) / 2 + 8.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
    // ປັບ Padding ເພື່ອໃຫ້ມັນສອດຄ່ອງກັບຂະໜາດຮູບພາບທີ່ຖືກປັບໃໝ່
    final double horizontalPadding =
        (MediaQuery.of(context).size.width * 0.15) / 2 + 8.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
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
                // ປ່ຽນຈາກ AssetImage ໄປເປັນ NetworkImage ເພື່ອຄວາມງ່າຍ
                // ຫຼືໃຫ້ແນ່ໃຈວ່າ 'assets/images/oak.jpg' ມີຢູ່ຈິງ
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
    // ປັບ Padding ດ້ານຂ້າງໃຫ້ຄືກັນກັບຮູບພາບເພື່ອໃຫ້ຈັດວາງເປັນລະບຽບ
    final double horizontalPadding =
        (MediaQuery.of(context).size.width * 0.15) / 2 + 8.0;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cannot go back from the first screen.'),
              ),
            );
          },
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(fontFamily: 'ScriptMTBold', fontSize: 26),
        ),
        centerTitle: true,
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
