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

param RoomHasCapacity[Rooms] := <01> 65, <02> 65, <03> 145, <04> 180, <05> 180, <06> 300;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t00", <18> "t00", <19> "t01", <20> "t01", <21> "t02", <22> "t02", <23> "t03", <24> "t03", <25> "t04", <26> "t04", <27> "t05", <28> "t05", <29> "t06", <30> "t06", <31> "t07", <32> "t07", <33> "t08";

param CourseHasStudents[Courses] := <01> 274, <02> 143, <03> 79, <04> 237, <05> 80, <06> 37, <07> 169, <08> 88, <09> 106, <10> 305, <11> 96, <12> 127, <13> 108, <14> 50, <15> 247, <16> 55, <17> 102, <18> 195, <19> 22, <20> 40, <21> 263, <22> 344, <23> 79, <24> 73, <25> 112, <26> 259, <27> 49, <28> 169, <29> 73, <30> 141, <31> 231, <32> 314, <33> 63;

param CourseHasEvents[Courses] := <01> 3, <02> 2, <03> 2, <04> 4, <05> 4, <06> 3, <07> 3, <08> 2, <09> 2, <10> 4, <11> 4, <12> 4, <13> 4, <14> 4, <15> 2, <16> 4, <17> 3, <18> 3, <19> 4, <20> 3, <21> 2, <22> 3, <23> 2, <24> 3, <25> 4, <26> 3, <27> 2, <28> 4, <29> 3, <30> 2, <31> 2, <32> 4, <33> 2;

param CourseHasMindays[Courses] := <01> 2, <02> 1, <03> 1, <04> 3, <05> 3, <06> 2, <07> 2, <08> 1, <09> 1, <10> 3, <11> 3, <12> 3, <13> 3, <14> 3, <15> 1, <16> 3, <17> 2, <18> 2, <19> 3, <20> 2, <21> 1, <22> 2, <23> 1, <24> 2, <25> 3, <26> 2, <27> 1, <28> 3, <29> 2, <30> 1, <31> 1, <32> 3, <33> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 5, <02> 7, <03> 4, <04> 0, <05> 12, <06> 0, <07> 10, <08> 0, <09> 3, <10> 5, <11> 5, <12> 0, <13> 5, <14> 0, <15> 3, <16> 0, <17> 2, <18> 0, <19> 1, <20> 5, <21> 9, <22> 5, <23> 0, <24> 0, <25> 9, <26> 3, <27> 0, <28> 2, <29> 10, <30> 0, <31> 0, <32> 2, <33> 3;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 6, <01,2> 7, <01,3> 8, <01,4> 9, <01,5> 10, <02,1> 6, <02,2> 7, <02,3> 8, <02,4> 9, <02,5> 10, <02,6> 14, <02,7> 15, <03,1> 1, <03,2> 2, <03,3> 3, <03,4> 4, <05,1> 6, <05,2> 7, <05,3> 14, <05,4> 15, <05,5> 16, <05,6> 17, <05,7> 18, <05,8> 21, <05,9> 22, <05,10> 23, <05,11> 24, <05,12> 25, <07,1> 1, <07,2> 2, <07,3> 3, <07,4> 4, <07,5> 5, <07,6> 21, <07,7> 22, <07,8> 23, <07,9> 24, <07,10> 25, <09,1> 18, <09,2> 19, <09,3> 20, <10,1> 16, <10,2> 17, <10,3> 18, <10,4> 19, <10,5> 20, <11,1> 1, <11,2> 2, <11,3> 3, <11,4> 4, <11,5> 5, <13,1> 4, <13,2> 5, <13,3> 16, <13,4> 17, <13,5> 18, <15,1> 6, <15,2> 7, <15,3> 8, <17,1> 4, <17,2> 5, <19,1> 16, <20,1> 6, <20,2> 7, <20,3> 8, <20,4> 9, <20,5> 10, <21,1> 11, <21,2> 12, <21,3> 13, <21,4> 14, <21,5> 16, <21,6> 17, <21,7> 18, <21,8> 19, <21,9> 20, <22,1> 11, <22,2> 12, <22,3> 13, <22,4> 14, <22,5> 15, <25,1> 6, <25,2> 7, <25,3> 8, <25,4> 9, <25,5> 21, <25,6> 22, <25,7> 23, <25,8> 24, <25,9> 25, <26,1> 21, <26,2> 22, <26,3> 23, <28,1> 11, <28,2> 12, <29,1> 11, <29,2> 12, <29,3> 13, <29,4> 14, <29,5> 15, <29,6> 16, <29,7> 17, <29,8> 18, <29,9> 19, <29,10> 20, <32,1> 6, <32,2> 7, <33,1> 23, <33,2> 24, <33,3> 25;

param CurriculumHasCoursesCount[Curricula] := <01> 5, <02> 4, <03> 4, <04> 4, <05> 2, <06> 2, <07> 4, <08> 4, <09> 3, <10> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 15, <01,2> 19, <01,3> 21, <01,4> 30, <01,5> 32, <02,1> 8, <02,2> 12, <02,3> 18, <02,4> 32, <03,1> 9, <03,2> 13, <03,3> 26, <03,4> 27, <04,1> 3, <04,2> 5, <04,3> 13, <04,4> 25, <05,1> 1, <05,2> 9, <06,1> 8, <06,2> 26, <07,1> 3, <07,2> 6, <07,3> 23, <07,4> 25, <08,1> 4, <08,2> 5, <08,3> 28, <08,4> 33, <09,1> 26, <09,2> 27, <09,3> 33, <10,1> 6, <10,2> 12, <10,3> 20, <10,4> 24, <10,5> 31;

param CurriculumHasEventsCount[Curricula] := <01> 14, <02> 13, <03> 11, <04> 14, <05> 5, <06> 5, <07> 11, <08> 14, <09> 7, <10> 15;

param nbTeachers := 16;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 3, <07> 3, <08> 3, <09> 3, <10> 3, <11> 3, <12> 3, <13> 3, <14> 1, <15> 1, <16> 2;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 15, <02,1> 13, <03,1> 16, <04,1> 14, <05,1> 12, <06,1> 8, <06,2> 31, <06,3> 32, <07,1> 7, <07,2> 29, <07,3> 30, <08,1> 6, <08,2> 27, <08,3> 28, <09,1> 5, <09,2> 25, <09,3> 26, <10,1> 4, <10,2> 23, <10,3> 24, <11,1> 3, <11,2> 21, <11,3> 22, <12,1> 2, <12,2> 19, <12,3> 20, <13,1> 1, <13,2> 17, <13,3> 18, <14,1> 11, <15,1> 10, <16,1> 9, <16,2> 33;

param TeacherHasEventsCount[Teachers] := <01> 2, <02> 4, <03> 4, <04> 4, <05> 4, <06> 8, <07> 8, <08> 9, <09> 11, <10> 9, <11> 7, <12> 9, <13> 9, <14> 4, <15> 4, <16> 4;

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
