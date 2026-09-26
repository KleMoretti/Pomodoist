import 'package:pomodoist/data/repositories/billing/billing_repository.dart';
import 'package:pomodoist/domain/models/billing/billing_access.dart';
import 'package:pomodoist/domain/models/billing/billing_models.dart';
import 'package:pomodoist/domain/models/billing/billing_store_models.dart';
import 'package:pomodoist/utils/result.dart';

/// Local access for the Chinese personal edition.
///
/// The personal edition exposes local features without representing a hosted
/// account entitlement or constructing a StoreKit/Stripe service.
final class PersonalEditionBillingRepository implements BillingRepository {
  const PersonalEditionBillingRepository();

  @override
  BillingAccess get currentAccess => (
    hasActiveEntitlement: true,
    hasLocalStoreKitEntitlement: false,
    loading: false,
  );

  @override
  Stream<BillingAccess> watchAccess() => Stream.value(currentAccess);

  @override
  Future<Result<void>> refresh() async => const Result.ok(null);

  @override
  String? get activeProductId => null;

  @override
  Set<String> get activeStoreKitProductIds => const {};

  @override
  Set<String> get purchasedProductIds => const {};

  @override
  bool get accountEntitlementActive => false;

  @override
  bool get environmentEntitlementActive => true;

  @override
  BillingEntitlement? get activeAccountEntitlement => null;

  @override
  bool get storeAvailable => false;

  @override
  String? get purchaseSuccessProductId => null;

  @override
  BillingFailure? get confirmationFailure => null;

  @override
  Stream<BillingPurchaseUpdate> get purchaseUpdates => const Stream.empty();

  @override
  Stream<BillingFailure> get purchaseErrors => const Stream.empty();

  @override
  Future<Result<void>> restore() async => const Result.ok(null);

  @override
  Future<void> processPurchaseUpdate(BillingPurchaseUpdate purchase) async {}

  @override
  void beginPurchase(String productId) {}

  @override
  void cancelPurchase() {}

  @override
  void setStoreAvailable(bool available) {}

  @override
  void clearPurchaseSuccess() {}

  @override
  void clearError() {}

  @override
  BillingCatalog get catalog => BillingCatalog(platformSupported: false);

  @override
  Future<void> loadCatalog() async {}

  @override
  Future<Result<bool>> purchase(String productId, {String? returnOfferId}) async {
    return const Result.ok(false);
  }

  @override
  String? get pendingProductId => null;

  @override
  Future<BillingReturnOffers> loadReturnOffers() async => BillingReturnOffers();

  @override
  bool isCancellation(Object error) => false;
}
