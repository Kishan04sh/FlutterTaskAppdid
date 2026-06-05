import 'package:flutter/material.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                "Quick Analytics",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: _AnalyticsItem(
                  title: "Categories",
                  value: "5",
                  icon: Icons.grid_view_rounded,
                  iconColor: Color(0xff4F46E5),
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: _AnalyticsItem(
                  title: "Transactions",
                  value: "57",
                  icon: Icons.receipt_long_rounded,
                  iconColor: Color(0xff10B981),
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: _AnalyticsItem(
                  title: "Avg Spend",
                  value: "₹431",
                  icon: Icons.analytics_outlined,
                  iconColor: Color(0xffF59E0B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnalyticsItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _AnalyticsItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}