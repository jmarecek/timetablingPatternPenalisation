param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 6;
param nbDays := 5;
param nbCurricula := 10;
param nbCourses := 33;
param nbPeriods := nbDays * nbPeriodsPerDay;
param nbMaxListCourses := 10;
param nbMaxListPeriods := 50;
param nbMaxEventsPerCourse := 6;

set Periods   := { 1 .. nbPeriods };
set Rooms     := { 1 .. nbRooms   };  
set Courses   := { 1 .. nbCourses };
set Curricula := { 1 .. nbCurricula };
set Days      := { 1 .. nbDays };
set ListCourses := { 1 .. nbMaxListCourses };
set ListPeriods := { 1 .. nbMaxListPeriods };
set PeriodsPerDay := { 1 .. nbPeriodsPerDay };
set DaySingletonChecks := { 1 .. nbDaySingletonChecks };

param RoomHasCapacity[Rooms] := <01> 85, <02> 130, <03> 145, <04> 145, <05> 170, <06> 170;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t00", <18> "t00", <19> "t01", <20> "t01", <21> "t02", <22> "t02", <23> "t03", <24> "t03", <25> "t04", <26> "t04", <27> "t05", <28> "t05", <29> "t06", <30> "t06", <31> "t07", <32> "t07", <33> "t08";

param CourseHasStudents[Courses] := <01> 320, <02> 43, <03> 125, <04> 291, <05> 60, <06> 147, <07> 134, <08> 214, <09> 213, <10> 57, <11> 278, <12> 200, <13> 213, <14> 38, <15> 60, <16> 31, <17> 111, <18> 173, <19> 346, <20> 193, <21> 106, <22> 144, <23> 120, <24> 295, <25> 259, <26> 202, <27> 225, <28> 213, <29> 232, <30> 212, <31> 25, <32> 220, <33> 139;

param CourseHasEvents[Courses] := <01> 4, <02> 4, <03> 4, <04> 3, <05> 3, <06> 3, <07> 4, <08> 4, <09> 3, <10> 4, <11> 3, <12> 4, <13> 2, <14> 2, <15> 4, <16> 3, <17> 2, <18> 3, <19> 2, <20> 2, <21> 2, <22> 3, <23> 4, <24> 4, <25> 3, <26> 4, <27> 2, <28> 2, <29> 3, <30> 3, <31> 2, <32> 4, <33> 1;

param CourseHasMindays[Courses] := <01> 3, <02> 3, <03> 3, <04> 2, <05> 2, <06> 2, <07> 3, <08> 3, <09> 2, <10> 3, <11> 2, <12> 3, <13> 1, <14> 1, <15> 3, <16> 2, <17> 1, <18> 2, <19> 1, <20> 1, <21> 1, <22> 2, <23> 3, <24> 3, <25> 2, <26> 3, <27> 1, <28> 1, <29> 2, <30> 2, <31> 1, <32> 3, <33> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 6, <03> 8, <04> 1, <05> 3, <06> 2, <07> 7, <08> 7, <09> 0, <10> 7, <11> 3, <12> 5, <13> 2, <14> 0, <15> 5, <16> 5, <17> 1, <18> 6, <19> 9, <20> 3, <21> 0, <22> 0, <23> 3, <24> 14, <25> 4, <26> 4, <27> 3, <28> 0, <29> 0, <30> 4, <31> 0, <32> 5, <33> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <02,1> 16, <02,2> 17, <02,3> 18, <02,4> 19, <02,5> 24, <02,6> 25, <03,1> 5, <03,2> 19, <03,3> 20, <03,4> 21, <03,5> 22, <03,6> 23, <03,7> 24, <03,8> 25, <04,1> 5, <05,1> 23, <05,2> 24, <05,3> 25, <06,1> 1, <06,2> 20, <07,1> 1, <07,2> 2, <07,3> 21, <07,4> 22, <07,5> 23, <07,6> 24, <07,7> 25, <08,1> 2, <08,2> 3, <08,3> 4, <08,4> 5, <08,5> 23, <08,6> 24, <08,7> 25, <10,1> 11, <10,2> 12, <10,3> 21, <10,4> 22, <10,5> 23, <10,6> 24, <10,7> 25, <11,1> 13, <11,2> 14, <11,3> 15, <12,1> 10, <12,2> 22, <12,3> 23, <12,4> 24, <12,5> 25, <13,1> 1, <13,2> 2, <15,1> 6, <15,2> 7, <15,3> 8, <15,4> 9, <15,5> 10, <16,1> 6, <16,2> 7, <16,3> 8, <16,4> 9, <16,5> 11, <17,1> 20, <18,1> 5, <18,2> 8, <18,3> 9, <18,4> 10, <18,5> 11, <18,6> 12, <19,1> 12, <19,2> 13, <19,3> 14, <19,4> 15, <19,5> 16, <19,6> 17, <19,7> 18, <19,8> 19, <19,9> 20, <20,1> 1, <20,2> 9, <20,3> 10, <23,1> 8, <23,2> 9, <23,3> 10, <24,1> 2, <24,2> 3, <24,3> 4, <24,4> 5, <24,5> 6, <24,6> 7, <24,7> 8, <24,8> 9, <24,9> 10, <24,10> 16, <24,11> 17, <24,12> 18, <24,13> 19, <24,14> 20, <25,1> 6, <25,2> 7, <25,3> 8, <25,4> 10, <26,1> 12, <26,2> 13, <26,3> 14, <26,4> 15, <27,1> 1, <27,2> 2, <27,3> 3, <30,1> 17, <30,2> 18, <30,3> 19, <30,4> 20, <32,1> 1, <32,2> 2, <32,3> 3, <32,4> 4, <32,5> 5;

