import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';

class WalletShowcasePage extends StatelessWidget {
  const WalletShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Wallet Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            _WalletBalanceCard(),
            SizedBox(height: 16),
            _PaymentMethodSection(),
            SizedBox(height: 16),
            _QrAddressSection(),
            SizedBox(height: 16),
            _ReceiptSection(),
          ],
        ),
      ),
    );
  }
}

class _WalletBalanceCard extends StatelessWidget {
  const _WalletBalanceCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 34,
      padding: const EdgeInsets.all(24),
      gradientColors: [
        const Color(0xFFAEC2FF).withOpacity(0.22),
        Colors.white.withOpacity(0.08),
        const Color(0xFFB7FFE0).withOpacity(0.08),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlassPill(
            text: 'WALLET',
            icon: Icons.account_balance_wallet_rounded,
          ),
          const SizedBox(height: 22),
          Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white.withOpacity(0.62),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$12,840.50',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: GlassMiniButton(
                  text: 'Deposit',
                  icon: Icons.add_rounded,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: GlassMiniButton(
                  text: 'Withdraw',
                  icon: Icons.arrow_upward_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  const _PaymentMethodSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.credit_card_rounded,
      title: 'Payment Method',
      subtitle: 'Bank, card, and crypto payment card.',
      children: const [
        GlassActionTile(
          title: 'BCA Virtual Account',
          subtitle: '**** 8420',
          icon: Icons.account_balance_rounded,
        ),
        GlassActionTile(
          title: 'USDT Wallet',
          subtitle: 'TRC20 Network',
          icon: Icons.currency_bitcoin_rounded,
          color: Color(0xFFB7FFE0),
        ),
      ],
    );
  }
}

class _QrAddressSection extends StatelessWidget {
  const _QrAddressSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.qr_code_rounded,
      title: 'QR Code Address',
      subtitle: 'Crypto deposit address card.',
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: QrImageView(
              data: '0x742d35Cc6634C0532925a3b844Bc454e4438f44e',
              version: QrVersions.auto,
              size: 150,
            ),
          ),
        ),
        const SizedBox(height: 14),
        const GlassActionTile(
          title: '0x742d...f44e',
          subtitle: 'Tap to copy deposit address.',
          icon: Icons.copy_rounded,
        ),
      ],
    );
  }
}

class _ReceiptSection extends StatelessWidget {
  const _ReceiptSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.receipt_rounded,
      title: 'Fee Breakdown',
      subtitle: 'Receipt summary card.',
      children: const [
        KeyValueRow(label: 'Amount', value: '100 USDT'),
        GlassDivider(),
        KeyValueRow(label: 'Network Fee', value: '1 USDT'),
        GlassDivider(),
        KeyValueRow(label: 'Admin Fee', value: '0 USDT'),
        DottedDivider(),
        SizedBox(height: 10),
        KeyValueRow(
          label: 'Total Receive',
          value: '99 USDT',
          valueColor: Color(0xFFB7FFE0),
        ),
      ],
    );
  }
}
