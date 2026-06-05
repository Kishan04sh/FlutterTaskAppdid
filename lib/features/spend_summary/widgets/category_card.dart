import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String icon;
  final double amount;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
    required this.amount,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: 135,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
          colors: [
            Color(0xff4F46E5),
            Color(0xff7C3AED),
          ],
        )
            : null,
        color: isSelected ? null : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? const Color(0xff4F46E5).withOpacity(.20)
                : Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isSelected
              ? Colors.transparent
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(.18)
                  : const Color(0xffEEF2FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: Center(
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "₹${amount.toStringAsFixed(0)}",
              maxLines: 1,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Colors.white
                    : const Color(0xff111827),
              ),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "Monthly",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              color: isSelected
                  ? Colors.white70
                  : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}