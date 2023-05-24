import 'package:arabic_learning_game/main.dart';

class CaptchaImage {
  // attributes of Image table
  static int? _imageId;
  static String? _image;
  static int? _numberOfPoints;
  static int? _numberOfMdLetters;
  static String? _isConected;
  static String? _word;
  static Map<String, dynamic>? imageQuery;

  CaptchaImage() {
    setImageQuery();
    setWord();
    setNumberOfPoints();
    setNumberOfMdLetters();
    setIsConnected();
  }
  static Future<void> setImageQuery() async {
    imageQuery = await databaseService.getRandomImage();
    // add refreah method
  }

  static Future<String> getImageData() async {
    //imageId = imageQuery['image_id'];
    _image = imageQuery!['image'];
    //numberOfPoints = imageQuery['number_of_points'];
    //numberOfMdLetters = imageQuery['number_of_md_letters'];
    //isConected = imageQuery['is_connected'];
    return '$_image';
  }

  static Future<void> setNumberOfPoints() async {
    _numberOfPoints = imageQuery!['number_of_points'];
  }

  static Future<String> getNumberOfPoints() async {
    return '$_numberOfPoints';
  }

  static Future<String> getWord() async => '$_word';

  static Future<void> setWord() async {
    _word = imageQuery!['word'];
  }

  static Future<String> getNumberOfMdLetters() async => '$_numberOfMdLetters';

  static Future<void> setNumberOfMdLetters() async {
    _numberOfMdLetters = imageQuery!['number_of_md_letters'];
  }

  static Future<String> getIsConnected() async => '$_isConected';

  static Future<void> setIsConnected() async {
    _isConected = imageQuery!['is_connected'];
  }
}

class Answer {
  String? answer;
  bool? isCorrect;
  Answer(String answer, bool isCorrect) {
    this.answer = answer;
    this.isCorrect = isCorrect;
  }
}
/*
 static Future<void> setPossibleAnswers() async {
    _correctAnswer = imageQuery!['number_of_points'];
    _possibleAnswers.add(Answer(_correctAnswer, true));
    for (var i = 0; i < 3; i++) {
      int wrongAnswer = Random().nextInt(10);
      _possibleAnswers.add(Answer(wrongAnswer.toString(), false));
    }
    print(_possibleAnswers);
    _possibleAnswers.shuffle();
  }

  static Future<List<Answer>> getPossibleAnswers() async {
    return _possibleAnswers;
  }
}
*/