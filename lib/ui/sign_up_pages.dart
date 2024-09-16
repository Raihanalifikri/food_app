part of 'pages.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({super.key});

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: "Sign Up",
        subtitle: "Create Account",
        onBackButtonPressed: () {
          Get.back();
        },
        child: Column(
         children: [
           Container(
             width: double.infinity,
             margin: EdgeInsets.fromLTRB(
               defaultMargin,
               26,
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
                 border: Border.all(color: Colors.black)
             ),
             child: TextFormField(
               controller: nameController,
               decoration: InputDecoration(
                   border: InputBorder.none,
                   hintStyle: greyFontStyle,
                   hintText: 'type your name'
               ),
             ),
           ),
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
                 border: Border.all(color: Colors.black)
             ),
             child: TextFormField(
               controller: emailController,
               decoration: InputDecoration(
                   border: InputBorder.none,
                   hintStyle: greyFontStyle,
                   hintText: 'type your email address'
               ),
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
                 border: Border.all(color: Colors.black)
             ),
             child: TextFormField(
               controller: passwordController,
               keyboardType: TextInputType.visiblePassword,
               obscureText: true,
               decoration: InputDecoration(
                   border: InputBorder.none,
                   hintStyle: greyFontStyle,
                   hintText: 'type your password'
               ),
             ),
           ),
           Container(
               width: double.infinity,
               height: 45,
               margin: EdgeInsets.only(top: 24),
               padding: EdgeInsets.symmetric(horizontal: defaultMargin),
               child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       backgroundColor: mainColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10),
                       )
                   ),
                   onPressed: (){
                     Get.to(() => AddressPages());
                   },
                   child: Text("CONTINUE"))
           ),
         ],
        ),
      ),
    );
  }
}
