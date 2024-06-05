import 'package:flutter/material.dart';
import 'package:store_data_from_api/model/user_info_model.dart';
import 'package:store_data_from_api/service/user_service.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({super.key});

  ValueNotifier<UserInfoModel?> user = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: user,
          builder: (context, value, _) {
            if (value != null) {
              return ListTile(
                leading: Image.network(
                  value.image,
                  errorBuilder: (context, error, stackTrace) {
                    return FlutterLogo();
                  },
                ),
                title: Text(value.firstName),
                subtitle: Text(value.username),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: InkWell(
          onTap: () async {
            UserInfoModel? tempUser = await UserService().getMyInfo();

            user.value = tempUser;
          },
          child: Icon(Icons.get_app_rounded)),
    );
  }
}
