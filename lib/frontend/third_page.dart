import 'package:eo_3ds_save_editor/backend/open.dart';
import 'package:eo_3ds_save_editor/backend/read_general.dart';
import 'package:eo_3ds_save_editor/frontend/display_utilities.dart';
import 'package:eo_3ds_save_editor/frontend/fouth_page.dart';
import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  final List keepGame;
  final int option;
  const NamePage(this.keepGame, this.option, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getTitle(getNameGame(keepGame)),
        automaticallyImplyLeading: false,
        backgroundColor: _getColor(getNameGame(keepGame)),
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 40% of the screen height
              child: TableGuild(readMembers()),
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            const Text(
              "Who",
            ),
            if (getNameGame(keepGame) != "MO2RGAME")...[
              if(option == 1)
                    FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 2)
                  FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 3)
                  FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 4)
                  FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 5)
                  FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 6 || option == 7)
                FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameListClasses(snapshot.data!, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 8)
                  FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 9)
                  FutureBuilder<List<String>>(
                future: getNames(keepGame),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ]
            
            else if(getNameGame(keepGame) == "MO2RGAME")...[
                if(option == 1)
                    FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 2)
                  FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 3)
                  FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 4)
                  FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 5)
                  FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 6 || option == 7)
                FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameListClasses(snapshot.data!, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
              if(option == 8)
                  FutureBuilder<List<String>>(
                future: getListEO2U(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropDownNameList(snapshot.data!, -1, keepGame, option);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ]
          ]
      ),
    )
    );
  }
}

Widget _getTitle(game) {
  switch(game){
    case 'MOS_GAME':
      return const Text('Etrian Odyssey Nexus');
    case 'MO1RGAME':
      return const Text('Etrian Odyssey Untold');
    case 'MO2RGAME':
      return const Text('Etrian Odyssey 2 Untold');
    case 'MOR4GAME':
      return const Text('Etrian Odyssey IV');              
    case 'MO5_GAME':
      return const Text('Etrian Odyssey V');              
  }
  return const Text('Null');
}

Color _getColor(game) {
  switch(game){
    case 'MOS_GAME':
      return Colors.blue;
    case 'MO1RGAME':
      return Colors.teal;
    case 'MO2RGAME':
      return Colors.red;
    case 'MOR4GAME':
      return Colors.green;
    case 'MO5_GAME':
      return Colors.blueGrey;
  }
  return Colors.black;
}

class ItemPage extends StatelessWidget {
  final List keepGame;
  const ItemPage(this.keepGame,  {super.key});
  static int itemOption = 0;
  
  
  @override
  //TODO add all butttons
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Items'),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    itemOption = 9;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NamePage(keepGame, itemOption),
                      ),
                    );
                  },
                  child: const Text('Edit character equipment'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BagPage(keepGame, itemOption),
                      ),
                    );
                  },
                  child: const Text('Edit bag items'),
                ),              ],
            ),
          ),
        ),
      );
    }
}