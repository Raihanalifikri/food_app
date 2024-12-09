part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IlutsrationPage(
        title: 'Order Foods Are OTW',
        subtitle: "Just Stay at home while we are\npriparing your best food",
        picturePath: 'assets/images/bike.png',
        buttonTitle1: 'Order Other Foood',
        buttonTap1: (){
          Get.offAll(MainPages(InitialPage: 0));
        },
        buttonTitle2: 'View My Order',
        buttonTap2: (){
          Get.offAll(MainPages(InitialPage: 1));
        },
    );
  }
}
