part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'Your Desrve Better Meal',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Item Orders',
                  style: blackFontStyle3.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.transaction.food!.picturePath!),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(
                            widget.transaction.food!.name!,
                            style: blackFontStyle2,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(NumberFormat.currency(
                                symbol: 'IDR',
                                decimalDigits: 0,
                                locale: 'id_ID')
                            .format(widget.transaction.food!.price)),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${widget.transaction.quantity} item(s)',
                        style: greyFontStyle.copyWith(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                // Detail Transaction
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Details Transaction',
                  style: blackFontStyle3.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                // Nama Makanan
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      widget.transaction.food!.name!,
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id_ID',
                    ).format(widget.transaction.food!.price))
                  ],
                ),
                // Quantity
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(
                      '${widget.transaction.quantity.toString()} Item(s)',
                      style: blackFontStyle3,
                    ),
                  ],
                ),
                // Subtotal
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id_ID',
                    ).format(widget.transaction.food!.price! *
                        widget.transaction.quantity!)),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // Tax
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id_ID',
                    ).format(widget.transaction.food!.price! *
                        widget.transaction.quantity! *
                        0.1)),
                  ],
                ),
                // Driver
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Driver',
                      style: blackFontStyle3,
                    ),
                    Spacer(),
                    Text(NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id_ID',
                    ).format(50000)),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                // Total
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(
                        widget.transaction.total! +
                            (widget.transaction.food!.price! *
                                widget.transaction.quantity! *
                                0.1) +
                            50000,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Text(
                  'Deliver To :',
                  style: blackFontStyle3,
                ),
                // Nama
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Nama Penerima : ',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.name!),
                  ],
                ),
                // email
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Email Penerima: ',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.email!),
                  ],
                ),
                // address
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Alamat penerima : ',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.address!),
                  ],
                ),
                // No Rumah
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'No Rumah : ',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.houseNumber!),
                  ],
                ),
                // No Telpon
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'No Telp : ',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.phoneNumber!),
                  ],
                ),
                // City
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Kota/City : ',
                      style: blackFontStyle2,
                    ),
                    Spacer(),
                    Text(widget.transaction.user!.city!),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      var payment_url = await context.read<TransactionCubit>().submitTransaction(
                          widget.transaction.copyWith(
                            dateTime: DateTime.now(),
                            total: (widget.transaction.total! * 1.1).toInt() + 50000,
                      ),
                      );
                      if (payment_url != null) {
                        Get.to(PaymentMathodPage(paymentURL: payment_url));
                      } else{
                        Get.snackbar(
                            "",
                            "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Transaction In Failed",
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
                      }
                    },
                    child: Text(
                      'Order Now',
                      style: blackFontStyle3.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
