import 'package:flutter/material.dart';

class McqQuestionCard extends StatelessWidget {
  final Map<String, dynamic> mcqData;

  const McqQuestionCard({Key? key, required this.mcqData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extracting data safely from the JSON-like map
    final String question = mcqData['question'] ?? '';
    final List<String> choices = [
      mcqData['choice1'] ?? '',
      mcqData['choice2'] ?? '',
      mcqData['choice3'] ?? '',
      mcqData['choice4'] ?? '',
    ];
    final int correctOption = mcqData['correctOption'] ?? 0;
    final String explanation = mcqData['explaination'] ?? '';

    int? selectedOption;
    bool isAnswered = false;

    // Using StatefulBuilder to manage selection state locally inside this widget component
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question text
              Text(
                question,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Choices list mapping over the 4 choices
              ...List.generate(choices.length, (index) {
                final int optionNumber = index + 1;
                final bool isSelected = selectedOption == optionNumber;
                final bool isCorrect = optionNumber == correctOption;

                // Dynamic UI color styling logic based on selection state
                Color tileColor = Colors.grey[50]!;
                Color borderColor = Colors.grey[200]!;
                Color textColor = Colors.black87;

                if (isAnswered) {
                  if (isCorrect) {
                    tileColor = Colors.green[50]!;
                    borderColor = Colors.green;
                    textColor = Colors.green[900]!;
                  } else if (isSelected && !isCorrect) {
                    tileColor = Colors.red[50]!;
                    borderColor = Colors.red;
                    textColor = Colors.red[900]!;
                  }
                } else if (isSelected) {
                  tileColor = Colors.blue[50]!;
                  borderColor = Colors.blueAccent;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: InkWell(
                    onTap: isAnswered
                        ? null // Lock selections after an answer is submitted
                        : () {
                            setState(() {
                              selectedOption = optionNumber;
                              isAnswered = true;
                            });
                          },
                    borderRadius: BorderRadius.circular(12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor, width: 2),
                      ),
                      child: Row(
                        children: [
                          // Index Number Bubble
                          CircleAvatar(
                            radius: 14,
                            backgroundColor:
                                isSelected || (isAnswered && isCorrect)
                                ? borderColor
                                : Colors.grey[200],
                            child: Text(
                              '$optionNumber',
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected || (isAnswered && isCorrect)
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Choice text
                          Expanded(
                            child: Text(
                              choices[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                color: textColor,
                              ),
                            ),
                          ),
                          // State Icon Indicators
                          if (isAnswered) ...[
                            if (isCorrect)
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 22,
                              )
                            else if (isSelected)
                              const Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 22,
                              ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }),

              // Conditional Explanation Section
              if (isAnswered && explanation.isNotEmpty) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    border: Border.all(color: Colors.amber[200]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.lightbulb_outline,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Explanation',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        explanation,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
