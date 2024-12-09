part of 'pages.dart';

class SuccessSingupPages extends StatelessWidget {
  const SuccessSingupPages({super.key});

  @override
  Widget build(BuildContext context) {
    return IlutsrationPage(
        title: 'Yeay! Completed',
        subtitle: 'Now you are able to order\nsome foods as a self-reward',
        picturePath: 'assets/images/food_wishes.png',
        buttonTitle1: 'Find Foood',
        buttonTap1: (){
          Get.to(MainPages());
        },
    );
  }
}
