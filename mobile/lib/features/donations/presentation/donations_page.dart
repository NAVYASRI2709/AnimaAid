import 'package:flutter/material.dart';

class DonationsPage extends StatefulWidget {
  const DonationsPage({super.key});

  @override
  State<DonationsPage> createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  final TextEditingController _customAmountController =
      TextEditingController();

  final List<String> _purposes = [
    'Animal Rescue',
    'Medical Care',
    'Shelter Support',
    'General Welfare',
  ];

  String _selectedPurpose = 'Animal Rescue';
  int? _selectedAmount;
  bool _donationCompleted = false;

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  void _selectAmount(int amount) {
    setState(() {
      _selectedAmount = amount;
      _customAmountController.clear();
    });
  }

  void _selectCustomAmount(String value) {
    final amount = int.tryParse(value);

    setState(() {
      _selectedAmount = amount;
    });
  }

  void _reviewDonation() {
    final amount = _selectedAmount;

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select or enter a donation amount.'),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Review Donation'),
          content: Text(
            'You are donating ₹$amount for $_selectedPurpose.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Review'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                setState(() {
                  _donationCompleted = true;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Donation submitted successfully.',
                    ),
                  ),
                );
              },
              child: const Text('Confirm'),
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
        title: const Text('Donate'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Support Animal Rescue',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your donation helps rescue, treat, and care for animals in need.',
            ),
            const SizedBox(height: 28),

            Text(
              'Donation Purpose',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              initialValue: _selectedPurpose,
              decoration: const InputDecoration(
                labelText: 'Choose a purpose',
                prefixIcon: Icon(
                  Icons.volunteer_activism_outlined,
                ),
                border: OutlineInputBorder(),
              ),
              items: _purposes
                  .map(
                    (purpose) => DropdownMenuItem<String>(
                      value: purpose,
                      child: Text(purpose),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  _selectedPurpose = value;
                });
              },
            ),

            const SizedBox(height: 28),

            Text(
              'Choose Amount',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildAmountButton(250),
                _buildAmountButton(500),
                _buildAmountButton(1000),
                _buildAmountButton(2000),
              ],
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _customAmountController,
              keyboardType: TextInputType.number,
              onChanged: _selectCustomAmount,
              decoration: const InputDecoration(
                labelText: 'Custom Amount',
                prefixText: '₹ ',
                prefixIcon: Icon(
                  Icons.currency_rupee,
                ),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 28),

            if (_donationCompleted)
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.check_circle_outline,
                  ),
                  title: const Text(
                    'Donation Submitted',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Your donation will be processed when payment services are connected.',
                  ),
                ),
              ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _reviewDonation,
                icon: const Icon(
                  Icons.favorite_outline,
                ),
                label: const Text(
                  'Review Donation',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountButton(int amount) {
    final isSelected = _selectedAmount == amount;

    return OutlinedButton(
      onPressed: () => _selectAmount(amount),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
      ),
      child: Text('₹$amount'),
    );
  }
}