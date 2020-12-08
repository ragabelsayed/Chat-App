import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this._message, this._isMe, {this.key});
  final Key key;
  final String _message;
  final bool _isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: _isMe ? Colors.grey[300] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: _isMe ? Radius.circular(0) : Radius.circular(12),
              bottomLeft: !_isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          //width: 140,
          constraints: BoxConstraints(
            maxWidth: 240,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            _message,
            style: TextStyle(
              color: _isMe
                  ? Colors.black
                  : Theme.of(context).accentTextTheme.headline1.color,
            ),
          ),
        ),
      ],
    );
  }
}
