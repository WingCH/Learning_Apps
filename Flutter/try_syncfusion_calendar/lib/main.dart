import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

/*
How to add the appointments to Firestore Database using Flutter Calendar
https://www.syncfusion.com/kb/12616/how-to-add-the-appointments-to-firestore-database-using-flutter-calendar
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'HK'),
      ],
      locale: const Locale('zh', 'HK'),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MeetingDataSource? _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = MeetingDataSource(_getDataSource());
  }

  void calendarTapped(CalendarTapDetails details) {
    print(details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // height: 500,
        child: SfCalendar(
          view: CalendarView.month,
          showNavigationArrow: true,
          initialSelectedDate: DateTime.now(),
          dataSource: _dataSource,
          monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
            showAgenda: true,
            agendaViewHeight: 400,
            agendaItemHeight: 70,
            dayFormat: 'EEE',
          ),
          onTap: calendarTapped,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*
          方法： 成個_dataSource換
          ref: https://www.syncfusion.com/kb/12616/how-to-add-the-appointments-to-firestore-database-using-flutter-calendar
           */
          // List<Appointment> _list =
          // _dataSource!.appointments!.cast<Appointment>();
          // _list.add(
          //   Appointment(
          //     startTime: DateTime.now(),
          //     endTime: DateTime.now().add(const Duration(hours: 2)),
          //     subject: 'Conference',
          //     color: Color(0xFF0F8644),
          //     isAllDay: false,
          //   ),
          // );
          // setState(() {
          //   _dataSource = MeetingDataSource(_list);
          // });

          /*
          方法2: 只是加入要加入的event
           */
          _dataSource!.notifyListeners(CalendarDataSourceAction.add, [
            Appointment(
              startTime: DateTime.now(),
              endTime: DateTime.now().add(const Duration(hours: 2)),
              subject: 'Conference',
              color: Color(0xFF0F8644),
              isAllDay: false,
            )
          ]);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Appointment> _getDataSource() {
    // https://help.syncfusion.com/flutter/calendar/appointments
    final List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day + 1, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    meetings.add(
      Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'Conference',
        color: Color(0xFF0F8644),
        isAllDay: false,
      ),
    );

    // meetings.add(Meeting(
    //     'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

/*
  以下只在 非Appointment 會觸發
   */
// @override
// DateTime getStartTime(int index) {
//   return appointments![index].from;
// }
//
// @override
// DateTime getEndTime(int index) {
//   return appointments![index].to;
// }
//
// @override
// String getSubject(int index) {
//   return appointments![index].eventName;
// }
//
// @override
// Color getColor(int index) {
//   return appointments![index].background;
// }
//
// @override
// bool isAllDay(int index) {
//   return appointments![index].isAllDay;
// }
}

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }