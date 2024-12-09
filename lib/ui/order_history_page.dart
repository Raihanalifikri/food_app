part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        await context.read<TransactionCubit>().getTransaction();
      },
      child: BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
        if (state is TransactionLoaded) {
          if (state.transaction.length == 0) {
            return IlutsrationPage(
              title: 'Ouch, Hungry',
              subtitle: '',
              picturePath: 'assets/images/food_wishes.png',
              buttonTitle1: 'find food',
              buttonTap1: () {},
            );
          } else {
            double listItemWidth =
                MediaQuery.of(context).size.width - 2 * defaultMargin;

            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: 15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Orders',
                        style: blackFontStyle2,
                      ),
                      Text(
                        'wait for the best meal',
                        style: blackFontStyle3.copyWith(color: greyColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomTabbar(
                        selectedIndex: selectedIndex,
                        title: ['In Progress', 'Pas Orders'],
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Builder(builder: (_) {
                        List<Transaction> transaction = (selectedIndex == 0
                            ? state.transaction
                                .where((e) =>
                                    e.status == TransactionStatus.on_delivery ||
                                    e.status == TransactionStatus.pending)
                                .toList()
                            : state.transaction
                                .where((e) =>
                                    e.status == TransactionStatus.delivered ||
                                    e.status == TransactionStatus.cancel)
                                .toList());
                        return Column(
                          children: transaction
                              .map((e) => GestureDetector(
                            onTap: (){
                              Get.to(
                                PaymentMathodPage(paymentURL:  e.payment_url!),
                              );
                            },
                                child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: OrderListItem(
                                        transaction: e,
                                        itemWidth: listItemWidth,
                                      ),
                                    ),
                              ))
                              .toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            );
          }
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      }),
    );
  }
}
