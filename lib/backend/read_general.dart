import 'dart:convert';
import 'dart:io';

import 'package:charset/charset.dart';
import 'package:eo_3ds_save_editor/backend/open.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';

var lvlist = [];
var benchlist = [];
var namelist = [];
var maxlevel = -1;
  var levelOffset = -1;
  var partyOffset = -1;
  var snameOffset = -1;
  var enameOffset = -1;
  var addOffset = -1;

  var sSkillOffset = -1;
  var eSkillOffset = -1;
  var classOffset = -1;

  var classes = {};
  var skilMult = -1;
  var skilAdd = -1;
  var skillNameFile = 'null';
  var currentspOffset = -1;
  var retirespOffset = -1;
  var guildslots = -1;
  var subclassOffset = -1;
  var sSubSkillOffset = -1;
  var eSubSkillOffset = -1;

//Equipment
var weaponOffset = -1;
var startSecondEquipmentOffset = -1;
var endSecondEquipmentOffset = -1;
var startThirdEquipmentOffset = -1;
var endThirdEquipmentOffset = -1;
var startFourthEquipmentOffset = -1;
var endFourthEquipmentOffset = -1;

List<int> weaponList = [];
List<int> equipment2List1 = [];
List<int> equipment2List2 = [];
List<int> equipment3List1 = [];
List<int> equipment3List2 = [];
List<int> equipment4List1 = [];
List<int> equipment4List2 = [];



