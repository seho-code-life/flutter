import 'package:flutter/material.dart';

class DetailPaged extends StatelessWidget {
  const DetailPaged({Key? key, this.title}) : super(key: key);

  // 参数
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPaged'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 按钮
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context, "ok");
              },
              child: const Text('Back'),
            ),
            // 显示传值
            Text(title ?? ""),
          ],
        ),
      ),
    );
  }
}
