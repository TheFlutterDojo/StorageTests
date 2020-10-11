import 'package:flutter/material.dart';

typedef Future<bool> AddTaskFunction(String taskText);

class AddTaskInput extends StatefulWidget {
  final AddTaskFunction onTaskAdded;

  AddTaskInput({this.onTaskAdded});

  @override
  State<StatefulWidget> createState() => _AddTaskInputState();
}

class _AddTaskInputState extends State<AddTaskInput> {
  TextEditingController _controller;
  bool buttonEnabled = false;
  bool isSubmitting = false;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(_onTextChange);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChange);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChange() {
    setState(() {
      buttonEnabled = _controller.text.length > 0;
    });
  }

  void _submitTask() {
    setState(() {
      isSubmitting = true;
    });

    widget.onTaskAdded(_controller.text).then((addedSuccess) {
      _controller.text = "";
      setState(() {
        isSubmitting = false;
        buttonEnabled = _controller.text.length > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: !isSubmitting,
      controller: _controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.add),
            onPressed: buttonEnabled && !isSubmitting ? _submitTask : null,
          ),
          hintText: "Type here to add a task..."),
    );
  }
}
