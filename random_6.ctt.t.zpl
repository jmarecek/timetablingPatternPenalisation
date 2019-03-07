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

param RoomHasCapacity[Rooms] := <01> 40, <02> 85, <03> 85, <04> 85, <05> 90, <06> 110, <07> 110, <08> 130, <09> 195, <10> 195, <11> 215, <12> 340;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t00", <35> "t00", <36> "t01", <37> "t01", <38> "t02", <39> "t02", <40> "t03", <41> "t03", <42> "t04", <43> "t04", <44> "t05", <45> "t05", <46> "t06", <47> "t06", <48> "t07", <49> "t07", <50> "t08", <51> "t08", <52> "t09", <53> "t09", <54> "t10", <55> "t10", <56> "t11", <57> "t11", <58> "t12", <59> "t12", <60> "t13", <61> "t13", <62> "t14", <63> "t14", <64> "t15", <65> "t15", <66> "t16";

param CourseHasStudents[Courses] := <01> 57, <02> 278, <03> 335, <04> 240, <05> 35, <06> 128, <07> 290, <08> 30, <09> 163, <10> 278, <11> 52, <12> 161, <13> 23, <14> 294, <15> 125, <16> 143, <17> 182, <18> 84, <19> 211, <20> 112, <21> 48, <22> 45, <23> 154, <24> 183, <25> 202, <26> 342, <27> 341, <28> 100, <29> 349, <30> 219, <31> 93, <32> 88, <33> 349, <34> 148, <35> 311, <36> 21, <37> 142, <38> 41, <39> 189, <40> 260, <41> 85, <42> 251, <43> 184, <44> 28, <45> 77, <46> 110, <47> 51, <48> 101, <49> 106, <50> 183, <51> 270, <52> 219, <53> 53, <54> 346, <55> 234, <56> 191, <57> 259, <58> 25, <59> 174, <60> 73, <61> 193, <62> 67, <63> 45, <64> 286, <65> 107, <66> 214;

param CourseHasEvents[Courses] := <01> 4, <02> 2, <03> 4, <04> 2, <05> 4, <06> 4, <07> 4, <08> 3, <09> 3, <10> 3, <11> 3, <12> 4, <13> 4, <14> 3, <15> 4, <16> 3, <17> 3, <18> 4, <19> 2, <20> 4, <21> 2, <22> 2, <23> 4, <24> 3, <25> 3, <26> 3, <27> 4, <28> 3, <29> 3, <30> 4, <31> 3, <32> 3, <33> 4, <34> 2, <35> 4, <36> 2, <37> 3, <38> 3, <39> 4, <40> 2, <41> 3, <42> 3, <43> 2, <44> 3, <45> 2, <46> 3, <47> 2, <48> 2, <49> 3, <50> 4, <51> 2, <52> 4, <53> 3, <54> 3, <55> 2, <56> 2, <57> 4, <58> 3, <59> 4, <60> 2, <61> 4, <62> 2, <63> 2, <64> 4, <65> 3, <66> 1;

