import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store_data_from_api/config/res/app_string.dart';
import 'package:store_data_from_api/config/view/history_page.dart';
import 'package:store_data_from_api/config/view/home_page.dart';
import 'package:store_data_from_api/model/user_model.dart';
import 'package:store_data_from_api/service/user_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString().HELLOWORLD),
        actions: [
          InkWell(
              onTap: () {
                if (context.locale.languageCode == "ar") {
                  context.setLocale(Locale('en'));
                } else {
                  context.setLocale(Locale('ar'));
                }
              },
              child: Icon(Icons.translate))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(AppString().HELLOWORLD),
            Text(AppString().PLEASELOGIN),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () async {
            bool status = await UserService().logIn(
                UserModel(username: username.text, password: password.text));

            if (status) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("error")));
            }
          },
          child: Icon(Icons.send)),
    );
  }
}
