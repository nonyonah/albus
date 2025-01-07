import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';

late ReownAppKitModal _appKitModal;

void initAppKitModal(BuildContext context) {
  _appKitModal = ReownAppKitModal(
    context: context,
    projectId: '59972ef7bbe74749333c1b2267265a47',
    metadata: const PairingMetadata(
      name: 'Albus',
      description: 'Decentralized budgeting app',
      url: 'https://example.com/',
      icons: ['https://example.com/logo.png'],
      redirect: Redirect(
        native: 'albus://',
        universal: 'https://reown.com/albus',
        linkMode: true,
      ),
    ),
  );
}