param CourseHasMindays[Courses] := <01> 3, <02> 1, <03> 3, <04> 1, <05> 3, <06> 3, <07> 3, <08> 2, <09> 2, <10> 2, <11> 2, <12> 3, <13> 3, <14> 2, <15> 3, <16> 2, <17> 2, <18> 3, <19> 1, <20> 3, <21> 1, <22> 1, <23> 3, <24> 2, <25> 2, <26> 2, <27> 3, <28> 2, <29> 2, <30> 3, <31> 2, <32> 2, <33> 3, <34> 1, <35> 3, <36> 1, <37> 2, <38> 2, <39> 3, <40> 1, <41> 2, <42> 2, <43> 1, <44> 2, <45> 1, <46> 2, <47> 1, <48> 1, <49> 2, <50> 3, <51> 1, <52> 3, <53> 2, <54> 2, <55> 1, <56> 1, <57> 3, <58> 2, <59> 3, <60> 1, <61> 3, <62> 1, <63> 1, <64> 3, <65> 2, <66> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 3, <02> 4, <03> 5, <04> 3, <05> 6, <06> 7, <07> 4, <08> 2, <09> 7, <10> 3, <11> 7, <12> 4, <13> 5, <14> 0, <15> 6, <16> 10, <17> 12, <18> 6, <19> 0, <20> 6, <21> 6, <22> 8, <23> 5, <24> 4, <25> 5, <26> 6, <27> 0, <28> 2, <29> 8, <30> 5, <31> 0, <32> 4, <33> 0, <34> 0, <35> 2, <36> 0, <37> 0, <38> 0, <39> 0, <40> 0, <41> 2, <42> 0, <43> 3, <44> 3, <45> 8, <46> 0, <47> 4, <48> 0, <49> 4, <50> 0, <51> 5, <52> 3, <53> 0, <54> 0, <55> 12, <56> 4, <57> 6, <58> 3, <59> 1, <60> 0, <61> 0, <62> 5, <63> 0, <64> 7, <65> 4, <66> 2;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 13, <01,2> 14, <01,3> 15, <02,1> 11, <02,2> 12, <02,3> 13, <02,4> 20, <03,1> 5, <03,2> 21, <03,3> 22, <03,4> 23, <03,5> 24, <04,1> 23, <04,2> 24, <04,3> 25, <05,1> 6, <05,2> 7, <05,3> 8, <05,4> 9, <05,5> 10, <05,6> 15, <06,1> 13, <06,2> 14, <06,3> 15, <06,4> 18, <06,5> 19, <06,6> 20, <06,7> 21, <07,1> 22, <07,2> 23, <07,3> 24, <07,4> 25, <08,1> 6, <08,2> 7, <09,1> 7, <09,2> 8, <09,3> 9, <09,4> 10, <09,5> 13, <09,6> 14, <09,7> 15, <10,1> 23, <10,2> 24, <10,3> 25, <11,1> 1, <11,2> 2, <11,3> 16, <11,4> 17, <11,5> 18, <11,6> 19, <11,7> 20, <12,1> 1, <12,2> 2, <12,3> 3, <12,4> 4, <13,1> 11, <13,2> 12, <13,3> 13, <13,4> 14, <13,5> 15, <15,1> 9, <15,2> 10, <15,3> 15, <15,4> 23, <15,5> 24, <15,6> 25, <16,1> 6, <16,2> 17, <16,3> 18, <16,4> 19, <16,5> 20, <16,6> 21, <16,7> 22, <16,8> 23, <16,9> 24, <16,10> 25, <17,1> 1, <17,2> 2, <17,3> 3, <17,4> 4, <17,5> 5, <17,6> 12, <17,7> 13, <17,8> 14, <17,9> 15, <17,10> 23, <17,11> 24, <17,12> 25, <18,1> 6, <18,2> 21, <18,3> 22, <18,4> 23, <18,5> 24, <18,6> 25, <20,1> 6, <20,2> 7, <20,3> 8, <20,4> 9, <20,5> 10, <20,6> 25, <21,1> 2, <21,2> 3, <21,3> 4, <21,4> 5, <21,5> 19, <21,6> 20, <22,1> 9, <22,2> 10, <22,3> 16, <22,4> 17, <22,5> 18, <22,6> 21, <22,7> 22, <22,8> 23, <23,1> 1, <23,2> 2, <23,3> 3, <23,4> 4, <23,5> 5, <24,1> 2, <24,2> 3, <24,3> 4, <24,4> 5, <25,1> 21, <25,2> 22, <25,3> 23, <25,4> 24, <25,5> 25, <26,1> 11, <26,2> 12, <26,3> 17, <26,4> 18, <26,5> 19, <26,6> 20, <28,1> 11, <28,2> 12, <29,1> 3, <29,2> 4, <29,3> 5, <29,4> 21, <29,5> 22, <29,6> 23, <29,7> 24, <29,8> 25, <30,1> 21, <30,2> 22, <30,3> 23, <30,4> 24, <30,5> 25, <32,1> 16, <32,2> 17, <32,3> 18, <32,4> 19, <35,1> 1, <35,2> 6, <41,1> 21, <41,2> 22, <43,1> 8, <43,2> 9, <43,3> 10, <44,1> 21, <44,2> 22, <44,3> 23, <45,1> 6, <45,2> 7, <45,3> 8, <45,4> 11, <45,5> 12, <45,6> 13, <45,7> 14, <45,8> 15, <47,1> 12, <47,2> 13, <47,3> 14, <47,4> 15, <49,1> 21, <49,2> 22, <49,3> 23, <49,4> 24, <51,1> 6, <51,2> 7, <51,3> 8, <51,4> 9, <51,5> 10, <52,1> 6, <52,2> 7, <52,3> 8, <55,1> 1, <55,2> 2, <55,3> 3, <55,4> 4, <55,5> 17, <55,6> 18, <55,7> 19, <55,8> 20, <55,9> 21, <55,10> 22, <55,11> 23, <55,12> 24, <56,1> 7, <56,2> 8, <56,3> 9, <56,4> 10, <57,1> 1, <57,2> 2, <57,3> 3, <57,4> 4, <57,5> 5, <57,6> 6, <58,1> 18, <58,2> 19, <58,3> 20, <59,1> 10, <62,1> 1, <62,2> 2, <62,3> 3, <62,4> 4, <62,5> 5, <64,1> 14, <64,2> 15, <64,3> 16, <64,4> 17, <64,5> 18, <64,6> 19, <64,7> 20, <65,1> 16, <65,2> 17, <65,3> 18, <65,4> 19, <66,1> 9, <66,2> 10;

