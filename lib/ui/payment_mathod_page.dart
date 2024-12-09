part of 'pages.dart';

class PaymentMathodPage extends StatelessWidget {
  const PaymentMathodPage({super.key, required this.paymentURL});

  final String paymentURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: IlutsrationPage(
          title: 'Finish Your Payment',
          subtitle: 'Please select your favorite \npayment method',
          picturePath: 'assets/images/Payment.png',
          buttonTitle1: 'Payment Method',
          buttonTap1: () async{
            await launch(paymentURL);
          },
          buttonTap2: (){
            Get.to(SuccessOrderPage());
          },
          buttonTitle2: 'Continue',
      ),
    );
  }
}
