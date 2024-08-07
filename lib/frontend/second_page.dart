import 'dart:io';

import 'package:convert/convert.dart';
import 'package:eo_3ds_save_editor/backend/read_general.dart';
import 'package:eo_3ds_save_editor/frontend/display_utilities.dart';
import 'package:eo_3ds_save_editor/frontend/third_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NexusPage extends StatelessWidget {
  final List keepGame;
  const NexusPage(this.keepGame, {super.key});
  static int option = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etrian Odyssey Nexus'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 80% of the screen height
              child: TableGuild(readMembers()),
            ),
            ElevatedButton(
              onPressed: () {
                saveFile(keepGame);
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 1;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Level'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Add to party'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Bench'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 4;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 8;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Sub Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 5;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Respec'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 6;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change class'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 7;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change subclass'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => ItemPage(keepGame),
                  )
                );
              },
              child: const Text('Items'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}

class Untold1Page extends StatelessWidget {
  final List keepGame;
  const Untold1Page(this.keepGame, {super.key});
  static int option = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etrian Odyssey Untold'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 80% of the screen height
              child: TableGuild(readMembers()),
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            ElevatedButton(
              onPressed: () {
                saveFile(keepGame);
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 1;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Level'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Add to party'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Bench'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 4;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 5;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Respec'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 6;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => ItemPage(keepGame),
                  )
                );
              },
              child: const Text('Items'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}

class Untold2Page extends StatelessWidget {
  final List keepGame;
  const Untold2Page(this.keepGame, {super.key});
  static int option = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etrian Odyssey 2 Untold'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 80% of the screen height
              child: TableGuild(readMembers()),
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            ElevatedButton(
              onPressed: () {
                saveFile(keepGame);
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 1;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Level'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Add to party'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Bench'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 4;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 5;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Respec'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 6;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => ItemPage(keepGame),
                  )
                );
              },
              child: const Text('Items'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}

class IVPage extends StatelessWidget {
  final List keepGame;
  const IVPage(this.keepGame, {super.key});
  static int option = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etrian Odyssey IV'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 80% of the screen height
              child: TableGuild(readMembers()),
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            ElevatedButton(
              onPressed: () {
                saveFile(keepGame);
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 1;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Level'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Add to party'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Bench'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 4;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 8;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Sub Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 5;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Respec'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 6;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change class'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 7;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change subclass'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => ItemPage(keepGame),
                  )
                );
              },
              child: const Text('Items'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}

class VPage extends StatelessWidget {
  final List keepGame;
  const VPage(this.keepGame, {super.key});
  static int option = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etrian Odyssey V'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 80% of the screen height
              child: TableGuild(readMembers()),
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            ElevatedButton(
              onPressed: () {
                saveFile(keepGame);
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 1;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Level'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Add to party'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 3;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Bench'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 4;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change Skill Tree'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 5;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Respec'),
            ),
            ElevatedButton(
              onPressed: () {
                option = 6;
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => NamePage(keepGame,option),
                  )
                );
              },
              child: const Text('Change class'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => ItemPage(keepGame),
                  )
                );
              },
              child: const Text('Items'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComparePage extends StatelessWidget {
  final List<File> files;
  final String path1;
  final String path2;
  const ComparePage(this.files, this.path1, this.path2, {super.key});

  @override
  Widget build(BuildContext context) {
    final file1 = files[0].readAsBytesSync();
    final file2 = files[1].readAsBytesSync();
    final hexString1 = hex.encode(file1).toUpperCase();
    final hexString2 = hex.encode(file2).toUpperCase();

    final hexList1 = List<String>.generate(
      hexString1.length ~/ 2,
      (i) => hexString1.substring(i * 2, i * 2 + 2),
    );
    final hexList2 = List<String>.generate(
      hexString2.length ~/ 2,
      (i) => hexString2.substring(i * 2, i * 2 + 2),
    );

  return Row(
  children: [
    Expanded(
      child: Column(
        children: [
          Text(
            path1,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (hexList1.length / 16).ceil(),
              itemBuilder: (context, index) {
                int start = index * 16;
                int end = start + 16;
                List<String> sublist1 = hexList1.sublist(start, end > hexList1.length ? hexList1.length : end);
                List<String> sublist2 = hexList2.sublist(start, end > hexList2.length ? hexList2.length : end);
                return Row(
                  children: List.generate(16, (i) {
                    if (i < sublist1.length && i < sublist2.length) {
                      bool isDifferent = sublist1[i] != sublist2[i];
                      return Expanded(
                        child: Center(
                          child: Tooltip(
                            message: 'Offset: ${start + i}',
                            child: Text(
                              sublist1[i],
                              style: isDifferent 
                                ? GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  )
                                : GoogleFonts.jetBrainsMono(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Expanded(child: SizedBox());
                    }
                  }),
                );
              },
            ),
          ),
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Text(
            path2,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (hexList2.length / 16).ceil(),
              itemBuilder: (context, index) {
                int start = index * 16;
                int end = start + 16;
                List<String> sublist1 = hexList1.sublist(start, end > hexList1.length ? hexList1.length : end);
                List<String> sublist2 = hexList2.sublist(start, end > hexList2.length ? hexList2.length : end);
                return Row(
                  children: List.generate(16, (i) {
                    if (i < sublist1.length && i < sublist2.length) {
                      bool isDifferent = sublist1[i] != sublist2[i];
                      return Expanded(
                        child: Center(
                          child: Tooltip(
                            message: 'Offset: ${start + i}',
                            child: Text(
                              sublist2[i],
                              style: isDifferent 
                                ? GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  )
                                : GoogleFonts.robotoMono(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Expanded(child: SizedBox());
                    }
                  }),
                );
              },
            ),
          ),
        ],
      ),
    ),
  ],
);
}
}

class InsertPage extends StatefulWidget {
  final File files;
  final String path1;
  final String name;

  const InsertPage(this.files, this.path1, this.name, {super.key});

  @override
  InsertPageState createState() => InsertPageState();
}

class InsertPageState extends State<InsertPage> {
  late List<TextEditingController> hexControllers;
  late List<String> hexList;

  @override
  void initState() {
    super.initState();
    final file1 = widget.files.readAsBytesSync();
    final hexString1 = hex.encode(file1).toUpperCase();

    hexList = List<String>.generate(
      hexString1.length ~/ 2,
      (i) => hexString1.substring(i * 2, i * 2 + 2),
    );

    hexControllers = hexList.map((hex) => TextEditingController(text: hex)).toList();
  }

  @override
  void dispose() {
    for (var controller in hexControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _applyChanges() async {
    final newHexString = hexControllers.map((controller) => controller.text).join();
    final newBytes = hex.decode(newHexString);

    // Convert List<int> to Uint8List
    final uint8ListBytes = Uint8List.fromList(newBytes);
    
    String fileName = 'null';
    switch (widget.name) {
      case 'MOS_GAME':
        fileName = 'ms00_game.sav';
        break;
      case 'MO1RGAME':
        fileName = 'mor1rgame.sav';
        break;
      case 'MO2RGAME':
        fileName = 'mo2r00_game.sav';
        break;
      case 'MOR4GAME':
        fileName = 'mori4game.sav';
        break;
      case 'MO5_GAME':
        fileName = 'm500_game.sav';
        break;
    }
      if(Platform.isAndroid){
      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: fileName,
        bytes: uint8ListBytes,
      );
      if (outputFile == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error saving file')),
        );
      } else if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Changes applied successfully')),
        );
      }
      }
      final FileSaveLocation? result =
      await getSaveLocation(suggestedName: fileName);
          if (result == null) {
            return;
        }

          final fileData = uint8ListBytes;
          const String mimeType = 'text/plain';
          final XFile textFile =
              XFile.fromData(fileData, mimeType: mimeType, name: fileName);
          await textFile.saveTo(result.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.path1),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _applyChanges,
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: (hexControllers.length / 16).ceil(),
                    itemBuilder: (context, index) {
                      int start = index * 16;
                      int end = start + 16;
                      List<TextEditingController> subControllers = hexControllers.sublist(
                        start,
                        end > hexControllers.length ? hexControllers.length : end,
                      );
                      return Row(
                        children: List.generate(16, (i) {
                          if (i < subControllers.length) {
                            return Expanded(
                              child: Center(
                                child: Tooltip(
                                  message: 'Offset: ${start + i}',
                                  child: TextField(
                                    controller: subControllers[i],
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    maxLength: 2,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp('[0-9A-F]')),
                                      UppercaseTextFormatter(),
                                    ],
                                    onChanged: (value) {
                                      final upperCaseValue = value.toUpperCase();
                                      if (upperCaseValue != value) {
                                        final controller = subControllers[i];
                                        controller.text = upperCaseValue;
                                        controller.selection = TextSelection.fromPosition(
                                          TextPosition(offset: upperCaseValue.length),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Expanded(child: SizedBox());
                          }
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UppercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.toUpperCase();
    return newValue.copyWith(
      text: newText,
      selection: newValue.selection.copyWith(
        baseOffset: newText.length,
        extentOffset: newText.length,
      ),
    );
  }
}