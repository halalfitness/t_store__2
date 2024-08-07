import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/buttons/rounded_text_button.dart';
import 'package:t_store/features/authentication/models/programme_model.dart';
import 'package:t_store/features/authentication/screens/programmes/data/programme_data.dart';
import 'package:t_store/features/authentication/screens/programmes/widgets/web_view.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProgrammesScreen extends StatefulWidget {
  @override
  _ProgrammesScreenState createState() => _ProgrammesScreenState();
}

class _ProgrammesScreenState extends State<ProgrammesScreen> {
  int currentLevelIndex = 0;
  List<Level> levels = sampleLevels;
  int dopaminePoints = 0; // To track user's points

  void completeTask(Level level, Task task) {
    setState(() {
      final levelIndex = levels.indexOf(level);
      final taskIndex = levels[levelIndex].tasks.indexOf(task);
      levels[levelIndex].tasks[taskIndex].isCompleted = true;
      dopaminePoints += 10; // Award points for completing a task
    });
  }

  void nextLevel() {
    if (currentLevelIndex < levels.length - 1) {
      setState(() {
        currentLevelIndex++;
      });
    }
  }

  void previousLevel() {
    if (currentLevelIndex > 0) {
      setState(() {
        currentLevelIndex--;
      });
    }
  }

  void startWorkout() {
    // Navigate to the PoseEstimationWebView screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PoseEstimationWebView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final currentLevel = levels[currentLevelIndex];
    return Scaffold(
      backgroundColor: dark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          'Level ${currentLevel.levelNumber}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: dark ? Colors.black : Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'dopaMine Points: $dopaminePoints',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: dark ? Colors.green : Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentLevel.tasks.length,
              itemBuilder: (context, index) {
                final task = currentLevel.tasks[index];
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      task.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: dark ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.description,
                          style: TextStyle(
                            color: dark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                        Text(
                          'Time: ${task.time}',
                          style: TextStyle(
                            color: dark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        task.isCompleted
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: task.isCompleted ? Colors.green : null,
                      ),
                      onPressed: task.isCompleted
                          ? null
                          : () {
                              completeTask(currentLevel, task);
                            },
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TRoundedTextButton(
                    text: "Start Workout",
                    backgroundColor: Color.fromARGB(255, 65, 149, 67),
                    onPressed: startWorkout,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentLevelIndex > 0)
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: TRoundedTextButton(
                          text: "Previous Level",
                          onPressed: previousLevel,
                        ),
                      ),
                    if (currentLevelIndex < levels.length - 1)
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TRoundedTextButton(
                          text: "Next Level",
                          onPressed: () {},
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
