param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 5;
param nbDays := 5;
param nbCurricula := 10;
param nbCourses := 35;
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

param RoomHasCapacity[Rooms] := <01> 60, <02> 60, <03> 115, <04> 335, <05> 335;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t00", <18> "t00", <19> "t01", <20> "t01", <21> "t02", <22> "t02", <23> "t03", <24> "t03", <25> "t04", <26> "t04", <27> "t05", <28> "t05", <29> "t06", <30> "t06", <31> "t07", <32> "t07", <33> "t08", <34> "t08", <35> "t09";

param CourseHasStudents[Courses] := <01> 284, <02> 69, <03> 336, <04> 222, <05> 303, <06> 94, <07> 121, <08> 300, <09> 43, <10> 228, <11> 225, <12> 61, <13> 288, <14> 224, <15> 29, <16> 317, <17> 336, <18> 149, <19> 84, <20> 53, <21> 277, <22> 259, <23> 37, <24> 293, <25> 101, <26> 216, <27> 58, <28> 84, <29> 227, <30> 21, <31> 126, <32> 74, <33> 28, <34> 336, <35> 217;

param CourseHasEvents[Courses] := <01> 4, <02> 2, <03> 2, <04> 2, <05> 3, <06> 2, <07> 2, <08> 3, <09> 2, <10> 4, <11> 4, <12> 3, <13> 3, <14> 3, <15> 2, <16> 4, <17> 4, <18> 3, <19> 3, <20> 3, <21> 2, <22> 3, <23> 2, <24> 3, <25> 2, <26> 3, <27> 3, <28> 4, <29> 3, <30> 4, <31> 4, <32> 2, <33> 2, <34> 4, <35> 1;

param CourseHasMindays[Courses] := <01> 3, <02> 1, <03> 1, <04> 1, <05> 2, <06> 1, <07> 1, <08> 2, <09> 1, <10> 3, <11> 3, <12> 2, <13> 2, <14> 2, <15> 1, <16> 3, <17> 3, <18> 2, <19> 2, <20> 2, <21> 1, <22> 2, <23> 1, <24> 2, <25> 1, <26> 2, <27> 2, <28> 3, <29> 2, <30> 3, <31> 3, <32> 1, <33> 1, <34> 3, <35> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 3, <02> 4, <03> 6, <04> 0, <05> 0, <06> 0, <07> 3, <08> 3, <09> 4, <10> 9, <11> 5, <12> 0, <13> 0, <14> 14, <15> 2, <16> 8, <17> 0, <18> 8, <19> 0, <20> 8, <21> 3, <22> 0, <23> 3, <24> 1, <25> 0, <26> 0, <27> 4, <28> 5, <29> 5, <30> 6, <31> 0, <32> 4, <33> 1, <34> 10, <35> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 16, <01,2> 17, <01,3> 18, <02,1> 1, <02,2> 2, <02,3> 3, <02,4> 4, <03,1> 2, <03,2> 3, <03,3> 4, <03,4> 5, <03,5> 19, <03,6> 20, <07,1> 21, <07,2> 22, <07,3> 23, <08,1> 3, <08,2> 4, <08,3> 5, <09,1> 6, <09,2> 7, <09,3> 8, <09,4> 10, <10,1> 1, <10,2> 2, <10,3> 3, <10,4> 4, <10,5> 5, <10,6> 11, <10,7> 12, <10,8> 13, <10,9> 25, <11,1> 21, <11,2> 22, <11,3> 23, <11,4> 24, <11,5> 25, <14,1> 6, <14,2> 7, <14,3> 8, <14,4> 9, <14,5> 10, <14,6> 16, <14,7> 17, <14,8> 18, <14,9> 19, <14,10> 20, <14,11> 21, <14,12> 22, <14,13> 23, <14,14> 24, <15,1> 4, <15,2> 5, <16,1> 4, <16,2> 5, <16,3> 19, <16,4> 20, <16,5> 21, <16,6> 22, <16,7> 23, <16,8> 24, <18,1> 13, <18,2> 14, <18,3> 15, <18,4> 21, <18,5> 22, <18,6> 23, <18,7> 24, <18,8> 25, <20,1> 11, <20,2> 12, <20,3> 13, <20,4> 14, <20,5> 15, <20,6> 16, <20,7> 17, <20,8> 18, <21,1> 8, <21,2> 9, <21,3> 10, <23,1> 23, <23,2> 24, <23,3> 25, <24,1> 1, <27,1> 1, <27,2> 2, <27,3> 3, <27,4> 4, <28,1> 16, <28,2> 17, <28,3> 18, <28,4> 19, <28,5> 20, <29,1> 6, <29,2> 7, <29,3> 8, <29,4> 9, <29,5> 10, <30,1> 1, <30,2> 2, <30,3> 11, <30,4> 12, <30,5> 13, <30,6> 14, <32,1> 15, <32,2> 23, <32,3> 24, <32,4> 25, <33,1> 16, <34,1> 6, <34,2> 7, <34,3> 8, <34,4> 9, <34,5> 10, <34,6> 16, <34,7> 17, <34,8> 18, <34,9> 19, <34,10> 20;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 3, <03> 3, <04> 4, <05> 4, <06> 5, <07> 4, <08> 5, <09> 3, <10> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 10, <01,2> 11, <01,3> 16, <02,1> 6, <02,2> 18, <02,3> 21, <03,1> 3, <03,2> 8, <03,3> 16, <04,1> 22, <04,2> 23, <04,3> 25, <04,4> 33, <05,1> 23, <05,2> 29, <05,3> 31, <05,4> 34, <06,1> 5, <06,2> 12, <06,3> 13, <06,4> 27, <06,5> 33, <07,1> 2, <07,2> 4, <07,3> 10, <07,4> 31, <08,1> 3, <08,2> 7, <08,3> 8, <08,4> 14, <08,5> 27, <09,1> 4, <09,2> 10, <09,3> 29, <10,1> 3, <10,2> 26, <10,3> 32;

