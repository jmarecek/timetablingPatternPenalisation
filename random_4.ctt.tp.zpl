param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 12;
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

param RoomHasCapacity[Rooms] := <01> 55, <02> 60, <03> 120, <04> 120, <05> 125, <06> 125, <07> 155, <08> 190, <09> 190, <10> 190, <11> 205, <12> 225;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t00", <35> "t00", <36> "t01", <37> "t01", <38> "t02", <39> "t02", <40> "t03", <41> "t03", <42> "t04", <43> "t04", <44> "t05", <45> "t05", <46> "t06", <47> "t06", <48> "t07", <49> "t07", <50> "t08", <51> "t08", <52> "t09", <53> "t09", <54> "t10", <55> "t10", <56> "t11", <57> "t11", <58> "t12", <59> "t12", <60> "t13", <61> "t13", <62> "t14", <63> "t14", <64> "t15", <65> "t15", <66> "t16", <67> "t16";

param CourseHasStudents[Courses] := <01> 271, <02> 285, <03> 109, <04> 337, <05> 123, <06> 325, <07> 50, <08> 57, <09> 333, <10> 184, <11> 44, <12> 27, <13> 42, <14> 66, <15> 277, <16> 192, <17> 146, <18> 205, <19> 290, <20> 164, <21> 230, <22> 243, <23> 39, <24> 58, <25> 302, <26> 272, <27> 21, <28> 294, <29> 152, <30> 225, <31> 322, <32> 309, <33> 311, <34> 277, <35> 100, <36> 96, <37> 51, <38> 93, <39> 297, <40> 70, <41> 121, <42> 236, <43> 108, <44> 141, <45> 146, <46> 110, <47> 324, <48> 189, <49> 121, <50> 186, <51> 228, <52> 157, <53> 191, <54> 101, <55> 261, <56> 46, <57> 101, <58> 336, <59> 220, <60> 244, <61> 174, <62> 90, <63> 323, <64> 115, <65> 315, <66> 261, <67> 201;

param CourseHasEvents[Courses] := <01> 2, <02> 2, <03> 4, <04> 3, <05> 4, <06> 4, <07> 2, <08> 4, <09> 4, <10> 2, <11> 2, <12> 2, <13> 4, <14> 4, <15> 3, <16> 2, <17> 2, <18> 4, <19> 4, <20> 3, <21> 2, <22> 3, <23> 2, <24> 2, <25> 2, <26> 3, <27> 2, <28> 3, <29> 4, <30> 4, <31> 3, <32> 4, <33> 2, <34> 4, <35> 2, <36> 3, <37> 4, <38> 3, <39> 2, <40> 4, <41> 4, <42> 4, <43> 4, <44> 2, <45> 3, <46> 2, <47> 2, <48> 2, <49> 3, <50> 3, <51> 4, <52> 4, <53> 4, <54> 3, <55> 4, <56> 2, <57> 3, <58> 4, <59> 3, <60> 4, <61> 2, <62> 2, <63> 2, <64> 4, <65> 2, <66> 3, <67> 2;

