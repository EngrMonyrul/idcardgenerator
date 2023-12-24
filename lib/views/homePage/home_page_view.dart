import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card_detector/flutter_credit_card_detector.dart';
import 'package:idcardgenerator/views/homePage/providers/home_page_provider.dart';
import 'package:idcardgenerator/views/homePage/widgets/empty_widget.dart';
import 'package:image_picker/image_picker.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Consumer<HomePageProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  (value.idCardImgs.isEmpty)
                      ? emptyWidget(context)
                      : CarouselSlider(
                          options: CarouselOptions(),
                          items: value.idCardImgs.map((e) {
                            return const SizedBox();
                          }).toList(),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      imageFetchArea(
                        context: context,
                        text: 'Camera',
                        onPressed: () async {
                          final pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);
                        },
                      ),
                      imageFetchArea(
                        context: context,
                        text: 'Gallery',
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  CupertinoButton imageFetchArea({required BuildContext context, required String text, required Function() onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: FittedBox(
        child: Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .35,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
