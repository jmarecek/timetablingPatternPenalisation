param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 12;
param nbDays := 5;
param nbCurricula := 20;
param nbCourses := 66;
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

param RoomHasCapacity[Rooms] := <01> 45, <02> 120, <03> 120, <04> 135, <05> 155, <06> 155, <07> 240, <08> 240, <09> 245, <10> 285, <11> 285, <12> 315;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t00", <35> "t00", <36> "t01", <37> "t01", <38> "t02", <39> "t02", <40> "t03", <41> "t03", <42> "t04", <43> "t04", <44> "t05", <45> "t05", <46> "t06", <47> "t06", <48> "t07", <49> "t07", <50> "t08", <51> "t08", <52> "t09", <53> "t09", <54> "t10", <55> "t10", <56> "t11", <57> "t11", <58> "t12", <59> "t12", <60> "t13", <61> "t13", <62> "t14", <63> "t14", <64> "t15", <65> "t15", <66> "t16";

param CourseHasStudents[Courses] := <01> 205, <02> 63, <03> 219, <04> 57, <05> 280, <06> 135, <07> 248, <08> 23, <09> 58, <10> 290, <11> 62, <12> 21, <13> 196, <14> 103, <15> 186, <16> 192, <17> 216, <18> 343, <19> 207, <20> 290, <21> 250, <22> 321, <23> 63, <24> 101, <25> 99, <26> 40, <27> 312, <28> 122, <29> 119, <30> 127, <31> 28, <32> 147, <33> 162, <34> 212, <35> 273, <36> 314, <37> 171, <38> 108, <39> 324, <40> 319, <41> 33, <42> 58, <43> 171, <44> 247, <45> 244, <46> 285, <47> 256, <48> 92, <49> 205, <50> 281, <51> 268, <52> 348, <53> 275, <54> 137, <55> 316, <56> 201, <57> 32, <58> 203, <59> 23, <60> 286, <61> 21, <62> 141, <63> 121, <64> 277, <65> 162, <66> 79;

param CourseHasEvents[Courses] := <01> 2, <02> 2, <03> 2, <04> 4, <05> 3, <06> 3, <07> 3, <08> 4, <09> 4, <10> 4, <11> 2, <12> 4, <13> 4, <14> 3, <15> 2, <16> 2, <17> 2, <18> 2, <19> 2, <20> 3, <21> 3, <22> 3, <23> 2, <24> 4, <25> 4, <26> 3, <27> 4, <28> 4, <29> 3, <30> 2, <31> 3, <32> 2, <33> 3, <34> 4, <35> 3, <36> 2, <37> 3, <38> 4, <39> 2, <40> 4, <41> 2, <42> 4, <43> 3, <44> 4, <45> 4, <46> 3, <47> 3, <48> 2, <49> 2, <50> 2, <51> 4, <52> 4, <53> 4, <54> 3, <55> 3, <56> 2, <57> 2, <58> 4, <59> 2, <60> 4, <61> 4, <62> 3, <63> 4, <64> 4, <65> 3, <66> 2;

