import 'package:flutter/material.dart';
import 'package:arabic_learning_game/classes/answers_generator.dart';
import 'dart:math';

// Leverl Menu
class LevelView extends StatefulWidget {
  const LevelView({super.key});

  @override
  State<LevelView> createState() => _LevelViewState();
}

class _LevelViewState extends State<LevelView> {
  void showDialogs(bool? isCorrect) {
    List<Widget> actions;
    if (isCorrect == true) {
      actions = [
        Icon(
          Icons.check,
          color: Colors.green,
          size: 100,
        ),
        Text(
          "أحسنت!",
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("إغلاق"))
      ];
    } else {
      actions = [
        Icon(
          Icons.cancel,
          color: Colors.red,
          size: 100,
        ),
        Text(
          "إجابة خاطئة!",
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              //Navigator.pop(context);
            },
            child: Text("إغلاق"))
      ];
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: actions,
              ),
            ),
          );
        });
  }

  Future<List<Answer>> setPossibleAnswers() async {
    String correctAnswer = await CaptchaImage.getNumberOfPoints();
    // convert the correct answer to intger
    int correctAnswerNum = int.parse(correctAnswer);
    //here we check if the correct answer equal to one so we can avoid 0 or nigative numbers in the answers
    int ans2 = 0, ans3 = 0, ans4 = 0;
    List<Answer> possibleAnswers = [];
    possibleAnswers.add(Answer(correctAnswer, true));
    if (correctAnswerNum == 1 ||
        correctAnswerNum ==
            2) //then make random answers equal to near the correct answer
    {
      ans2 = correctAnswerNum + 1;
      possibleAnswers.add(Answer(ans2.toString(), false));
      ans3 = ans2 + 1;
      possibleAnswers.add(Answer(ans3.toString(), false));

      if (correctAnswerNum == 2) {
        ans4 = correctAnswerNum - 1;
        possibleAnswers.add(Answer(ans4.toString(), false));
      } else {
        ans4 = ans3 + 1;
        possibleAnswers.add(Answer(ans4.toString(), false));
      }
    } else {
      ans2 = correctAnswerNum + 1;
      possibleAnswers.add(Answer(ans2.toString(), false));
      ans3 = correctAnswerNum - 1;
      possibleAnswers.add(Answer(ans3.toString(), false));

      if (Random().nextInt(1) == 0) {
        ans4 = ans2 + 1;
        possibleAnswers.add(Answer(ans4.toString(), false));
      } else {
        ans4 = ans3 - 1;
        possibleAnswers.add(Answer(ans4.toString(), false));
      }
    }
    possibleAnswers.shuffle();
    return possibleAnswers;
  }

  @override
  Widget build(BuildContext context) {
    CaptchaImage imageEntry = CaptchaImage();
    Future<List<Answer>> answers = setPossibleAnswers();
    print(answers);
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF40B4B7),
        textStyle: const TextStyle(fontSize: 40),
        fixedSize: Size(224, 77));
    return Scaffold(
        backgroundColor: Color(0xFFD4ECEC),
        appBar: AppBar(
          title: Text(
            ('مرحلة 1 - جزئية 1'),
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${Questions.Question1}',
                style: TextStyle(fontSize: 32),
              ),
              Container(
                  child: FutureBuilder(
                      future: CaptchaImage.getImageData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          // data is available, display it
                          return Image.asset('assets/images/${snapshot.data!}');
                        } else if (snapshot.hasError) {
                          // an error occurred while fetching the data, display an error message
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // data is not yet available, display a loading indicator
                          return CircularProgressIndicator();
                        }
                      })),
              Container(
                  child: FutureBuilder(
                      future: setPossibleAnswers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Answer>> snapshot) {
                        if (snapshot.hasData) {
                          // data is available, display it
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                      child: ElevatedButton(
                                    child: Text('${snapshot.data![0].answer}'),
                                    onPressed: () {
                                      showDialogs(snapshot.data![0].isCorrect);
                                    },
                                  )),
                                  Flexible(
                                      child: ElevatedButton(
                                    child: Text('${snapshot.data![1].answer}'),
                                    onPressed: () {
                                      showDialogs(snapshot.data![1].isCorrect);
                                    },
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: ElevatedButton(
                                    child: Text('${snapshot.data![2].answer}'),
                                    onPressed: () {
                                      showDialogs(snapshot.data![2].isCorrect);
                                    },
                                  )),
                                  Flexible(
                                      child: ElevatedButton(
                                    child: Text('${snapshot.data![3].answer}'),
                                    onPressed: () {
                                      showDialogs(snapshot.data![3].isCorrect);
                                    },
                                  ))
                                ],
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          // an error occurred while fetching the data, display an error message
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // data is not yet available, display a loading indicator
                          return CircularProgressIndicator();
                        }
                      })),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('التالي'),
              ),
            ],
          ),
        )));
  }
}
