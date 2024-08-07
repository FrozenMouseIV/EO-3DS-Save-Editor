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

var bagStartOffset = [];
var bagEndOffset = [];

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

    bagStartOffset =[
      22596,
      22600,
      22604,
      22608,
      22612,
      22616,
      22620,
      22624,
      22628,
      22632,
      22636,
      22640,
      22644,
      22648,
      22652,
      22656,
      22660,
      22664,
      22668,
      22672,
      22676,
      22680,
      22684,
      22688,
      22692,
      22696,
      22700,
      22704,
      22708,
      22712,
      22716,
      22720,
      22724,
      22728,
      22732,
      22736,
      22740,
      22744,
      22748,
      22752,
      22756,
      22760,
      22764,
      22768,
      22772,
      22776,
      22780,
      22784,
      22788,
      22792,
      22796,
      22800,
      22804,
      22808,
      22812,
      22816,
      22820,
      22824,
      22828,
      22832
    ];

    bagEndOffset = [
      22597,
      22601,
      22605,
      22609,
      22613,
      22617,
      22621,
      22625,
      22629,
      22633,
      22637,
      22641,
      22645,
      22649,
      22653,
      22657,
      22661,
      22665,
      22669,
      22673,
      22677,
      22681,
      22685,
      22689,
      22693,
      22697,
      22701,
      22705,
      22709,
      22713,
      22717,
      22721,
      22725,
      22729,
      22733,
      22737,
      22741,
      22745,
      22749,
      22753,
      22757,
      22761,
      22765,
      22769,
      22773,
      22777,
      22781,
      22785,
      22789,
      22793,
      22797,
      22801,
      22805,
      22809,
      22813,
      22817,
      22821,
      22825,
      22829,
      22833
    ];
      
    weaponOffset = 348;
    startSecondEquipmentOffset = 352;
    endSecondEquipmentOffset = 353;
    startThirdEquipmentOffset = 356;
    endThirdEquipmentOffset = 357;
    startFourthEquipmentOffset = 360;
    endFourthEquipmentOffset = 361;

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

      bagStartOffset = [
        12644,
        12656,
        12668,
        12680,
        12692,
        12704,
        12716,
        12728,
        12740,
        12752,
        12764,
        12776,
        12788,
        12800,
        12812,
        12824,
        12836,
        12848,
        12860,
        12872,
        12884,
        12896,
        12908,
        12920,
        12932,
        12944,
        12956,
        12968,
        12980,
        12992,
        13004,
        13016,
        13028,
        13040,
        13052,
        13064,
        13076,
        13088,
        13100,
        13112,
        13124,
        13136,
        13148,
        13160,
        13172,
        13184,
        13196,
        13208,
        13220,
        13232,
        13244,
        13256,
        13268,
        13280,
        13292,
        13304,
        13316,
        13328,
        13340,
        13352
      ];
      
      bagEndOffset =[
        12645,
        12657,
        12669,
        12681,
        12693,
        12705,
        12717,
        12729,
        12741,
        12753,
        12765,
        12777,
        12789,
        12801,
        12813,
        12825,
        12837,
        12849,
        12861,
        12873,
        12885,
        12897,
        12909,
        12921,
        12933,
        12945,
        12957,
        12969,
        12981,
        12993,
        13005,
        13017,
        13029,
        13041,
        13053,
        13065,
        13077,
        13089,
        13101,
        13113,
        13125,
        13137,
        13149,
        13161,
        13173,
        13185,
        13197,
        13209,
        13221,
        13233,
        13245,
        13257,
        13269,
        13281,
        13293,
        13305,
        13317,
        13329,
        13341,
        13353
      ];

      weaponOffset = 2132;
      startSecondEquipmentOffset = 2144;
      endSecondEquipmentOffset = 2145;
      startThirdEquipmentOffset = 2156;
      endThirdEquipmentOffset = 2157;
      startFourthEquipmentOffset = 2168;
      endFourthEquipmentOffset = 2169;

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

      bagStartOffset =[
        8784,
        8788,
        8792,
        8796,
        8800,
        8804,
        8808,
        8812,
        8816,
        8820,
        8824,
        8828,
        8832,
        8836,
        8840,
        8844,
        8848,
        8852,
        8856,
        8860,
        8864,
        8868,
        8872,
        8876,
        8880,
        8884,
        8888,
        8892,
        8896,
        8900,
        8904,
        8908,
        8912,
        8916,
        8920,
        8924,
        8928,
        8932,
        8936,
        8940,
        8944,
        8948,
        8952,
        8956,
        8960,
        8964,
        8968,
        8972,
        8976,
        8980,
        8984,
        8988,
        8992,
        8996,
        9000,
        9004,
        9008,
        9012,
        9016,
        9020,
      ];

      bagEndOffset =[
        8785,
        8789,
        8793,
        8797,
        8801,
        8805,
        8809,
        8813,
        8817,
        8821,
        8825,
        8829,
        8833,
        8837,
        8841,
        8845,
        8849,
        8853,
        8857,
        8861,
        8865,
        8869,
        8873,
        8877,
        8881,
        8885,
        8889,
        8893,
        8897,
        8901,
        8905,
        8909,
        8913,
        8917,
        8921,
        8925,
        8929,
        8933,
        8937,
        8941,
        8945,
        8949,
        8953,
        8957,
        8961,
        8965,
        8969,
        8973,
        8977,
        8981,
        8985,
        8989,
        8993,
        8997,
        9001,
        9005,
        9009,
        9013,
        9017,
        9021,
      ];

      weaponOffset = 1720;
      startSecondEquipmentOffset = 1724;
      endSecondEquipmentOffset = 1725;
      startThirdEquipmentOffset = 1728;
      endThirdEquipmentOffset = 1729;
      startFourthEquipmentOffset = 1732;
      endFourthEquipmentOffset = 1733;

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

      bagStartOffset = [
        11616,
        11628,
        11640,
        11652,
        11664,
        11676,
        11688,
        11700,
        11712,
        11724,
        11736,
        11748,
        11760,
        11772,
        11784,
        11796,
        11808,
        11820,
        11832,
        11844,
        11856,
        11868,
        11880,
        11892,
        11904,
        11916,
        11928,
        11940,
        11952,
        11964,
        11976,
        11988,
        12000,
        12012,
        12024,
        12036,
        12048,
        12060,
        12072,
        12084,
        12096,
        12108,
        12120,
        12132,
        12144,
        12156,
        12168,
        12180,
        12192,
        12204,
        12216,
        12228,
        12240,
        12252,
        12264,
        12276,
        12288,
        12300,
        12312,
        12324,
      ];
      bagEndOffset= [
        11617,
        11629,
        11641,
        11653,
        11665,
        11677,
        11689,
        11701,
        11713,
        11725,
        11737,
        11749,
        11761,
        11773,
        11785,
        11797,
        11809,
        11821,
        11833,
        11845,
        11857,
        11869,
        11881,
        11893,
        11905,
        11917,
        11929,
        11941,
        11953,
        11965,
        11977,
        11989,
        12001,
        12013,
        12025,
        12037,
        12049,
        12061,
        12073,
        12085,
        12097,
        12109,
        12121,
        12133,
        12145,
        12157,
        12169,
        12181,
        12193,
        12205,
        12217,
        12229,
        12241,
        12253,
        12265,
        12277,
        12289,
        12301,
        12313,
        12325,
      ];

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

      bagStartOffset =[
        10972,
        10976,
        10980,
        10984,
        10988,
        10992,
        10996,
        11000,
        11004,
        11008,
        11012,
        11016,
        11020,
        11024,
        11028,
        11032,
        11036,
        11040,
        11044,
        11048,
        11052,
        11056,
        11060,
        11064,
        11068,
        11072,
        11076,
        11080,
        11084,
        11088,
        11092,
        11096,
        11100,
        11104,
        11108,
        11112,
        11116,
        11120,
        11124,
        11128,
        11132,
        11136,
        11140,
        11144,
        11148,
        11152,
        11156,
        11160,
        11164,
        11168,
        11172,
        11176,
        11180,
        11184,
        11188,
        11192,
        11196,
        11200,
        11204,
        11208
      ];

      bagEndOffset = [
        10973,
        10977,
        10981,
        10985,
        10989,
        10993,
        10997,
        11001,
        11005,
        11009,
        11013,
        11017,
        11021,
        11025,
        11029,
        11033,
        11037,
        11041,
        11045,
        11049,
        11053,
        11057,
        11061,
        11065,
        11069,
        11073,
        11077,
        11081,
        11085,
        11089,
        11093,
        11097,
        11101,
        11105,
        11109,
        11113,
        11117,
        11121,
        11125,
        11129,
        11133,
        11137,
        11141,
        11145,
        11149,
        11153,
        11157,
        11161,
        11165,
        11169,
        11173,
        11177,
        11181,
        11185,
        11189,
        11193,
        11197,
        11201,
        11205,
        11209,
      ];

      weaponOffset = 340;
      startSecondEquipmentOffset = 344;
      endSecondEquipmentOffset = 345;
      startThirdEquipmentOffset = 348;
      endThirdEquipmentOffset = 349;
      startFourthEquipmentOffset = 352;
      endFourthEquipmentOffset = 353;

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

