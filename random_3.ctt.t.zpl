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

param RoomHasCapacity[Rooms] := <01> 85, <02> 130, <03> 130, <04> 240, <05> 240, <06> 300;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t00", <18> "t00", <19> "t01", <20> "t01", <21> "t02", <22> "t02", <23> "t03", <24> "t03", <25> "t04", <26> "t04", <27> "t05", <28> "t05", <29> "t06", <30> "t06", <31> "t07", <32> "t07", <33> "t08";

param CourseHasStudents[Courses] := <01> 201, <02> 97, <03> 195, <04> 336, <05> 197, <06> 66, <07> 334, <08> 164, <09> 292, <10> 197, <11> 257, <12> 204, <13> 124, <14> 124, <15> 97, <16> 70, <17> 28, <18> 309, <19> 309, <20> 278, <21> 212, <22> 214, <23> 277, <24> 76, <25> 191, <26> 121, <27> 162, <28> 299, <29> 255, <30> 87, <31> 327, <32> 278, <33> 94;

param CourseHasEvents[Courses] := <01> 4, <02> 2, <03> 4, <04> 2, <05> 4, <06> 2, <07> 4, <08> 2, <09> 3, <10> 3, <11> 2, <12> 2, <13> 4, <14> 3, <15> 4, <16> 2, <17> 3, <18> 4, <19> 3, <20> 4, <21> 4, <22> 3, <23> 3, <24> 2, <25> 3, <26> 3, <27> 4, <28> 3, <29> 3, <30> 4, <31> 2, <32> 4, <33> 1;

param CourseHasMindays[Courses] := <01> 3, <02> 1, <03> 3, <04> 1, <05> 3, <06> 1, <07> 3, <08> 1, <09> 2, <10> 2, <11> 1, <12> 1, <13> 3, <14> 2, <15> 3, <16> 1, <17> 2, <18> 3, <19> 2, <20> 3, <21> 3, <22> 2, <23> 2, <24> 1, <25> 2, <26> 2, <27> 3, <28> 2, <29> 2, <30> 3, <31> 1, <32> 3, <33> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 1, <02> 4, <03> 3, <04> 4, <05> 3, <06> 7, <07> 4, <08> 3, <09> 0, <10> 7, <11> 0, <12> 12, <13> 0, <14> 0, <15> 5, <16> 5, <17> 3, <18> 5, <19> 0, <20> 6, <21> 9, <22> 9, <23> 4, <24> 15, <25> 1, <26> 2, <27> 0, <28> 2, <29> 0, <30> 3, <31> 3, <32> 0, <33> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 6, <02,1> 22, <02,2> 23, <02,3> 24, <02,4> 25, <03,1> 13, <03,2> 14, <03,3> 15, <04,1> 2, <04,2> 3, <04,3> 4, <04,4> 5, <05,1> 1, <05,2> 10, <05,3> 21, <06,1> 1, <06,2> 2, <06,3> 3, <06,4> 21, <06,5> 22, <06,6> 24, <06,7> 25, <07,1> 12, <07,2> 13, <07,3> 14, <07,4> 15, <08,1> 23, <08,2> 24, <08,3> 25, <10,1> 6, <10,2> 7, <10,3> 8, <10,4> 9, <10,5> 10, <10,6> 15, <10,7> 25, <12,1> 4, <12,2> 5, <12,3> 11, <12,4> 12, <12,5> 13, <12,6> 14, <12,7> 15, <12,8> 16, <12,9> 17, <12,10> 18, <12,11> 19, <12,12> 20, <15,1> 11, <15,2> 12, <15,3> 13, <15,4> 14, <15,5> 15, <16,1> 16, <16,2> 17, <16,3> 18, <16,4> 21, <16,5> 22, <17,1> 14, <17,2> 15, <17,3> 20, <18,1> 21, <18,2> 22, <18,3> 23, <18,4> 24, <18,5> 25, <20,1> 7, <20,2> 8, <20,3> 9, <20,4> 10, <20,5> 21, <20,6> 22, <21,1> 15, <21,2> 18, <21,3> 19, <21,4> 20, <21,5> 21, <21,6> 22, <21,7> 23, <21,8> 24, <21,9> 25, <22,1> 1, <22,2> 2, <22,3> 3, <22,4> 4, <22,5> 5, <22,6> 22, <22,7> 23, <22,8> 24, <22,9> 25, <23,1> 1, <23,2> 11, <23,3> 12, <23,4> 13, <24,1> 6, <24,2> 7, <24,3> 8, <24,4> 9, <24,5> 11, <24,6> 12, <24,7> 13, <24,8> 14, <24,9> 15, <24,10> 19, <24,11> 20, <24,12> 21, <24,13> 22, <24,14> 23, <24,15> 24, <25,1> 10, <26,1> 1, <26,2> 2, <28,1> 4, <28,2> 5, <30,1> 10, <30,2> 14, <30,3> 15, <31,1> 8, <31,2> 9, <31,3> 10;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 3, <03> 5, <04> 5, <05> 5, <06> 4, <07> 3, <08> 4, <09> 4, <10> 4;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 20, <01,2> 25, <01,3> 27, <02,1> 7, <02,2> 27, <02,3> 30, <03,1> 1, <03,2> 9, <03,3> 12, <03,4> 13, <03,5> 25, <04,1> 8, <04,2> 20, <04,3> 22, <04,4> 26, <04,5> 32, <05,1> 5, <05,2> 14, <05,3> 23, <05,4> 25, <05,5> 27, <06,1> 6, <06,2> 20, <06,3> 26, <06,4> 30, <07,1> 2, <07,2> 11, <07,3> 12, <08,1> 8, <08,2> 9, <08,3> 17, <08,4> 26, <09,1> 13, <09,2> 23, <09,3> 27, <09,4> 33, <10,1> 1, <10,2> 16, <10,3> 22, <10,4> 33;

param CurriculumHasEventsCount[Curricula] := <01> 11, <02> 12, <03> 16, <04> 16, <05> 17, <06> 13, <07> 6, <08> 11, <09> 12, <10> 10;

param nbTeachers := 16;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 3, <07> 3, <08> 3, <09> 3, <10> 3, <11> 3, <12> 3, <13> 3, <14> 1, <15> 1, <16> 2;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 15, <02,1> 13, <03,1> 16, <04,1> 14, <05,1> 12, <06,1> 8, <06,2> 31, <06,3> 32, <07,1> 7, <07,2> 29, <07,3> 30, <08,1> 6, <08,2> 27, <08,3> 28, <09,1> 5, <09,2> 25, <09,3> 26, <10,1> 4, <10,2> 23, <10,3> 24, <11,1> 3, <11,2> 21, <11,3> 22, <12,1> 2, <12,2> 19, <12,3> 20, <13,1> 1, <13,2> 17, <13,3> 18, <14,1> 11, <15,1> 10, <16,1> 9, <16,2> 33;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 4, <03> 2, <04> 3, <05> 2, <06> 8, <07> 11, <08> 9, <09> 10, <10> 7, <11> 11, <12> 9, <13> 11, <14> 2, <15> 3, <16> 4;

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
