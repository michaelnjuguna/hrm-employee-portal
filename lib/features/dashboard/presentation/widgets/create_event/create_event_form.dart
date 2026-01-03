import 'package:flutter/material.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  State<CreateEventForm> createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  String? _selectedEventType;
  bool _allDay = false;

  final List<String> _eventTypes = const ['Appointment', 'Deadline', 'Meeting'];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter event title'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descController,
              minLines: 5,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    initialValue: _selectedEventType,
                    decoration: const InputDecoration(labelText: 'Type'),
                    items: _eventTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedEventType = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SwitchListTile(
                    title: Text('All Day', style: textTheme.bodySmall),
                    value: _allDay,
                    onChanged: (value) {
                      setState(() {
                        _allDay = value;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _startTimeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Start date & time',
                    ),
                    onTap: () => _pickDateTime(context, _startTimeController),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _endTimeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'End date & time',
                    ),
                    onTap: () => _pickDateTime(context, _endTimeController),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                    onPressed: _submit,
                    child: const Text('Create'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      'Create & create more',
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDateTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final localContext = context;

    final date = await showDatePicker(
      context: localContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: localContext,
      initialTime: TimeOfDay.now(),
    );

    if (!mounted || time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    controller.text =
        '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
        '${time.format(localContext)}';
  }
}
