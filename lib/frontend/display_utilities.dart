import 'package:eo_3ds_save_editor/backend/open.dart';
import 'package:eo_3ds_save_editor/backend/read_general.dart';
import 'package:eo_3ds_save_editor/frontend/fouth_page.dart';
import 'package:eo_3ds_save_editor/frontend/second_page.dart';
import 'package:flutter/material.dart';

class TableGuild extends StatelessWidget {
  final Future<List<String>> gameData;
  const TableGuild(this.gameData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<String>>(
          future: gameData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return Column(
                children: [
                  Center(
                    child: Table(
                      border: TableBorder.all(),
                      children: snapshot.data!.map((row) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(row),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class TableSkills extends StatelessWidget {
  final Future<List<String>> gameData;
  const TableSkills(this.gameData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<String>>(
          future: gameData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return Column(
                children: [
                  Center(
                    child: Table(
                      border: TableBorder.all(),
                      children: snapshot.data!.map((row) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(row),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class DisplayClasses extends StatelessWidget{
  final Future<List<String>> gameData;
  const DisplayClasses(this.gameData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: DictionaryDisplay(returnClasses()),
    );
  }
}

class DictionaryDisplay extends StatelessWidget {
  final Future<List<String>> classes;
  const DictionaryDisplay(this.classes, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: classes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index]),
              );
            },
          );
        }
      },
    );
  }
}

class DropDownNameList extends StatefulWidget {
  final List<String> className;
  final int selectedClass;
  final List keepGame;
  final int option;
  const DropDownNameList(this.className, this.selectedClass, this.keepGame, this.option, {super.key});

  @override
  DropDownListState createState() => DropDownListState();
}

class DropDownListState extends State<DropDownNameList> {
  int? selectedName;
  String errorMessage = "Null";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<int>(
          value: selectedName,
          onChanged: (newValue) {
            setState(() {
              selectedName = newValue;
            });
          },
          items: widget.className.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return DropdownMenuItem<int>(
              value: index,
              child: Text(item),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: (){
          String game = getNameGame(widget.keepGame);
          final navigator = Navigator.of(context);
          if (selectedName != null && widget.option == 1){
            navigator.push(
              MaterialPageRoute(builder: (context) => LevelPage(widget.keepGame, selectedName!)),
            );
          }
          else if (selectedName != null && widget.option == 2){
            addToParty(selectedName);
            switch(game){
              case 'MOS_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NexusPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO1RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold1Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO2RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold2Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MOR4GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => IVPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO5_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => VPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
            }
          }
          else if (selectedName != null && widget.option == 3){
            removeOfParty(selectedName);
            switch(game){
              case 'MOS_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NexusPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO1RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold1Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO2RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold2Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MOR4GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => IVPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO5_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => VPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
            }
          }
          else if (selectedName != null && widget.option == 4){
            navigator.push(
              MaterialPageRoute(builder: (context) => SkillPage(widget.keepGame, selectedName!, widget.option)),
            );
          }
          else if (selectedName != null && widget.option == 5){
            respec(selectedName, widget.keepGame);
            navigator.push(
              MaterialPageRoute(builder: (context) => SkillPage(widget.keepGame, selectedName!, widget.option)),
            );
          }
          else if (selectedName != null && widget.option == 6) {
            changeClass(widget.selectedClass, selectedName);
            switch(game){
              case 'MOS_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NexusPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO1RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold1Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO2RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold2Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MOR4GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => IVPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO5_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => VPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
            }
          }
          else if (selectedName != null && widget.option == 7) 
          {
            changeSubclass(widget.selectedClass, selectedName);
            switch(game){
              case 'MOS_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => NexusPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO1RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold1Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO2RGAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Untold2Page(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MOR4GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => IVPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
              case 'MO5_GAME':
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => VPage(widget.keepGame)),
                  ModalRoute.withName('MyHomePage')
                );
                break;
            }
          }
          else if (selectedName != null && widget.option == 8){
            if(checkSubSkills(selectedName!)){
              navigator.push(
              MaterialPageRoute(builder: (context) => SkillPage(widget.keepGame, selectedName!, widget.option)),
              );
            }
            else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('This character has no subclass.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Confirm'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          }
          else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('No item selected'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Confirm'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class DropDownNameListClasses extends StatefulWidget {
  final List<String> characterNames;
  final List keepGame;
  final int option;
  const DropDownNameListClasses(this.characterNames, this.keepGame, this.option, {super.key});

  @override
  DropDownListStateClasses createState() => DropDownListStateClasses();
}

class DropDownListStateClasses extends State<DropDownNameListClasses> {
  int? selectedName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<int>(
          value: selectedName,
          onChanged: (newValue) {
            setState(() {
              selectedName = newValue;
            });
          },
          items: widget.characterNames.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return DropdownMenuItem<int>(
              value: index,
              child: Text(item),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (selectedName != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ClassesPage(selectedName!, widget.keepGame, widget.option),
                ),
              );
              // You can also return this value to the caller or perform other actions.
            } else {
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

Future<List<String>> getListEO2U(){
List<String> listNumbers = [];
for(int i = 0;i < 30; i++){
  listNumbers.add("$i");
}
return Future.value(listNumbers);
} 