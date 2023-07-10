import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  JobCard({
    super.key,
    required this.name,
    required this.thumbnail,
    required this.startWorkingDate,
    required this.startWorkingTime,
    required this.endWorkingTime,
    required this.city,
    required this.totalBreakingMinute,
    required this.hourlySalary,
    required this.companyID,
  });
  String name;
  String thumbnail;
  String startWorkingDate;
  String startWorkingTime;
  String endWorkingTime;
  String city;
  String totalBreakingMinute;
  String hourlySalary;
  String companyID;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 5 / 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.fitWidth,
                    height: 110,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                height: 25,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Color(0xFF00C898),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.history,
                      size: 16,
                    ),
                    Text(
                      '$companyID日',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.access_time_rounded,
                        size: 11,
                      ),
                    ),
                    const SizedBox(width: 4), // Adjust the spacing as needed
                    Text(
                      startWorkingDate.substring(5),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      '${startWorkingTime.substring(0, 5)}~${endWorkingTime.substring(0, 5)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 11,
                    ),
                    const SizedBox(width: 4), // Adjust the spacing as needed
                    Text(
                      city,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.map_outlined,
                      size: 11,
                    ),
                    Text(
                      totalBreakingMinute,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              // Add a Divider widget
              height: 1,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$hourlySalary￥g',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
