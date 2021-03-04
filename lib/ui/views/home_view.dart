import 'package:flutter/material.dart';
import 'package:flutter_tutorials/view_models/user_models.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => UserModel(),
        child: Builder(builder: (context) {
          final model = Provider.of<UserModel>(context);
          if (model.homeState == HomeState.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.homeState == HomeState.Error) {
            return Center(child: Text('An Erroor Occured'));
          }
          if (model.homeState == HomeState.Initial) {
            return Center(child: Text('No Data Found'));
          }
          return ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              final user = model.users[index];
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
