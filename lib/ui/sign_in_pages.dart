part of 'pages.dart';

class SignInPages extends StatefulWidget {
  const SignInPages({super.key});

  @override
  State<SignInPages> createState() => _SignInPagesState();
}

class _SignInPagesState extends State<SignInPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: "Sign In",
        subtitle: "Find Your Best Ever Meal",
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                defaultMargin,
                26,
                defaultMargin,
                6,
              ),
              child: Text(
                "Email Address",
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
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'type your email address'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                defaultMargin,
                21,
                defaultMargin,
                6,
              ),
              child: Text(
                "Password",
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
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'type your password'),
              ),
            ),
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading
                    ? loadingIndicator
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () async {
                          if (emailController.text == "" ||
                              passwordController.text == "") {
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
                                style: blackFontStyle1,
                              ),
                              messageText: Text(
                                "Please fill all the fields",
                                style: blackFontStyle3,
                              ),
                            );
                          }
                          else {
                            setState(() {
                              isLoading = true;
                            });

                            await context.read<UserCubit>().signIn(
                              emailController.text,
                              passwordController.text,
                            );
                            UserState state = context.read<UserCubit>().state;

                            if (state is UserLoaded) {
                              context.read<FoodCubit>().getFoods();
                              context.read<TransactionCubit>().getTransaction();
                              Get.to(() => MainPages());
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
                                  )
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          "LOGIN",
                          style: blackFontStyle2,
                        ))),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 12.0),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SignUpPages());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Create Accout",
                  style: blackFontStyle3.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
