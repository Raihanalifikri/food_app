part of 'pages.dart';

class AddressPages extends StatefulWidget {
  const AddressPages({super.key});

  @override
  State<AddressPages> createState() => _AddressPagesState();
}

class _AddressPagesState extends State<AddressPages> {
  TextEditingController addressContorller = TextEditingController();
  TextEditingController phoneNumberContorller = TextEditingController();
  TextEditingController houseNumberContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Address",
      subtitle: "Make sure It's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          // Gambar
          Container(
            height: 110,
            width: 110,
            margin: EdgeInsets.only(top: 26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/photo_border.png'),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image:
                      NetworkImage('https://ui-avatars.com/api/?name=John+Doe'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Address
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: addressContorller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your address",
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // Phone Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "Phone Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: phoneNumberContorller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your phone number",
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // Home Number
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "House Number",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: houseNumberContorller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your house number",
                hintStyle: greyFontStyle,
              ),
            ),
          ),
          // City
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: Text(
              "City",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child:  DropdownButton(

              items: [
                DropdownMenuItem(
                    child: Text("Bandung"),
                  value: "Bandung",
                ),
                DropdownMenuItem(
                  child: Text("Cirebon"),
                  value: "Cirebon",
                ),
                DropdownMenuItem(
                  child: Text("Palembang"),
                  value: "Palembang",
                ),
                DropdownMenuItem(
                  child: Text("Bekasi"),
                  value: "Bekasi",
                ),
              ],
              onChanged: (item) {},
            isExpanded: true,
            underline: SizedBox(),
            ),
          ),
          // Tombol
          Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 24),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  onPressed: (){},
                  child: Text("CONTINUE"))
          ),
        ],
      ),
    );
  }
}
