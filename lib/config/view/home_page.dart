
import 'package:flutter/material.dart';
import 'package:store_data_from_api/config/view/details_page.dart';
import 'package:store_data_from_api/config/view/history_page.dart';
import 'package:store_data_from_api/config/view/user_info_page.dart';
import 'package:store_data_from_api/model/people_model.dart';
import 'package:store_data_from_api/service/peaple_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(),
                  ));
            },
            child: Icon(Icons.person)),],
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(),
                  ));
            },
            child: Icon(Icons.history)),
      ),
      body: FutureBuilder(
        future: PeapleServiceImp().getPoeple(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PeopleModel> people = snapshot.data!;
            return ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          people: people[index],
                        ),
                      ));
                },
                child: Card(
                  child: ListTile(
                    leading: Image.network(people[index].image),
                    title: Text(people[index].name),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
