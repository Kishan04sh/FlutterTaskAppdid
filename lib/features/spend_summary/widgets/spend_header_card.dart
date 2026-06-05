import 'package:flutter/material.dart';

class SpendHeaderCard extends StatelessWidget {
  final double totalSpend;
  final double percentageChange;

  const SpendHeaderCard({
    super.key,
    required this.totalSpend,
    required this.percentageChange,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4F46E5),
            Color(0xff7C3AED),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4F46E5).withOpacity(.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          /// Background Design
          Positioned(
            top: -30,
            right: -20,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -40,
            left: -20,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// TOP HEADER
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons
                          .account_balance_wallet_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Monthly Spend",
                          overflow:
                          TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Expense Overview",
                          overflow:
                          TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color:
                      Colors.white.withOpacity(.15),
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "June",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// TOTAL SPEND
              Text(
                "₹ ${totalSpend.toStringAsFixed(0)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                  width < 360 ? 28 : 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Total expenses this month",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 16),

              /// GROWTH INFO
              Wrap(
                crossAxisAlignment:
                WrapCrossAlignment.center,
                spacing: 6,
                children: [
                  const Icon(
                    Icons.trending_up_rounded,
                    color: Colors.greenAccent,
                    size: 18,
                  ),
                  Text(
                    "+${percentageChange.toStringAsFixed(1)}%",
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "vs last month",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// BUDGET
              const Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                    "Budget Usage",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "72%",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              ClipRRect(
                borderRadius:
                BorderRadius.circular(30),
                child: const LinearProgressIndicator(
                  minHeight: 8,
                  value: .72,
                  backgroundColor:
                  Colors.white24,
                  valueColor:
                  AlwaysStoppedAnimation(
                    Colors.white,
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