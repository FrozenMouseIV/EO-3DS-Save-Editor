import 'dart:io';

import 'package:eo_3ds_save_editor/backend/read_general.dart';
import 'package:eo_3ds_save_editor/frontend/display_utilities.dart';
import 'package:eo_3ds_save_editor/frontend/third_page.dart';
import 'package:flutter/material.dart';

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