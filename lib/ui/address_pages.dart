part of 'pages.dart';

class AddressPages extends StatefulWidget {
  const AddressPages(
      {super.key,
      required this.users,
      required this.password,
      required this.pictureFile});

  final Users users;
  final String password;
  final File pictureFile;

  @override
  State<AddressPages> createState() => _AddressPagesState();
}

class _AddressPagesState extends State<AddressPages> {
  TextEditingController addressContorller = TextEditingController();
  TextEditingController phoneNumberContorller = TextEditingController();
  TextEditingController houseNumberContorller = TextEditingController();
  bool isLoading = false;
  List<String>? cities;
  String? selectedCity;

  @override
  void initState() {
    cities = ['cirebon', 'Bandung', 'Jakarta'];
    selectedCity = cities![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Address",
      subtitle: "Make sure It's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          // Gambar

          // Address
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: addressContorller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your address",
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // Phone Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "Phone Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: phoneNumberContorller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your phone number",
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // Home Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "House Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: houseNumberContorller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your house number",
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // City
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "City",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: DropdownButton(
              value: selectedCity!,
              items: cities!
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
              isExpanded: true,
              underline: SizedBox(),
            ),
          ),
          // Tombol
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: (isLoading == true)
                ? loadingIndicator
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () async {
                      if (addressContorller.text == "" ||
                          phoneNumberContorller.text == "" ||
                          houseNumberContorller.text == "" ||
                          selectedCity == null) {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign Up Failed",
                            style: blackFontStyle1,
                          ),
                          messageText: Text(
                            "Please fill all the fields",
                            style: blackFontStyle3,
                          ),
                        );
                      } else {
                        Users users = widget.users.copyWith(
                            address: addressContorller.text,
                            phoneNumber: phoneNumberContorller.text,
                            houseNumber: houseNumberContorller.text,
                            city: selectedCity);

                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().singUp(
                            users, widget.password,
                            pictureFile: widget.pictureFile);

                        UserState state = context.read<UserCubit>().state;

                        if (state is UserLoaded) {
                          context.read<FoodCubit>().getFoods();
                          context.read<TransactionCubit>().getTransaction();
                          Get.to(() => SuccessSingupPages());
                        } else {
                          Get.snackbar(
                            "",
                            "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign In Failed",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            messageText: Text(
                              "Please Try Again Later",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    child: Text("CONTINUE")),
          ),
        ],
      ),
    );
  }
}
