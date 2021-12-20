import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserMenuBar extends StatefulWidget {
  @override
  State<UserMenuBar> createState() => _UserMenuBarState();
}

class _UserMenuBarState extends State<UserMenuBar> {

  String? finalemail;
  String? finalname;

  @override
  void initState() {
    getAuth();
    super.initState();
  }

  Future getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedemail = prefs.getString('email');
    var obtainedname = prefs.getString('name');
    setState(() {
      finalemail = obtainedemail;
      finalname = obtainedname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
              radius: 25.0,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 15.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hello, \n",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(152, 156, 173, 1),
                    ),
                  ),
                  TextSpan(
                    text: "Email, ",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(152, 156, 173, 1),
                    ),
                  ),
                ],
              ),
            ),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$finalname" + "\n",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text: "$finalemail",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/icons/bell.png'),
                color: AppColor.primaryTextColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
