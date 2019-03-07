param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 5;
param nbDays := 5;
param nbCurricula := 10;
param nbCourses := 37;
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

param RoomHasCapacity[Rooms] := <01> 105, <02> 195, <03> 195, <04> 195, <05> 325;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t00", <18> "t00", <19> "t01", <20> "t01", <21> "t02", <22> "t02", <23> "t03", <24> "t03", <25> "t04", <26> "t04", <27> "t05", <28> "t05", <29> "t06", <30> "t06", <31> "t07", <32> "t07", <33> "t08", <34> "t08", <35> "t09", <36> "t09", <37> "t10";

param CourseHasStudents[Courses] := <01> 335, <02> 343, <03> 250, <04> 54, <05> 348, <06> 44, <07> 168, <08> 231, <09> 171, <10> 137, <11> 32, <12> 40, <13> 84, <14> 176, <15> 118, <16> 347, <17> 115, <18> 179, <19> 303, <20> 211, <21> 319, <22> 249, <23> 277, <24> 172, <25> 93, <26> 171, <27> 202, <28> 247, <29> 70, <30> 199, <31> 145, <32> 316, <33> 263, <34> 320, <35> 223, <36> 162, <37> 199;

param CourseHasEvents[Courses] := <01> 2, <02> 2, <03> 3, <04> 2, <05> 4, <06> 2, <07> 4, <08> 2, <09> 2, <10> 3, <11> 4, <12> 3, <13> 3, <14> 2, <15> 2, <16> 3, <17> 3, <18> 2, <19> 2, <20> 4, <21> 2, <22> 2, <23> 2, <24> 2, <25> 4, <26> 4, <27> 4, <28> 3, <29> 2, <30> 2, <31> 2, <32> 4, <33> 2, <34> 2, <35> 4, <36> 2, <37> 3;

param CourseHasMindays[Courses] := <01> 1, <02> 1, <03> 2, <04> 1, <05> 3, <06> 1, <07> 3, <08> 1, <09> 1, <10> 2, <11> 3, <12> 2, <13> 2, <14> 1, <15> 1, <16> 2, <17> 2, <18> 1, <19> 1, <20> 3, <21> 1, <22> 1, <23> 1, <24> 1, <25> 3, <26> 3, <27> 3, <28> 2, <29> 1, <30> 1, <31> 1, <32> 3, <33> 1, <34> 1, <35> 3, <36> 1, <37> 2;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 0, <03> 4, <04> 1, <05> 11, <06> 2, <07> 4, <08> 6, <09> 0, <10> 5, <11> 0, <12> 0, <13> 5, <14> 4, <15> 4, <16> 6, <17> 0, <18> 5, <19> 0, <20> 9, <21> 5, <22> 4, <23> 0, <24> 1, <25> 0, <26> 7, <27> 0, <28> 0, <29> 0, <30> 5, <31> 5, <32> 5, <33> 2, <34> 5, <35> 7, <36> 0, <37> 2;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <03,1> 6, <03,2> 13, <03,3> 14, <03,4> 15, <04,1> 1, <05,1> 1, <05,2> 2, <05,3> 3, <05,4> 4, <05,5> 5, <05,6> 6, <05,7> 7, <05,8> 8, <05,9> 11, <05,10> 21, <05,11> 22, <06,1> 16, <06,2> 17, <07,1> 17, <07,2> 18, <07,3> 19, <07,4> 20, <08,1> 3, <08,2> 4, <08,3> 5, <08,4> 13, <08,5> 14, <08,6> 15, <10,1> 1, <10,2> 22, <10,3> 23, <10,4> 24, <10,5> 25, <13,1> 6, <13,2> 7, <13,3> 21, <13,4> 22, <13,5> 23, <14,1> 7, <14,2> 8, <14,3> 9, <14,4> 10, <15,1> 7, <15,2> 8, <15,3> 9, <15,4> 10, <16,1> 11, <16,2> 12, <16,3> 13, <16,4> 14, <16,5> 24, <16,6> 25, <18,1> 6, <18,2> 7, <18,3> 8, <18,4> 9, <18,5> 10, <20,1> 11, <20,2> 12, <20,3> 13, <20,4> 14, <20,5> 15, <20,6> 22, <20,7> 23, <20,8> 24, <20,9> 25, <21,1> 15, <21,2> 17, <21,3> 18, <21,4> 19, <21,5> 20, <22,1> 11, <22,2> 16, <22,3> 17, <22,4> 18, <24,1> 21, <26,1> 6, <26,2> 7, <26,3> 8, <26,4> 9, <26,5> 10, <26,6> 11, <26,7> 12, <30,1> 2, <30,2> 3, <30,3> 4, <30,4> 5, <30,5> 16, <31,1> 1, <31,2> 2, <31,3> 3, <31,4> 4, <31,5> 5, <32,1> 14, <32,2> 15, <32,3> 21, <32,4> 22, <32,5> 23, <33,1> 14, <33,2> 15, <34,1> 21, <34,2> 22, <34,3> 23, <34,4> 24, <34,5> 25, <35,1> 13, <35,2> 14, <35,3> 15, <35,4> 16, <35,5> 17, <35,6> 18, <35,7> 19, <37,1> 6, <37,2> 7;