param CourseHasMindays[Courses] := <01> 1, <02> 1, <03> 3, <04> 2, <05> 3, <06> 3, <07> 1, <08> 3, <09> 3, <10> 1, <11> 1, <12> 1, <13> 3, <14> 3, <15> 2, <16> 1, <17> 1, <18> 3, <19> 3, <20> 2, <21> 1, <22> 2, <23> 1, <24> 1, <25> 1, <26> 2, <27> 1, <28> 2, <29> 3, <30> 3, <31> 2, <32> 3, <33> 1, <34> 3, <35> 1, <36> 2, <37> 3, <38> 2, <39> 1, <40> 3, <41> 3, <42> 3, <43> 3, <44> 1, <45> 2, <46> 1, <47> 1, <48> 1, <49> 2, <50> 2, <51> 3, <52> 3, <53> 3, <54> 2, <55> 3, <56> 1, <57> 2, <58> 3, <59> 2, <60> 3, <61> 1, <62> 1, <63> 1, <64> 3, <65> 1, <66> 2, <67> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 5, <03> 0, <04> 0, <05> 11, <06> 0, <07> 5, <08> 2, <09> 0, <10> 7, <11> 5, <12> 7, <13> 4, <14> 5, <15> 0, <16> 6, <17> 2, <18> 7, <19> 3, <20> 0, <21> 4, <22> 5, <23> 9, <24> 0, <25> 1, <26> 0, <27> 7, <28> 1, <29> 0, <30> 7, <31> 7, <32> 0, <33> 0, <34> 6, <35> 5, <36> 2, <37> 5, <38> 9, <39> 2, <40> 2, <41> 8, <42> 6, <43> 4, <44> 0, <45> 5, <46> 5, <47> 0, <48> 1, <49> 5, <50> 0, <51> 2, <52> 0, <53> 9, <54> 2, <55> 8, <56> 5, <57> 3, <58> 2, <59> 1, <60> 0, <61> 0, <62> 0, <63> 8, <64> 0, <65> 0, <66> 10, <67> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <02,1> 16, <02,2> 17, <02,3> 18, <02,4> 19, <02,5> 20, <05,1> 3, <05,2> 4, <05,3> 5, <05,4> 16, <05,5> 19, <05,6> 20, <05,7> 21, <05,8> 22, <05,9> 23, <05,10> 24, <05,11> 25, <07,1> 16, <07,2> 17, <07,3> 18, <07,4> 19, <07,5> 20, <08,1> 14, <08,2> 15, <10,1> 14, <10,2> 15, <10,3> 16, <10,4> 17, <10,5> 18, <10,6> 19, <10,7> 20, <11,1> 8, <11,2> 9, <11,3> 10, <11,4> 19, <11,5> 20, <12,1> 1, <12,2> 2, <12,3> 3, <12,4> 6, <12,5> 11, <12,6> 24, <12,7> 25, <13,1> 16, <13,2> 17, <13,3> 18, <13,4> 19, <14,1> 5, <14,2> 11, <14,3> 12, <14,4> 13, <14,5> 14, <16,1> 6, <16,2> 7, <16,3> 8, <16,4> 9, <16,5> 10, <16,6> 15, <17,1> 14, <17,2> 15, <18,1> 1, <18,2> 2, <18,3> 21, <18,4> 22, <18,5> 23, <18,6> 24, <18,7> 25, <19,1> 8, <19,2> 9, <19,3> 10, <21,1> 16, <21,2> 17, <21,3> 18, <21,4> 19, <22,1> 6, <22,2> 7, <22,3> 8, <22,4> 9, <22,5> 10, <23,1> 6, <23,2> 7, <23,3> 8, <23,4> 9, <23,5> 11, <23,6> 12, <23,7> 13, <23,8> 14, <23,9> 15, <25,1> 15, <27,1> 3, <27,2> 4, <27,3> 5, <27,4> 17, <27,5> 18, <27,6> 19, <27,7> 20, <28,1> 16, <30,1> 1, <30,2> 2, <30,3> 3, <30,4> 4, <30,5> 5, <30,6> 11, <30,7> 12, <31,1> 12, <31,2> 13, <31,3> 14, <31,4> 15, <31,5> 23, <31,6> 24, <31,7> 25, <34,1> 1, <34,2> 11, <34,3> 12, <34,4> 13, <34,5> 14, <34,6> 15, <35,1> 6, <35,2> 7, <35,3> 8, <35,4> 9, <35,5> 10, <36,1> 11, <36,2> 12, <37,1> 6, <37,2> 7, <37,3> 8, <37,4> 9, <37,5> 10, <38,1> 11, <38,2> 12, <38,3> 13, <38,4> 14, <38,5> 15, <38,6> 21, <38,7> 22, <38,8> 23, <38,9> 24, <39,1> 9, <39,2> 10, <40,1> 6, <40,2> 7, <41,1> 6, <41,2> 7, <41,3> 8, <41,4> 9, <41,5> 10, <41,6> 18, <41,7> 19, <41,8> 20, <42,1> 11, <42,2> 21, <42,3> 22, <42,4> 23, <42,5> 24, <42,6> 25, <43,1> 16, <43,2> 17, <43,3> 18, <43,4> 19, <45,1> 11, <45,2> 12, <45,3> 13, <45,4> 14, <45,5> 15, <46,1> 11, <46,2> 12, <46,3> 13, <46,4> 14, <46,5> 15, <48,1> 21, <49,1> 6, <49,2> 7, <49,3> 8, <49,4> 9, <49,5> 10, <51,1> 16, <51,2> 17, <53,1> 1, <53,2> 2, <53,3> 3, <53,4> 4, <53,5> 5, <53,6> 7, <53,7> 8, <53,8> 9, <53,9> 10, <54,1> 6, <54,2> 7, <55,1> 3, <55,2> 4, <55,3> 5, <55,4> 6, <55,5> 7, <55,6> 8, <55,7> 9, <55,8> 10, <56,1> 21, <56,2> 22, <56,3> 23, <56,4> 24, <56,5> 25, <57,1> 6, <57,2> 7, <57,3> 15, <58,1> 24, <58,2> 25, <59,1> 20, <63,1> 3, <63,2> 4, <63,3> 5, <63,4> 6, <63,5> 7, <63,6> 8, <63,7> 9, <63,8> 10, <66,1> 6, <66,2> 7, <66,3> 8, <66,4> 9, <66,5> 10, <66,6> 16, <66,7> 17, <66,8> 18, <66,9> 19, <66,10> 20;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 4, <03> 4, <04> 5, <05> 3, <06> 4, <07> 5, <08> 3, <09> 4, <10> 4, <11> 5, <12> 3, <13> 3, <14> 5, <15> 4, <16> 5, <17> 5, <18> 4, <19> 4, <20> 4;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 22, <01,2> 23, <01,3> 33, <02,1> 15, <02,2> 50, <02,3> 58, <02,4> 66, <03,1> 2, <03,2> 20, <03,3> 50, <03,4> 61, <04,1> 27, <04,2> 39, <04,3> 40, <04,4> 55, <04,5> 59, <05,1> 11, <05,2> 27, <05,3> 50, <06,1> 12, <06,2> 28, <06,3> 48, <06,4> 65, <07,1> 15, <07,2> 29, <07,3> 32, <07,4> 58, <07,5> 61, <08,1> 3, <08,2> 23, <08,3> 45, <09,1> 22, <09,2> 35, <09,3> 42, <09,4> 51, <10,1> 4, <10,2> 29, <10,3> 41, <10,4> 60, <11,1> 4, <11,2> 19, <11,3> 28, <11,4> 32, <11,5> 63, <12,1> 13, <12,2> 21, <12,3> 52, <13,1> 17, <13,2> 58, <13,3> 65, <14,1> 4, <14,2> 45, <14,3> 49, <14,4> 50, <14,5> 58, <15,1> 19, <15,2> 27, <15,3> 46, <15,4> 66, <16,1> 1, <16,2> 26, <16,3> 32, <16,4> 43, <16,5> 56, <17,1> 11, <17,2> 30, <17,3> 38, <17,4> 42, <17,5> 49, <18,1> 7, <18,2> 19, <18,3> 31, <18,4> 34, <19,1> 3, <19,2> 27, <19,3> 28, <19,4> 61, <20,1> 17, <20,2> 26, <20,3> 49, <20,4> 65;

