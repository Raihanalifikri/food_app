part of 'pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key, this.InitialPage = 0});

  final int InitialPage;
  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    selectedPage = widget.InitialPage;
    pageController = PageController(initialPage: widget.InitialPage);
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            color: 'FAFAFC'.toColor(),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: OrderHistoryPage(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtonNavbar(
                onTap: (int index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                },
                selectedIndex: selectedPage),
          )
        ],
      ),
    );
  }
}
