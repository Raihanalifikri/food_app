part of 'widget.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {super.key, required this.transaction, required this.itemWidth});

  final Transaction transaction;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(transaction.food?.picturePath ??
                  'https://ui-avatars.com/api/?name=${transaction.food?.name}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth! - 168,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food?.name ?? 'No Name',
                style: blackFontStyle2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Text(transaction.quantity.toString() + 'item(s) ~ '),
                  Text(
                    NumberFormat.currency(
                      symbol: 'IDR',
                      decimalDigits: 0,
                      locale: 'id-ID',
                    ).format(transaction.total),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(ConvertDateTimesDsiplay(transaction.dateTime!)),
            (transaction.status == TransactionStatus.delivered)
                ? Text(
                    'Delivered',
                    style: blackFontStyle2.copyWith(color: Colors.green),
                  )
                : (transaction.status == TransactionStatus.cancel)
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                        child: Text(
                          'Cancel',
                          style: blackFontStyle2.copyWith(color: Colors.white),
                        ),
                      )
                    : (transaction.status == TransactionStatus.pending)
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(9.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 3.5),
                            child: Text(
                              'Pending',
                              style:
                                  blackFontStyle2.copyWith(color: Colors.white),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(9.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 3.5),
                            child: Text(
                              'On Delivery',
                              style:
                                  blackFontStyle2.copyWith(color: Colors.white),
                            )),
          ],
        ),
      ],
    );
  }
}
