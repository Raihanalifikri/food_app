part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage(
      {super.key,
      this.title = "Titel",
      this.subtitle = "Subtitle",
      this.bgColor,
      this.onBackButtonPressed,
      this.child});

  final String title;
  final String subtitle;
  final Color? bgColor;
  final Function? onBackButtonPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: bgColor ?? Colors.white,
            ),
          ),
          SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: <Widget>[
                          onBackButtonPressed != null?
                          GestureDetector(onTap: (){
                            if(onBackButtonPressed != null){
                              onBackButtonPressed!();
                            };
                          },child: Container(
                            width: defaultMargin,
                            height: defaultMargin,
                            margin: EdgeInsets.only(right: 26.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/back_arrow.png')),
                            ),
                          ),)
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(title, style: blackFontStyle1,),
                              Text(subtitle, style: blackFontStyle2,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: defaultMargin,
                  width: double.infinity,
                  color: "FAFAFC".toColor(),
                ),
                child ?? SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
