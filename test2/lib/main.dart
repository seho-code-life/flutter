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
        // 悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_photo_alternate),
        ),
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
        const BannerList(),
        const ListColumn()
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(11),
      child: Image.network(img),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(
          color: Colors.red,
          width: 10,
        ),
      ),
    );
  }
}

class BannerList extends StatelessWidget {
  const BannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // verticalDirection: VerticalDirection.up,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(img1),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(img2),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(img1),
          ),
        ],
      ),
    );
  }
}

class ListColumn extends StatelessWidget {
  const ListColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FlutterLogo(
          size: 24,
        ),
        const FlutterLogo(
          size: 24,
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
            // const Positioned(
            //   left: 0,
            //   bottom: 0,
            //   child: FlutterLogo(size: 100),
            // ),
          ],
        ),
        const AlignItem()
      ],
    );
  }
}

class AlignItem extends StatelessWidget {
  const AlignItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      widthFactor: 2,
      heightFactor: 2,
      alignment: Alignment.bottomLeft,
      child: FlutterLogo(
        size: 50,
      ),
    );
  }
}
