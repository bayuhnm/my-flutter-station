import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PremiumInputOption<T> {
  final String label;
  final T value;
  final IconData? icon;

  const PremiumInputOption({
    required this.label,
    required this.value,
    this.icon,
  });
}

class PremiumTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;

  const PremiumTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onTap,
    this.textInputAction,
  });

  @override
  State<PremiumTextField> createState() => _PremiumTextFieldState();
}

class _PremiumTextFieldState extends State<PremiumTextField> {
  late final FocusNode _focusNode;
  bool _focused = false;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode()
      ..addListener(() {
        if (!mounted) return;

        setState(() {
          _focused = _focusNode.hasFocus;
        });
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = _focused
        ? const Color(0xFF38BDF8)
        : Theme.of(context).colorScheme.outline.withValues(alpha: 0.18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PremiumInputLabel(
          label: widget.label,
          color: _focused ? const Color(0xFF38BDF8) : null,
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              if (_focused)
                BoxShadow(
                  color: const Color(0xFF38BDF8).withValues(alpha: 0.18),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Icon(widget.prefixIcon, size: 21),
              suffixIcon: widget.suffix,
              filled: true,
              fillColor: premiumFieldFillColor(context),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 17,
              ),
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: premiumInputMutedColor(context),
                fontWeight: FontWeight.w500,
              ),
              errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: const Color(0xFFFB7185),
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: accent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: Color(0xFF38BDF8),
                  width: 1.4,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.12),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: Color(0xFFFB7185),
                  width: 1.2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: Color(0xFFFB7185),
                  width: 1.4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PremiumPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String? value)? validator;
  final ValueChanged<String>? onChanged;

  const PremiumPasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
    this.onChanged,
  });

  @override
  State<PremiumPasswordField> createState() => _PremiumPasswordFieldState();
}

class _PremiumPasswordFieldState extends State<PremiumPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return PremiumTextField(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      prefixIcon: Icons.lock_rounded,
      obscureText: _obscure,
      validator: widget.validator,
      onChanged: widget.onChanged,
      suffix: IconButton(
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
        icon: Icon(
          _obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
        ),
      ),
    );
  }
}

class PremiumDropdownField<T> extends StatelessWidget {
  final String label;
  final String hint;
  final T? value;
  final List<PremiumInputOption<T>> options;
  final ValueChanged<T?> onChanged;
  final String? Function(T? value)? validator;
  final IconData? prefixIcon;

