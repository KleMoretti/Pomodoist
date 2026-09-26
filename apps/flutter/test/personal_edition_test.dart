import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoist/config/billing_dependencies.dart';
import 'package:pomodoist/config/billing_store_dependencies.dart';
import 'package:pomodoist/ui/billing/view_models/billing_view_model.dart';
import 'package:pomodoist/ui/onboarding/widgets/onboarding_gate.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('personal edition enables local access without constructing a store', () async {
    final container = ProviderContainer(
      overrides: [
        billingStoreProvider.overrideWith(
          (ref) => throw StateError('personal edition must not construct a store'),
        ),
      ],
    );
    addTearDown(container.dispose);
    expect(container.read(billingRepositoryProvider), isNotNull);
    await container.read(billingViewModelProvider.notifier).reload();
    final state = container.read(billingViewModelProvider);
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
    final controller = container.read(onboardingViewModelProvider.notifier);
    controller.next();
    expect(container.read(onboardingViewModelProvider).step, OnboardingStep.timer);
    controller.next();
    expect(container.read(onboardingViewModelProvider).step, OnboardingStep.account);
    controller.back();
    expect(container.read(onboardingViewModelProvider).step, OnboardingStep.timer);
    await Future<void>.delayed(Duration.zero);
  });
}