param CourseHasMindays[Courses] := <01> 1, <02> 1, <03> 1, <04> 3, <05> 2, <06> 2, <07> 2, <08> 3, <09> 3, <10> 3, <11> 1, <12> 3, <13> 3, <14> 2, <15> 1, <16> 1, <17> 1, <18> 1, <19> 1, <20> 2, <21> 2, <22> 2, <23> 1, <24> 3, <25> 3, <26> 2, <27> 3, <28> 3, <29> 2, <30> 1, <31> 2, <32> 1, <33> 2, <34> 3, <35> 2, <36> 1, <37> 2, <38> 3, <39> 1, <40> 3, <41> 1, <42> 3, <43> 2, <44> 3, <45> 3, <46> 2, <47> 2, <48> 1, <49> 1, <50> 1, <51> 3, <52> 3, <53> 3, <54> 2, <55> 2, <56> 1, <57> 1, <58> 3, <59> 1, <60> 3, <61> 3, <62> 2, <63> 3, <64> 3, <65> 2, <66> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 5, <02> 0, <03> 2, <04> 4, <05> 10, <06> 4, <07> 0, <08> 5, <09> 6, <10> 11, <11> 5, <12> 8, <13> 0, <14> 0, <15> 9, <16> 11, <17> 4, <18> 1, <19> 0, <20> 0, <21> 9, <22> 3, <23> 0, <24> 10, <25> 0, <26> 7, <27> 2, <28> 1, <29> 2, <30> 1, <31> 9, <32> 0, <33> 5, <34> 1, <35> 5, <36> 0, <37> 2, <38> 3, <39> 0, <40> 0, <41> 2, <42> 1, <43> 0, <44> 4, <45> 0, <46> 1, <47> 4, <48> 2, <49> 0, <50> 9, <51> 11, <52> 3, <53> 10, <54> 0, <55> 0, <56> 1, <57> 0, <58> 0, <59> 5, <60> 8, <61> 7, <62> 0, <63> 5, <64> 0, <65> 5, <66> 1;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 1, <01,2> 2, <01,3> 3, <01,4> 4, <01,5> 5, <03,1> 6, <03,2> 7, <04,1> 2, <04,2> 3, <04,3> 4, <04,4> 5, <05,1> 6, <05,2> 7, <05,3> 8, <05,4> 9, <05,5> 10, <05,6> 11, <05,7> 12, <05,8> 13, <05,9> 14, <05,10> 15, <06,1> 7, <06,2> 8, <06,3> 9, <06,4> 10, <08,1> 21, <08,2> 22, <08,3> 23, <08,4> 24, <08,5> 25, <09,1> 14, <09,2> 15, <09,3> 21, <09,4> 22, <09,5> 23, <09,6> 24, <10,1> 5, <10,2> 6, <10,3> 7, <10,4> 8, <10,5> 9, <10,6> 10, <10,7> 16, <10,8> 17, <10,9> 18, <10,10> 19, <10,11> 20, <11,1> 20, <11,2> 22, <11,3> 23, <11,4> 24, <11,5> 25, <12,1> 6, <12,2> 7, <12,3> 16, <12,4> 17, <12,5> 18, <12,6> 19, <12,7> 20, <12,8> 25, <15,1> 1, <15,2> 2, <15,3> 16, <15,4> 17, <15,5> 18, <15,6> 19, <15,7> 20, <15,8> 21, <15,9> 22, <16,1> 6, <16,2> 7, <16,3> 8, <16,4> 9, <16,5> 10, <16,6> 11, <16,7> 16, <16,8> 17, <16,9> 18, <16,10> 19, <16,11> 20, <17,1> 17, <17,2> 18, <17,3> 19, <17,4> 20, <18,1> 11, <21,1> 16, <21,2> 17, <21,3> 18, <21,4> 19, <21,5> 20, <21,6> 21, <21,7> 22, <21,8> 23, <21,9> 24, <22,1> 11, <22,2> 12, <22,3> 21, <24,1> 1, <24,2> 2, <24,3> 3, <24,4> 4, <24,5> 6, <24,6> 11, <24,7> 12, <24,8> 13, <24,9> 14, <24,10> 15, <26,1> 6, <26,2> 7, <26,3> 8, <26,4> 9, <26,5> 10, <26,6> 11, <26,7> 12, <27,1> 9, <27,2> 10, <28,1> 20, <29,1> 24, <29,2> 25, <30,1> 6, <31,1> 6, <31,2> 7, <31,3> 8, <31,4> 9, <31,5> 10, <31,6> 17, <31,7> 18, <31,8> 19, <31,9> 20, <33,1> 2, <33,2> 3, <33,3> 4, <33,4> 5, <33,5> 6, <34,1> 5, <35,1> 21, <35,2> 22, <35,3> 23, <35,4> 24, <35,5> 25, <37,1> 6, <37,2> 7, <38,1> 1, <38,2> 2, <38,3> 3, <41,1> 10, <41,2> 25, <42,1> 11, <44,1> 6, <44,2> 21, <44,3> 22, <44,4> 23, <46,1> 20, <47,1> 21, <47,2> 22, <47,3> 23, <47,4> 24, <48,1> 9, <48,2> 10, <50,1> 1, <50,2> 2, <50,3> 4, <50,4> 5, <50,5> 11, <50,6> 12, <50,7> 13, <50,8> 14, <50,9> 15, <51,1> 1, <51,2> 11, <51,3> 12, <51,4> 13, <51,5> 14, <51,6> 16, <51,7> 17, <51,8> 18, <51,9> 19, <51,10> 20, <51,11> 21, <52,1> 1, <52,2> 11, <52,3> 12, <53,1> 5, <53,2> 16, <53,3> 17, <53,4> 18, <53,5> 19, <53,6> 21, <53,7> 22, <53,8> 23, <53,9> 24, <53,10> 25, <56,1> 15, <59,1> 21, <59,2> 22, <59,3> 23, <59,4> 24, <59,5> 25, <60,1> 1, <60,2> 2, <60,3> 3, <60,4> 4, <60,5> 6, <60,6> 7, <60,7> 8, <60,8> 9, <61,1> 1, <61,2> 2, <61,3> 3, <61,4> 13, <61,5> 14, <61,6> 15, <61,7> 21, <63,1> 21, <63,2> 22, <63,3> 23, <63,4> 24, <63,5> 25, <65,1> 2, <65,2> 3, <65,3> 4, <65,4> 5, <65,5> 6, <66,1> 11;

