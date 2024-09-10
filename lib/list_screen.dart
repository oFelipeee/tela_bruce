import 'package:flutter/material.dart';
import 'user.dart';

class ListScreen extends StatelessWidget {
  final List<User> users;

  ListScreen({required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários Cadastrados')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              users[index].gender == 'Masculino'
                  ? 'assets/images/male.png'
                  : 'assets/images/female.png',
            ),
            title: Text(users[index].name),
            subtitle: Text(
                'Email: ${users[index].email}\nTelefone: ${users[index].phone}\nEndereço: ${users[index].address}'),
          );
        },
      ),
    );
  }
}