void setGame(keepGame){
  var game = getNameGame(keepGame);
  if(game == "MOS_GAME")
  {
    maxlevel = 130;
    levelOffset = 337;
    partyOffset = 332;
    snameOffset = 512;
    enameOffset = 531;
    addOffset = 360;

    sSkillOffset = 534;
    eSkillOffset = 558;
    classOffset = 341;

    classes = {
      0: "Protector",
      1: "Medic",
      2: "Survivalist",
      3: "Ronin",
      4: "Highlander",
      5: "Gunner",
      6: "Sovereign",
      7: "Zodiac",
      8: "Ninja",
      9: "Shogun",
      10: "Landsknecht",
      11: "Nightseeker",
      12: "Imperial",
      13: "Pugilist",
      14: "Harbinger",
      15: "Hero",
      16: "WarMagus",
      17: "Arcanist",
      18: "Farmer",
    };
    skilMult = 27;
    skilAdd = 2;
    skillNameFile = 'lib/backend/skills/eox.txt';
    currentspOffset = 339;
    retirespOffset = 340;
    guildslots = 30;
    subclassOffset = 342;
    sSubSkillOffset = 562;
    eSubSkillOffset = 589;
    }
    else if(game == "MO1RGAME"){
      maxlevel = 99;

      levelOffset = 2116;
      partyOffset = 2112;
      snameOffset = 2328;
      enameOffset = 2347;
      addOffset = 384;

      sSkillOffset = 2384;
      eSkillOffset = 2408;
      classOffset = 2120;

      classes = {
        0: "Landsknecht",
        1: "Survivalist",
        2: "Protector",
        3: "Dark Hunter",
        4: "Medic",
        5: "Alchemist",
        6: "Troubador",
        7: "Ronin",
        8: "Hexer",
        9: "Highlander",
        10: "Gunner",
      };
      skilMult = 30;
      skilAdd = 6;
      skillNameFile = 'lib/backend/skills/eou.txt';
      currentspOffset = 2118;
      retirespOffset = 2119;
      guildslots = 25;
      subclassOffset = 2121;
      sSubSkillOffset = 2384;
      eSubSkillOffset = 2408;
    }
    else if(game == "MO2RGAME"){
      maxlevel = 99;

      levelOffset = 376;
      partyOffset = 372;
      snameOffset = 564;
      enameOffset = 583;
      addOffset = 264;

      sSkillOffset = 588;
      eSkillOffset = 613;
      classOffset = 380;

      classes = {
        0: "Landsknecht",
        1: "Survivalist",
        2: "Protector",
        3: "Dark Hunter",
        4: "Medic",
        5: "Alchemist",
        6: "Troubador",
        7: "Ronin",
        8: "Hexer",
        9: "Gunner",  
        10: "War Magus",  
        11: "Beast",  
        12: "Sovereign",  
        13: "Highlander",  
        14: "Fafnir",
      };
      skilMult = 30;
      skilAdd = 5;
      skillNameFile = 'lib/backend/skills/eo2u.txt';
      currentspOffset = 378;
      retirespOffset = 379;
      guildslots = 30;
      subclassOffset = 381;
      sSubSkillOffset = 588;
      eSubSkillOffset = 613;
    }
    else if(game == "MOR4GAME"){
      maxlevel = 99;
      levelOffset = 199;
      partyOffset = 196;
      snameOffset = 400;
      enameOffset = 419;
      addOffset = 364;

      sSkillOffset = 422;
      eSkillOffset = 446;
      classOffset = 200;

      classes = {
        0: 'Landsknecht',
        1: 'Nightseeker',
        2: 'Fortress',
        3: 'Sniper',
        4: 'Medic',
        5: 'Runemaster',
        6: 'Dancer',
        7: 'Arcanist',
        8: 'Bushi',
        9: 'Imperial',
      };
      skilMult = 25;
      skilAdd = 2;
      skillNameFile = 'lib/backend/skills/eo4.txt';
      currentspOffset = 421;
      retirespOffset = 490;
      guildslots = 30;
      subclassOffset = 201;
      sSubSkillOffset = 447;
      eSubSkillOffset = 471;

      weaponOffset = 204;
      startSecondEquipmentOffset = 216;
      endSecondEquipmentOffset = 217;
      startThirdEquipmentOffset = 228;
      endThirdEquipmentOffset = 229;
      startFourthEquipmentOffset = 240;
      endFourthEquipmentOffset = 241;
    }
    else if(game == "MO5_GAME"){
      maxlevel = 99;
      levelOffset = 328;
      partyOffset = 324;
      snameOffset = 504;
      enameOffset = 523;
      addOffset = 336;

      sSkillOffset = 526;
      eSkillOffset = 545;
      classOffset = 332;

      classes = {
        0: "Fencer",
        1: "Dragoon",
        2: "Warlock",
        3: "Rover",
        4: "Masurao",
        5: "Shaman",
        6: "Botanist",
        7: "Pugilist",
        8: "Harbinger",
        9: "Necromancer",
        10: "Phantom Duelist",
        11: "Chain Duelist",
        12: "Shield Bearer",
        13: "Cannon Bearer",
        14: "Omnimancer",
        15: "Elemancer",
        16: "Flying Falcon",
        17: "Hunting Hound",
        18: "Blade Dancer",
        19: "Blade Master",
        20: "Divine Punisher",
        21: "Divine Herald",
        22: "Merciful Healer",
        23: "Graced Poisoner",
        24: "Barrage Brawler",
        25: "Impact Brawler",
        26: "Deathbringer",
        27: "Deathguard",
        28: "Spirit Evoker",
        29: "Spirit Broker",
      };
      skilMult = 20;
      skilAdd = 2;
      skillNameFile = 'lib/backend/skills/eo5.txt';
      currentspOffset = 330;
      retirespOffset = 331;
      guildslots = 30;
      subclassOffset = 333;
      sSubSkillOffset = 546;
      eSubSkillOffset = 569;
    }
}


var levelOffsetR = levelOffset;
var partyOffsetR = partyOffset;
var snameOffsetR = snameOffset;
var enameOffsetR = enameOffset;
var sSkillOffsetR = sSkillOffset;
var eSkillOffsetR = eSkillOffset;
var classOffsetR = classOffset;
var currentspOffsetR = currentspOffset;
var retirespOffsetR = retirespOffset;
var subclassOffsetR = subclassOffset;
var sSubSkillOffsetR = sSubSkillOffset;
var eSubSkillOffsetR = eSubSkillOffset;

var weaponOffsetR = weaponOffset;
var startSecondEquipmentOffsetR = startSecondEquipmentOffset;
var endSecondEquipmentOffsetR = endSecondEquipmentOffset;
var startThirdEquipmentOffsetR = startThirdEquipmentOffset;
var endThirdEquipmentOffsetR = endThirdEquipmentOffset;
var startFourthEquipmentOffsetR = startFourthEquipmentOffset;
var endFourthEquipmentOffsetR = endFourthEquipmentOffset;

var skillList = [];
var skillListName = [];
var classlist = [];
var currentsplist = [];
var retiresplist = [];
var subclasslist = [];
var subskillList = [];

var equipmentList = [];