param CurriculumHasCoursesCount[Curricula] := <01> 5, <02> 3, <03> 3, <04> 3, <05> 5, <06> 5, <07> 3, <08> 3, <09> 4, <10> 5, <11> 5, <12> 5, <13> 3, <14> 3, <15> 4, <16> 3, <17> 3, <18> 4, <19> 4, <20> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 12, <01,2> 41, <01,3> 46, <01,4> 49, <01,5> 61, <02,1> 16, <02,2> 18, <02,3> 40, <03,1> 1, <03,2> 32, <03,3> 33, <04,1> 1, <04,2> 6, <04,3> 65, <05,1> 8, <05,2> 36, <05,3> 39, <05,4> 42, <05,5> 43, <06,1> 1, <06,2> 8, <06,3> 34, <06,4> 47, <06,5> 49, <07,1> 7, <07,2> 24, <07,3> 53, <08,1> 10, <08,2> 27, <08,3> 29, <09,1> 3, <09,2> 31, <09,3> 42, <09,4> 45, <10,1> 28, <10,2> 31, <10,3> 32, <10,4> 34, <10,5> 48, <11,1> 26, <11,2> 33, <11,3> 46, <11,4> 61, <11,5> 65, <12,1> 8, <12,2> 9, <12,3> 13, <12,4> 14, <12,5> 45, <13,1> 11, <13,2> 29, <13,3> 57, <14,1> 8, <14,2> 28, <14,3> 57, <15,1> 11, <15,2> 19, <15,3> 39, <15,4> 46, <16,1> 2, <16,2> 16, <16,3> 30, <17,1> 27, <17,2> 43, <17,3> 61, <18,1> 21, <18,2> 38, <18,3> 45, <18,4> 59, <19,1> 20, <19,2> 48, <19,3> 62, <19,4> 66, <20,1> 28, <20,2> 45, <20,3> 50;

param CurriculumHasEventsCount[Curricula] := <01> 15, <02> 8, <03> 7, <04> 8, <05> 15, <06> 15, <07> 11, <08> 11, <09> 13, <10> 15, <11> 16, <12> 19, <13> 7, <14> 10, <15> 9, <16> 6, <17> 11, <18> 13, <19> 10, <20> 10;

param nbTeachers := 33;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 3, <06> 3, <07> 2, <08> 1, <09> 3, <10> 3, <11> 3, <12> 3, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 3, <24> 3, <25> 3, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 3, <33> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 28, <02,1> 30, <03,1> 29, <04,1> 27, <05,1> 15, <05,2> 62, <05,3> 63, <06,1> 16, <06,2> 64, <06,3> 65, <07,1> 17, <07,2> 66, <08,1> 18, <09,1> 11, <09,2> 54, <09,3> 55, <10,1> 12, <10,2> 56, <10,3> 57, <11,1> 13, <11,2> 58, <11,3> 59, <12,1> 14, <12,2> 60, <12,3> 61, <13,1> 19, <14,1> 20, <15,1> 31, <16,1> 32, <17,1> 33, <18,1> 8, <18,2> 48, <18,3> 49, <19,1> 7, <19,2> 46, <19,3> 47, <20,1> 6, <20,2> 44, <20,3> 45, <21,1> 5, <21,2> 42, <21,3> 43, <22,1> 4, <22,2> 40, <22,3> 41, <23,1> 3, <23,2> 38, <23,3> 39, <24,1> 2, <24,2> 36, <24,3> 37, <25,1> 1, <25,2> 34, <25,3> 35, <26,1> 22, <27,1> 21, <28,1> 24, <29,1> 23, <30,1> 26, <31,1> 25, <32,1> 10, <32,2> 52, <32,3> 53, <33,1> 9, <33,2> 50, <33,3> 51;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 2, <03> 3, <04> 4, <05> 9, <06> 9, <07> 4, <08> 2, <09> 8, <10> 8, <11> 10, <12> 11, <13> 2, <14> 3, <15> 3, <16> 2, <17> 3, <18> 8, <19> 9, <20> 11, <21> 10, <22> 10, <23> 8, <24> 7, <25> 9, <26> 3, <27> 3, <28> 4, <29> 2, <30> 3, <31> 4, <32> 12, <33> 10;

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

