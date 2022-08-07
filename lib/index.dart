import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  String uid = '';
  List user_info = [];

  @override
  void initState() {
    super.initState();
    Future(() async {

    final currentUser = await FirebaseAuth.instance.currentUser;
    final uid = currentUser!.uid;

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    setState(() {
      user_info = snapshot.docs;
    });

    print(currentUser);
    print(uid);
    user_info.map((document) {
      print('${document['name']}さん');
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CustomScrollView(
                slivers: [
                  // TODO: GitHub issue #4
                  SliverGrid.count(crossAxisCount: 2, children: [
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: Container(
                          child: Image.network(
                              "https://cdn-common.skima.jp/item/926/171/926171/showcase-f28b74369ae29e84ab5e3c61309531fc-20220315012613.jpeg"),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
