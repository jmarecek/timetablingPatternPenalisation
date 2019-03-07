param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 10;
param nbDays := 5;
param nbCurricula := 20;
param nbCourses := 67;
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

param RoomHasCapacity[Rooms] := <01> 50, <02> 150, <03> 150, <04> 205, <05> 205, <06> 205, <07> 245, <08> 245, <09> 255, <10> 345;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t00", <35> "t00", <36> "t01", <37> "t01", <38> "t02", <39> "t02", <40> "t03", <41> "t03", <42> "t04", <43> "t04", <44> "t05", <45> "t05", <46> "t06", <47> "t06", <48> "t07", <49> "t07", <50> "t08", <51> "t08", <52> "t09", <53> "t09", <54> "t10", <55> "t10", <56> "t11", <57> "t11", <58> "t12", <59> "t12", <60> "t13", <61> "t13", <62> "t14", <63> "t14", <64> "t15", <65> "t15", <66> "t16", <67> "t16";

param CourseHasStudents[Courses] := <01> 146, <02> 160, <03> 76, <04> 141, <05> 324, <06> 135, <07> 236, <08> 202, <09> 241, <10> 66, <11> 22, <12> 345, <13> 74, <14> 104, <15> 170, <16> 88, <17> 60, <18> 203, <19> 121, <20> 231, <21> 114, <22> 129, <23> 247, <24> 296, <25> 242, <26> 266, <27> 292, <28> 24, <29> 285, <30> 92, <31> 29, <32> 28, <33> 180, <34> 67, <35> 45, <36> 267, <37> 108, <38> 333, <39> 328, <40> 30, <41> 248, <42> 119, <43> 148, <44> 55, <45> 278, <46> 156, <47> 229, <48> 99, <49> 278, <50> 256, <51> 88, <52> 260, <53> 119, <54> 347, <55> 60, <56> 114, <57> 48, <58> 334, <59> 299, <60> 343, <61> 70, <62> 24, <63> 312, <64> 229, <65> 84, <66> 282, <67> 205;

param CourseHasEvents[Courses] := <01> 3, <02> 3, <03> 3, <04> 4, <05> 3, <06> 4, <07> 2, <08> 4, <09> 3, <10> 2, <11> 3, <12> 4, <13> 3, <14> 2, <15> 4, <16> 3, <17> 4, <18> 4, <19> 3, <20> 4, <21> 2, <22> 2, <23> 2, <24> 2, <25> 4, <26> 3, <27> 4, <28> 3, <29> 2, <30> 4, <31> 2, <32> 3, <33> 2, <34> 4, <35> 2, <36> 2, <37> 4, <38> 2, <39> 3, <40> 2, <41> 4, <42> 3, <43> 3, <44> 4, <45> 3, <46> 3, <47> 3, <48> 3, <49> 4, <50> 3, <51> 3, <52> 2, <53> 3, <54> 4, <55> 4, <56> 2, <57> 2, <58> 4, <59> 3, <60> 3, <61> 3, <62> 3, <63> 3, <64> 2, <65> 4, <66> 2, <67> 1;

