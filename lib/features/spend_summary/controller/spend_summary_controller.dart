import 'package:get/get.dart';
import '../modal/categories_mock.dart';
import '../modal/transaction_model.dart';

class SpendSummaryController extends GetxController {

  final isLoading = false.obs;
  final totalSpend = 0.0.obs;
  final percentageChange = 12.5.obs;
  final selectedCategory = 0.obs;
  final RxList<CategoryModel> categoriesList =<CategoryModel>[].obs;
  final RxList<TransactionModel> transactionsList =<TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(milliseconds: 800),
    );
    categoriesList.assignAll(categories);
    transactionsList.assignAll(transactions);
    _calculateTotalSpend();
    isLoading.value = false;
  }

  void _calculateTotalSpend() {
    totalSpend.value = categoriesList.fold(
      0, (previousValue, element) =>
      previousValue + element.amount,
    );
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  List<TransactionModel> get filteredTransactions {
    if (categoriesList.isEmpty) {
      return transactionsList;
    }
    final selected = categoriesList[selectedCategory.value].name;
    return transactionsList.where((transaction) {
      return transaction.category == selected;
    }).toList();
  }

  Future<void> refreshData() async {
    await loadInitialData();
  }
}