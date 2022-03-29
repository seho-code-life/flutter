// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    return MaterialApp(title: 'Welcome to Flutter', home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  //全局 Key 用来获取 Form 表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var httpClient = HttpClient();
  //用户名
  late String userName;
  //密码
  late String password;

  void login() async {
    //读取当前 Form 状态
    var loginForm = loginKey.currentState;
    //验证 Form表单
    if (loginForm!.validate()) {
      loginForm.save();
      var request =
          await httpClient.get("http://localhost", 9999, '/v1/user/login');
      var response = await request.close();
      print('userName：' + userName + '，password：' + password);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆表单"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(0.6),
            child: Form(
              key: loginKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                      onSaved: (newValue) {
                        userName = newValue!;
                      },
                      validator: (value) {
                        return value!.trim().isNotEmpty ? null : "用户名不能为空";
                      },
                      decoration: const InputDecoration(
                          hintText: "用户名或者邮箱",
                          hintStyle: TextStyle(fontSize: 13, color: Colors.red),
                          labelText: "请输入用户名",
                          prefixIcon: Icon(Icons.person))),
                  TextFormField(
                    validator: (value) {
                      return value!.length < 6 ? '密码长度不够 6 位' : null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "密码",
                        hintStyle: TextStyle(fontSize: 13, color: Colors.red),
                        labelText: "请输入密码",
                        prefixIcon: Icon(Icons.lock)),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "登录",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: login,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// child: const Text(
//             'hello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello worldhello world',
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontSize: 18, color: Colors.red),
//           ),


// Scaffold(
//         appBar: AppBar(
//           title: const Text('登陆'),
//         ),
//         body: Container(
//           width: 500,
//           height: 400,
//           padding: const EdgeInsets.all(30),
//           decoration:
//               BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
//         ),
//       ),