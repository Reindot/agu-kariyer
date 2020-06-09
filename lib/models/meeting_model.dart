class Meetings{
  final String meID;
  final String itID;
  final String itName;
  final String meName;
  final String where;
  final String when;
  final String clock;
  final int no;
  final int bugfix;
  final bool isConfirmed;
  final bool isDone;


  Meetings({this.meID, this.itID, this.itName, this.meName, this.where,
      this.when, this.clock, this.isConfirmed, this.no, this.bugfix, this.isDone});

  Map<String, dynamic> toMap(){
    return {
      'meID' : meID,
      'itID' : itID,
      'bugfix' : bugfix ?? 1,
      'itName' : itName,
      'meName' : meName,
      'isDone' : isDone ?? false,
      'where' : where,
      'when' : when,
      'clock' : clock,
      'no' : no,
      'isConfirmed' : isConfirmed ?? false,
    };
  }

  Meetings.fromMap(Map<String, dynamic> map):
        meID = map['meID'],
        itID = map['itID'],
        itName = map['itName'],
        meName = map['meName'],
        isDone = map['isDone'],
        bugfix = map['bugfix'],
        where = map['where'],
        no = map['no'],
        when = map['when'],
        clock = map['clock'],
        isConfirmed = map['isConfirmed'];
}