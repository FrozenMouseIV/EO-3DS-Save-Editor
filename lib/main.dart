import 'dart:io';

import 'package:eo_3ds_save_editor/backend/open.dart';
import 'package:eo_3ds_save_editor/backend/read_general.dart';
import 'package:eo_3ds_save_editor/frontend/second_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etrian Odyssey 3DS Save Editor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Etrian Odyssey 3DS Save Editor'),
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
  String message = "Insert an Etrian Odyssey 3DS save.";
  String message2 = "Compare two saves";
    
    Future<void> initPlatformState(BuildContext context) async {
    const XTypeGroup typeGroup = XTypeGroup(
    label: 'save',
    extensions: <String>['sav', 'savbackup'],
    );
    final XFile? file =
    await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    
    var fileNTemp = file?.path ?? 'Null';
    var game = await read(fileNTemp);
    var keepGame = await keep(fileNTemp);

    if(game == "MOS_GAME"){
      setGame(keepGame);
      decrypt(keepGame);
if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => NexusPage(keepGame),
    ),
  );
}
    }
    else if(game == "MO1RGAME"){
      setGame(keepGame);
      decrypt(keepGame);
if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => Untold1Page(keepGame),
    ),
  );
}
    }
    else if(game == "MO2RGAME"){
      setGame(keepGame);
      decrypt(keepGame);
if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => Untold2Page(keepGame),
      ),
    );
}
    }
    else if(game == "MOR4GAME"){
      setGame(keepGame);
      decrypt(keepGame);
      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => IVPage(keepGame),
    ),
  );
}
    }
    else if(game == "MO5_GAME"){
      setGame(keepGame);
      decrypt(keepGame);
if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => VPage(keepGame),
    ),
  );
}
    }
    else{
      setState(() {
      message = ("Not an 3DS EO save");
          });
    }
  }
    Future<void> comparePlatformState(BuildContext context) async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        if (files.length > 1 && files.length < 3 && files[0].existsSync() && files[1].existsSync()){
          String file1Path = files[0].path;
          String file2Path = files[1].path;
          if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => ComparePage(files, file1Path, file2Path),
            ),
          );
          }
        }
        else {
        }
      } else {
      }
    }

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
            Text(
              message,
            ),
            TextButton(
              onPressed: () => _MyHomePageState().initPlatformState(context), child: const Text('Select'),
            ),
            const SizedBox(height: 50),
            Text(
              message2,
            ),
            TextButton(
              onPressed: () {
                _MyHomePageState().comparePlatformState(context);
              },
              child: const Text('Compare') 
            ),
          ],
        ),
      ),
    );
  }
}





