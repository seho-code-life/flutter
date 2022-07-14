import 'package:flutter/material.dart';

const img1 =
    "https://ducafecat.tech/2021/12/09/blog/2021-jetbrains-fleet-vs-vscode/2021-12-09-10-30-00.png";
const img2 =
    "https://ducafecat.tech/2021/12/09/blog/2021-jetbrains-fleet-vs-vscode/2021-12-09-20-45-02.png";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('有状态无状态'),
        ),
        body: const BannerStateFulWidget(),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(img1);
  }
}

class BannerStateFulWidget extends StatefulWidget {
  const BannerStateFulWidget({Key? key}) : super(key: key);

  @override
  State<BannerStateFulWidget> createState() => _BannerStateFulWidgetState();
}

class _BannerStateFulWidgetState extends State<BannerStateFulWidget> {
  String imgUrl = img1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                imgUrl = imgUrl == img1 ? img2 : img1;
              });
            },
            child: const Text('更新图片')),
        ImageWidget(
          img: imgUrl,
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      color: Colors.amber,
      child: Image.network(img),
    );
  }
}