param CurriculumHasCoursesCount[Curricula] := <01> 4, <02> 4, <03> 5, <04> 4, <05> 3, <06> 3, <07> 4, <08> 3, <09> 4, <10> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 1, <01,2> 14, <01,3> 15, <01,4> 25, <02,1> 4, <02,2> 6, <02,3> 7, <02,4> 27, <03,1> 5, <03,2> 6, <03,3> 27, <03,4> 28, <03,5> 32, <04,1> 7, <04,2> 26, <04,3> 27, <04,4> 30, <05,1> 7, <05,2> 8, <05,3> 16, <06,1> 26, <06,2> 29, <06,3> 32, <07,1> 3, <07,2> 11, <07,3> 15, <07,4> 21, <08,1> 5, <08,2> 12, <08,3> 20, <09,1> 2, <09,2> 7, <09,3> 23, <09,4> 31, <10,1> 1, <10,2> 9, <10,3> 30;

param CurriculumHasEventsCount[Curricula] := <01> 13, <02> 12, <03> 14, <04> 13, <05> 11, <06> 11, <07> 13, <08> 9, <09> 14, <10> 10;

param nbTeachers := 16;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 3, <07> 3, <08> 3, <09> 3, <10> 3, <11> 3, <12> 3, <13> 3, <14> 1, <15> 1, <16> 2;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 15, <02,1> 13, <03,1> 16, <04,1> 14, <05,1> 12, <06,1> 8, <06,2> 31, <06,3> 32, <07,1> 7, <07,2> 29, <07,3> 30, <08,1> 6, <08,2> 27, <08,3> 28, <09,1> 5, <09,2> 25, <09,3> 26, <10,1> 4, <10,2> 23, <10,3> 24, <11,1> 3, <11,2> 21, <11,3> 22, <12,1> 2, <12,2> 19, <12,3> 20, <13,1> 1, <13,2> 17, <13,3> 18, <14,1> 11, <15,1> 10, <16,1> 9, <16,2> 33;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 2, <03> 3, <04> 2, <05> 4, <06> 10, <07> 10, <08> 7, <09> 10, <10> 11, <11> 9, <12> 8, <13> 9, <14> 3, <15> 4, <16> 4;

