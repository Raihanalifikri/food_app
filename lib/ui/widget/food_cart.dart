part of 'widget.dart';

class FoodCart extends StatelessWidget {
  const FoodCart({super.key, this.food});

  final Food? food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(food?.picturePath ?? ''),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food?.name ?? 'Ini Makanan',
                    style: blackFontStyle2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  RetingStars(
                    rate: food?.rate,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
