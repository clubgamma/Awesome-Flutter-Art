import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color textColor = Color(0xff07e7c5);

  final Color textFieldColor = Color(0xff344747);

  static String phoneData = "";
  String phoneDataFinal;

  String msgData;
  TextEditingController msg = TextEditingController();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController(text: phoneData);

    return Stack(
      children: <Widget>[
        Image.asset(
          'images/background.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Hello !",
                    style: TextStyle(fontSize: 40.0, color: textColor),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Welcome to WhatsApp DM ",
                        style: TextStyle(fontSize: 20.0, color: Colors.white60),
                      ),
                      Text(
                        "💚",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.contact_phone,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            final PhoneContact contact =
                                await FlutterContactPicker.pickPhoneContact();
                            setState(() {
                              phoneData = contact.phoneNumber.number.toString();
                            });
                          },
                        ),
                      ),
                      filled: true,
                      fillColor: textFieldColor,
                      hintText: 'Enter Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) {
                      phoneData = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {
                      msgData = value;
                    },
                    controller: msg,
                    maxLines: 8,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: textFieldColor,
                      hintText: 'Enter Message',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    height: 60.0,
                    width: 150.0,
                    child: RaisedButton(
                      color: Color(0xff07c9ab),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      onPressed: () {
                        if (phoneData[0] != '+') {
                          if (phoneData[0] != '9')
                            phoneDataFinal = "+91" + phoneData;
                        } else
                          phoneDataFinal = phoneData;
                        launch("https://wa.me/$phoneDataFinal?text=$msgData");
                      },
                      child: Text(
                        "Send to WhatsApp",
                        style: TextStyle(color: textFieldColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
