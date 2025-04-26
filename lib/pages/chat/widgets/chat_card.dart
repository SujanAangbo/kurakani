import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kurakani/common/services/formatter.dart';
import '../../../common/entities/message_model.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.isMine,
    required this.message,
  });

  final bool isMine;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (message.isMessage)
          Container(
            constraints: BoxConstraints(
              maxWidth: 280.w,
            ),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue.withOpacity(isMine ? 1 : 0.1),
            ),
            child: Text(
              message.message,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color:
                        isMine ? Colors.white.withOpacity(0.9) : Colors.black,
                  ),
            ),
          )
        else
          Container(
            constraints: BoxConstraints(
              maxWidth: 280.w,
            ),
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue.withOpacity(isMine ? 1 : 0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.isVideo ? "Video Call" : "Audio Call",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: isMine
                            ? Colors.white.withOpacity(0.9)
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  message.callDuration,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isMine
                            ? Colors.white.withOpacity(0.9)
                            : Colors.black,
                      ),
                ),
              ],
            ),
          ),

        // message time
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Formatter.formatTime(message.time),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black.withOpacity(0.6),
                  ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.done_all,
              size: 16,
              color: message.seen ? Colors.blue : Colors.black.withOpacity(0.6),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
