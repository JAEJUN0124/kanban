import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:kanban/themes/app_size.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StatusIsland extends StatelessWidget {
  final KanbanStatus status;

  const StatusIsland({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.StatusIslandHeight,
      child: Row(
        spacing: 7,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: status.bubbleColor,
                borderRadius: .circular(
                  AppSize.StatusIslandHeight + 10,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: .centerLeft,
              child: Row(
                spacing: 10,
                children: [
                  Icon(status.icon, size: 26,),
                  Expanded(
                    child: Text(
                      status.label,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: .w600,
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          _buildCircleBubble(
            child: Text(
              '2',
              style: TextStyle(
                fontWeight: .w600,
                fontSize: 20,
              ),
            )
          ),

          _buildCircleBubble(
            onTap: () {
              // TODO: KAnban 아이템 추가하기
              debugPrint('$status 추가하기');
              context.read<KanbanProvider>().addItem(status, 'New Task');
            },
            visible: status != KanbanStatus.done,
            child: Icon(
              LucideIcons.plus,
              size: 24,
            )
          ),
        ],
      ),
    );
  }

  Widget _buildCircleBubble({required Widget child, bool visible = true, VoidCallback? onTap}) {
    if (!visible) {
      return SizedBox.fromSize(
        size: Size.fromWidth(
          AppSize.StatusIslandHeight
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
            width: AppSize.StatusIslandHeight,
            height: AppSize.StatusIslandHeight,
            alignment: .center,
            decoration: visible
                ? BoxDecoration(
                      color: status.bubbleColor,
                      shape: BoxShape.circle,
                    )
                  : null,
                    child: visible ? child : null,
          ),
    );
  }
}