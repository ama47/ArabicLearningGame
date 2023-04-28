import 'package:arabic_learning_game/main.dart';

class CaptchaImage {
  // attributes of Image table
  static int? _imageId;
  static String? _image;
  static String _correctAnswer = '';
  static int? _numberOfPoints;
  static int? _numberOfMdLetters;
  static String? _isConected;
  static Map<String, dynamic>? imageQuery;

  CaptchaImage() {
    setImageQuery();
    setNumberOfPoints();
  }
  static Future<void> setImageQuery() async {
    imageQuery = await databaseService.getRandomImage();
    print(imageQuery);
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
}

class Questions {
  static final String Question1 = 'كم عدد النقاط في الصورة؟';
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