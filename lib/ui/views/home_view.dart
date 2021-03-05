import 'package:flutter/material.dart';
import 'package:flutter_tutorials/view_model/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Users'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: Builder(builder: (context) {
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
                subtitle: Text(user.address.street),
              );
            },
          );
        }),
      ),
    );
  }
}
