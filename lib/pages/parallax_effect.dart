import 'package:flutter/material.dart';

class ParallaxEffect extends StatefulWidget {
  const ParallaxEffect({super.key});

  @override
  State<ParallaxEffect> createState() => _ParallaxEffectState();
}

class _ParallaxEffectState extends State<ParallaxEffect> {
  List<String> texts = [
    "Parallax Effect",
    "Beauty of Nature",
    "Power of Flower",
    "Just Feel it",
    "Himalayan Look"
  ];
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: 5,
        itemBuilder: (
          context,
          index,
        ) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            height: size.height,
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        scrollController.hasClients
                            ? (-(index * size.height) +
                                    scrollController.position.pixels) /
                                2
                            : 1.0),
                  width: size.width,
                  height: size.height,
                  child: Image.asset(
                    'image/img/image${index + 1}.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    texts[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
