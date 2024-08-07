// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:t_store/main.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   CameraController? cameraController;
//   CameraImage? cameraImage;
//   String result = '';

//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//     initializeCamera();
//   }

//   initializeCamera() async {
//     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
//     await cameraController!.initialize();
//     cameraController!.startImageStream((image) {
//       setState(() {
//         cameraImage = image;
//       });
//       if (cameraImage != null) {
//         applyModelOnFrame();
//       }
//     });
//   }

//   applyModelOnFrame() async {
//     var predictions = await Tflite.runModelOnFrame(
//       bytesList: cameraImage!.planes.map((plane) {
//         return plane.bytes;
//       }).toList(),
//       imageHeight: cameraImage!.height,
//       imageWidth: cameraImage!.width,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       rotation: 90,
//       threshold: 0.5,
//       asynch: true,
//     );

//     setState(() {
//       result = predictions != null
//           ? predictions.map((p) => p['label']).join('\n')
//           : '';
//     });
//   }

//   loadModel() async {
//     try {
//       await Tflite.loadModel(
//         model: "assets/videos/model_unquant.tflite",
//         labels: "assets/videos/labels.txt",
//       );
//       print("Model loaded successfully.");
//     } catch (e) {
//       print("Error loading model: $e");
//     }
//   }

//   @override
//   void dispose() {
//     cameraController?.dispose();
//     Tflite.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Camera Screen'),
//       ),
//       body: Column(
//         children: [
//           cameraController == null
//               ? Container()
//               : AspectRatio(
//                   aspectRatio: cameraController!.value.aspectRatio,
//                   child: CameraPreview(cameraController!),
//                 ),
//           Text(
//             result,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