List<List<int>> equipmentList = [];
var bagListStart = [];
var bagListEnd = [];

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
  for(var i = 0; i < 30; i++){
    bagListStart.add(
      game[bagStartOffset[i]]
    );
    bagListEnd.add(
      game[bagEndOffset[i]]
    );
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

    var saveBagStart = bagStartOffset;
    var saveBagEnd = bagEndOffset;



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
    for (var i = 0; i < 30; i++){
      game[saveBagStart[i]] = bagListStart[i];
      game[saveBagEnd[i]] = bagListEnd[i];
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
  List<String> hexList = [];
  for (var item in equipmentList[character]) {
    hexList.add(item.toRadixString(16).padLeft(2, '0').toUpperCase());
  }
  return hexList;
}

List<String> getEquipment(character) {
  List<String> hexList = [];
  for (var item in equipmentList[character]) {
    hexList.add(item.toRadixString(16).padLeft(2, '0').toUpperCase());
  }
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

List<String> getBagStart(){
  return bagListStart.map((number) => number.toRadixString(16).padLeft(2, '0').toUpperCase()).toList().cast<String>();
}

List<String> getBagEnd(){
    return bagListEnd.map((number) => number.toRadixString(16).padLeft(2, '0').toUpperCase()).toList().cast<String>();
}
void setItemBag(selectedValuesStart, selectedValuesEnd){
  for(var i = 0; i< 30; i++)
  {  
    bagListStart[i] = int.parse(selectedValuesStart[i], radix: 16);
    bagListEnd[i] = int.parse(selectedValuesEnd[i], radix: 16);
  }
  
}