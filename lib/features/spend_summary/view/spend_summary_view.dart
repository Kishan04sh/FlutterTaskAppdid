import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/spend_summary_controller.dart';
import '../widgets/analytics_card.dart';
import '../widgets/category_card.dart';
import '../widgets/spend_header_card.dart';
import '../widgets/transaction_tile.dart';

class SpendSummaryView extends GetView<SpendSummaryController> {
  const SpendSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 8,
        onPressed: () {},
        backgroundColor: const Color(0xff4F46E5),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Add Expense",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Obx(() => RefreshIndicator(
            onRefresh: controller.refreshData,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [

                /// HEADER
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [

                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xff4F46E5),
                          child: Text(
                            "K",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        const Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning 👋",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Kishan",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// SPEND CARD
                SliverToBoxAdapter(
                  child: SpendHeaderCard(
                    totalSpend:
                    controller.totalSpend.value,
                    percentageChange:
                    controller.percentageChange.value,
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),

                /// ANALYTICS
                const SliverToBoxAdapter(
                  child: AnalyticsCard(),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 25),
                ),

                /// CATEGORY TITLE
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 12),
                ),

                /// CATEGORY LIST
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      itemCount: controller.categoriesList.length,
                      separatorBuilder: (_, __) =>
                      const SizedBox(width: 2),
                      itemBuilder: (context, index) {
                        final item = controller.categoriesList[index];

                        return GestureDetector(
                          onTap: () => controller.selectCategory(index),
                          child: CategoryCard(
                            name: item.name,
                            icon: item.icon,
                            amount: item.amount,
                            isSelected: controller.selectedCategory.value == index,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),

                /// TRANSACTION TITLE
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Recent Transactions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See All",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 12),
                ),

                /// LOADING
                if (controller.isLoading.value)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(50),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )

                /// TRANSACTIONS
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                        final transaction = controller.filteredTransactions[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TransactionTile(
                            title: transaction.title,
                            date: transaction.date,
                            amount: transaction.amount,
                          ),
                        );
                      },
                      childCount: controller.filteredTransactions.length,
                    ),
                  ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 120),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}