import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image_file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image_file == null ? FlutterLogo() : Image.file(image_file!),
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (kIsWeb) {
            if (result != null) {
              File file = File.fromRawPath(result.files.single.bytes!);
              setState(() {
                image_file = file;
              });
              await Future.delayed(Duration(seconds: 1));

              // Map<String, dynamic> map = {
            } else {
              File file = File(result!.files.single.path!);
              setState(() {
                image_file = file;
              });
            }
            //   "image": await MultipartFile.fromString(file.path,
            //       filename: 'my-image-name.png')
            // };

            // map.addAll(UserModel(email: 'email').toMap());

            // final data = FormData.fromMap(map);

            // await Dio().post('', data: data);
          } else {
            // User canceled the picker
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
