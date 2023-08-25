import 'dart:math';
import 'lists.dart';

String choice(List<String> list) {
  final random = Random();
  return list[random.nextInt(list.length)];
}

List<String> firstSentence(String tense) {
  List<String> words = [];

  String choice(List<String> list) {
    final random = Random();
    return list[random.nextInt(list.length)];
  }

  bool choiceBool() {
    return Random().nextBool();
  }

  String subjbool = choiceBool() ? "pronoun" : "noun";
  String subjnumbool = choiceBool() ? "plur" : "sing";
  bool adjective1bool = choiceBool();

  if (subjbool == "pronoun") {
    if (subjnumbool == "plur") {
      words.add(choice(pronplur));
    } else {
      words.add(choice(pronsing));
    }
  } else {
    if (subjnumbool == "plur") {
      words.add(choice(articleplur));
      if (adjective1bool) {
        words.add(choice(adjective));
        words.add(choice(nounplur));
      } else {
        words.add(choice(nounplur));
      }
    } else {
      words.add(choice(articlesing));
      if (adjective1bool) {
        words.add(choice(adjective));
        words.add(choice(nounsing));
      } else {
        words.add(choice(nounsing));
      }
    }
  }

  String attpassbool = choiceBool() ? "att" : "pass";
  String transbool = choiceBool() ? "trans" : "intrans";

  if (attpassbool == "att") {
    if (subjnumbool == "plur") {
      if (transbool == "trans") {
        if (tense == 'present') {
          words.add(choice(actPlurTrans));
        } else if (tense == "past") {
          words.add(choice(actPlurTransPast));
        } else {
          words.add("will");
          words.add(choice(actPlurTrans));
        }
      } else {
        if (tense == 'present') {
          words.add(choice(actPlurIntrans));
        } else if (tense == "past") {
          words.add(choice(actPlurIntransPast));
        } else {
          words.add("will");
          words.add(choice(actPlurIntrans));
        }
      }
    } else {
      if (transbool == "trans") {
        if (tense == 'present') {
          words.add(choice(actSingTrans));
        } else if (tense == "past") {
          words.add(choice(actPlurTransPast));
        } else {
          words.add("will");
          words.add(choice(actPlurTrans));
        }
      } else {
        if (tense == 'present') {
          words.add(choice(actSingIntrans));
        } else if (tense == 'past') {
          words.add(choice(actPlurIntransPast));
        } else {
          words.add("will");
          words.add(choice(actPlurIntrans));
        }
      }
    }
  } else {
    if (subjnumbool == "plur") {
      if (transbool == "trans") {
        if (tense == "present") {
          words.addAll(["are", choice(passverb), "by"]);
        } else if (tense == "past") {
          words.addAll(["were", choice(passverb), "by"]);
        } else {
          words.addAll(["will", "be", choice(passverb), "by"]);
        }
      } else {
        if (tense == "present") {
          words.addAll(["are", choice(passverb)]);
        } else if (tense == "past") {
          words.addAll(["were", choice(passverb)]);
        } else {
          words.addAll(["will", "be", choice(passverb)]);
        }
      }
    } else {
      if (transbool == "trans") {
        if (tense == "present") {
          words.addAll(["is", choice(passverb), "by"]);
        } else if (tense == "past") {
          words.addAll(["was", choice(passverb), "by"]);
        } else {
          words.addAll(["will", "be", choice(passverb), "by"]);
        }
      } else {
        if (tense == "present") {
          words.addAll(["is", choice(passverb)]);
        } else if (tense == "past") {
          words.addAll(["was", choice(passverb)]);
        } else {
          words.addAll(["will", "be", choice(passverb)]);
        }
      }
    }
  }

  String objnumbool = choiceBool() ? "plur" : "sing";
  bool adjective2bool = choiceBool();

  if (transbool == "trans") {
    String object1 = objnumbool == "sing" ? choice(nounsing) : choice(nounplur);
    words.add(choice(objnumbool == "sing" ? articlesing : articleplur));
    if (adjective2bool) {
      words.add(choice(adjective));
    }
    words.add(object1);
  }

  return words;
}

