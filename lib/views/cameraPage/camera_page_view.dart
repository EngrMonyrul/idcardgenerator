import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_detector/flutter_credit_card_detector.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:idcardgenerator/views/cameraPage/providers/camera_page_provider.dart';

class CameraPageView extends StatefulWidget {
  const CameraPageView({super.key});

  @override
  State<CameraPageView> createState() => _CameraPageViewState();
}

class _CameraPageViewState extends State<CameraPageView> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameraDescription;
  bool _cameraInitiate = false;
  FlipCardController flipCardController = FlipCardController();

  Future<void> initializeCameraController() async {
    final cameraPageProvider =
        Provider.of<CameraPageProvider>(context, listen: false);
    _cameraDescription = await availableCameras();
    _cameraController = CameraController(
        _cameraDescription[cameraPageProvider.cameraNumber],
        ResolutionPreset.ultraHigh);
    await _cameraController.initialize();
    _cameraInitiate = true;
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeCameraController();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Consumer<CameraPageProvider>(builder: (context, property, value) {
          return Center(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                (_cameraInitiate)
                    ? ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      child: FlipCard(
                        animationDuration: Duration(seconds: 2),
                        rotateSide: RotateSide.left,
                        controller: flipCardController,
                        frontWidget: CameraPreview(_cameraController),
                        backWidget: CameraPreview(_cameraController),
                      ),
                    )
                    : const CircularProgressIndicator(),
                // const Positioned(
                //   top: 40,
                //   child: Text(
                //     'ID Card Scanner',
                //     style: TextStyle(
                //       fontSize: 25,
                //       color: Colors.black,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            property.setCameraNumber();
                            initializeCameraController();
                          },
                          icon: const Icon(CupertinoIcons.switch_camera_solid),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            flipCardController.flipcard();
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                          ),
                        ),
                        IconButton(
                          icon: property.cameraFlash
                              ? const Icon(CupertinoIcons.bolt)
                              : const Icon(CupertinoIcons.bolt_slash),
                          onPressed: () {
                            property.setCameraFlash();
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .02,
                  child: const Text(
                    'Front Part',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
