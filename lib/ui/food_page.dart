part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {

    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        //   Header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food Market",
                    style: blackFontStyle1,
                  ),
                  Text(
                    "Let's get some food!",
                    style: blackFontStyle2,
                  )
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/736x/c8/4b/1b/c84b1bc7fb9fe438e9ac111af9db1b94.jpg'),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
        //   card food
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: mockFoods
                .map((food) => Padding(
                      padding: EdgeInsets.only(
                          left: (food == mockFoods.first) ? defaultMargin : 0,
                          right: defaultMargin),
                      child: FoodCart(
                        food: food,
                      ),
                    ))
                .toList(),
          ),
        ),
        //   tab layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(children: [
            CustomTabbar(
              selectedIndex: selectIndex,
              title: ['New Taste', 'Popular', 'Recommender'],
              onTap: (index) {
                setState(() {
                  selectIndex = index;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Builder(builder: (_) {
              List<Food> foods = (selectIndex == 0)
                  ? mockFoods
                  : (selectIndex == 1)
                      ? []
                      : [];
              return Column(
                children: foods
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FoodListItem(
                            food: e,
                            itemWidth: listItemWidth,
                          ),
                        ))
                    .toList(),
              );
            }),
            SizedBox(height: 80,),
          ]),
        )
      ],
    );
  }
}