param CurriculumHasCoursesCount[Curricula] := <01> 4, <02> 3, <03> 3, <04> 5, <05> 3, <06> 5, <07> 4, <08> 3, <09> 3, <10> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 1, <01,2> 21, <01,3> 26, <01,4> 32, <02,1> 20, <02,2> 31, <02,3> 33, <03,1> 11, <03,2> 16, <03,3> 23, <04,1> 5, <04,2> 12, <04,3> 25, <04,4> 26, <04,5> 28, <05,1> 23, <05,2> 28, <05,3> 34, <06,1> 6, <06,2> 7, <06,3> 8, <06,4> 10, <06,5> 17, <07,1> 2, <07,2> 6, <07,3> 29, <07,4> 33, <08,1> 2, <08,2> 3, <08,3> 14, <09,1> 1, <09,2> 6, <09,3> 22, <10,1> 1, <10,2> 20, <10,3> 36;

param CurriculumHasEventsCount[Curricula] := <01> 12, <02> 8, <03> 9, <04> 18, <05> 7, <06> 14, <07> 8, <08> 7, <09> 6, <10> 8;

param nbTeachers := 16;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 3, <07> 3, <08> 3, <09> 3, <10> 3, <11> 3, <12> 3, <13> 3, <14> 2, <15> 3, <16> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 15, <02,1> 13, <03,1> 16, <04,1> 14, <05,1> 12, <06,1> 8, <06,2> 31, <06,3> 32, <07,1> 7, <07,2> 29, <07,3> 30, <08,1> 6, <08,2> 27, <08,3> 28, <09,1> 5, <09,2> 25, <09,3> 26, <10,1> 4, <10,2> 23, <10,3> 24, <11,1> 3, <11,2> 21, <11,3> 22, <12,1> 2, <12,2> 19, <12,3> 20, <13,1> 1, <13,2> 17, <13,3> 18, <14,1> 11, <14,2> 37, <15,1> 10, <15,2> 35, <15,3> 36, <16,1> 9, <16,2> 33, <16,3> 34;

param TeacherHasEventsCount[Teachers] := <01> 2, <02> 3, <03> 3, <04> 2, <05> 3, <06> 8, <07> 8, <08> 9, <09> 12, <10> 6, <11> 7, <12> 8, <13> 7, <14> 7, <15> 9, <16> 6;

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

#  sum (cu in Curricula, d in Days) (PatternPenalties[cu][d]) -
#  sum (cu in Curricula, d in Days, s in DaySingletonChecks) (SingletonChecks[cu][d][s]) == 0;

subto ctPatternPenaltiesEqual1:
  sum <cu> in Curricula:
  sum <d> in Days:
  PatternPenalties[cu,d] ==
  sum <cu> in Curricula:
  sum <d> in Days:
  sum <sc> in DaySingletonChecks:
  SingletonChecks[cu,d,sc];    

#  forall (cu in Curricula)
#  sum (d in Days) (PatternPenalties[cu][d]) ==
#  sum (d in Days, s in DaySingletonChecks) (SingletonChecks[cu][d][s]);

subto ctPatternPenaltiesEqual2:
  forall <cu> in Curricula:
  sum <d> in Days:
  PatternPenalties[cu,d] ==
  sum <d> in Days:
  sum <sc> in DaySingletonChecks:
  SingletonChecks[cu,d,sc];

#  forall (cu in Curricula, d in Days)
#  sum (s in DaySingletonChecks) (SingletonChecks[cu][d][s]) == PatternPenalties[cu][d];

subto ctPatternPenaltiesEqual3:
  forall <cu> in Curricula:
  forall <d> in Days:
  sum <sc> in DaySingletonChecks:
  SingletonChecks[cu,d,sc] ==
  PatternPenalties[cu,d];
