
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_data_from_api/config/core_config.dart';
import 'package:store_data_from_api/config/view/history_page.dart';

import 'package:store_data_from_api/model/people_model.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.people});
  final PeopleModel people;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                List<String> temp =
                    core.get<SharedPreferences>().getStringList('peoples') ??
                        [];

                temp.add(people.toJson());
                core
                    .get<SharedPreferences>()
                    .setStringList('peoples', temp);
              },
              child: Icon(Icons.save)),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(),
                    ));
              },
              child: Icon(Icons.home)),
        ],
      ),
      body: Column(
        children: [
          Image.network(people.image),
          ListTile(
            title: Text(people.name),
            leading: CircleAvatar(child: Text(people.id)),
            subtitle: Text(people.message),
          )
        ],
      ),
    );
  }
}