List<String> secondSentenceGenerator(String start, String tense) {
  List<String> words = [];

  String choice(List<String> list) {
    final random = Random();
    return list[random.nextInt(list.length)];
  }

  bool choiceBool() {
    return Random().nextBool();
  }

  if (!situation.contains(start)) {
    words.add(choice(["as soon as", "when", "and", "so that", "but"]));
  }
  if (start == "and") {
    words.add(choice(["cause", "for", "since", "when", "and"]));
  }
  if (["since", "while", "as"].contains(start)) {
    words.add("");
  }
  if (["when", "if"].contains(start)) {
    words.add(choice(["", "then"]));
  }
  if (start == "where") {
    words.add(choice(["", "there"]));
  }
  if (start == "like") {
    words.add("so");
  }
  if (start == "then") {
    words.add(choice(["and", "when", "while", "since"]));
  }
  if (["finally", "in the end", "at last", "at the beginning"]
      .contains(start)) {
    words.add(choice(["and", "but", "so", "for", "cause"]));
  }

  String subjbool = choice(["pronoun", "noun"]);
  String subjnumbool = choice(["plur", "sing"]);
  bool adjective1bool = choiceBool();

  if (subjbool == "pronoun") {
    if (subjnumbool == "plur") {
      words.add(choice(pronplur));
    } else {
      words.add(choice(pronsing));
    }
  } else {
    if (subjnumbool == "plur") {
      words.add(choice(articleplur));
      if (adjective1bool) {
        words.add(choice(adjective));
        words.add(choice(nounplur));
      } else {
        words.add(choice(nounplur));
      }
    } else {
      words.add(choice(articlesing));
      if (adjective1bool) {
        words.add(choice(adjective));
        words.add(choice(nounsing));
      } else {
        words.add(choice(nounsing));
      }
    }
  }

  String attpassbool = choice(["att", "pass"]);
  String transbool = choice(["trans", "intrans"]);

  if (attpassbool == "att") {
    if (subjnumbool == "plur") {
      if (transbool == "trans") {
        if (tense == 'present') {
          if (start == "if") {
            words.add(choice(["", "will"]));
          }
          words.add(choice(actPlurTrans));
        } else if (tense == "past") {
          if (start == "if") {
            words.addAll(["would", choice(actPlurTrans)]);
          } else {
            words.add(choice(actPlurTransPast));
          }
        } else {
          words.add("will");
          words.add(choice(actPlurTrans));
        }
      } else {
        if (tense == 'present') {
          if (start == "if") {
            words.add(choice(["", "will"]));
          }
          words.add(choice(actPlurIntrans));
        } else if (tense == "past") {
          if (start == "if") {
            words.addAll(["would", choice(actPlurIntrans)]);
          } else {
            words.add(choice(actPlurIntransPast));
          }
        } else {
          words.add("will");
          words.add(choice(actPlurIntrans));
        }
      }
    } else {
      if (transbool == "trans") {
        if (tense == 'present') {
          words.add(choice(actSingTrans));
        } else if (tense == "past") {
          if (start == "if") {
            words.addAll(["would", choice(actPlurTrans)]);
          } else {
            words.add(choice(actPlurTransPast));
          }
        } else {
          words.add("will");
          words.add(choice(actPlurTrans));
        }
      } else {
        if (tense == 'present') {
          words.add(choice(actSingIntrans));
        } else if (tense == 'past') {
          if (start == "if") {
            words.addAll(["would", choice(actPlurIntrans)]);
          } else {
            words.add(choice(actPlurIntransPast));
          }
        } else {
          words.add("will");
          words.add(choice(actPlurIntrans));
        }
      }
    }
  } else {
    if (subjnumbool == "plur") {
      if (transbool == "trans") {
        if (tense == "present") {
          words.addAll(["are", choice(passverb), "by"]);
        } else if (tense == "past") {
          words.addAll(["were", choice(passverb), "by"]);
        } else {
          words.addAll(["will", "be", choice(passverb), "by"]);
        }
      } else {
        if (tense == "present") {
          words.addAll(["are", choice(passverb)]);
        } else if (tense == "past") {
          words.addAll(["were", choice(passverb)]);
        } else {
          words.addAll(["will", "be", choice(passverb)]);
        }
      }
    } else {
      if (transbool == "trans") {
        if (tense == "present") {
          words.addAll(["is", choice(passverb), "by"]);
        } else if (tense == "past") {
          words.addAll(["was", choice(passverb), "by"]);
        } else {
          words.addAll(["will", "be", choice(passverb), "by"]);
        }
      } else {
        if (tense == "present") {
          words.addAll(["is", choice(passverb)]);
        } else if (tense == "past") {
          words.addAll(["was", choice(passverb)]);
        } else {
          words.addAll(["will", "be", choice(passverb)]);
        }
      }
    }
  }

  String objnumbool = choice(["plur", "sing"]);
  bool adjective2bool = choiceBool();

  if (transbool == "trans") {
    String object1 = objnumbool == "sing" ? choice(nounsing) : choice(nounplur);
    words.add(choice(objnumbool == "sing" ? articlesing : articleplur));
    if (adjective2bool) {
      words.add(choice(adjective));
    }
    words.add(object1);
  }

  return words;
}