void decrypt(game) async {
for (var i = 0; i < guildslots; i++){
    lvlist.add(game[levelOffsetR]);
    benchlist.add(game[partyOffsetR]);
    classlist.add(game[classOffsetR]);
    currentsplist.add(game[currentspOffsetR]);
    retiresplist.add(game[retirespOffsetR]);
    subclasslist.add(game[subclassOffsetR]);

    var getNameEncrypted = game.sublist(snameOffsetR,enameOffsetR);
    final name = shiftJis.decode(getNameEncrypted);


    namelist.add(name.replaceAll('\x00', ' '));

    levelOffsetR += addOffset;
    partyOffsetR += addOffset;
    snameOffsetR += addOffset;
    enameOffsetR += addOffset;

    skillList.add(game.sublist(sSkillOffsetR, eSkillOffsetR));
    sSkillOffsetR += addOffset;
    eSkillOffsetR += addOffset;
    classOffsetR += addOffset;
    currentspOffsetR += addOffset;
    retirespOffsetR += addOffset;
    subclassOffsetR += addOffset;
    subskillList.add(game.sublist(sSubSkillOffsetR, eSubSkillOffsetR));
    sSubSkillOffsetR += addOffset;
    eSubSkillOffsetR += addOffset;

    decryptEquipment(
      game[weaponOffsetR],
      game[startSecondEquipmentOffsetR],
      game[endSecondEquipmentOffsetR],
      game[startThirdEquipmentOffsetR],
      game[endThirdEquipmentOffsetR],
      game[startFourthEquipmentOffsetR],
      game[endFourthEquipmentOffsetR],
    );

    equipmentList.add([
    weaponList[i],
    equipment2List1[i],
    equipment2List2[i],
    equipment3List1[i],
    equipment3List2[i],
    equipment4List1[i],
    equipment4List2[i],
    ]);

    weaponOffsetR += addOffset;
    startSecondEquipmentOffsetR += addOffset;
    endSecondEquipmentOffsetR += addOffset;
    startThirdEquipmentOffsetR += addOffset;
    endThirdEquipmentOffsetR += addOffset;
    startFourthEquipmentOffsetR += addOffset;
    endFourthEquipmentOffsetR += addOffset;

  }
}

Future<List<String>> readMembers() async {
List<String> tableName = [];

for (var id = 0; id < lvlist.length; id++) {
  var ia = lvlist[id];
  var ib = namelist[id];
  var ic = benchlist[id];
  var ie = classlist[id];
  var ig = subclasslist[id];

  if (ib != "                   ") {
    tableName.add('${id.toString().padLeft(4)} - '
          '$ib'
          '${ia.toString().padLeft(4)} '
          '${ic == 3 ? "Party".padLeft(6) : "".padLeft(6)} '
          '${classes[ie]?.padRight(14)} '
          '${ig == 255 ? "".padRight(14) : classes[ig]?.padRight(14)}');
  }
}

return tableName;
}

Future<List<String>> getNames(game) async {
List<String> tableName = [];
List<String> characterNames = [];


for (var id = 0; id < lvlist.length; id++) {
  var ia = lvlist[id];
  var ib = namelist[id];
  var ic = benchlist[id];
  var ie = classlist[id];
  var ig = subclasslist[id];

    if (ib != "                   ") {
      tableName.add('${id.toString().padLeft(4)} - '
            '$ib'
            '${ia.toString().padLeft(4)} '
            '${ic == 3 ? "Party".padLeft(6) : "".padLeft(6)} '
            '${classes[ie]?.padRight(14)} '
            '${ig == 255 ? "".padRight(14) : classes[ig]?.padRight(14)}');
        characterNames.add('$ib');
    }
  }
  return characterNames;
}

Future<List<String>> readskill(int character, game) async {
  List<String> skillDisplay = [];
  List<String> skillLines = await File(skillNameFile).readAsLines(encoding: latin1);
  
  List<String> skillListName = skillLines.sublist((classlist[character] * skilMult) + skilAdd);
  

  int id = 0;
  for (var i = 0; i < skillList[character].length; i++) {
    final a = skillList[character][i];
    final b = skillListName[i];
    skillDisplay.add('${id.toString().padLeft(4)} - ${a.toString().padRight(2)} $b');
    id++;
  }

  skillDisplay.add("Current SP: ${currentsplist[character]}");
  return skillDisplay;
}