subto ctSessionAllocation: 
  forall <c> in Courses:
  sum <r> in Rooms: 
  sum <p> in Periods: 
  Taught[p,r,c] == CourseHasEvents[c]; 

subto ctSessionAllocationPlus: 
  forall <c> in Courses:
  sum <r> in Rooms: 
  sum <p> in Periods: 
  c * Taught[p,r,c] == c * CourseHasEvents[c]; 

subto ctSessionsDistinctRooms:
  forall <p> in Periods:
  forall <c> in Courses:
  sum <r> in Rooms:
  Taught[p,r,c] <= 1;

subto ctRoomOccupancy:
  forall <r> in Rooms:
  forall <p> in Periods:
  sum <c> in Courses:
  Taught[p,r,c] <= 1;

subto ctCurriculumWithoutConflicts:
  forall <p> in Periods:
  forall <cu> in Curricula:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:  
  Taught[p,r,CurriculumHasCourses[cu,cnt]] <= 1;

subto ctCurriculumCheck:
  forall <cu> in Curricula:
  sum <p> in Periods:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:  
  Taught[p,r,CurriculumHasCourses[cu,cnt]] == CurriculumHasEventsCount[cu];
  
subto ctTeacherWithoutConflicts:
  forall <p> in Periods:
  forall <t> in Teachers:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= TeacherHasCoursesCount[t]:
  Taught[p,r,TeacherHasCourses[t,cnt]] <= 1; 

subto ctTeacherCheck:
  forall <t> in Teachers:
  sum <p> in Periods:
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= TeacherHasCoursesCount[t]:
  Taught[p,r,TeacherHasCourses[t,cnt]] == TeacherHasEventsCount[t]; 
 
subto ctAvailabilities: 
  forall <c> in Courses with CourseHasDeprecatedPeriodsCount[c] > 0:
  sum <cnt> in ListPeriods with cnt <= CourseHasDeprecatedPeriodsCount[c]:
  sum <r> in Rooms:
  Taught[CourseHasDeprecatedPeriods[c,cnt],r,c] == 0; 
  
subto ctSurveyWorkingDays1:
  forall <c> in Courses:
  forall <d> in Days:
  forall <cnt> in PeriodsPerDay:
  sum <r> in Rooms:
  Taught[HasPeriods[d,cnt],r,c] <= CourseSchedule[c,d];

subto ctSurveyWorkingDays2:   
  forall <c> in Courses:
  forall <d> in Days:
  sum <r> in Rooms:
  sum <cnt> in PeriodsPerDay:
  Taught[HasPeriods[d,cnt],r,c] >= CourseSchedule[c,d];
  
subto ctCountWorkingDays:
  forall <c> in Courses: 
  sum <d> in Days:
  CourseSchedule[c,d] >= CourseHasMindays[c] - CourseMinDayViolations[c];    

subto ctCheckWorkingDays1:
  forall <c> in Courses:
  forall <d> in Days:
  sum <r> in Rooms:
  sum <cnt> in PeriodsPerDay:
  Taught[HasPeriods[d,cnt],r,c] <= 1 + CourseHasEvents[c] + CourseMinDayViolations[c] - CourseHasMindays[c]; 

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
      Taught[p5,r,CurriculumHasCourses[cu,cnt]]) - 
  minus)
  <= sum <sc> in DaySingletonChecks: SingletonChecks[cu,d,sc];

subto ctPenalisePatterns1:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods: 
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  ( Taught[p1,r,CurriculumHasCourses[cu,cnt]] - 
  Taught[p2,r,CurriculumHasCourses[cu,cnt]] )
  <= SingletonChecks[cu,d,1];
  
subto ctPenalisePatterns2:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:  
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p5,r,CurriculumHasCourses[cu,cnt]] - 
  Taught[p4,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,2];

subto ctPenalisePatterns3:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p2,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p1,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p3,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,3];

subto ctPenalisePatterns4:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p3,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p2,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p4,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,4];

subto ctPenalisePatterns5:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4, p5> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p4,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p3,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p5,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,5];
