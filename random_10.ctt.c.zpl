param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 5;
param nbDays := 5;
param nbCurricula := 10;
param nbCourses := 34;
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

param RoomHasCapacity[Rooms] := <01> 175, <02> 175, <03> 215, <04> 215, <05> 330;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t00", <18> "t00", <19> "t01", <20> "t01", <21> "t02", <22> "t02", <23> "t03", <24> "t03", <25> "t04", <26> "t04", <27> "t05", <28> "t05", <29> "t06", <30> "t06", <31> "t07", <32> "t07", <33> "t08", <34> "t08";

param CourseHasStudents[Courses] := <01> 200, <02> 144, <03> 106, <04> 237, <05> 65, <06> 207, <07> 55, <08> 126, <09> 217, <10> 118, <11> 301, <12> 266, <13> 57, <14> 242, <15> 144, <16> 186, <17> 93, <18> 215, <19> 277, <20> 292, <21> 331, <22> 181, <23> 27, <24> 42, <25> 175, <26> 316, <27> 28, <28> 247, <29> 277, <30> 195, <31> 166, <32> 70, <33> 212, <34> 42;

param CourseHasEvents[Courses] := <01> 4, <02> 4, <03> 3, <04> 3, <05> 2, <06> 4, <07> 2, <08> 2, <09> 4, <10> 4, <11> 2, <12> 3, <13> 3, <14> 3, <15> 4, <16> 2, <17> 2, <18> 2, <19> 3, <20> 3, <21> 3, <22> 3, <23> 4, <24> 3, <25> 2, <26> 4, <27> 2, <28> 4, <29> 2, <30> 3, <31> 2, <32> 4, <33> 3, <34> 2;

param CourseHasMindays[Courses] := <01> 3, <02> 3, <03> 2, <04> 2, <05> 1, <06> 3, <07> 1, <08> 1, <09> 3, <10> 3, <11> 1, <12> 2, <13> 2, <14> 2, <15> 3, <16> 1, <17> 1, <18> 1, <19> 2, <20> 2, <21> 2, <22> 2, <23> 3, <24> 2, <25> 1, <26> 3, <27> 1, <28> 3, <29> 1, <30> 2, <31> 1, <32> 3, <33> 2, <34> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 4, <02> 8, <03> 0, <04> 0, <05> 9, <06> 5, <07> 0, <08> 3, <09> 7, <10> 1, <11> 0, <12> 5, <13> 4, <14> 3, <15> 0, <16> 5, <17> 8, <18> 0, <19> 3, <20> 0, <21> 0, <22> 7, <23> 0, <24> 1, <25> 6, <26> 11, <27> 3, <28> 7, <29> 5, <30> 2, <31> 0, <32> 7, <33> 3, <34> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 16, <01,2> 17, <01,3> 18, <01,4> 19, <02,1> 3, <02,2> 4, <02,3> 5, <02,4> 6, <02,5> 7, <02,6> 8, <02,7> 9, <02,8> 10, <05,1> 1, <05,2> 2, <05,3> 3, <05,4> 6, <05,5> 7, <05,6> 21, <05,7> 22, <05,8> 23, <05,9> 24, <06,1> 1, <06,2> 2, <06,3> 3, <06,4> 4, <06,5> 5, <08,1> 21, <08,2> 22, <08,3> 23, <09,1> 1, <09,2> 2, <09,3> 3, <09,4> 11, <09,5> 12, <09,6> 24, <09,7> 25, <10,1> 11, <12,1> 15, <12,2> 22, <12,3> 23, <12,4> 24, <12,5> 25, <13,1> 16, <13,2> 17, <13,3> 18, <13,4> 19, <14,1> 18, <14,2> 19, <14,3> 20, <16,1> 5, <16,2> 17, <16,3> 18, <16,4> 19, <16,5> 20, <17,1> 8, <17,2> 9, <17,3> 10, <17,4> 21, <17,5> 22, <17,6> 23, <17,7> 24, <17,8> 25, <19,1> 21, <19,2> 22, <19,3> 23, <22,1> 11, <22,2> 12, <22,3> 13, <22,4> 14, <22,5> 15, <22,6> 19, <22,7> 20, <24,1> 25, <25,1> 16, <25,2> 17, <25,3> 18, <25,4> 19, <25,5> 20, <25,6> 25, <26,1> 5, <26,2> 6, <26,3> 7, <26,4> 8, <26,5> 9, <26,6> 10, <26,7> 16, <26,8> 17, <26,9> 18, <26,10> 19, <26,11> 20, <27,1> 16, <27,2> 17, <27,3> 18, <28,1> 11, <28,2> 12, <28,3> 16, <28,4> 17, <28,5> 18, <28,6> 19, <28,7> 20, <29,1> 6, <29,2> 7, <29,3> 8, <29,4> 9, <29,5> 10, <30,1> 24, <30,2> 25, <32,1> 12, <32,2> 13, <32,3> 14, <32,4> 15, <32,5> 23, <32,6> 24, <32,7> 25, <33,1> 23, <33,2> 24, <33,3> 25;

param CurriculumHasCoursesCount[Curricula] := <01> 5, <02> 3, <03> 3, <04> 4, <05> 3, <06> 4, <07> 5, <08> 5, <09> 4, <10> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 1, <01,2> 6, <01,3> 14, <01,4> 15, <01,5> 25, <02,1> 3, <02,2> 11, <02,3> 34, <03,1> 13, <03,2> 18, <03,3> 30, <04,1> 20, <04,2> 25, <04,3> 33, <04,4> 34, <05,1> 6, <05,2> 14, <05,3> 19, <06,1> 4, <06,2> 11, <06,3> 21, <06,4> 25, <07,1> 14, <07,2> 23, <07,3> 30, <07,4> 33, <07,5> 34, <08,1> 10, <08,2> 17, <08,3> 20, <08,4> 28, <08,5> 29, <09,1> 3, <09,2> 4, <09,3> 17, <09,4> 23, <10,1> 2, <10,2> 5, <10,3> 7, <10,4> 12, <10,5> 32;

param CurriculumHasEventsCount[Curricula] := <01> 17, <02> 7, <03> 8, <04> 10, <05> 10, <06> 10, <07> 15, <08> 15, <09> 12, <10> 15;

param nbTeachers := 16;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 3, <07> 3, <08> 3, <09> 3, <10> 3, <11> 3, <12> 3, <13> 3, <14> 1, <15> 1, <16> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 15, <02,1> 13, <03,1> 16, <04,1> 14, <05,1> 12, <06,1> 8, <06,2> 31, <06,3> 32, <07,1> 7, <07,2> 29, <07,3> 30, <08,1> 6, <08,2> 27, <08,3> 28, <09,1> 5, <09,2> 25, <09,3> 26, <10,1> 4, <10,2> 23, <10,3> 24, <11,1> 3, <11,2> 21, <11,3> 22, <12,1> 2, <12,2> 19, <12,3> 20, <13,1> 1, <13,2> 17, <13,3> 18, <14,1> 11, <15,1> 10, <16,1> 9, <16,2> 33, <16,3> 34;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 3, <03> 2, <04> 3, <05> 3, <06> 8, <07> 7, <08> 10, <09> 8, <10> 10, <11> 9, <12> 10, <13> 8, <14> 2, <15> 4, <16> 9;

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