  const PremiumDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.options,
    required this.onChanged,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PremiumInputLabel(label: label),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          value: value,
          isExpanded: true,
          validator: validator,
          onChanged: onChanged,
          menuMaxHeight: 320,
          dropdownColor: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF071327)
              : Colors.white,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, size: 21),
            filled: true,
            fillColor: premiumFieldFillColor(context),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 17,
            ),
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: premiumInputMutedColor(context),
              fontWeight: FontWeight.w500,
            ),
            errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: const Color(0xFFFB7185),
              fontWeight: FontWeight.w700,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.18),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: const BorderSide(
                color: Color(0xFF38BDF8),
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: const BorderSide(
                color: Color(0xFFFB7185),
                width: 1.2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: const BorderSide(
                color: Color(0xFFFB7185),
                width: 1.4,
              ),
            ),
          ),
          selectedItemBuilder: (context) {
            return options.map((option) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  option.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              );
            }).toList();
          },
          items: options.map((option) {
            return DropdownMenuItem<T>(
              value: option.value,
              child: Row(
                children: [
                  if (option.icon != null) ...[
                    Icon(option.icon, size: 19, color: const Color(0xFF38BDF8)),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: Text(
                      option.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PremiumSegmentedControl<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<PremiumInputOption<T>> options;
  final ValueChanged<T> onChanged;

  const PremiumSegmentedControl({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumInputPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PremiumInputLabel(label: label),
          const SizedBox(height: 12),
          Row(
            children: List.generate(options.length, (index) {
              final option = options[index];
              final selected = value == option.value;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == options.length - 1 ? 0 : 8,
                  ),
                  child: InkWell(
                    onTap: () => onChanged(option.value),
                    borderRadius: BorderRadius.circular(18),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: selected
                            ? const LinearGradient(
                                colors: [Color(0xFF38BDF8), Color(0xFF2563EB)],
                              )
                            : null,
                        color: selected ? null : premiumFieldFillColor(context),
                        border: Border.all(
                          color: selected
                              ? Colors.white.withValues(alpha: 0.20)
                              : Theme.of(
                                  context,
                                ).colorScheme.outline.withValues(alpha: 0.14),
                        ),
                        boxShadow: [
                          if (selected)
                            BoxShadow(
                              color: const Color(
                                0xFF38BDF8,
                              ).withValues(alpha: 0.20),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          option.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: selected
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class PremiumRadioGroup<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<PremiumInputOption<T>> options;
  final ValueChanged<T> onChanged;

  const PremiumRadioGroup({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumInputPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PremiumInputLabel(label: label),
          const SizedBox(height: 12),
          Column(
            children: options.map((option) {
              final selected = option.value == value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PremiumSelectableTile(
                  title: option.label,
                  icon: option.icon,
                  selected: selected,
                  activeColor: const Color(0xFF38BDF8),
                  trailing: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected
                            ? const Color(0xFF38BDF8)
                            : premiumInputMutedColor(context),
                        width: selected ? 6 : 1.4,
                      ),
                    ),
                  ),
                  onTap: () => onChanged(option.value),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PremiumCheckboxTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;
  final IconData icon;

  const PremiumCheckboxTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.color = const Color(0xFF22C55E),
    this.icon = Icons.verified_user_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumSelectableTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      selected: value,
      activeColor: color,
      trailing: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: value ? color : Colors.transparent,
          border: Border.all(
            color: value ? color : premiumInputMutedColor(context),
          ),
        ),
        child: value
            ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
            : null,
      ),
      onTap: () => onChanged(!value),
    );
  }
}

class PremiumSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;
  final IconData icon;

  const PremiumSwitchTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.color = const Color(0xFF8B5CF6),
    this.icon = Icons.notifications_active_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumSelectableTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      selected: value,
      activeColor: color,
      trailing: Switch.adaptive(
        value: value,
        activeThumbColor: color,
        onChanged: onChanged,
      ),
      onTap: () => onChanged(!value),
    );
  }
}

class PremiumDatePickerField extends StatelessWidget {
  final String label;
  final String hint;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final String? Function(DateTime? value)? validator;

  const PremiumDatePickerField({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: value,
      validator: (_) => validator?.call(value),
      builder: (state) {
        Future<void> pickDate() async {
          final now = DateTime.now();

          final picked = await showDatePicker(
            context: context,
            initialDate: value ?? now,
            firstDate: DateTime(now.year - 5),
            lastDate: DateTime(now.year + 5),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  datePickerTheme: DatePickerThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked == null) return;

          state.didChange(picked);
          onChanged(picked);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PremiumInputLabel(label: label),
            const SizedBox(height: 8),
            InkWell(
              onTap: pickDate,
              borderRadius: BorderRadius.circular(22),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: premiumFieldFillColor(context),
                  border: Border.all(
                    color: state.hasError
                        ? const Color(0xFFFB7185)
                        : Theme.of(
                            context,
                          ).colorScheme.outline.withValues(alpha: 0.18),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded, size: 21),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        value == null ? hint : _formatDate(value!),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: value == null
                              ? premiumInputMutedColor(context)
                              : Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ),
            if (state.hasError) ...[
              const SizedBox(height: 7),
              Text(
                state.errorText ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFFFB7185),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class PremiumUploadBox extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;
  final String? fileName;
  final VoidCallback onTap;
  final VoidCallback? onClear;
  final String? Function(String? value)? validator;

  const PremiumUploadBox({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.fileName,
    required this.onTap,
    this.onClear,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: fileName,
      validator: (_) => validator?.call(fileName),
      builder: (state) {
        final hasFile = fileName != null && fileName!.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PremiumInputLabel(label: label),
            const SizedBox(height: 8),
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(26),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: premiumFieldFillColor(context),
                  border: Border.all(
                    color: state.hasError
                        ? const Color(0xFFFB7185)
                        : hasFile
                        ? const Color(0xFF22C55E).withValues(alpha: 0.45)
                        : Theme.of(
                            context,
                          ).colorScheme.outline.withValues(alpha: 0.18),
                  ),
                  boxShadow: [
                    if (hasFile)
                      BoxShadow(
                        color: const Color(0xFF22C55E).withValues(alpha: 0.12),
                        blurRadius: 22,
                        offset: const Offset(0, 12),
                      ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            (hasFile
                                    ? const Color(0xFF22C55E)
                                    : const Color(0xFF38BDF8))
                                .withValues(alpha: 0.14),
                        border: Border.all(
                          color:
                              (hasFile
                                      ? const Color(0xFF22C55E)
                                      : const Color(0xFF38BDF8))
                                  .withValues(alpha: 0.28),
                        ),
                      ),
                      child: Icon(
                        hasFile
                            ? Icons.check_circle_rounded
                            : Icons.cloud_upload_rounded,
                        color: hasFile
                            ? const Color(0xFF22C55E)
                            : const Color(0xFF38BDF8),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasFile ? fileName! : title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: premiumInputMutedColor(context),
                                  height: 1.35,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (hasFile && onClear != null)
                      IconButton(
                        onPressed: onClear,
                        icon: const Icon(Icons.close_rounded),
                      )
                    else
                      const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ],
                ),
              ),
            ),
            if (state.hasError) ...[
              const SizedBox(height: 7),
              Text(
                state.errorText ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFFFB7185),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class PremiumOtpInput extends StatefulWidget {
  final int length;
  final double gap;
  final double minBoxSize;
  final double maxBoxSize;
  final ValueChanged<String> onChanged;
  final String? Function(String value)? validator;

  const PremiumOtpInput({
    super.key,
    this.length = 6,
    this.gap = 8,
    this.minBoxSize = 46,
    this.maxBoxSize = 58,
    required this.onChanged,
    this.validator,
  });

  @override
  State<PremiumOtpInput> createState() => _PremiumOtpInputState();
}

class _PremiumOtpInputState extends State<PremiumOtpInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  String get _value => _controller.text;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _focusNode = FocusNode()
      ..addListener(() {
        if (!mounted) return;
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleChanged(String value, FormFieldState<String> state) {
    final normalized = value.length > widget.length
        ? value.substring(0, widget.length)
        : value;

    if (normalized != value) {
      _controller.value = TextEditingValue(
        text: normalized,
        selection: TextSelection.collapsed(offset: normalized.length),
      );
    }

    state.didChange(normalized);
    widget.onChanged(normalized);

    setState(() {});
  }

  void _focusInput() {
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: _value,
      validator: (_) => widget.validator?.call(_value),
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PremiumInputLabel(label: 'OTP Code'),
            const SizedBox(height: 10),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _focusInput,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0,
                      child: TextFormField(
                        controller: _controller,
                        focusNode: _focusNode,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        enableSuggestions: false,
                        autocorrect: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(widget.length),
                        ],
                        onChanged: (value) {
                          _handleChanged(value, state);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final maxWidth = constraints.maxWidth;

                      final totalGap = widget.gap * (widget.length - 1);
                      final availableWidth = maxWidth - totalGap;
                      final itemWidth = availableWidth / widget.length;

                      final boxHeight = itemWidth.clamp(
                        widget.minBoxSize,
                        widget.maxBoxSize,
                      );

                      return Row(
                        children: List.generate(widget.length, (index) {
                          final hasValue = index < _value.length;
                          final char = hasValue ? _value[index] : '';

                          final isActive =
                              _focusNode.hasFocus &&
                              index == _value.length &&
                              _value.length < widget.length;

                          final isLastActive =
                              _focusNode.hasFocus &&
                              _value.length == widget.length &&
                              index == widget.length - 1;

                          final isFocused = isActive || isLastActive;
                          final isFilled = char.isNotEmpty;

                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == widget.length - 1
                                  ? 0
                                  : widget.gap,
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              curve: Curves.easeOutCubic,
                              width: itemWidth,
                              height: boxHeight * 1.3,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: premiumFieldFillColor(context),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: state.hasError
                                      ? const Color(0xFFFB7185)
                                      : isFocused || isFilled
                                      ? const Color(0xFF38BDF8)
                                      : Theme.of(context).colorScheme.outline
                                            .withValues(alpha: 0.18),
                                  width: isFocused || isFilled ? 1.4 : 1,
                                ),
                                boxShadow: [
                                  if (isFocused)
                                    BoxShadow(
                                      color: const Color(
                                        0xFF38BDF8,
                                      ).withValues(alpha: 0.18),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                ],
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  char,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),

            if (state.hasError) ...[
              const SizedBox(height: 7),
              Text(
                state.errorText ?? '',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: const Color(0xFFFB7185),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class PremiumSelectableTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final bool selected;
  final Color activeColor;
  final Widget trailing;
  final VoidCallback onTap;

  const PremiumSelectableTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    required this.selected,
    required this.activeColor,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: selected
              ? activeColor.withValues(alpha: 0.11)
              : premiumFieldFillColor(context),
          border: Border.all(
            color: selected
                ? activeColor.withValues(alpha: 0.36)
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.14),
          ),
          boxShadow: [
            if (selected)
              BoxShadow(
                color: activeColor.withValues(alpha: 0.12),
                blurRadius: 22,
                offset: const Offset(0, 12),
              ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: activeColor.withValues(alpha: selected ? 0.18 : 0.09),
                ),
                child: Icon(icon, color: activeColor, size: 21),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: premiumInputMutedColor(context),
                        height: 1.32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            trailing,
          ],
        ),
      ),
    );
  }
}

class PremiumInputPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const PremiumInputPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 28,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth.isFinite ? constraints.maxWidth : 0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Colors.white.withValues(alpha: isDark ? 0.065 : 0.68),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: isDark ? 0.10 : 0.82),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isDark ? 0.28 : 0.07,
                      ),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Padding(padding: padding, child: child),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PremiumInputLabel extends StatelessWidget {
  final String label;
  final Color? color;

  const PremiumInputLabel({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: color ?? premiumInputMutedColor(context),
        fontWeight: FontWeight.w900,
        letterSpacing: -0.1,
      ),
    );
  }
}

class PremiumFormButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color color;

  const PremiumFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.color = const Color(0xFF38BDF8),
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: enabled ? 1 : 0.55,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(22),
          child: Ink(
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: [color, const Color(0xFF2563EB)],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.26),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 240),
                child: isLoading
                    ? const SizedBox(
                        key: ValueKey('loading'),
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        key: const ValueKey('content'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (icon != null) ...[
                            Icon(icon, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                          ],
                          Text(
                            label,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
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

Color premiumInputMutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return isDark
      ? Colors.white.withValues(alpha: 0.58)
      : Colors.black.withValues(alpha: 0.52);
}

Color premiumFieldFillColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Colors.white.withValues(alpha: isDark ? 0.07 : 0.72);
}
