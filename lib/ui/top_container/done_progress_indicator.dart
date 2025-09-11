import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:provider/provider.dart';

class DoneProgressIndicator extends StatelessWidget {
  const DoneProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvider>(
      builder: (_, provider, child) {
        final doneCount = 0;
        final todoCount = 3;

        return Row(
          mainAxisSize: .min,
          spacing: 10,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                value: doneCount / todoCount,
                color: Colors.green,
                backgroundColor: Colors.grey,
                strokeWidth: 8,
              ),
            ),
            Text('$doneCount/$todoCount 완료', style: TextStyle(fontSize: 20),),
          ],
        );
      },
    );
  }
}