param CurriculumHasEventsCount[Curricula] := <01> 7, <02> 13, <03> 10, <04> 15, <05> 7, <06> 9, <07> 17, <08> 9, <09> 13, <10> 15, <11> 16, <12> 10, <13> 8, <14> 16, <15> 11, <16> 15, <17> 16, <18> 13, <19> 11, <20> 10;

param nbTeachers := 33;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 3, <06> 3, <07> 3, <08> 1, <09> 3, <10> 3, <11> 3, <12> 3, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 3, <24> 3, <25> 3, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 3, <33> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 28, <02,1> 30, <03,1> 29, <04,1> 27, <05,1> 15, <05,2> 62, <05,3> 63, <06,1> 16, <06,2> 64, <06,3> 65, <07,1> 17, <07,2> 66, <07,3> 67, <08,1> 18, <09,1> 11, <09,2> 54, <09,3> 55, <10,1> 12, <10,2> 56, <10,3> 57, <11,1> 13, <11,2> 58, <11,3> 59, <12,1> 14, <12,2> 60, <12,3> 61, <13,1> 19, <14,1> 20, <15,1> 31, <16,1> 32, <17,1> 33, <18,1> 8, <18,2> 48, <18,3> 49, <19,1> 7, <19,2> 46, <19,3> 47, <20,1> 6, <20,2> 44, <20,3> 45, <21,1> 5, <21,2> 42, <21,3> 43, <22,1> 4, <22,2> 40, <22,3> 41, <23,1> 3, <23,2> 38, <23,3> 39, <24,1> 2, <24,2> 36, <24,3> 37, <25,1> 1, <25,2> 34, <25,3> 35, <26,1> 22, <27,1> 21, <28,1> 24, <29,1> 23, <30,1> 26, <31,1> 25, <32,1> 10, <32,2> 52, <32,3> 53, <33,1> 9, <33,2> 50, <33,3> 51;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 4, <03> 4, <04> 2, <05> 7, <06> 8, <07> 7, <08> 4, <09> 9, <10> 7, <11> 11, <12> 10, <13> 4, <14> 3, <15> 3, <16> 4, <17> 2, <18> 9, <19> 6, <20> 9, <21> 12, <22> 11, <23> 9, <24> 9, <25> 8, <26> 3, <27> 2, <28> 2, <29> 2, <30> 3, <31> 2, <32> 10, <33> 11;

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
