part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/photo_border.png'))),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  (context.read<UserCubit>().state as UserLoaded)
                                      .users
                                      .picturePath!),
                            ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: Text((context.read<UserCubit>().state as UserLoaded).users.name ?? "name", style: blackFontStyle1.copyWith(
                        color: mainColor,
                      ),),
                    ),
                    Text((context.read<UserCubit>().state as UserLoaded).users.email ?? "email", style: blackFontStyle1.copyWith(
                      color: mainColor,
                    ),),
                    Container(
                      width: double.infinity,
                      height: 45,
                      margin: EdgeInsets.only(top: 5.0),
                      color: Colors.white,
                    ),
                    CustomTabbar(
                      selectedIndex: selectedIndex,
                      title: ['Account', 'FoodMarket'],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (selectedIndex == 0)
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: AccountPage(),
                            )
                          : FoodMarketPage(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void refresh(){
    context.read<UserCubit>().getUser((context.read<UserCubit>().state as UserLoaded).users);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
          onTap: (){
            Get.to(() => EditProfilePage())! .then((value) => refresh()); ;
          },
          child: RowTab(title: 'Edit Profile')),
      RowTab(title: 'Home Address'),
      RowTab(title: 'Security'),
      RowTab(title: 'Payment'),
      InkWell(
          onTap: () {
            context.read<UserCubit>().singOut();
            Get.to(SignInPages());
          },
          child: RowTab(title: 'Sing Out')),
    ]);
  }
}

class FoodMarketPage extends StatelessWidget {
  const FoodMarketPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RowTab(title: 'Rate App'),
        RowTab(title: 'Help Center'),
        RowTab(title: 'Policy & Privaci'),
        RowTab(title: 'Term & Condition'),
      ],
    );
  }
}

class RowTab extends StatelessWidget {
  const RowTab({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackFontStyle2,
        ),
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.black,
          size: 30,
        )
      ],
    );
  }
}