List<String> getSkills(int character){
  List<String> skillDisplay = [];
  List<String> skillLines = File(skillNameFile).readAsLinesSync(encoding: latin1);

  List<String> skillListName = skillLines.sublist((classlist[character] * skilMult) + skilAdd);

  for (var i = 0; i < skillList[character].length; i++) {
    final b = skillListName[i];
    skillDisplay.add(b);
  }
  return skillDisplay;
}

Future<List<String>> readsubskill(int character, game) async {
  List<String> skillDisplay = [];
  List<String> skillLines = await File(skillNameFile).readAsLines(encoding: latin1);
  
  List<String> skillListName = skillLines.sublist((subclasslist[character] * skilMult) + skilAdd);
  

  int id = 0;
  for (var i = 0; i < subskillList[character].length; i++) {
    final a = subskillList[character][i];
    final b = skillListName[i];
    skillDisplay.add('${id.toString().padLeft(4)} - ${a.toString().padRight(2)} $b');
    id++;
  
  }
  skillDisplay.add("Current SP: ${currentsplist[character]}");
  return skillDisplay;
}

List<String> getSubSkills(int character){
  List<String> skillDisplay = [];
  List<String> skillLines = File(skillNameFile).readAsLinesSync(encoding: latin1);

  List<String> skillListName = skillLines.sublist((subclasslist[character] * skilMult) + skilAdd);

  for (var i = 0; i < subskillList[character].length; i++) {
    final b = skillListName[i];
    skillDisplay.add(b);
  }
  return skillDisplay;
}

bool checkSubSkills(int character){
  bool hasSkills = true;

  if (subclasslist[character] == 255) {
    hasSkills = false;
  }
  return hasSkills;
}

