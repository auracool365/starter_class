import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MathQuiz());
  }
}

class MathQuiz extends StatefulWidget {
  const MathQuiz({super.key});

  @override
  State<MathQuiz> createState() => _MathQuizState();
}

class _MathQuizState extends State<MathQuiz> {
  late final ConfettiController _confettiController;

  String? _feedback;

  static const String _correctAnswer = '4';

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _checkAnswer(String answer) {
    setState(() {
      if (answer == _correctAnswer) {
        _feedback = 'Correct!';
        _confettiController.play();
      } else {
        _feedback = 'Wrong answer. Try again!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Math Game',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'What is 2 + 2?',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _checkAnswer('3'),
                      child: const _AnswerWidget(answerLabel: "3"),
                    ),

                    ElevatedButton(
                      onPressed: () => _checkAnswer('4'),
                      child: const _AnswerWidget(answerLabel: "4"),
                    ),

                    ElevatedButton(
                      onPressed: () => _checkAnswer('5'),
                      child: const _AnswerWidget(answerLabel: "5"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                if (_feedback != null)
                  Text(_feedback!, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),

          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            numberOfParticles: 80,
          ),
        ],
      ),
    );
  }
}

class _AnswerWidget extends StatelessWidget {
  final String answerLabel;
  const _AnswerWidget({required this.answerLabel});

  @override
  Widget build(BuildContext context) {
    return Text(
      answerLabel,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
