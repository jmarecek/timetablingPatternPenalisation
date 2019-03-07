param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 10;
param nbDays := 5;
param nbCurricula := 20;
param nbCourses := 68;
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

param RoomHasCapacity[Rooms] := <01> 60, <02> 60, <03> 60, <04> 135, <05> 145, <06> 145, <07> 195, <08> 270, <09> 270, <10> 290;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t00", <35> "t00", <36> "t01", <37> "t01", <38> "t02", <39> "t02", <40> "t03", <41> "t03", <42> "t04", <43> "t04", <44> "t05", <45> "t05", <46> "t06", <47> "t06", <48> "t07", <49> "t07", <50> "t08", <51> "t08", <52> "t09", <53> "t09", <54> "t10", <55> "t10", <56> "t11", <57> "t11", <58> "t12", <59> "t12", <60> "t13", <61> "t13", <62> "t14", <63> "t14", <64> "t15", <65> "t15", <66> "t16", <67> "t16", <68> "t17";

param CourseHasStudents[Courses] := <01> 300, <02> 64, <03> 86, <04> 96, <05> 254, <06> 28, <07> 240, <08> 332, <09> 23, <10> 138, <11> 143, <12> 209, <13> 46, <14> 280, <15> 256, <16> 265, <17> 166, <18> 230, <19> 300, <20> 328, <21> 141, <22> 319, <23> 207, <24> 174, <25> 164, <26> 118, <27> 42, <28> 150, <29> 21, <30> 219, <31> 136, <32> 92, <33> 311, <34> 182, <35> 111, <36> 31, <37> 294, <38> 339, <39> 93, <40> 120, <41> 103, <42> 270, <43> 319, <44> 310, <45> 209, <46> 95, <47> 296, <48> 80, <49> 82, <50> 58, <51> 348, <52> 290, <53> 229, <54> 89, <55> 280, <56> 348, <57> 338, <58> 327, <59> 125, <60> 104, <61> 192, <62> 208, <63> 116, <64> 245, <65> 156, <66> 87, <67> 74, <68> 348;

param CourseHasEvents[Courses] := <01> 3, <02> 2, <03> 2, <04> 2, <05> 4, <06> 3, <07> 3, <08> 4, <09> 3, <10> 2, <11> 2, <12> 4, <13> 2, <14> 4, <15> 3, <16> 3, <17> 2, <18> 2, <19> 4, <20> 3, <21> 2, <22> 4, <23> 2, <24> 2, <25> 4, <26> 4, <27> 4, <28> 3, <29> 4, <30> 4, <31> 3, <32> 4, <33> 4, <34> 2, <35> 4, <36> 3, <37> 3, <38> 4, <39> 2, <40> 2, <41> 3, <42> 3, <43> 4, <44> 3, <45> 3, <46> 2, <47> 2, <48> 3, <49> 2, <50> 2, <51> 2, <52> 2, <53> 3, <54> 4, <55> 2, <56> 4, <57> 4, <58> 3, <59> 2, <60> 4, <61> 2, <62> 3, <63> 4, <64> 4, <65> 2, <66> 4, <67> 2, <68> 1;

