import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/user.dart';
import 'package:flutter_tutorials/services/user_api.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: FutureBuilder<List<User>>(
        future: UserApi.getAllUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.address.street),
              );
            },
          );
        },
      ),
    );
  }
}