param CourseHasMindays[Courses] := <01> 2, <02> 2, <03> 2, <04> 3, <05> 2, <06> 3, <07> 1, <08> 3, <09> 2, <10> 1, <11> 2, <12> 3, <13> 2, <14> 1, <15> 3, <16> 2, <17> 3, <18> 3, <19> 2, <20> 3, <21> 1, <22> 1, <23> 1, <24> 1, <25> 3, <26> 2, <27> 3, <28> 2, <29> 1, <30> 3, <31> 1, <32> 2, <33> 1, <34> 3, <35> 1, <36> 1, <37> 3, <38> 1, <39> 2, <40> 1, <41> 3, <42> 2, <43> 2, <44> 3, <45> 2, <46> 2, <47> 2, <48> 2, <49> 3, <50> 2, <51> 2, <52> 1, <53> 2, <54> 3, <55> 3, <56> 1, <57> 1, <58> 3, <59> 2, <60> 2, <61> 2, <62> 2, <63> 2, <64> 1, <65> 3, <66> 1, <67> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 5, <02> 4, <03> 3, <04> 0, <05> 8, <06> 5, <07> 2, <08> 0, <09> 1, <10> 3, <11> 4, <12> 9, <13> 7, <14> 5, <15> 0, <16> 6, <17> 7, <18> 5, <19> 3, <20> 6, <21> 0, <22> 2, <23> 5, <24> 5, <25> 7, <26> 1, <27> 0, <28> 12, <29> 2, <30> 0, <31> 11, <32> 1, <33> 0, <34> 1, <35> 0, <36> 10, <37> 1, <38> 3, <39> 0, <40> 0, <41> 4, <42> 2, <43> 8, <44> 1, <45> 0, <46> 1, <47> 6, <48> 7, <49> 2, <50> 10, <51> 10, <52> 1, <53> 0, <54> 3, <55> 2, <56> 5, <57> 0, <58> 5, <59> 4, <60> 0, <61> 5, <62> 0, <63> 5, <64> 7, <65> 0, <66> 4, <67> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 6, <01,2> 7, <01,3> 8, <01,4> 9, <01,5> 10, <02,1> 11, <02,2> 12, <02,3> 13, <02,4> 14, <03,1> 11, <03,2> 12, <03,3> 25, <05,1> 10, <05,2> 14, <05,3> 15, <05,4> 21, <05,5> 22, <05,6> 23, <05,7> 24, <05,8> 25, <06,1> 1, <06,2> 2, <06,3> 3, <06,4> 4, <06,5> 5, <07,1> 11, <07,2> 12, <09,1> 6, <10,1> 16, <10,2> 17, <10,3> 18, <11,1> 11, <11,2> 16, <11,3> 17, <11,4> 18, <12,1> 7, <12,2> 8, <12,3> 9, <12,4> 10, <12,5> 21, <12,6> 22, <12,7> 23, <12,8> 24, <12,9> 25, <13,1> 4, <13,2> 5, <13,3> 6, <13,4> 7, <13,5> 8, <13,6> 9, <13,7> 10, <14,1> 1, <14,2> 2, <14,3> 3, <14,4> 4, <14,5> 5, <16,1> 6, <16,2> 7, <16,3> 16, <16,4> 17, <16,5> 18, <16,6> 19, <17,1> 3, <17,2> 4, <17,3> 5, <17,4> 6, <17,5> 7, <17,6> 8, <17,7> 9, <18,1> 11, <18,2> 12, <18,3> 13, <18,4> 14, <18,5> 15, <19,1> 11, <19,2> 12, <19,3> 13, <20,1> 2, <20,2> 3, <20,3> 4, <20,4> 5, <20,5> 24, <20,6> 25, <22,1> 11, <22,2> 12, <23,1> 1, <23,2> 2, <23,3> 3, <23,4> 4, <23,5> 5, <24,1> 6, <24,2> 7, <24,3> 8, <24,4> 14, <24,5> 15, <25,1> 1, <25,2> 2, <25,3> 3, <25,4> 17, <25,5> 18, <25,6> 19, <25,7> 20, <26,1> 15, <28,1> 11, <28,2> 12, <28,3> 13, <28,4> 14, <28,5> 15, <28,6> 16, <28,7> 19, <28,8> 20, <28,9> 21, <28,10> 22, <28,11> 23, <28,12> 24, <29,1> 9, <29,2> 10, <31,1> 11, <31,2> 12, <31,3> 13, <31,4> 14, <31,5> 15, <31,6> 16, <31,7> 17, <31,8> 18, <31,9> 23, <31,10> 24, <31,11> 25, <32,1> 6, <34,1> 1, <36,1> 6, <36,2> 7, <36,3> 8, <36,4> 9, <36,5> 10, <36,6> 21, <36,7> 22, <36,8> 23, <36,9> 24, <36,10> 25, <37,1> 5, <38,1> 11, <38,2> 12, <38,3> 13, <41,1> 13, <41,2> 14, <41,3> 15, <41,4> 16, <42,1> 14, <42,2> 15, <43,1> 8, <43,2> 9, <43,3> 10, <43,4> 11, <43,5> 16, <43,6> 17, <43,7> 21, <43,8> 22, <44,1> 21, <46,1> 10, <47,1> 18, <47,2> 19, <47,3> 20, <47,4> 23, <47,5> 24, <47,6> 25, <48,1> 1, <48,2> 2, <48,3> 21, <48,4> 22, <48,5> 23, <48,6> 24, <48,7> 25, <49,1> 6, <49,2> 7, <50,1> 1, <50,2> 2, <50,3> 3, <50,4> 7, <50,5> 8, <50,6> 9, <50,7> 10, <50,8> 13, <50,9> 14, <50,10> 15, <51,1> 1, <51,2> 2, <51,3> 3, <51,4> 4, <51,5> 5, <51,6> 16, <51,7> 17, <51,8> 18, <51,9> 19, <51,10> 20, <52,1> 15, <54,1> 18, <54,2> 19, <54,3> 20, <55,1> 21, <55,2> 22, <56,1> 6, <56,2> 7, <56,3> 8, <56,4> 9, <56,5> 10, <58,1> 6, <58,2> 7, <58,3> 8, <58,4> 9, <58,5> 10, <59,1> 11, <59,2> 12, <59,3> 13, <59,4> 14, <61,1> 16, <61,2> 17, <61,3> 18, <61,4> 19, <61,5> 20, <63,1> 6, <63,2> 7, <63,3> 8, <63,4> 9, <63,5> 15, <64,1> 8, <64,2> 9, <64,3> 10, <64,4> 12, <64,5> 13, <64,6> 14, <64,7> 15, <66,1> 21, <66,2> 22, <66,3> 23, <66,4> 24;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 4, <03> 5, <04> 3, <05> 4, <06> 4, <07> 5, <08> 4, <09> 5, <10> 5, <11> 3, <12> 4, <13> 3, <14> 5, <15> 3, <16> 5, <17> 4, <18> 4, <19> 5, <20> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 32, <01,2> 40, <01,3> 59, <02,1> 7, <02,2> 14, <02,3> 47, <02,4> 56, <03,1> 2, <03,2> 6, <03,3> 12, <03,4> 42, <03,5> 44, <04,1> 12, <04,2> 42, <04,3> 45, <05,1> 22, <05,2> 24, <05,3> 35, <05,4> 45, <06,1> 19, <06,2> 22, <06,3> 25, <06,4> 52, <07,1> 21, <07,2> 26, <07,3> 42, <07,4> 44, <07,5> 63, <08,1> 7, <08,2> 27, <08,3> 41, <08,4> 55, <09,1> 22, <09,2> 26, <09,3> 27, <09,4> 41, <09,5> 64, <10,1> 3, <10,2> 5, <10,3> 8, <10,4> 13, <10,5> 28, <11,1> 6, <11,2> 45, <11,3> 55, <12,1> 1, <12,2> 3, <12,3> 60, <12,4> 63, <13,1> 9, <13,2> 24, <13,3> 54, <14,1> 1, <14,2> 3, <14,3> 17, <14,4> 18, <14,5> 66, <15,1> 31, <15,2> 55, <15,3> 62, <16,1> 10, <16,2> 23, <16,3> 26, <16,4> 38, <16,5> 65, <17,1> 18, <17,2> 26, <17,3> 45, <17,4> 53, <18,1> 15, <18,2> 30, <18,3> 31, <18,4> 45, <19,1> 17, <19,2> 21, <19,3> 42, <19,4> 50, <19,5> 66, <20,1> 5, <20,2> 45, <20,3> 48;

