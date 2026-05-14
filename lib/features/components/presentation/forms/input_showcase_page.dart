import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';

enum AccountType { personal, business, enterprise }

class InputShowcasePage extends StatefulWidget {
  const InputShowcasePage({super.key});
  @override
  State<InputShowcasePage> createState() => _InputShowcasePageState();
}

class _InputShowcasePageState extends State<InputShowcasePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final notesController = TextEditingController();

  AccountType accountType = AccountType.personal;
  String selectedCountry = 'Indonesia';
  bool acceptTerms = false;
  bool enableNotification = true;
  bool enableBiometric = false;
  double experienceLevel = 40;
  DateTime? selectedDate;

  final countries = const [
    'Indonesia',
    'Singapore',
    'Malaysia',
    'Thailand',
    'United States',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 80),
      lastDate: DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: DialogThemeData(
              backgroundColor: const Color(0xFF101827),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) setState(() => selectedDate = result);
  }

  void _submit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;
    if (!acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept terms first.')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Form submitted: ${nameController.text} / $selectedCountry / ${accountType.name}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: GestureDetector(
        onTap: () {
          // FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const GlassAppBar(title: 'Input Showcase'),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: [
                const _HeaderCard(),
                const SizedBox(height: 16),
                GlassCard(
                  borderRadius: 32,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionTitle(
                        icon: Icons.text_fields_rounded,
                        title: 'Text Inputs',
                        subtitle: 'Basic form field, password, and textarea.',
                      ),
                      const SizedBox(height: 18),
                      AppTextField(
                        controller: nameController,
                        label: 'Full Name',
                        hintText: 'Your name',
                        prefixIcon: Icons.person_outline_rounded,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? 'Name is required'
                            : null,
                      ),
                      const SizedBox(height: 14),
                      AppTextField(
                        controller: emailController,
                        label: 'Email',
                        hintText: 'you@example.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.mail_outline_rounded,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty)
                            return 'Email is required';
                          if (!value.contains('@'))
                            return 'Email format is invalid';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      AppTextField(
                        controller: passwordController,
                        label: 'Password',
                        hintText: 'Minimum 6 characters',
                        obscureText: true,
                        prefixIcon: Icons.lock_outline_rounded,
                        validator: (value) => value == null || value.length < 6
                            ? 'Password minimum 6 characters'
                            : null,
                      ),
                      const SizedBox(height: 14),
                      AppTextField(
                        controller: notesController,
                        label: 'Notes',
                        hintText: 'Write something...',
                        maxLines: 4,
                        prefixIcon: Icons.notes_rounded,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GlassCard(
                  borderRadius: 32,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionTitle(
                        icon: Icons.radio_button_checked_rounded,
                        title: 'Selection Inputs',
                        subtitle: 'Radio, dropdown, checkbox, switch.',
                      ),
                      const SizedBox(height: 18),
                      _GlassDropdown<String>(
                        label: 'Country',
                        value: selectedCountry,
                        items: countries,
                        itemLabel: (value) => value,
                        onChanged: (value) {
                          if (value != null)
                            setState(() => selectedCountry = value);
                        },
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Account Type',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _RadioTile(
                        title: 'Personal',
                        subtitle: 'For individual usage.',
                        value: AccountType.personal,
                        groupValue: accountType,
                        onChanged: (value) =>
                            setState(() => accountType = value),
                      ),
                      _RadioTile(
                        title: 'Business',
                        subtitle: 'For teams and small companies.',
                        value: AccountType.business,
                        groupValue: accountType,
                        onChanged: (value) =>
                            setState(() => accountType = value),
                      ),
                      _RadioTile(
                        title: 'Enterprise',
                        subtitle: 'Advanced control and scale.',
                        value: AccountType.enterprise,
                        groupValue: accountType,
                        onChanged: (value) =>
                            setState(() => accountType = value),
                      ),
                      const SizedBox(height: 10),
                      _SwitchTile(
                        title: 'Enable Notifications',
                        subtitle: 'Receive product updates and alerts.',
                        value: enableNotification,
                        onChanged: (value) =>
                            setState(() => enableNotification = value),
                      ),
                      _SwitchTile(
                        title: 'Enable Biometric',
                        subtitle: 'Use Face ID / Touch ID style login.',
                        value: enableBiometric,
                        onChanged: (value) =>
                            setState(() => enableBiometric = value),
                      ),
                      CheckboxListTile(
                        value: acceptTerms,
                        onChanged: (value) =>
                            setState(() => acceptTerms = value ?? false),
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'I accept terms and conditions',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          'Required before submit.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.56),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GlassCard(
                  borderRadius: 32,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionTitle(
                        icon: Icons.tune_rounded,
                        title: 'Advanced Inputs',
                        subtitle: 'Slider, date picker, and submit preview.',
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Experience Level',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                          GlassPill(text: '${experienceLevel.round()}%'),
                        ],
                      ),
                      Slider(
                        value: experienceLevel,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        label: '${experienceLevel.round()}%',
                        onChanged: (value) =>
                            setState(() => experienceLevel = value),
                      ),
                      const SizedBox(height: 10),
                      _DatePickerTile(
                        selectedDate: selectedDate,
                        onTap: _pickDate,
                      ),
                      const SizedBox(height: 22),
                      AppButton(
                        text: 'Submit Form',
                        icon: Icons.check_circle_rounded,
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();
  @override
  Widget build(BuildContext context) => GlassCard(
    borderRadius: 34,
    padding: const EdgeInsets.all(24),
    gradientColors: [
      Colors.white.withOpacity(0.22),
      const Color(0xFFAEC2FF).withOpacity(0.09),
      Colors.white.withOpacity(0.06),
    ],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GlassPill(text: 'FORM COMPONENTS', icon: Icons.widgets_rounded),
        const SizedBox(height: 20),
        const Text(
          'Glass Input System',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'One page that contains common input types you can reuse across the app.',
          style: TextStyle(
            height: 1.45,
            color: Colors.white.withOpacity(0.66),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _SectionTitle({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white.withOpacity(0.12),
          border: Border.all(color: Colors.white.withOpacity(0.14)),
        ),
        child: Icon(icon, color: const Color(0xFFAEC2FF)),
      ),
      const SizedBox(width: 13),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.56),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class _GlassDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> items;
  final String Function(T value) itemLabel;
  final ValueChanged<T?> onChanged;
  const _GlassDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) => DropdownButtonFormField<T>(
    value: value,
    isExpanded: true,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: const Icon(Icons.public_rounded),
    ),
    dropdownColor: const Color(0xFF111827),
    borderRadius: BorderRadius.circular(20),
    items: items
        .map(
          (item) =>
              DropdownMenuItem<T>(value: item, child: Text(itemLabel(item))),
        )
        .toList(),
    onChanged: onChanged,
  );
}

class _RadioTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final AccountType value;
  final AccountType groupValue;
  final ValueChanged<AccountType> onChanged;
  const _RadioTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFFAEC2FF).withOpacity(0.14)
            : Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: selected
              ? const Color(0xFFAEC2FF).withOpacity(0.54)
              : Colors.white.withOpacity(0.10),
        ),
      ),
      child: RadioListTile<AccountType>(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white.withOpacity(0.56)),
        ),
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) => SwitchListTile(
    value: value,
    onChanged: onChanged,
    contentPadding: EdgeInsets.zero,
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
    subtitle: Text(
      subtitle,
      style: TextStyle(color: Colors.white.withOpacity(0.56)),
    ),
  );
}

class _DatePickerTile extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onTap;
  const _DatePickerTile({required this.selectedDate, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final label = selectedDate == null
        ? 'Select date'
        : '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}';
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_rounded, color: Color(0xFFAEC2FF)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}
