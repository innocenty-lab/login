import 'package:flutter/material.dart';
import 'package:login/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserMenuBar extends StatefulWidget {
  @override
  State<UserMenuBar> createState() => _UserMenuBarState();
}

class _UserMenuBarState extends State<UserMenuBar> {
  String? finalname;

  @override
  void initState() {
    getAuth();
    super.initState();
  }

  Future getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedname = prefs.getString('name');
    setState(() {
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
                    text: "Hello,\n",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(152, 156, 173, 1),
                    ),
                  ),
                  TextSpan(
                    text: "$finalname",
                    style: TextStyle(
                      fontSize: 16.0,
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