param CourseHasMindays[Courses] := <01> 2, <02> 1, <03> 1, <04> 1, <05> 3, <06> 2, <07> 2, <08> 3, <09> 2, <10> 1, <11> 1, <12> 3, <13> 1, <14> 3, <15> 2, <16> 2, <17> 1, <18> 1, <19> 3, <20> 2, <21> 1, <22> 3, <23> 1, <24> 1, <25> 3, <26> 3, <27> 3, <28> 2, <29> 3, <30> 3, <31> 2, <32> 3, <33> 3, <34> 1, <35> 3, <36> 2, <37> 2, <38> 3, <39> 1, <40> 1, <41> 2, <42> 2, <43> 3, <44> 2, <45> 2, <46> 1, <47> 1, <48> 2, <49> 1, <50> 1, <51> 1, <52> 1, <53> 2, <54> 3, <55> 1, <56> 3, <57> 3, <58> 2, <59> 1, <60> 3, <61> 1, <62> 2, <63> 3, <64> 3, <65> 1, <66> 3, <67> 1, <68> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 1, <02> 0, <03> 3, <04> 0, <05> 3, <06> 1, <07> 0, <08> 0, <09> 0, <10> 0, <11> 3, <12> 6, <13> 11, <14> 0, <15> 10, <16> 8, <17> 4, <18> 5, <19> 0, <20> 6, <21> 3, <22> 0, <23> 6, <24> 10, <25> 0, <26> 2, <27> 0, <28> 10, <29> 1, <30> 12, <31> 7, <32> 1, <33> 0, <34> 4, <35> 9, <36> 1, <37> 0, <38> 9, <39> 0, <40> 5, <41> 1, <42> 0, <43> 4, <44> 0, <45> 2, <46> 1, <47> 4, <48> 0, <49> 0, <50> 5, <51> 4, <52> 11, <53> 6, <54> 0, <55> 1, <56> 6, <57> 2, <58> 3, <59> 5, <60> 0, <61> 0, <62> 3, <63> 11, <64> 3, <65> 0, <66> 5, <67> 0, <68> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 11, <03,1> 1, <03,2> 2, <03,3> 3, <05,1> 18, <05,2> 19, <05,3> 20, <06,1> 16, <11,1> 1, <11,2> 4, <11,3> 5, <12,1> 18, <12,2> 19, <12,3> 20, <12,4> 21, <12,5> 22, <12,6> 23, <13,1> 1, <13,2> 2, <13,3> 6, <13,4> 7, <13,5> 8, <13,6> 13, <13,7> 14, <13,8> 15, <13,9> 18, <13,10> 19, <13,11> 20, <15,1> 1, <15,2> 2, <15,3> 6, <15,4> 7, <15,5> 8, <15,6> 21, <15,7> 22, <15,8> 23, <15,9> 24, <15,10> 25, <16,1> 16, <16,2> 17, <16,3> 18, <16,4> 19, <16,5> 20, <16,6> 21, <16,7> 22, <16,8> 23, <17,1> 15, <17,2> 18, <17,3> 19, <17,4> 20, <18,1> 11, <18,2> 17, <18,3> 18, <18,4> 19, <18,5> 20, <20,1> 1, <20,2> 2, <20,3> 3, <20,4> 4, <20,5> 5, <20,6> 21, <21,1> 16, <21,2> 19, <21,3> 20, <23,1> 6, <23,2> 7, <23,3> 8, <23,4> 9, <23,5> 16, <23,6> 17, <24,1> 1, <24,2> 2, <24,3> 3, <24,4> 5, <24,5> 6, <24,6> 7, <24,7> 8, <24,8> 9, <24,9> 10, <24,10> 11, <26,1> 1, <26,2> 5, <28,1> 16, <28,2> 17, <28,3> 18, <28,4> 19, <28,5> 20, <28,6> 21, <28,7> 22, <28,8> 23, <28,9> 24, <28,10> 25, <29,1> 25, <30,1> 1, <30,2> 2, <30,3> 3, <30,4> 4, <30,5> 5, <30,6> 8, <30,7> 9, <30,8> 10, <30,9> 17, <30,10> 18, <30,11> 19, <30,12> 20, <31,1> 9, <31,2> 10, <31,3> 16, <31,4> 17, <31,5> 18, <31,6> 19, <31,7> 20, <32,1> 6, <34,1> 1, <34,2> 9, <34,3> 10, <34,4> 11, <35,1> 2, <35,2> 3, <35,3> 4, <35,4> 5, <35,5> 21, <35,6> 22, <35,7> 23, <35,8> 24, <35,9> 25, <36,1> 11, <38,1> 1, <38,2> 2, <38,3> 3, <38,4> 4, <38,5> 6, <38,6> 7, <38,7> 8, <38,8> 9, <38,9> 10, <40,1> 21, <40,2> 22, <40,3> 23, <40,4> 24, <40,5> 25, <41,1> 5, <43,1> 6, <43,2> 7, <43,3> 8, <43,4> 9, <45,1> 19, <45,2> 20, <46,1> 11, <47,1> 16, <47,2> 17, <47,3> 18, <47,4> 19, <50,1> 6, <50,2> 7, <50,3> 8, <50,4> 9, <50,5> 10, <51,1> 12, <51,2> 13, <51,3> 14, <51,4> 15, <52,1> 7, <52,2> 8, <52,3> 9, <52,4> 10, <52,5> 13, <52,6> 14, <52,7> 15, <52,8> 16, <52,9> 17, <52,10> 18, <52,11> 19, <53,1> 1, <53,2> 2, <53,3> 7, <53,4> 8, <53,5> 9, <53,6> 10, <55,1> 15, <56,1> 1, <56,2> 2, <56,3> 5, <56,4> 18, <56,5> 19, <56,6> 20, <57,1> 24, <57,2> 25, <58,1> 6, <58,2> 7, <58,3> 8, <59,1> 11, <59,2> 12, <59,3> 13, <59,4> 14, <59,5> 15, <62,1> 18, <62,2> 19, <62,3> 20, <63,1> 6, <63,2> 7, <63,3> 8, <63,4> 9, <63,5> 10, <63,6> 11, <63,7> 12, <63,8> 13, <63,9> 14, <63,10> 15, <63,11> 20, <64,1> 13, <64,2> 14, <64,3> 15, <66,1> 2, <66,2> 3, <66,3> 4, <66,4> 5, <66,5> 21;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 4, <03> 4, <04> 4, <05> 4, <06> 4, <07> 3, <08> 3, <09> 4, <10> 5, <11> 3, <12> 4, <13> 5, <14> 4, <15> 3, <16> 3, <17> 4, <18> 3, <19> 3, <20> 4;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 13, <01,2> 43, <01,3> 63, <02,1> 48, <02,2> 50, <02,3> 54, <02,4> 67, <03,1> 8, <03,2> 38, <03,3> 57, <03,4> 59, <04,1> 24, <04,2> 43, <04,3> 50, <04,4> 67, <05,1> 44, <05,2> 45, <05,3> 54, <05,4> 56, <06,1> 10, <06,2> 11, <06,3> 23, <06,4> 60, <07,1> 28, <07,2> 51, <07,3> 61, <08,1> 7, <08,2> 56, <08,3> 58, <09,1> 22, <09,2> 40, <09,3> 58, <09,4> 61, <10,1> 16, <10,2> 31, <10,3> 33, <10,4> 35, <10,5> 61, <11,1> 20, <11,2> 26, <11,3> 36, <12,1> 12, <12,2> 36, <12,3> 38, <12,4> 47, <13,1> 41, <13,2> 46, <13,3> 47, <13,4> 50, <13,5> 68, <14,1> 11, <14,2> 32, <14,3> 33, <14,4> 55, <15,1> 1, <15,2> 56, <15,3> 58, <16,1> 7, <16,2> 23, <16,3> 51, <17,1> 51, <17,2> 57, <17,3> 61, <17,4> 63, <18,1> 25, <18,2> 37, <18,3> 57, <19,1> 1, <19,2> 15, <19,3> 58, <20,1> 20, <20,2> 28, <20,3> 44, <20,4> 46;