param CurriculumHasEventsCount[Curricula] := <01> 12, <02> 7, <03> 9, <04> 9, <05> 13, <06> 14, <07> 12, <08> 13, <09> 9, <10> 7;

param nbTeachers := 16;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 3, <07> 3, <08> 3, <09> 3, <10> 3, <11> 3, <12> 3, <13> 3, <14> 1, <15> 2, <16> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 15, <02,1> 13, <03,1> 16, <04,1> 14, <05,1> 12, <06,1> 8, <06,2> 31, <06,3> 32, <07,1> 7, <07,2> 29, <07,3> 30, <08,1> 6, <08,2> 27, <08,3> 28, <09,1> 5, <09,2> 25, <09,3> 26, <10,1> 4, <10,2> 23, <10,3> 24, <11,1> 3, <11,2> 21, <11,3> 22, <12,1> 2, <12,2> 19, <12,3> 20, <13,1> 1, <13,2> 17, <13,3> 18, <14,1> 11, <15,1> 10, <15,2> 35, <16,1> 9, <16,2> 33, <16,3> 34;

param TeacherHasEventsCount[Teachers] := <01> 2, <02> 3, <03> 4, <04> 3, <05> 3, <06> 9, <07> 9, <08> 9, <09> 8, <10> 7, <11> 7, <12> 8, <13> 11, <14> 4, <15> 5, <16> 8;

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
var SingletonChecks[Curricula * Days * DaySingletonChecks] binary;

minimize value:  
    (sum <p> in Periods: sum <r> in Rooms: sum <c> in Courses with CourseHasStudents[c] > RoomHasCapacity[r]:
      (Taught[p,r,c] * (CourseHasStudents[c] - RoomHasCapacity[r]))
    ) 
  + 5 * (sum <c> in Courses: CourseMinDayViolations[c])
  + 2 * (sum <cu> in Curricula: sum <d> in Days: sum <sc> in DaySingletonChecks: SingletonChecks[cu,d,sc]) 
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
