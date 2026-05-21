import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/widgets/app_background.dart';
import '../widgets/form_input_widgets.dart';

class FormInputPreviewPage extends StatefulWidget {
  const FormInputPreviewPage({super.key});

  @override
  State<FormInputPreviewPage> createState() => _FormInputPreviewPageState();
}

class _FormInputPreviewPageState extends State<FormInputPreviewPage> {
  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);
  static const _pink = Color(0xFFFB7185);
  static const _dark = Color(0xFF020617);

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _amountController = TextEditingController();
  final _searchController = TextEditingController();
  final _noteController = TextEditingController();

  String? _selectedAsset;
  String? _uploadedFileName;
  String _accountType = 'spot';
  String _riskLevel = 'medium';
  bool _acceptedTerms = false;
  bool _enableNotification = true;
  bool _biometricEnabled = false;
  bool _showTermsError = false;
  DateTime? _selectedDate;
  String _otpCode = '';
  bool _isSubmitting = false;

  bool get _canSubmit => !_isSubmitting;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _amountController.dispose();
    _searchController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }

    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  String? _amountValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }

    final normalized = value.replaceAll(',', '');
    final amount = double.tryParse(normalized);

    if (amount == null) {
      return 'Amount must be a valid number';
    }

    if (amount <= 0) {
      return 'Amount must be greater than 0';
    }

    if (amount < 10) {
      return 'Minimum amount is 10';
    }

    return null;
  }

  Future<void> _simulateSubmit() async {
    final valid = _formKey.currentState?.validate() ?? false;

    setState(() {
      _showTermsError = !_acceptedTerms;
    });

    if (!valid || !_acceptedTerms) {
      _showMessage(
        title: 'Validation Failed',
        message: 'Please complete all required fields correctly.',
        color: _pink,
        icon: Icons.error_rounded,
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;

    setState(() {
      _isSubmitting = false;
    });

    _showMessage(
      title: 'Form Submitted',
      message: 'Premium form validation passed successfully.',
      color: _green,
      icon: Icons.check_circle_rounded,
    );
  }

  void _fillDemoData() {
    setState(() {
      _nameController.text = 'Bayu HNM';
      _emailController.text = 'bayu@example.com';
      _passwordController.text = 'Password1';
      _amountController.text = '1000.50';
      _searchController.text = 'Bitcoin';
      _noteController.text =
          'This is a premium design system form preview with validation.';
      _selectedAsset = 'btc';
      _selectedDate = DateTime.now();
      _uploadedFileName = 'identity_document.png';
      _acceptedTerms = true;
      _showTermsError = false;
      _enableNotification = true;
      _biometricEnabled = true;
      _accountType = 'futures';
      _riskLevel = 'high';
      _otpCode = '123456';
    });

    _showMessage(
      title: 'Demo Filled',
      message: 'All fields have been filled with sample data.',
      color: _blue,
      icon: Icons.auto_awesome_rounded,
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();

    setState(() {
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _amountController.clear();
      _searchController.clear();
      _noteController.clear();
      _selectedAsset = null;
      _selectedDate = null;
      _uploadedFileName = null;
      _accountType = 'spot';
      _riskLevel = 'medium';
      _acceptedTerms = false;
      _showTermsError = false;
      _enableNotification = true;
      _biometricEnabled = false;
      _otpCode = '';
    });

    _showMessage(
      title: 'Form Reset',
      message: 'All form fields have been cleared.',
      color: _gold,
      icon: Icons.refresh_rounded,
    );
  }

  void _mockUpload() {
    setState(() {
      _uploadedFileName = 'premium_kyc_document.png';
    });
  }

  void _showMessage({
    required String title,
    required String message,
    required Color color,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withValues(alpha: 0.34)),
              ),
              child: Row(
                children: [
                  Icon(icon, color: color),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          message,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white.withValues(alpha: 0.78),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? _dark
            : const Color(0xFFF6F9FF),
        body: AppBackground(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Header(onBack: () => Navigator.pop(context)),
                    const SizedBox(height: 28),
                    const _HeroCard(),
                    const SizedBox(height: 28),
                    const _SectionTitle(
                      title: 'Basic Inputs',
                      subtitle:
                          'Text field, email, password, search, amount and multiline input with validation states.',
                    ),
                    const SizedBox(height: 14),
                    PremiumInputPanel(
                      child: Column(
                        children: [
                          PremiumTextField(
                            controller: _nameController,
                            label: 'Full Name',
                            hint: 'Enter your full name',
                            prefixIcon: Icons.person_rounded,
                            textInputAction: TextInputAction.next,
                            validator: (value) =>
                                _requiredValidator(value, 'Full name'),
                          ),
                          const SizedBox(height: 18),
                          PremiumTextField(
                            controller: _emailController,
                            label: 'Email Address',
                            hint: 'name@example.com',
                            prefixIcon: Icons.email_rounded,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: _emailValidator,
                          ),
                          const SizedBox(height: 18),
                          PremiumPasswordField(
                            controller: _passwordController,
                            label: 'Password',
                            hint: 'Minimum 6 chars, uppercase and number',
                            validator: _passwordValidator,
                          ),
                          const SizedBox(height: 18),
                          PremiumTextField(
                            controller: _searchController,
                            label: 'Search Asset',
                            hint: 'Search BTC, ETH, SOL...',
                            prefixIcon: Icons.search_rounded,
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                              icon: const Icon(Icons.close_rounded),
                            ),
                          ),
                          const SizedBox(height: 18),
                          PremiumTextField(
                            controller: _amountController,
                            label: 'Amount',
                            hint: '1,000.50',
                            prefixIcon: Icons.attach_money_rounded,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.,]'),
                              ),
                            ],
                            validator: _amountValidator,
                          ),
                          const SizedBox(height: 18),
                          PremiumTextField(
                            controller: _noteController,
                            label: 'Notes',
                            hint: 'Write transaction notes...',
                            prefixIcon: Icons.notes_rounded,
                            maxLines: 4,
                            validator: (value) =>
                                _requiredValidator(value, 'Notes'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const _SectionTitle(
                      title: 'Selection Inputs',
                      subtitle:
                          'Dropdown, segmented control, radio group, checkbox and switch input examples.',
                    ),
                    const SizedBox(height: 14),
                    PremiumInputPanel(
                      child: PremiumDropdownField<String>(
                        label: 'Asset',
                        hint: 'Choose crypto asset',
                        value: _selectedAsset,
                        prefixIcon: Icons.currency_bitcoin_rounded,
                        options: const [
                          PremiumInputOption(
                            label: 'Bitcoin / BTC',
                            value: 'btc',
                            icon: Icons.currency_bitcoin_rounded,
                          ),
                          PremiumInputOption(
                            label: 'Ethereum / ETH',
                            value: 'eth',
                            icon: Icons.hexagon_rounded,
                          ),
                          PremiumInputOption(
                            label: 'Solana / SOL',
                            value: 'sol',
                            icon: Icons.bolt_rounded,
                          ),
                        ],
                        validator: (value) {
                          if (value == null) {
                            return 'Please choose one asset';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _selectedAsset = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    PremiumSegmentedControl<String>(
                      label: 'Account Type',
                      value: _accountType,
                      options: const [
                        PremiumInputOption(label: 'Spot', value: 'spot'),
                        PremiumInputOption(label: 'Margin', value: 'margin'),
                        PremiumInputOption(label: 'Futures', value: 'futures'),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _accountType = value;
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    PremiumRadioGroup<String>(
                      label: 'Risk Preference',
                      value: _riskLevel,
                      options: const [
                        PremiumInputOption(
                          label: 'Low Risk',
                          value: 'low',
                          icon: Icons.shield_rounded,
                        ),
                        PremiumInputOption(
                          label: 'Medium Risk',
                          value: 'medium',
                          icon: Icons.balance_rounded,
                        ),
                        PremiumInputOption(
                          label: 'High Risk',
                          value: 'high',
                          icon: Icons.local_fire_department_rounded,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _riskLevel = value;
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    PremiumInputPanel(
                      child: Column(
                        children: [
                          PremiumCheckboxTile(
                            title: 'Accept Terms & Conditions',
                            subtitle:
                                'Required before submitting this premium form preview.',
                            value: _acceptedTerms,
                            color: _green,
                            icon: Icons.verified_user_rounded,
                            onChanged: (value) {
                              setState(() {
                                _acceptedTerms = value;
                                if (value) _showTermsError = false;
                              });
                            },
                          ),
                          if (_showTermsError) ...[
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Please accept the terms before submitting',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: _pink,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 12),
                          PremiumSwitchTile(
                            title: 'Enable Notifications',
                            subtitle:
                                'Receive premium alerts and market updates.',
                            value: _enableNotification,
                            color: _purple,
                            icon: Icons.notifications_active_rounded,
                            onChanged: (value) {
                              setState(() {
                                _enableNotification = value;
                              });
                            },
                          ),
                          const SizedBox(height: 12),
                          PremiumSwitchTile(
                            title: 'Biometric Login',
                            subtitle:
                                'Use face ID or fingerprint for faster access.',
                            value: _biometricEnabled,
                            color: _blue,
                            icon: Icons.fingerprint_rounded,
                            onChanged: (value) {
                              setState(() {
                                _biometricEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const _SectionTitle(
                      title: 'Advanced Inputs',
                      subtitle:
                          'Date picker, upload input, OTP input and custom validation examples.',
                    ),
                    const SizedBox(height: 14),
                    PremiumInputPanel(
                      child: Column(
                        children: [
                          PremiumDatePickerField(
                            label: 'Transaction Date',
                            hint: 'Choose date',
                            value: _selectedDate,
                            validator: (value) {
                              if (value == null) {
                                return 'Transaction date is required';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _selectedDate = value;
                              });
                            },
                          ),
                          const SizedBox(height: 18),
                          PremiumUploadBox(
                            label: 'Upload Document',
                            title: 'Upload KYC document',
                            subtitle: 'PNG, JPG or PDF. Max size 5 MB.',
                            fileName: _uploadedFileName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Document is required';
                              }

                              return null;
                            },
                            onTap: _mockUpload,
                            onClear: () {
                              setState(() {
                                _uploadedFileName = null;
                              });
                            },
                          ),
                          const SizedBox(height: 18),
                          PremiumOtpInput(
                            length: 6,
                            onChanged: (value) {
                              _otpCode = value;
                            },
                            validator: (value) {
                              if (value.length < 6) {
                                return 'Please enter complete 6 digit OTP code';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const _SectionTitle(
                      title: 'Validation Actions',
                      subtitle:
                          'Submit, fill demo data, reset state, and preview validation feedback.',
                    ),
                    const SizedBox(height: 14),
                    PremiumInputPanel(
                      child: Column(
                        children: [
                          PremiumFormButton(
                            label: 'Validate & Submit Form',
                            icon: Icons.check_circle_rounded,
                            color: _blue,
                            isLoading: _isSubmitting,
                            onPressed: _canSubmit ? _simulateSubmit : null,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _SecondaryActionButton(
                                  label: 'Fill Demo',
                                  icon: Icons.auto_awesome_rounded,
                                  color: _gold,
                                  onTap: _fillDemoData,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SecondaryActionButton(
                                  label: 'Reset',
                                  icon: Icons.refresh_rounded,
                                  color: _pink,
                                  onTap: _resetForm,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _FooterCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onBack;

  const _Header({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GlassIconButton(icon: Icons.arrow_back_rounded, onTap: onBack),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFF38BDF8),
                      Color(0xFFF8D66D),
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Form Input Showcase',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Premium interactive form components',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _mutedColor(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      padding: EdgeInsets.zero,
      borderRadius: 36,
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -80,
            child: _BlurOrb(size: 230, color: _gold.withValues(alpha: 0.22)),
          ),
          Positioned(
            bottom: -110,
            left: -90,
            child: _BlurOrb(size: 230, color: _blue.withValues(alpha: 0.22)),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Icon(
              Icons.dynamic_form_rounded,
              size: 104,
              color: Colors.white.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark
                    ? 0.035
                    : 0.16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Badge(
                  label: 'Professional Form System',
                  icon: Icons.verified_rounded,
                  color: _gold,
                ),
                const SizedBox(height: 24),
                Text(
                  'Premium forms\nwith validation.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'A complete reusable form input library for auth, profile, transaction, KYC, settings, and dashboard filter pages.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: _mutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(
                      child: _MiniCard(
                        title: 'Inputs',
                        value: '12+',
                        icon: Icons.input_rounded,
                        color: _blue,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _MiniCard(
                        title: 'Validation',
                        value: 'Ready',
                        icon: Icons.rule_rounded,
                        color: _purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MiniCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      borderRadius: 24,
      padding: const EdgeInsets.all(15),
      backgroundColor: Colors.white.withValues(
        alpha: Theme.of(context).brightness == Brightness.dark ? 0.06 : 0.5,
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 23),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: _mutedColor(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: _mutedColor(context),
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FooterCard extends StatelessWidget {
  const _FooterCard();

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      borderRadius: 30,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFF38BDF8).withValues(alpha: 0.12),
              border: Border.all(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.28),
              ),
            ),
            child: const Icon(
              Icons.tips_and_updates_rounded,
              color: Color(0xFF38BDF8),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'All form inputs are reusable widgets. You can move them into auth, KYC, profile, wallet, filter, transaction, or admin pages.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.42,
                color: _mutedColor(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecondaryActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SecondaryActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.11),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.32)),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 19),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w900,
                    ),
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

class _GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? backgroundColor;

  const _GlassPanel({
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 28,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color:
                backgroundColor ??
                Colors.white.withValues(alpha: isDark ? 0.075 : 0.72),
            border: Border.all(
              color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.86),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.34 : 0.08),
                blurRadius: 34,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.82),
                ),
              ),
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _Badge({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlurOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _BlurOrb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 58, sigmaY: 58),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}

Color _mutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return isDark
      ? Colors.white.withValues(alpha: 0.58)
      : Colors.black.withValues(alpha: 0.52);
}
