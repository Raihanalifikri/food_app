part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).users.name!;
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).users.phoneNumber!;
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).users.houseNumber!;
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).users.address!;
    cityController.text =
        (context.read<UserCubit>().state as UserLoaded).users.city!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: blackFontStyle1.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: mainColor),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // NAME
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  21,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Name",
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'type your Name'),
                ),
              ),

              // Phone Number
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  21,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Phone Number",
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'type your Phone Number'),
                ),
              ),

              //   House Number
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  21,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "House Number",
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: houseNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'type your House Number'),
                ),
              ),

              //   Address
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  21,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Address",
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'type your address'),
                ),
              ),

              //   City
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  21,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "City",
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: 'type your City'),
                ),
              ),

              //   Button
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 18.0),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: (isLoading == true)
                    ? loadingIndicator
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          Users users =
                              (context.read<UserCubit>().state as UserLoaded)
                                  .users
                                  .copyWith(
                                    name: nameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    houseNumber: houseNumberController.text,
                                    address: addressController.text,
                                    city: cityController.text,
                                  );

                          ApiReturnValue<Users> result =
                              await UserServices.updateProfile(users);

                          if (result.value != null) {
                            context.read<UserCubit>().getUser(result.value!);
                            Get.snackbar(
                              "",
                              "",
                              backgroundColor: "2ECC71".toColor(),
                              icon: Icon(
                                MdiIcons.checkCircleOutline,
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
                          }
                          setState(() {
                            isLoading = false;
                          });

                          Get.back();
                          context.read<UserCubit>().getUser(users);

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Update Profile",
                          style: blackFontStyle3.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