param CurriculumHasEventsCount[Curricula] := <01> 10, <02> 11, <03> 14, <04> 10, <05> 14, <06> 10, <07> 7, <08> 10, <09> 11, <10> 16, <11> 10, <12> 13, <13> 10, <14> 12, <15> 10, <16> 7, <17> 12, <18> 11, <19> 9, <20> 11;

param nbTeachers := 33;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 3, <06> 3, <07> 3, <08> 2, <09> 3, <10> 3, <11> 3, <12> 3, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 3, <24> 3, <25> 3, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 3, <33> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 28, <02,1> 30, <03,1> 29, <04,1> 27, <05,1> 15, <05,2> 62, <05,3> 63, <06,1> 16, <06,2> 64, <06,3> 65, <07,1> 17, <07,2> 66, <07,3> 67, <08,1> 18, <08,2> 68, <09,1> 11, <09,2> 54, <09,3> 55, <10,1> 12, <10,2> 56, <10,3> 57, <11,1> 13, <11,2> 58, <11,3> 59, <12,1> 14, <12,2> 60, <12,3> 61, <13,1> 19, <14,1> 20, <15,1> 31, <16,1> 32, <17,1> 33, <18,1> 8, <18,2> 48, <18,3> 49, <19,1> 7, <19,2> 46, <19,3> 47, <20,1> 6, <20,2> 44, <20,3> 45, <21,1> 5, <21,2> 42, <21,3> 43, <22,1> 4, <22,2> 40, <22,3> 41, <23,1> 3, <23,2> 38, <23,3> 39, <24,1> 2, <24,2> 36, <24,3> 37, <25,1> 1, <25,2> 34, <25,3> 35, <26,1> 22, <27,1> 21, <28,1> 24, <29,1> 23, <30,1> 26, <31,1> 25, <32,1> 10, <32,2> 52, <32,3> 53, <33,1> 9, <33,2> 50, <33,3> 51;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 4, <03> 4, <04> 4, <05> 10, <06> 9, <07> 8, <08> 3, <09> 8, <10> 12, <11> 7, <12> 10, <13> 4, <14> 3, <15> 3, <16> 4, <17> 4, <18> 9, <19> 7, <20> 9, <21> 11, <22> 7, <23> 8, <24> 8, <25> 9, <26> 4, <27> 2, <28> 2, <29> 2, <30> 4, <31> 4, <32> 7, <33> 7;

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