param HasPeriods[Days * PeriodsPerDay] := <01,1> 1, <01,2> 2, <01,3> 3, <01,4> 4, <01,5> 5, <02,1> 6, <02,2> 7, <02,3> 8, <02,4> 9, <02,5> 10, <03,1> 11, <03,2> 12, <03,3> 13, <03,4> 14, <03,5> 15, <04,1> 16, <04,2> 17, <04,3> 18, <04,4> 19, <04,5> 20, <05,1> 21, <05,2> 22, <05,3> 23, <05,4> 24, <05,5> 25;

set HasNamedPeriods := {  <1, 1, 2, 3, 4, 5>, <2, 6, 7, 8, 9, 10>, <3, 11, 12, 13, 14, 15>, <4, 16, 17, 18, 19, 20>, <5, 21, 22, 23, 24, 25> };
set BannedCurriculumPatterns := { 
<1, -1, -1, -1, -1, 1, 0>, 
<1, -1, -1, -1, 1, -1, 0>, 
<1, -1, -1, 1, -1, -1, 0>, 
<2, -1, -1, 1, -1, 1, 1>, 
<1, -1, 1, -1, -1, -1, 0>, 
<2, -1, 1, -1, -1, 1, 1>, 
<2, -1, 1, -1, 1, -1, 1>, 
<1, -1, 1, -1, 1, 1, 2>, 
<1, -1, 1, 1, -1, 1, 2>, 
<1, 1, -1, -1, -1, -1, 0>, 
<2, 1, -1, -1, -1, 1, 1>, 
<2, 1, -1, -1, 1, -1, 1>, 
<1, 1, -1, -1, 1, 1, 2>, 
<2, 1, -1, 1, -1, -1, 1>, 
<3, 1, -1, 1, -1, 1, 2>, 
<1, 1, -1, 1, 1, -1, 2>, 
<1, 1, -1, 1, 1, 1, 3>, 
<1, 1, 1, -1, -1, 1, 2>, 
<1, 1, 1, -1, 1, -1, 2>, 
<1, 1, 1, 1, -1, 1, 3>};


# ------------------------------------------------------------------------------
#   Data set independent from this point on
# ------------------------------------------------------------------------------

var Taught[Periods * Rooms * Courses] binary; 
var CourseSchedule[Courses * Days] binary;
var CourseMinDayViolations[Courses] integer >= 0 <= nbDays;
var PatternPenalties[Curricula * Days] binary;
var SingletonChecks[Curricula * Days * DaySingletonChecks] binary;

minimize value:  
    (sum <p> in Periods: sum <r> in Rooms: sum <c> in Courses with CourseHasStudents[c] > RoomHasCapacity[r]:
      (Taught[p,r,c] * (CourseHasStudents[c] - RoomHasCapacity[r]))
    ) 
  + 5 * (sum <c> in Courses: CourseMinDayViolations[c])
  + (sum <cu> in Curricula: sum <d> in Days: PatternPenalties[cu,d]) 
  + (sum <cu> in Curricula: sum <d> in Days: sum <sc> in DaySingletonChecks: SingletonChecks[cu,d,sc]) 
;

#  forall (c in Courses)
#  sum (r in Rooms, p in Periods) Taught[p][r][c] == CourseInfo[c].events;

subto ctSessionAllocation: 
  forall <c> in Courses:
  sum <r> in Rooms: 
  sum <p> in Periods: 
  Taught[p,r,c] == CourseHasEvents[c]; 

#  forall (p in Periods, c in Courses)
#  sum (r in Rooms) Taught[p][r][c] <= 1; 

subto ctSessionsDistinctRooms:
  forall <p> in Periods:
  forall <c> in Courses:
  sum <r> in Rooms:
  Taught[p,r,c] <= 1;

#  forall (r in Rooms, p in Periods)
#  sum (c in Courses) Taught[p][r][c] <= 1;

subto ctRoomOccupancy:
  forall <r> in Rooms:
  forall <p> in Periods:
  sum <c> in Courses:
  Taught[p,r,c] <= 1;

#  forall (p in Periods, cu in Curricula)
#  sum (r in Rooms, c in CurriculumHasCourses[cu]) Taught[p][r][c] <= 1; 