List<String> recommend() {
  List<String> words = [];

  String choice(List<String> list) {
    final random = Random();
    return list[random.nextInt(list.length)];
  }

  words.add(choice(subject2));
  words.add(choice(verb21));

  if (!["Everything", "Nothing"].contains(words[0])) {
    words.add(choice(["", "not"]));
  }

  String attpassboolR = choice(["att", "intrans"]);
  String transboolR = choice(["trans", "intrans"]);

  if (attpassboolR == "att") {
    if (transboolR == "trans") {
      words.add(choice(actPlurTrans));
    } else {
      words.add(choice(actPlurIntrans));
    }
  } else {
    words.add("be");
    words.add(choice(passverb));
    if (transboolR == "trans") {
      words.add("by");
    }
  }

  String objnumboolR = choice(["plur", "sing"]);
  bool adjective2boolR = Random().nextBool();

  if (transboolR == "trans") {
    String object1 =
        objnumboolR == "sing" ? choice(nounsing) : choice(nounplur);
    words.add(choice(objnumboolR == "sing" ? articlesing : articleplur));
    if (adjective2boolR) {
      words.add(choice(adjective));
    }
    words.add(object1);
  } else {
    List<String> indirect = ["time", "place", "way"];
    String indcomp = choice(indirect);
    if (indcomp == "time") {
      words.add(choice(timecomp));
    } else if (indcomp == "place") {
      words.add(choice(placecomp));
    } else {
      words.add(choice(waycomp));
    }
  }

  return words;
}

List<String> directRecommend(String directsubject) {
  List<String> words = [];

  String choice(List<String> list) {
    final random = Random();
    return list[random.nextInt(list.length)];
  }

  words.add(directsubject);
  words.add(choice(verb21));

  if (!["Everything", "Nothing"].contains(words[0])) {
    words.add(choice(["", "not"]));
  }

  String attpassboolR = choice(["att", "intrans"]);
  String transboolR = choice(["trans", "intrans"]);

  if (attpassboolR == "att") {
    if (transboolR == "trans") {
      words.add(choice(actPlurTrans));
    } else {
      words.add(choice(actPlurIntrans));
    }
  } else {
    words.add("be");
    words.add(choice(passverb));
    if (transboolR == "trans") {
      words.add("by");
    }
  }

  String objnumboolR = choice(["plur", "sing"]);
  bool adjective2boolR = Random().nextBool();

  if (transboolR == "trans") {
    String object1 =
        objnumboolR == "sing" ? choice(nounsing) : choice(nounplur);
    words.add(choice(objnumboolR == "sing" ? articlesing : articleplur));
    if (adjective2boolR) {
      words.add(choice(adjective));
    }
    words.add(object1);
  } else {
    List<String> indirect = ["time", "place", "way"];
    String indcomp = choice(indirect);
    if (indcomp == "time") {
      words.add(choice(timecomp));
    } else if (indcomp == "place") {
      words.add(choice(placecomp));
    } else {
      words.add(choice(waycomp));
    }
  }

  return words;
}

