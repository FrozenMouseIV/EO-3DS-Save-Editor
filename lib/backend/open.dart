import 'dart:io';

import 'package:charset/charset.dart';

Future<String> read(file) async {
  // Specify the file path
  final filePath = file;

  // Read the file as bytes
  var fileBytes = [0,1,2,3,4,5,6,7];
  try{
    fileBytes = await File(filePath).readAsBytes();
  }
  catch(e){
    fileBytes;
  }

  var firstEightChars = fileBytes.sublist(0,8);
  // Decode the bytes using Shift-JIS encoding
  final decodedString = shiftJis.decode(firstEightChars);

  // Return the decoded string
  return decodedString;
}

Future<List> keep(file) async {
  // Specify the file path
  final filePath = file;

  // Read the file as bytes
  var fileBytes = [0,1,2,3,4,5,6,7];
  try{
    fileBytes = await File(filePath).readAsBytes();
  }
  catch(e){
    fileBytes;
  }
  // Return the file data
  return fileBytes;
}

Future<String> check(file) async {
  var firstEightChars = file.sublist(0,8);
  // Decode the bytes using Shift-JIS encoding
  final decodedString = shiftJis.decode(firstEightChars);

  // Return the decoded string
  return decodedString;
}

String getNameGame(file){
  var firstEightChars = file.sublist(0,8);
  // Decode the bytes using Shift-JIS encoding
  final decodedString = shiftJis.decode(firstEightChars);

  // Return the decoded string
  return decodedString;
}