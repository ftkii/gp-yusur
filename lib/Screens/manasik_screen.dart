import 'package:flutter/material.dart';
import 'package:yusur_app/widget/arrow.dart';
import '/widget/task_list_widget.dart';

//الشاشه الرئيسيه الي تعرضها
class ManasikScreen extends StatefulWidget {
  const ManasikScreen({super.key});

  @override
  State<ManasikScreen> createState() => _ManasikScreenState();
}

class _ManasikScreenState extends State<ManasikScreen> {
  final List<bool> completedTasks = List.generate(7, (_) => false);

  int get completedCount =>
      completedTasks.where((isCompleted) => isCompleted).length;
  int get totalTasks => completedTasks.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Manasik",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16, top: 16),
            child: ArrowIcon(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Track your Hajj rituals step by step.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),
            TaskHeaderWidget(
                completedCount: completedCount, totalTasks: totalTasks),
            const SizedBox(height: 20),
            Expanded(
                child: TaskListWidget(
                    completedTasks: completedTasks,
                    onUpdate: () => setState(() {}))),
          ],
        ),
      ),
    );
  }
}

class TaskHeaderWidget extends StatelessWidget {
  final int completedCount;
  final int totalTasks;

  const TaskHeaderWidget({
    super.key,
    required this.completedCount,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    double progress = completedCount / totalTasks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey[300],
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFB7AD9F)),
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFB7AD9F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Task",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
