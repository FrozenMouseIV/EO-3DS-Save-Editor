import 'package:eo_3ds_save_editor/backend/open.dart';
import 'package:eo_3ds_save_editor/backend/read_general.dart';
import 'package:eo_3ds_save_editor/frontend/display_utilities.dart';
import 'package:eo_3ds_save_editor/frontend/second_page.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  final int selectedName;
  final List keepGame;
  final int option;
  const ClassesPage(this.selectedName, this.keepGame, this.option, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Class'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 40% of the screen height
              child: TableGuild(returnClasses()),
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            const Text(
              "Which class",
            ),
            FutureBuilder<List<String>>(
              future: returnClasses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return DropDownNameList(snapshot.data!, selectedName, keepGame, option);
                } else {
                  return const Text('No data available');
                }
              },
            ),
          ]
      ),
    )
    );
  }
}

class LevelPage extends StatefulWidget {
  final List keepGame;
  final int selectedName;
  const LevelPage(this.keepGame, this.selectedName, {super.key});

  @override
  LevelPageState createState() => LevelPageState();
}

class LevelPageState extends State<LevelPage> {
  int selectedLevel = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select level'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 40% of the screen height
              child: TableGuild(readMembers())
            ),
            const SizedBox(height: 20), // Add some space between the table and the button
            const Text(
              "Which level",
            ),
            if (getNameGame(widget.keepGame) == "MOS_GAME")
              DropdownButton<int>(
                value: selectedLevel,
                items: List.generate(130, (index) => index + 1)
                    .map((int number) => DropdownMenuItem<int>(
                          value: number,
                          child: Text(number.toString()),
                        ))
                    .toList(),
                onChanged: (int? value) {
                  setState(() {
                    selectedLevel = value!;
                  });
                },
              )
            else
              DropdownButton<int>(
                value: selectedLevel,
                items: List.generate(99, (index) => index + 1)
                    .map((number) => DropdownMenuItem<int>(
                          value: number,
                          child: Text(number.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLevel = value!;
                  });
                },
              ),
            const SizedBox(height: 20), // Add some space between the dropdown and the button
            ElevatedButton(
              onPressed: () {
                final navigator = Navigator.of(context);
                changeLevel(widget.selectedName, selectedLevel);
                String game = getNameGame(widget.keepGame);
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
                
                  // Add other actions for different game names if needed
                
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillPage extends StatefulWidget {
  final List keepGame;
  final int selectedName;
  final int option;
  const SkillPage(this.keepGame, this.selectedName, this.option, {super.key});
  
  @override
  SkillPageState createState() => SkillPageState();
}

class SkillPageState extends State<SkillPage> {
int selectedSkill = 0;
int selectedLevel = 0;
List<int> levels = [0,1,2,3,4,5,6,7,8,9,10];
  void _refreshPage() {
      setState(() {
      });
    }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Skill Tree'),
      automaticallyImplyLeading: false,
    ),
    body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, 
            child: _buildTableSkills(widget.option, widget.selectedName, widget.keepGame),// 60% of the screen height
          ),
          const SizedBox(height: 20),
           // Add some space between the table and the button
          if (widget.option == 4)
          ...[ 
            const Text(
              "Which skill?",
            ),
            DropdownButton<int>(
          value: selectedSkill,
          onChanged: (newValue) {
            setState(() {
              selectedSkill = newValue!;
            });
          },
          items: getSkills(widget.selectedName).asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return DropdownMenuItem<int>(
              value: index,
              child: Text(item),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        DropdownButton<int>(
          value: selectedLevel,
          onChanged: (newValue) {
            setState(() {
              selectedLevel = newValue!;
            });
          },
          items: levels.map((int number)  {
            return DropdownMenuItem<int>(
              value: number,
              child: Text(number.toString()),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              changeSkills(widget.selectedName, selectedSkill, selectedLevel);
              _refreshPage();
          },
          child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final navigator = Navigator.of(context);
              String game = getNameGame(widget.keepGame);
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
          },
          child: const Text('Go back'),
          ),
          ]
          else if (widget.option == 5)
          ...[
          ElevatedButton(
              onPressed: () {
                final navigator = Navigator.of(context);
                String game = getNameGame(widget.keepGame);
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
              },
              child: const Text('Continue'),
          ),
          ]
          else if (widget.option == 8)
          ...[ 
            const Text(
              "Which skill?",
            ),
            DropdownButton<int>(
          value: selectedSkill,
          onChanged: (newValue) {
            setState(() {
              selectedSkill = newValue!;
            });
          },
          items: getSubSkills(widget.selectedName).asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return DropdownMenuItem<int>(
              value: index,
              child: Text(item),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        DropdownButton<int>(
          value: selectedLevel,
          onChanged: (newValue) {
            setState(() {
              selectedLevel = newValue!;
            });
          },
          items: levels.map((int number)  {
            return DropdownMenuItem<int>(
              value: number,
              child: Text(number.toString()),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              changeSubSkills(widget.selectedName, selectedSkill, selectedLevel);
              _refreshPage();
          },
          child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final navigator = Navigator.of(context);
              String game = getNameGame(widget.keepGame);
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
          },
          child: const Text('Go back'),
          ),
          ]
        ],
      ),
    ),
  );
}
}

Future<void> getSkillsAndMap(selectedName) async {
  List<String> skills = getSkills(selectedName);
  skills.asMap().entries.map((entry) {
    // Your mapping logic here
  }).toList();
}

Widget _buildTableSkills(option, selectedName, game) {
  if (option == 8) {
    return TableSkills(readsubskill(selectedName, game));
  } else {
    return TableSkills(readskill(selectedName, game));
  }
}