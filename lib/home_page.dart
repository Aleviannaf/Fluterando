import 'package:fluterando/app_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(child: Image.network(
                'https://avatars.githubusercontent.com/u/86177150?v=4',),
                ),
              accountName: Text('Alexandre Vianna'), 
              accountEmail: Text('alexandrevianna511@gmail.com')),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  print('Home');
                }),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
        actions: [
          CustomSwith(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [CustomSwith(), Text('Contador: $count')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomSwith extends StatelessWidget {
  const CustomSwith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instace.isDarkTheme,
      onChanged: (value) {
        AppController.instace.changeTheme();
      },
    );
  }
}
