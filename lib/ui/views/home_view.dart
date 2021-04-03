import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/views/map_view.dart';
import 'package:flutter_tutorials/view_model/map_model/map_model.dart';
import 'package:flutter_tutorials/view_model/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Users'),
      ),
      body: Builder(builder: (context) {
        final model = Provider.of<UserModel>(context);

        if (model.homeState == HomeState.Loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (model.homeState == HomeState.Error) {
          return Center(child: Text('An Error Occured ${model.message}'));
        }
        final users = model.users;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.name),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()));
              },
              subtitle: Text(user.address.street),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.map),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()));
          }),
    );
  }
}
