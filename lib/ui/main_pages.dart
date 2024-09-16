part of 'pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {

  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

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
          SafeArea(child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
              selectedPage = index;
              });
            },
            children: [
              Center(
                child: FoodPage(

                ),
              ),
              Center(
                child: Text(
                  'Screen 2',
                  style: blackFontStyle1,
                ),
              ),
              Center(
                child: Text(
                  'Screen 3',
                  style: blackFontStyle1,
                ),
              ),
            ],
            ),
           ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtonNavbar(
                onTap: (int index ) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(index);
                },
                selectedIndex: selectedPage),
          )
        ],
      ),
    );
  }
}
