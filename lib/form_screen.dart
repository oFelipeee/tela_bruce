import 'package:flutter/material.dart';
import 'list_screen.dart';
import 'user.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _address = '';
  String _gender = 'Masculino';

  List<User> _users = [];

  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      setState(() {
        // Adiciona o usuário à lista
        _users.add(User(
          name: _name,
          email: _email,
          phone: _phone,
          address: _address,
          gender: _gender,
        ));
      });

      // Limpa os campos do formulário
      _formKey.currentState?.reset();
      _gender = 'Masculino';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário salvo com sucesso!')),
      );
    }
  }

  void _viewUsers() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListScreen(users: _users)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TELA DE CADASTRO')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _name = value ?? '',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value ?? '',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
                onSaved: (value) => _phone = value ?? '',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o telefone';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço'),
                onSaved: (value) => _address = value ?? '',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o endereço';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gênero'),
                value: _gender,
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue ?? 'Masculino';
                  });
                },
                items: <String>['Masculino', 'Feminino']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Salvar'),
                  ),
                  ElevatedButton(
                    onPressed: _viewUsers,
                    child: Text('Ver'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}