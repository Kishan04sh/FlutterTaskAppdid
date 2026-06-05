import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final double amount;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
  });

  IconData _getIcon() {
    final lowerTitle = title.toLowerCase();

    if (lowerTitle.contains("food")) {
      return Icons.fastfood_rounded;
    } else if (lowerTitle.contains("travel")) {
      return Icons.flight_takeoff_rounded;
    } else if (lowerTitle.contains("shopping")) {
      return Icons.shopping_bag_rounded;
    } else if (lowerTitle.contains("bill")) {
      return Icons.receipt_long_rounded;
    }

    return Icons.account_balance_wallet_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: const Color(0xffEEF2FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              _getIcon(),
              color: const Color(0xff4F46E5),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Text(
                "- ₹${amount.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: Color(0xffEF4444),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 4),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4F6),
                  borderRadius:
                  BorderRadius.circular(8),
                ),
                child: const Text(
                  "Expense",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}