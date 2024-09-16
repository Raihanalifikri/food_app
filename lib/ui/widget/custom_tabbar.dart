part of 'widget.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar(
      {super.key,
      required this.selectedIndex,
      required this.title,
      this.onTap});

  final int selectedIndex;
  final List<String> title;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: title
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(left: defaultMargin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) {
                              onTap!(title.indexOf(e));
                            }
                          },
                          child: Text(
                            e,
                            style: (title.indexOf(e) == selectedIndex)
                                ? blackFontStyle3
                                : greyFontStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 3,
                          margin: EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: (title.indexOf(e) == selectedIndex)
                                ? "020202".toColor()
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