String generateAnswer() {
  //String subjbool = choice(["pronoun", "noun"]);
  //String subjnumbool = choice(["plur", "sing"]);
  //bool adjective1bool = Random().nextBool();
  String tense = choice(["past", "present", "future"]);

  String sitbool = choice(["yes", "no"]);
  String start = '';
  List<String> words = [];

  if (sitbool == "yes") {
    start = choice(situation);
    words.add(start);
  }

  List<String> first = firstSentence(tense);
  List<String> second = secondSentenceGenerator(start, tense);
  while (first.length > 7 && second.length > 7) {
    first = firstSentence(tense);
    second = secondSentenceGenerator(start, tense);
  }
  List<String> rec = recommend();
  List<int> acapol = [2, 3];
  int rndmindx = Random().nextInt(acapol.length);
  int acapo = acapol[rndmindx];

  words = [...words, ...first, "\n", ...second, ".\n"];

  if (rec.length > acapo) {
    words = [...words, ...rec.sublist(0, acapo), "\n", ...rec.sublist(acapo)];
  } else {
    words = [...words, ...rec];
  }

  List<int> aIndices = [];
  for (int i = 0; i < words.length; i++) {
    if (words[i] == "a") {
      aIndices.add(i);
    }
  }

  for (int index in aIndices) {
    if (words[index + 1][0] == "a" ||
        words[index + 1][0] == "e" ||
        words[index + 1][0] == "i" ||
        words[index + 1][0] == "o" ||
        words[index + 1][0] == "u") {
      words[index] = "an";
    }
  }

  //String generatedString = words.join(" ").replaceAll(RegExp(r"\s+"), " ");
  String generatedString = words.join(" ");
  generatedString =
      generatedString[0].toUpperCase() + generatedString.substring(1);
  if (generatedString[0] == ' ') {
    generatedString =
        generatedString[1].toUpperCase() + generatedString.substring(2);
  }
  //generatedString = generatedString.replaceAll(RegExp(r'(?![\n])\s+'), ' ');
  generatedString = generatedString
      .replaceAll(
          RegExp(r'  '), ' ') // Replace multiple spaces with a single space
      .replaceAll(RegExp(r' \. | \.'), '. ') // Replace " ." or " . " with ". "
      .replaceAll(RegExp(r' \.\n | \.\n'), '.\n');

  return generatedString;
}

String generateDirectAnswer(String directsubject) {
  //String subjbool = choice(["pronoun", "noun"]);
  //String subjnumbool = choice(["plur", "sing"]);
  //bool adjective1bool = Random().nextBool();
  String tense = choice(["past", "present", "future"]);

  String sitbool = choice(["yes", "no"]);
  String start = '';
  List<String> words = [];

  if (sitbool == "yes") {
    start = choice(situation);
    words.add(start);
  }

  List<String> first = firstSentence(tense);
  List<String> second = secondSentenceGenerator(start, tense);
  while (first.length > 7 && second.length > 7) {
    first = firstSentence(tense);
    second = secondSentenceGenerator(start, tense);
  }
  List<String> rec = directRecommend(directsubject);
  List<int> acapol = [2, 3];
  int rndmindx = Random().nextInt(acapol.length);
  int acapo = acapol[rndmindx];

  words = [...words, ...first, "\n", ...second, ".\n"];

  if (rec.length > acapo) {
    words = [...words, ...rec.sublist(0, acapo), "\n", ...rec.sublist(acapo)];
  } else {
    words = [...words, ...rec];
  }

  List<int> aIndices = [];
  for (int i = 0; i < words.length; i++) {
    if (words[i] == "a") {
      aIndices.add(i);
    }
  }

  for (int index in aIndices) {
    if (words[index + 1][0] == "a" ||
        words[index + 1][0] == "e" ||
        words[index + 1][0] == "i" ||
        words[index + 1][0] == "o" ||
        words[index + 1][0] == "u") {
      words[index] = "an";
    }
  }

  //String generatedString = words.join(" ").replaceAll(RegExp(r"\s+"), " ");
  String generatedString = words.join(" ");
  generatedString =
      generatedString[0].toUpperCase() + generatedString.substring(1);
  if (generatedString[0] == ' ') {
    generatedString =
        generatedString[1].toUpperCase() + generatedString.substring(2);
  }
  //generatedString = generatedString.replaceAll(RegExp(r'(?![\n])\s+'), ' ');
  generatedString = generatedString
      .replaceAll(
          RegExp(r'  '), ' ') // Replace multiple spaces with a single space
      .replaceAll(RegExp(r' \. | \.'), '. ') // Replace " ." or " . " with ". "
      .replaceAll(RegExp(r' \.\n | \.\n'), '.\n');

  return generatedString;
}