subto ctCurriculumWithoutConflicts:
  forall <p> in Periods:
  forall <cu> in Curricula:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:  
  Taught[p,r,CurriculumHasCourses[cu,cnt]] <= 1;

#  forall (cu in Curricula)
#  sum (c in CurriculumHasCourses[cu], p in Periods, r in Rooms) 
#  Taught[p][r][c] == CurriculumHasEventsCount[cu];

subto ctCurriculumCheck:
  forall <cu> in Curricula:
  sum <p> in Periods:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:  
  Taught[p,r,CurriculumHasCourses[cu,cnt]] == CurriculumHasEventsCount[cu];
  
#  forall (p in Periods, t in Teachers)
#  sum (r in Rooms, c in TeacherHasCourses[t]) Taught[p][r][c] <= 1;   
  
subto ctTeacherWithoutConflicts:
  forall <p> in Periods:
  forall <t> in Teachers:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= TeacherHasCoursesCount[t]:
  Taught[p,r,TeacherHasCourses[t,cnt]] <= 1; 

#  forall (t in Teachers)
#  sum (c in TeacherHasCourses[t], p in Periods, r in Rooms) 
#  Taught[p][r][c] == TeacherHasEventsCount[t];

subto ctTeacherCheck:
  forall <t> in Teachers:
  sum <p> in Periods:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= TeacherHasCoursesCount[t]:
  Taught[p,r,TeacherHasCourses[t,cnt]] == TeacherHasEventsCount[t]; 
 
#  forall (c in Courses)
#  sum (r in Rooms, p in CourseInfo[c].deprecatedPeriods) Taught[p][r][c] == 0; 
 
subto ctAvailabilities: 
  forall <c> in Courses with CourseHasDeprecatedPeriodsCount[c] > 0:
  sum <cnt> in ListPeriods with cnt <= CourseHasDeprecatedPeriodsCount[c]:
  sum <r> in Rooms:
  Taught[CourseHasDeprecatedPeriods[c,cnt],r,c] == 0; 

#  forall (c in Courses, d in Days, p in HasPeriods[d])
#  sum (r in Rooms) Taught[p][r][c] <= CourseSchedule[c][d]; 
  
subto ctSurveyWorkingDays1:
  forall <c> in Courses:
  forall <d> in Days:
  forall <cnt> in PeriodsPerDay:
  sum <r> in Rooms:
  Taught[HasPeriods[d,cnt],r,c] <= CourseSchedule[c,d];

#  forall (c in Courses, d in Days)
#  sum (r in Rooms, p in HasPeriods[d]) Taught[p][r][c] >= CourseSchedule[c][d];

subto ctSurveyWorkingDays2:   
  forall <c> in Courses:
  forall <d> in Days:
  sum <r> in Rooms:
  sum <cnt> in PeriodsPerDay:
  Taught[HasPeriods[d,cnt],r,c] >= CourseSchedule[c,d];

#  forall (c in Courses) 
#  sum (d in Days) CourseSchedule[c][d] >= CourseInfo[c].minDays - CourseMinDayViolations[c];    
  
subto ctCountWorkingDays:
  forall <c> in Courses: 
  sum <d> in Days:
  CourseSchedule[c,d] >= CourseHasMindays[c] - CourseMinDayViolations[c];    

#  forall (c in Courses, d in Days)
#  sum (p in HasPeriods[d], r in Rooms) 
#  Taught[p][r][c] <= 1 + CourseInfo[c].events + CourseMinDayViolations[c] - CourseInfo[c].minDays; 

subto ctCheckWorkingDays1:
  forall <c> in Courses:
  forall <d> in Days:
  sum <r> in Rooms:
  sum <cnt> in PeriodsPerDay:
  Taught[HasPeriods[d,cnt],r,c] <= 1 + CourseHasEvents[c] + CourseMinDayViolations[c] - CourseHasMindays[c]; 
  