param CurriculumHasCoursesCount[Curricula] := <01> 5, <02> 4, <03> 4, <04> 5, <05> 5, <06> 3, <07> 4, <08> 4, <09> 4, <10> 5, <11> 3, <12> 3, <13> 4, <14> 5, <15> 3, <16> 5, <17> 5, <18> 5, <19> 3, <20> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 15, <01,2> 18, <01,3> 30, <01,4> 33, <01,5> 64, <02,1> 10, <02,2> 13, <02,3> 26, <02,4> 37, <03,1> 15, <03,2> 35, <03,3> 48, <03,4> 51, <04,1> 5, <04,2> 41, <04,3> 47, <04,4> 49, <04,5> 65, <05,1> 11, <05,2> 13, <05,3> 27, <05,4> 33, <05,5> 40, <06,1> 24, <06,2> 35, <06,3> 58, <07,1> 17, <07,2> 34, <07,3> 47, <07,4> 60, <08,1> 32, <08,2> 50, <08,3> 54, <08,4> 62, <09,1> 6, <09,2> 19, <09,3> 22, <09,4> 32, <10,1> 1, <10,2> 4, <10,3> 22, <10,4> 56, <10,5> 66, <11,1> 1, <11,2> 17, <11,3> 19, <12,1> 15, <12,2> 18, <12,3> 43, <13,1> 8, <13,2> 33, <13,3> 45, <13,4> 61, <14,1> 7, <14,2> 26, <14,3> 46, <14,4> 49, <14,5> 65, <15,1> 12, <15,2> 22, <15,3> 55, <16,1> 10, <16,2> 14, <16,3> 18, <16,4> 21, <16,5> 40, <17,1> 11, <17,2> 13, <17,3> 23, <17,4> 46, <17,5> 64, <18,1> 4, <18,2> 24, <18,3> 29, <18,4> 35, <18,5> 64, <19,1> 13, <19,2> 23, <19,3> 38, <20,1> 15, <20,2> 19, <20,3> 42, <20,4> 53, <20,5> 63;

param CurriculumHasEventsCount[Curricula] := <01> 20, <02> 13, <03> 12, <04> 15, <05> 17, <06> 10, <07> 9, <08> 12, <09> 11, <10> 11, <11> 9, <12> 10, <13> 13, <14> 16, <15> 8, <16> 14, <17> 18, <18> 16, <19> 11, <20> 14;

param nbTeachers := 33;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 3, <06> 3, <07> 2, <08> 1, <09> 3, <10> 3, <11> 3, <12> 3, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 3, <24> 3, <25> 3, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 3, <33> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 28, <02,1> 30, <03,1> 29, <04,1> 27, <05,1> 15, <05,2> 62, <05,3> 63, <06,1> 16, <06,2> 64, <06,3> 65, <07,1> 17, <07,2> 66, <08,1> 18, <09,1> 11, <09,2> 54, <09,3> 55, <10,1> 12, <10,2> 56, <10,3> 57, <11,1> 13, <11,2> 58, <11,3> 59, <12,1> 14, <12,2> 60, <12,3> 61, <13,1> 19, <14,1> 20, <15,1> 31, <16,1> 32, <17,1> 33, <18,1> 8, <18,2> 48, <18,3> 49, <19,1> 7, <19,2> 46, <19,3> 47, <20,1> 6, <20,2> 44, <20,3> 45, <21,1> 5, <21,2> 42, <21,3> 43, <22,1> 4, <22,2> 40, <22,3> 41, <23,1> 3, <23,2> 38, <23,3> 39, <24,1> 2, <24,2> 36, <24,3> 37, <25,1> 1, <25,2> 34, <25,3> 35, <26,1> 22, <27,1> 21, <28,1> 24, <29,1> 23, <30,1> 26, <31,1> 25, <32,1> 10, <32,2> 52, <32,3> 53, <33,1> 9, <33,2> 50, <33,3> 51;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 4, <03> 3, <04> 4, <05> 8, <06> 10, <07> 4, <08> 4, <09> 8, <10> 10, <11> 11, <12> 9, <13> 2, <14> 4, <15> 3, <16> 3, <17> 4, <18> 8, <19> 9, <20> 9, <21> 9, <22> 7, <23> 11, <24> 7, <25> 10, <26> 2, <27> 2, <28> 3, <29> 4, <30> 3, <31> 3, <32> 10, <33> 9;

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
