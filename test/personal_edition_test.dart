import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoist/features/billing/billing.dart';
import 'package:pomodoist/features/onboarding/onboarding_gate.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('personal edition enables local features without loading a store or claiming a purchase', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final controller = container.read(billingControllerProvider.notifier);
    await controller.reload();
    await controller.purchase('unused');
    final state = container.read(billingControllerProvider);
    expect(state.loading, isFalse);
    expect(state.hasActiveEntitlement, isTrue);
    expect(state.canPurchase, isFalse);
    expect(state.activeStoreKitProductIds, isEmpty);
    expect(state.accountEntitlementActive, isFalse);
    expect(state.error, isNull);
  });

  test('onboarding skips the paywall in both directions', () async {
    SharedPreferences.setMockInitialValues({});
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final controller = container.read(onboardingControllerProvider.notifier);
    controller.next();
    expect(container.read(onboardingControllerProvider).step, OnboardingStep.timer);
    controller.next();
    expect(container.read(onboardingControllerProvider).step, OnboardingStep.account);
    controller.back();
    expect(container.read(onboardingControllerProvider).step, OnboardingStep.timer);
    await Future<void>.delayed(Duration.zero);
  });
}
