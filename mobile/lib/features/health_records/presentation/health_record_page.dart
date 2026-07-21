import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HealthRecordsPage extends StatefulWidget {
  const HealthRecordsPage({super.key});

  @override
  State<HealthRecordsPage> createState() => _HealthRecordsPageState();
}

class _HealthRecordsPageState extends State<HealthRecordsPage> {
  final List<Map<String, String>> _vaccinations = [];
  final List<Map<String, String>> _medicalHistory = [];
  final List<Map<String, String>> _medications = [];
  final List<Map<String, String>> _vetVisits = [];

  String _healthStatus = 'Healthy';

  String _animalName = 'Animal';
  String _species = 'Not specified';
  String _breed = 'Not specified';
  String _dateOfBirth = 'Not provided';
  String _estimatedAge = 'Not provided';

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text =
          '${picked.day} ${_monthName(picked.month)} ${picked.year}';
    }
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  void _showEditAnimalDetailsDialog() {
    final nameController = TextEditingController(
      text: _animalName == 'Animal' ? '' : _animalName,
    );
    final speciesController = TextEditingController(
      text: _species == 'Not specified' ? '' : _species,
    );
    final breedController = TextEditingController(
      text: _breed == 'Not specified' ? '' : _breed,
    );
    final dateOfBirthController = TextEditingController(
      text: _dateOfBirth == 'Not provided' ? '' : _dateOfBirth,
    );
    final estimatedAgeController = TextEditingController(
      text: _estimatedAge == 'Not provided' ? '' : _estimatedAge,
    );

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Animal Information'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Animal Name',
                    hintText: 'e.g. Buddy',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: speciesController,
                  decoration: const InputDecoration(
                    labelText: 'Species',
                    hintText: 'e.g. Dog',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: breedController,
                  decoration: const InputDecoration(
                    labelText: 'Breed',
                    hintText: 'e.g. Golden Retriever',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: dateOfBirthController,
                  readOnly: true,
                  onTap: () => _selectDate(dialogContext, dateOfBirthController),
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'Tap to select date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: estimatedAgeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Estimated Age (years)',
                    hintText: 'e.g. 4',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  _animalName = nameController.text.trim().isEmpty
                      ? 'Animal'
                      : nameController.text.trim();
                  _species = speciesController.text.trim().isEmpty
                      ? 'Not specified'
                      : speciesController.text.trim();
                  _breed = breedController.text.trim().isEmpty
                      ? 'Not specified'
                      : breedController.text.trim();
                  _dateOfBirth = dateOfBirthController.text.trim().isEmpty
                      ? 'Not provided'
                      : dateOfBirthController.text.trim();
                  _estimatedAge = estimatedAgeController.text.trim().isEmpty
                      ? 'Not provided'
                      : '${estimatedAgeController.text.trim()} years';
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddVaccinationDialog() {
    final vaccineController = TextEditingController();
    final dateController = TextEditingController();
    final nextDueController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Vaccination'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: vaccineController,
                  decoration: const InputDecoration(
                    labelText: 'Vaccine Name',
                    hintText: 'e.g. Rabies',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () => _selectDate(dialogContext, dateController),
                  decoration: const InputDecoration(
                    labelText: 'Date Administered',
                    hintText: 'Tap to select date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nextDueController,
                  readOnly: true,
                  onTap: () => _selectDate(dialogContext, nextDueController),
                  decoration: const InputDecoration(
                    labelText: 'Next Due Date',
                    hintText: 'Tap to select date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (vaccineController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  _vaccinations.add({
                    'name': vaccineController.text.trim(),
                    'date': dateController.text.trim().isEmpty
                        ? 'Date not provided'
                        : dateController.text.trim(),
                    'nextDue': nextDueController.text.trim().isEmpty
                        ? 'Not specified'
                        : nextDueController.text.trim(),
                  });
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddMedicalRecordDialog() {
    final conditionController = TextEditingController();
    final treatmentController = TextEditingController();
    final dateController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Medical Record'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: conditionController,
                  decoration: const InputDecoration(
                    labelText: 'Condition / Reason',
                    hintText: 'e.g. Skin infection',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: treatmentController,
                  decoration: const InputDecoration(
                    labelText: 'Treatment',
                    hintText: 'e.g. Medication prescribed',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () => _selectDate(dialogContext, dateController),
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    hintText: 'Tap to select date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (conditionController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  _medicalHistory.add({
                    'condition': conditionController.text.trim(),
                    'treatment': treatmentController.text.trim().isEmpty
                        ? 'No treatment details'
                        : treatmentController.text.trim(),
                    'date': dateController.text.trim().isEmpty
                        ? 'Date not provided'
                        : dateController.text.trim(),
                  });
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddMedicationDialog() {
    final medicineController = TextEditingController();
    final instructionsController = TextEditingController();
    final durationController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Medication'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: medicineController,
                  decoration: const InputDecoration(
                    labelText: 'Medicine Name',
                    hintText: 'e.g. Antibiotic',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: instructionsController,
                  decoration: const InputDecoration(
                    labelText: 'Instructions',
                    hintText: 'e.g. Twice daily',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: durationController,
                  decoration: const InputDecoration(
                    labelText: 'Duration',
                    hintText: 'e.g. 7 days',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (medicineController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  _medications.add({
                    'medicine': medicineController.text.trim(),
                    'instructions': instructionsController.text.trim().isEmpty
                        ? 'No instructions provided'
                        : instructionsController.text.trim(),
                    'duration': durationController.text.trim().isEmpty
                        ? 'Not specified'
                        : durationController.text.trim(),
                  });
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddVetVisitDialog() {
    final dateController = TextEditingController();
    final reasonController = TextEditingController();
    final notesController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Vet Visit'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () => _selectDate(dialogContext, dateController),
                  decoration: const InputDecoration(
                    labelText: 'Visit Date',
                    hintText: 'Tap to select date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Reason for Visit',
                    hintText: 'e.g. Routine check-up',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: notesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    hintText: 'Add additional information',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (reasonController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  _vetVisits.add({
                    'date': dateController.text.trim().isEmpty
                        ? 'Date not provided'
                        : dateController.text.trim(),
                    'reason': reasonController.text.trim(),
                    'notes': notesController.text.trim().isEmpty
                        ? 'No notes added'
                        : notesController.text.trim(),
                  });
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Records'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnimalOverview(context),
            const SizedBox(height: 20),
            _buildHealthStatusCard(context),
            const SizedBox(height: 24),
            _buildSectionTitle(
              context,
              title: 'Vaccinations',
              icon: Icons.vaccines_outlined,
              onAdd: _showAddVaccinationDialog,
            ),
            const SizedBox(height: 12),
            _buildVaccinationSection(),
            const SizedBox(height: 24),
            _buildSectionTitle(
              context,
              title: 'Medical History',
              icon: Icons.medical_information_outlined,
              onAdd: _showAddMedicalRecordDialog,
            ),
            const SizedBox(height: 12),
            _buildMedicalHistorySection(),
            const SizedBox(height: 24),
            _buildSectionTitle(
              context,
              title: 'Medications',
              icon: Icons.medication_outlined,
              onAdd: _showAddMedicationDialog,
            ),
            const SizedBox(height: 12),
            _buildMedicationSection(),
            const SizedBox(height: 24),
            _buildSectionTitle(
              context,
              title: 'Veterinary Visits',
              icon: Icons.local_hospital_outlined,
              onAdd: _showAddVetVisitDialog,
            ),
            const SizedBox(height: 12),
            _buildVetVisitsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalOverview(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  child: Icon(
                    Icons.pets,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    _animalName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: _showEditAnimalDetailsDialog,
                  icon: const Icon(Icons.edit_outlined),
                  tooltip: 'Edit animal information',
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Species', _species),
            _buildInfoRow('Breed', _breed),
            _buildInfoRow('Date of Birth', _dateOfBirth),
            _buildInfoRow('Estimated Age', _estimatedAge),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStatusCard(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Icon(
            _healthStatus == 'Healthy'
                ? Icons.check_circle_outline
                : Icons.warning_amber_outlined,
          ),
        ),
        title: const Text(
          'Overall Health Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Current status: $_healthStatus'),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            setState(() {
              _healthStatus = value;
            });
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 'Healthy',
              child: Text('Healthy'),
            ),
            PopupMenuItem(
              value: 'Needs Attention',
              child: Text('Needs Attention'),
            ),
            PopupMenuItem(
              value: 'Under Treatment',
              child: Text('Under Treatment'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onAdd,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        IconButton(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          tooltip: 'Add $title',
        ),
      ],
    );
  }

  Widget _buildVaccinationSection() {
    if (_vaccinations.isEmpty) {
      return _buildEmptyCard(
        icon: Icons.vaccines_outlined,
        message: 'No vaccination records added yet.',
      );
    }

    return Column(
      children: _vaccinations.map((vaccination) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.vaccines_outlined),
            title: Text(vaccination['name']!),
            subtitle: Text(
              'Administered: ${vaccination['date']}\n'
              'Next due: ${vaccination['nextDue']}',
            ),
            isThreeLine: true,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMedicalHistorySection() {
    if (_medicalHistory.isEmpty) {
      return _buildEmptyCard(
        icon: Icons.medical_information_outlined,
        message: 'No medical history recorded yet.',
      );
    }

    return Column(
      children: _medicalHistory.map((record) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.medical_information_outlined),
            title: Text(record['condition']!),
            subtitle: Text(
              'Treatment: ${record['treatment']}\n'
              'Date: ${record['date']}',
            ),
            isThreeLine: true,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMedicationSection() {
    if (_medications.isEmpty) {
      return _buildEmptyCard(
        icon: Icons.medication_outlined,
        message: 'No current medications recorded.',
      );
    }

    return Column(
      children: _medications.map((medication) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.medication_outlined),
            title: Text(medication['medicine']!),
            subtitle: Text(
              '${medication['instructions']}\n'
              'Duration: ${medication['duration']}',
            ),
            isThreeLine: true,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildVetVisitsSection() {
    if (_vetVisits.isEmpty) {
      return _buildEmptyCard(
        icon: Icons.local_hospital_outlined,
        message: 'No veterinary visits recorded yet.',
      );
    }

    return Column(
      children: _vetVisits.map((visit) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.local_hospital_outlined),
            title: Text(visit['reason']!),
            subtitle: Text(
              'Date: ${visit['date']}\n'
              'Notes: ${visit['notes']}',
            ),
            isThreeLine: true,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyCard({
    required IconData icon,
    required String message,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
      ),
    );
  }
}
