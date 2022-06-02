import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:week7/models/user_model.dart';
import 'package:week7/services/dio.dart';
import 'package:week7/services/shared_preference.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserModel> userList = [];
  UserModel? user;

  @override
  void initState() {
    initialLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(text: 'tab2'),
          ]),
          title: Text(widget.title),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: userList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return card(userList[index]);
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: [
                  user != null ? card(user!) : Container(),
                  ElevatedButton(
                    child: const Text('Carregar usuarios'),
                    onPressed: () async {
                      final result = await SharedPrefs().getData();

                      setState(() {
                        user = result;
                      });
                    },
                  ),
                ],
              )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await ClientHttp().getUser();
            setState(() {});
            inspect(result);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget card(UserModel user) {
    return InkWell(
      onTap: () async {
        await SharedPrefs().saveData(user);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('nome:${user.name}'),
            Text('age:${user.age}'),
            Text('id:${user.id}'),
            Text('hasChildren:${user.complements.hasChildren}'),
            Text('profession:${user.complements.profession}'),
          ],
        ),
      ),
    );
  }

  Future<void> initialLoad() async {
    userList = await ClientHttp().getUser();
  }
}