void saveFile(game) async{
    var idsave = 0;
    var save1 = levelOffset;
    var save2 = partyOffset;
    var save3 = sSkillOffset;
    var save4 = currentspOffset;
    var save5 = sSubSkillOffset;
    var saveClass = classOffset;
    var saveSubClass = subclassOffset;
    
    var saveWeapon = weaponOffset;
    var saveStartEquipment2 = startSecondEquipmentOffset;
    var saveEndEquipment2 = endSecondEquipmentOffset;
    var saveStartEquipment3 = startThirdEquipmentOffset;
    var saveEndEquipment3 = endThirdEquipmentOffset;
    var saveStartEquipment4 = startFourthEquipmentOffset;
    var saveEndEquipment4 = endFourthEquipmentOffset;


    for (var i = 1; i < guildslots; i++){
//check        
        game[save1] = lvlist[idsave];

        game[save2] = benchlist[idsave];

    for (int i = 0; i < skillList[idsave].length; i++) {
      game[save3 + i] = skillList[idsave][i];
    }

    game[save4] = currentsplist[idsave];

    for (int i = 0; i < subskillList[idsave].length; i++) {
      game[save5 + i] = subskillList[idsave][i];
   }

    game[saveClass] = classlist[idsave];

    game[saveSubClass] = subclasslist[idsave];

//check
    game[saveWeapon] = weaponList[idsave];
    game[saveStartEquipment2] = equipment2List1[idsave];
    game[saveEndEquipment2] = equipment2List2[idsave];
    game[saveStartEquipment3] = equipment3List1[idsave];
    game[saveEndEquipment3] = equipment3List2[idsave];
    game[saveStartEquipment4] = equipment4List1[idsave];
    game[saveEndEquipment4] = equipment4List2[idsave];



        idsave += 1;
        save1 += addOffset;
        save2 += addOffset;
        save3 += addOffset;
        save4 += addOffset;
        save5 += addOffset;
        saveClass += addOffset;
        saveSubClass += addOffset;

        saveWeapon += addOffset;
        saveStartEquipment2 += addOffset;
        saveEndEquipment2 += addOffset;
        saveStartEquipment3 += addOffset;
        saveEndEquipment3 += addOffset;
        saveStartEquipment4 += addOffset;
        saveEndEquipment4 += addOffset;
    }
    //saving
  
  
  String fileName = 'null';
  switch(getNameGame(game)){
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
  if (Platform.isAndroid) {
    String? outputFile = await FilePicker.platform.saveFile(
    dialogTitle: 'Please select an output file:',
    fileName: fileName,
    bytes: game,
  
    );

    if (outputFile == null) {
    // User canceled the picker
    }
  }
  final FileSaveLocation? result =
      await getSaveLocation(suggestedName: fileName);
  if (result == null) {
    return;
}

  final fileData = game;
  const String mimeType = 'text/plain';
  final XFile textFile =
      XFile.fromData(fileData, mimeType: mimeType, name: fileName);
  await textFile.saveTo(result.path);
}


void addToParty(character){
  if (benchlist.where((element) => element == 3).length < 6) {
      if (character >= 0 && character <= 59) {
        if (benchlist[character] == 3) {
        } else {
          benchlist[character] = 3;
        }
      }
  }
}

void removeOfParty(remInput){
  if (benchlist.where((element) => element == 3).length > 1) {
    if (remInput != null) {
        if (remInput >= 0 && remInput <= 59) {
          if (benchlist[remInput] == 1) {
          } else {
            benchlist[remInput] = 1;
          }
      }
    }
  }
}

void changeLevel(character,level){
  if (character >= 0 && character <= 59) {
    if (level != null) {
      if (level >= 1 && level <= maxlevel + 2) {
        lvlist[character] = level;
      }
    }
  } 
}

void changeSkills(character, skillidinput, skilllvinput){
    if (skillidinput != null) {
      if (skilllvinput != null) {
        skillList[character][skillidinput] = skilllvinput;
    }
  }
}

void changeSubSkills(character, skillidinput, skilllvinput){
    if (skillidinput != null) {
      if (skilllvinput != null) {
        subskillList[character][skillidinput] = skilllvinput;
    }
  }
}

void respec(character, game){
  var gameID = getNameGame(game);
  if (gameID == "MO5_GAME") {
  skillList[character] = List.filled(skilMult, 0);
  subskillList[character] = List.filled(24, 0);
  currentsplist[character] = classlist[character] > 9 ? lvlist[character] + 2 + retiresplist[character] + 5 : lvlist[character] + 2 + retiresplist[character];
} else {
  skillList[character] = List.filled(skilMult, 0);
  subskillList[character] = List.filled(skilMult, 0);
  currentsplist[character] = subclasslist[character] == 255 ? lvlist[character] + 2 + retiresplist[character] : lvlist[character] + 2 + retiresplist[character] + 5;
}
}

void changeClass(character, newClass){
  classlist[character] = newClass;
}

void changeSubclass(character, newSubClass) async{
  subclasslist[character] = newSubClass;
}

Future<List<String>> returnClasses() async{
  List<String> listClasses = [];
  classes.forEach((key, value){
    listClasses.add(value);
  });
  return listClasses;
}

Future<List<String>> getEquipmentFuture(character) async{
  List<String> hexList = equipmentList.expand((sublist) {
  return sublist.map((item) => item.toRadixString(16).padLeft(2, '0').toUpperCase());
  }).cast<String>().toList();

return hexList;
}

List<String> getEquipment(character) {
  
  List<String> hexList = equipmentList.expand((sublist) {
    return sublist.map((item) => item.toRadixString(16).padLeft(2, '0').toUpperCase());
  }).cast<String>().toList();

return hexList;
}

void setEquipment(hex1,hex2,hex3,hex4,hex5,hex6,hex7,character) {
  weaponList[character] = int.parse(hex1, radix: 16);
  equipment2List1[character] = int.parse(hex2, radix: 16);
  equipment2List2[character] = int.parse(hex3, radix: 16);
  equipment3List1[character] = int.parse(hex4, radix: 16);
  equipment3List2[character] = int.parse(hex5, radix: 16);
  equipment4List1[character] = int.parse(hex6, radix: 16);
  equipment4List2[character] = int.parse(hex7, radix: 16);

  List<int> equipment = [
    int.parse(hex1, radix: 16),
    int.parse(hex2, radix: 16),
    int.parse(hex3, radix: 16),
    int.parse(hex4, radix: 16),
    int.parse(hex5, radix: 16),
    int.parse(hex6, radix: 16),
    int.parse(hex7, radix: 16),
  ];

  equipmentList[character] = equipment;
}

void decryptEquipment(hex1,hex2,hex3,hex4,hex5,hex6,hex7) {
  weaponList.add(hex1);
  equipment2List1.add(hex2);
  equipment2List2.add(hex3);
  equipment3List1.add(hex4);
  equipment3List2.add(hex5);
  equipment4List1.add(hex6);
  equipment4List2.add(hex7);
}