import 'package:flutter/material.dart';
import 'package:showcasing_flutter/constants/user_list.dart';
import 'package:showcasing_flutter/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> searchedUsers = [];

  List<User> get users => usersList.map((data) => User.fromMap(data)).toList();

  _quaryUsers(String value) {
    setState(() {
      searchedUsers = users.where((user) => user.name.contains(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: _quaryUsers,
                decoration: const InputDecoration(
                  hintText: "Search something...",
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchedUsers.length,
                itemBuilder: (context, index) {
                  final user = searchedUsers[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
