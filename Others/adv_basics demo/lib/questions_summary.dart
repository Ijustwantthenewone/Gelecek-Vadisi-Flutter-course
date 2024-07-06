import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  List<Map<String, dynamic>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: summaryData.map(
      (data) {
        return Row(
          children: [
            Text((data["question_index"] + 1).toString()),
            Column(
              children: [
                Text(data["question_text"]),
                const SizedBox(
                  height: 5,
                ),
                Text(data["user_answer"]),
                Text(data["correct_answer"]),
              ],
            )
          ],
        );
      },
    ).toList());
  }
}
