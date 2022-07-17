import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'DetailPaged.dart';

var logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const AppPage(),
        routes: {
          '/details': (context) => const DetailPaged(),
        });
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件'),
      ),
      body: Column(
        children: [
          const Text(
            "hello",
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
          const Text(
            "缩放，Each line here is progressively more opaque. The base color is material.Colors.black, and Color.withOpacity is used to create a derivative color with the desired opacity. The root TextSpan for this RichText widget is explicitly given the ambient DefaultTextStyle, since RichText does not do that automatically. The inner TextStyle objects are implicitly mixed with the parent TextSpans TextSpan.style.",
            softWrap: true,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.blue, fontSize: 24),
          ),
          Text.rich(TextSpan(
            text: "text span",
            style: const TextStyle(color: Colors.red, fontSize: 24),
            children: [
              const TextSpan(
                text: "text span",
                style: TextStyle(color: Colors.blue, fontSize: 24),
              ),
              TextSpan(
                text: "text span",
                style: const TextStyle(color: Colors.red, fontSize: 24),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("点击了");
                  },
              ),
            ],
          )),
          Image.asset(
            'assets/images/IMG_1442.PNG',
            color: Colors.red,
            width: 100,
            height: 100,
            colorBlendMode: BlendMode.dstOver,
          ),
          const Icon(
            Icons.search,
            size: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.pushNamed(context, '/details',
                      arguments: {'title': "ducafecat"});

                  print("路由返回值: $result");
                },
                child: const Text("hello button"),
                style: const ButtonStyle(),
              ),
              TextButton(onPressed: () {}, child: const Text("text button")),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.holiday_village,
                ),
                iconSize: 30,
                color: Colors.amber,
              ),
            ],
          ),
          TextField(
      // 控制器
      controller: _controllerName,
      // 焦点
      autofocus: true,
      // 焦点管理
      focusNode: focusNodeName,
      // 输入框的样式
      decoration: const InputDecoration(
        labelText: '用户名',
        hintText: '请输入',
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.edit),
        border: OutlineInputBorder(),
      ),
      // 输入改变事件
      onChanged: (String value) {
        setState(() {
          _message = value;
        });
      },
      // 提交回车事件
      onSubmitted: (String value) {
        focusScopeNode ??= FocusScope.of(context);
        focusScopeNode?.requestFocus(focusNodePassword);
      },
    );
        ],
      ),
    );
  }
}