param CurriculumHasEventsCount[Curricula] := <01> 8, <02> 9, <03> 18, <04> 10, <05> 9, <06> 11, <07> 15, <08> 14, <09> 15, <10> 16, <11> 11, <12> 12, <13> 9, <14> 16, <15> 9, <16> 13, <17> 13, <18> 13, <19> 14, <20> 9;

param nbTeachers := 33;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 3, <06> 3, <07> 3, <08> 1, <09> 3, <10> 3, <11> 3, <12> 3, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 3, <24> 3, <25> 3, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 3, <33> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 28, <02,1> 30, <03,1> 29, <04,1> 27, <05,1> 15, <05,2> 62, <05,3> 63, <06,1> 16, <06,2> 64, <06,3> 65, <07,1> 17, <07,2> 66, <07,3> 67, <08,1> 18, <09,1> 11, <09,2> 54, <09,3> 55, <10,1> 12, <10,2> 56, <10,3> 57, <11,1> 13, <11,2> 58, <11,3> 59, <12,1> 14, <12,2> 60, <12,3> 61, <13,1> 19, <14,1> 20, <15,1> 31, <16,1> 32, <17,1> 33, <18,1> 8, <18,2> 48, <18,3> 49, <19,1> 7, <19,2> 46, <19,3> 47, <20,1> 6, <20,2> 44, <20,3> 45, <21,1> 5, <21,2> 42, <21,3> 43, <22,1> 4, <22,2> 40, <22,3> 41, <23,1> 3, <23,2> 38, <23,3> 39, <24,1> 2, <24,2> 36, <24,3> 37, <25,1> 1, <25,2> 34, <25,3> 35, <26,1> 22, <27,1> 21, <28,1> 24, <29,1> 23, <30,1> 26, <31,1> 25, <32,1> 10, <32,2> 52, <32,3> 53, <33,1> 9, <33,2> 50, <33,3> 51;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 4, <03> 2, <04> 4, <05> 10, <06> 9, <07> 7, <08> 4, <09> 11, <10> 8, <11> 10, <12> 8, <13> 3, <14> 4, <15> 2, <16> 3, <17> 2, <18> 11, <19> 8, <20> 11, <21> 9, <22> 10, <23> 8, <24> 9, <25> 9, <26> 2, <27> 2, <28> 2, <29> 2, <30> 3, <31> 4, <32> 7, <33> 9;

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
