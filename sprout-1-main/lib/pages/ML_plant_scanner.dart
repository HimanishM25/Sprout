import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/appBar.dart';
import '../main.dart';
import 'package:tflite/tflite.dart';

class PlantScanner extends StatefulWidget {
  @override
  _PlantScannerState createState() => _PlantScannerState();
}

class _PlantScannerState extends State<PlantScanner> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((ImageStream) {
            cameraImage = ImageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      // ignore: avoid_function_literals_in_foreach_calls
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: "assets/ML_Model/model.tflite",
        labels: "assets/ML_Model/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NewAppBar('Disease Detector'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Shade.moss,
                ),
                child: Center(
                  child: Text(
                    output,
                    style:  const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Icon(Icons.info_outline,size:   22,),
                    const Text('To improve the accuracy of the of the Disease Detector, try hoding your phone close to the leaf of the plant while holding still',
                     style: TextStyle(
                       fontWeight: FontWeight.w100,
                       fontSize: 12,
                     ),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
