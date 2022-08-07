import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watatosyo/index.dart';
import 'package:watatosyo/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2012/09/15/02/22/forest-56930_1280.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "ログイン",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.all(8),
                            // メッセージ表示
                            child: Text(infoText,style: TextStyle(color: Colors.red),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "メールアドレス",
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '必須項目です';
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "パスワード",
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '必須項目です';
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: TextButton(
                              child: Text("新規登録はこちら"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.only(left: 40, right: 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    // メール/パスワードでログイン
                                    final FirebaseAuth auth =
                                        FirebaseAuth.instance;
                                    await auth.signInWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );
                                    // ログインに成功した場合
                                    // チャット画面に遷移＋ログイン画面を破棄
                                    await Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                        return Index();
                                      }),
                                    );
                                  } catch (e) {
                                    // ログインに失敗した場合
                                    setState(() {
                                      // infoText = "ログインに失敗しました：${e.toString()}";
                                      infoText = "ログインに失敗しました";
                                    });
                                  }
                                }
                              },
                              child: Text("ログイン"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
