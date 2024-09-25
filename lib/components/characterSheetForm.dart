import 'package:flutter/material.dart';

class CharacterSheetForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  const CharacterSheetForm({Key? key, required this.onSave}) : super(key: key);

  @override
  _CharacterSheetFormState createState() => _CharacterSheetFormState();
}

class _CharacterSheetFormState extends State<CharacterSheetForm> {
  final _formKey = GlobalKey<FormState>();

  String _characterName = '';
  Map<String, int> _attributes = {
    'Strength': 0,
    'Agility': 0,
    'Coordination': 0,
    'Intelligence': 0,
    'Willpower': 0
  };
  Map<String, int> _skills = {
    'Athletics': 0,
    'Stealth': 0,
    'Persuasion': 0,
    'Investigation': 0
  };
  int _momentum = 0;
  int _stress = 0;

  // Helper method to build number input fields (for attributes or skills)
  Widget _buildNumberInputField(
      String label, int currentValue, Function(int) onChanged) {
    return Row(
      children: [
        Text(label),
        SizedBox(width: 20),
        DropdownButton<int>(
          value: currentValue,
          onChanged: (value) {
            setState(() {
              onChanged(value!);
            });
          },
          items: List.generate(
              21,
              (index) => DropdownMenuItem(
                    value: index,
                    child: Text('$index'),
                  )),
        ),
      ],
    );
  }

  // On form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare character data to pass back to the parent
      Map<String, dynamic> characterData = {
        'name': _characterName,
        'attributes': _attributes,
        'skills': _skills,
        'momentum': _momentum,
        'stress': _stress,
      };

      // Call the onSave callback passed in the widget
      widget.onSave(characterData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character Name Field
            TextFormField(
              decoration: const InputDecoration(labelText: 'Character Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a character name';
                }
                return null;
              },
              onSaved: (value) {
                _characterName = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nationality'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a character name';
                }
                return null;
              },
              onSaved: (value) {
                _characterName = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Rank'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a character name';
                }
                return null;
              },
              onSaved: (value) {
                _characterName = value!;
              },
            ),

            // Attributes Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Attributes',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            ..._attributes.entries
                .map((entry) => _buildNumberInputField(entry.key, entry.value,
                    (newValue) => _attributes[entry.key] = newValue))
                .toList(),

            // Skills Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Skills',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            ..._skills.entries
                .map((entry) => _buildNumberInputField(entry.key, entry.value,
                    (newValue) => _skills[entry.key] = newValue))
                .toList(),

            // Momentum
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Momentum',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            _buildNumberInputField(
                'Momentum', _momentum, (newValue) => _momentum = newValue),

            // Stress
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Stress',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            _buildNumberInputField(
                'Stress', _stress, (newValue) => _stress = newValue),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save Character'),
            ),
          ],
        ),
      ),
    );
  }
}
