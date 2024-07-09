import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/features/schedule_session/controller/schedule_session_controller.dart';
import 'package:linkin/features/schedule_session/view/widgets/session_type_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleSessionView extends StatefulWidget {
  const ScheduleSessionView({super.key});

  @override
  State<ScheduleSessionView> createState() => _ScheduleSessionViewState();
}

class _ScheduleSessionViewState extends State<ScheduleSessionView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Schedule Session',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: GetBuilder<ScheduleSessionController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Session Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 11,
                ),
                Container(
                  width: 353,
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          '${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 210,
                        ),
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Session Time",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 353,
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '${_selectedTime.hour}:${_selectedTime.minute}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      IconButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        icon: const Icon(Icons.access_time, size: 24),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Select Session Type",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ScheduleSessionController>(
                  builder: (controller) => Row(
                    children: [
                      SessionTypeWidget(
                        text: "Chat",
                        color: controller.selectedValue == "Chat"
                            ? const Color(0xff4547EB)
                            : Colors.white,
                        textColor: controller.selectedValue != "Chat"
                            ? const Color(0xff4547EB)
                            : Colors.white,
                        onPressed: () {
                          controller.selectedValue = "Chat";
                          controller.update();
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SessionTypeWidget(
                        text: "Call",
                        color: controller.selectedValue == "Call"
                            ? const Color(0xff4547EB)
                            : Colors.white,
                        textColor: controller.selectedValue != "Call"
                            ? const Color(0xff4547EB)
                            : Colors.white,
                        onPressed: () {
                          controller.selectedValue = "Call";
                          controller.update();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: Container(
                    width: 353,
                    height: 52,
                    color: const Color(0xff4547EB),
                    child: TextButton(
                      onPressed: () {
                        controller.dateController.text =
                            '${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}';
                        controller.timeController.text =
                            '${_selectedTime.hour}:${_selectedTime.minute}';
                        controller.update();
                        ApiService().skillSharingSchedule();
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