#  ctPenalisePatterns =
#  forall (cu in Curricula, <penalty, x1, x2, x3, x4, x5, minus> in  BannedCurriculumPatterns5)
#  forall (d in Days, <p1, p2, p3, p4, p5> in HasNamedPeriods[d])   
#  penalty * (
#  x1*(sum (c in CurriculumHasCourses[cu], r in Rooms) Taught[p1][r][c]) + 
#  x2*(sum (c in CurriculumHasCourses[cu], r in Rooms) Taught[p2][r][c]) +
#  x3*(sum (c in CurriculumHasCourses[cu], r in Rooms) Taught[p3][r][c]) + 
#  x4*(sum (c in CurriculumHasCourses[cu], r in Rooms) Taught[p4][r][c]) +
#  x5*(sum (c in CurriculumHasCourses[cu], r in Rooms) Taught[p5][r][c]) 
#  - minus)
#  <= PatternPenalties[cu][d];

subto ctPenalisePatterns:
  forall <cu> in Curricula:
  forall <penalty, x1, x2, x3, x4, x5, minus> in BannedCurriculumPatterns:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  penalty * (
  x1*(sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]: 
      sum <r> in Rooms: 
      Taught[p1,r,CurriculumHasCourses[cu,cnt]]) + 
  x2*(sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]: 
      sum <r> in Rooms: 
      Taught[p2,r,CurriculumHasCourses[cu,cnt]]) +
  x3*(sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]: 
      sum <r> in Rooms: 
      Taught[p3,r,CurriculumHasCourses[cu,cnt]]) +
  x4*(sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]: 
      sum <r> in Rooms: 
      Taught[p4,r,CurriculumHasCourses[cu,cnt]]) +
  x5*(sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]: 
      sum <r> in Rooms: 
      Taught[p5,r,CurriculumHasCourses[cu,cnt]]) 
  - minus)
  <= PatternPenalties[cu,d];

#  forall (cu in Curricula, d in Days, <p1, p2, p3, p4, p5> in HasNamedPeriods[d])   
#  sum (c in CurriculumHasCourses[cu], r in Rooms) (Taught[p1][r][c] - Taught[p2][r][c])
#  <= SingletonChecks[cu][d][1];

subto ctPenalisePatterns1:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods: 
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  (Taught[p1,r,CurriculumHasCourses[cu,cnt]] - Taught[p2,r,CurriculumHasCourses[cu,cnt]])
  <= SingletonChecks[cu,d,1];

#  forall (cu in Curricula, d in Days, <p1, p2, p3, p4, p5> in HasNamedPeriods[d])   
#  sum (c in CurriculumHasCourses[cu], r in Rooms) (Taught[p5][r][c] - Taught[p4][r][c])
#  <= SingletonChecks[cu][d][2];
  
subto ctPenalisePatterns2:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:  
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  (Taught[p5,r,CurriculumHasCourses[cu,cnt]] - Taught[p4,r,CurriculumHasCourses[cu,cnt]]) 
  <= SingletonChecks[cu,d,2];

#  forall (cu in Curricula, d in Days, <p1, p2, p3, p4, p5> in HasNamedPeriods[d])   
#  sum (c in CurriculumHasCourses[cu], r in Rooms) (Taught[p2][r][c] - Taught[p1][r][c] - Taught[p3][r][c])
#  <= SingletonChecks[cu][d][3];

subto ctPenalisePatterns3:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p2,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p1,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p3,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,3];

#  forall (cu in Curricula, d in Days, <p1, p2, p3, p4, p5> in HasNamedPeriods[d])   
#  sum (c in CurriculumHasCourses[cu], r in Rooms) (Taught[p3][r][c] - Taught[p2][r][c] - Taught[p4][r][c])
#  <= SingletonChecks[cu][d][4];

subto ctPenalisePatterns4:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p3,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p2,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p4,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,4];

#  forall (cu in Curricula, d in Days, <p1, p2, p3, p4, p5> in HasNamedPeriods[d])   
#  sum (c in CurriculumHasCourses[cu], r in Rooms) (Taught[p4][r][c] - Taught[p3][r][c] - Taught[p5][r][c])
#  <= SingletonChecks[cu][d][5];

subto ctPenalisePatterns5:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p4,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p3,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p5,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,5];
