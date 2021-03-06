param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 10;
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

param RoomHasCapacity[Rooms] := <01> 65, <02> 65, <03> 155, <04> 155, <05> 180, <06> 180, <07> 180, <08> 190, <09> 195, <10> 255;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t00", <35> "t00", <36> "t01", <37> "t01", <38> "t02", <39> "t02", <40> "t03", <41> "t03", <42> "t04", <43> "t04", <44> "t05", <45> "t05", <46> "t06", <47> "t06", <48> "t07", <49> "t07", <50> "t08", <51> "t08", <52> "t09", <53> "t09", <54> "t10", <55> "t10", <56> "t11", <57> "t11", <58> "t12", <59> "t12", <60> "t13", <61> "t13", <62> "t14", <63> "t14", <64> "t15", <65> "t15", <66> "t16";

param CourseHasStudents[Courses] := <01> 277, <02> 283, <03> 73, <04> 309, <05> 103, <06> 145, <07> 301, <08> 131, <09> 309, <10> 310, <11> 152, <12> 146, <13> 46, <14> 48, <15> 270, <16> 160, <17> 218, <18> 319, <19> 245, <20> 295, <21> 186, <22> 256, <23> 64, <24> 87, <25> 283, <26> 49, <27> 255, <28> 223, <29> 233, <30> 274, <31> 242, <32> 82, <33> 62, <34> 270, <35> 39, <36> 114, <37> 267, <38> 153, <39> 223, <40> 174, <41> 181, <42> 127, <43> 176, <44> 165, <45> 36, <46> 191, <47> 120, <48> 140, <49> 214, <50> 144, <51> 243, <52> 211, <53> 47, <54> 111, <55> 265, <56> 24, <57> 74, <58> 112, <59> 246, <60> 71, <61> 272, <62> 164, <63> 245, <64> 20, <65> 308, <66> 285;

param CourseHasEvents[Courses] := <01> 3, <02> 2, <03> 4, <04> 3, <05> 3, <06> 4, <07> 2, <08> 3, <09> 2, <10> 2, <11> 4, <12> 2, <13> 2, <14> 4, <15> 3, <16> 4, <17> 2, <18> 3, <19> 4, <20> 3, <21> 3, <22> 4, <23> 2, <24> 2, <25> 2, <26> 3, <27> 2, <28> 2, <29> 4, <30> 4, <31> 4, <32> 3, <33> 3, <34> 2, <35> 4, <36> 4, <37> 2, <38> 2, <39> 2, <40> 3, <41> 3, <42> 3, <43> 4, <44> 2, <45> 3, <46> 2, <47> 4, <48> 3, <49> 2, <50> 4, <51> 2, <52> 4, <53> 3, <54> 3, <55> 3, <56> 4, <57> 3, <58> 4, <59> 4, <60> 4, <61> 4, <62> 4, <63> 3, <64> 3, <65> 3, <66> 3;

param CourseHasMindays[Courses] := <01> 2, <02> 1, <03> 3, <04> 2, <05> 2, <06> 3, <07> 1, <08> 2, <09> 1, <10> 1, <11> 3, <12> 1, <13> 1, <14> 3, <15> 2, <16> 3, <17> 1, <18> 2, <19> 3, <20> 2, <21> 2, <22> 3, <23> 1, <24> 1, <25> 1, <26> 2, <27> 1, <28> 1, <29> 3, <30> 3, <31> 3, <32> 2, <33> 2, <34> 1, <35> 3, <36> 3, <37> 1, <38> 1, <39> 1, <40> 2, <41> 2, <42> 2, <43> 3, <44> 1, <45> 2, <46> 1, <47> 3, <48> 2, <49> 1, <50> 3, <51> 1, <52> 3, <53> 2, <54> 2, <55> 2, <56> 3, <57> 2, <58> 3, <59> 3, <60> 3, <61> 3, <62> 3, <63> 2, <64> 2, <65> 2, <66> 2;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 1, <02> 4, <03> 0, <04> 5, <05> 0, <06> 10, <07> 0, <08> 4, <09> 6, <10> 2, <11> 0, <12> 0, <13> 4, <14> 4, <15> 9, <16> 0, <17> 5, <18> 5, <19> 12, <20> 10, <21> 5, <22> 1, <23> 7, <24> 2, <25> 11, <26> 0, <27> 3, <28> 6, <29> 4, <30> 1, <31> 1, <32> 1, <33> 0, <34> 6, <35> 1, <36> 0, <37> 2, <38> 0, <39> 5, <40> 4, <41> 4, <42> 2, <43> 0, <44> 0, <45> 9, <46> 2, <47> 10, <48> 2, <49> 5, <50> 6, <51> 1, <52> 2, <53> 4, <54> 5, <55> 1, <56> 4, <57> 0, <58> 0, <59> 1, <60> 0, <61> 6, <62> 2, <63> 0, <64> 6, <65> 5, <66> 2;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 6, <02,1> 7, <02,2> 8, <02,3> 9, <02,4> 10, <04,1> 16, <04,2> 17, <04,3> 18, <04,4> 19, <04,5> 20, <06,1> 1, <06,2> 2, <06,3> 3, <06,4> 4, <06,5> 5, <06,6> 9, <06,7> 10, <06,8> 21, <06,9> 22, <06,10> 23, <08,1> 22, <08,2> 23, <08,3> 24, <08,4> 25, <09,1> 11, <09,2> 12, <09,3> 13, <09,4> 14, <09,5> 15, <09,6> 20, <10,1> 14, <10,2> 15, <13,1> 21, <13,2> 22, <13,3> 23, <13,4> 24, <14,1> 6, <14,2> 7, <14,3> 8, <14,4> 9, <15,1> 1, <15,2> 2, <15,3> 3, <15,4> 6, <15,5> 7, <15,6> 10, <15,7> 23, <15,8> 24, <15,9> 25, <17,1> 21, <17,2> 22, <17,3> 23, <17,4> 24, <17,5> 25, <18,1> 11, <18,2> 12, <18,3> 18, <18,4> 19, <18,5> 20, <19,1> 3, <19,2> 4, <19,3> 5, <19,4> 6, <19,5> 7, <19,6> 8, <19,7> 9, <19,8> 10, <19,9> 11, <19,10> 12, <19,11> 13, <19,12> 14, <20,1> 1, <20,2> 2, <20,3> 3, <20,4> 4, <20,5> 5, <20,6> 21, <20,7> 22, <20,8> 23, <20,9> 24, <20,10> 25, <21,1> 21, <21,2> 22, <21,3> 23, <21,4> 24, <21,5> 25, <22,1> 6, <23,1> 12, <23,2> 13, <23,3> 14, <23,4> 15, <23,5> 21, <23,6> 22, <23,7> 23, <24,1> 1, <24,2> 10, <25,1> 7, <25,2> 8, <25,3> 9, <25,4> 10, <25,5> 14, <25,6> 15, <25,7> 16, <25,8> 17, <25,9> 18, <25,10> 19, <25,11> 20, <27,1> 6, <27,2> 7, <27,3> 8, <28,1> 1, <28,2> 2, <28,3> 3, <28,4> 4, <28,5> 5, <28,6> 21, <29,1> 21, <29,2> 22, <29,3> 23, <29,4> 24, <30,1> 20, <31,1> 25, <32,1> 5, <34,1> 1, <34,2> 2, <34,3> 3, <34,4> 4, <34,5> 14, <34,6> 15, <35,1> 16, <37,1> 21, <37,2> 22, <39,1> 6, <39,2> 7, <39,3> 8, <39,4> 9, <39,5> 10, <40,1> 2, <40,2> 3, <40,3> 4, <40,4> 5, <41,1> 7, <41,2> 8, <41,3> 9, <41,4> 10, <42,1> 6, <42,2> 10, <45,1> 6, <45,2> 7, <45,3> 13, <45,4> 14, <45,5> 15, <45,6> 17, <45,7> 18, <45,8> 19, <45,9> 20, <46,1> 24, <46,2> 25, <47,1> 5, <47,2> 16, <47,3> 17, <47,4> 18, <47,5> 19, <47,6> 20, <47,7> 21, <47,8> 22, <47,9> 23, <47,10> 24, <48,1> 24, <48,2> 25, <49,1> 1, <49,2> 2, <49,3> 3, <49,4> 4, <49,5> 5, <50,1> 1, <50,2> 2, <50,3> 3, <50,4> 13, <50,5> 14, <50,6> 15, <51,1> 21, <52,1> 6, <52,2> 7, <53,1> 2, <53,2> 3, <53,3> 4, <53,4> 5, <54,1> 1, <54,2> 7, <54,3> 8, <54,4> 9, <54,5> 10, <55,1> 10, <56,1> 6, <56,2> 7, <56,3> 8, <56,4> 9, <59,1> 21, <61,1> 6, <61,2> 21, <61,3> 22, <61,4> 23, <61,5> 24, <61,6> 25, <62,1> 16, <62,2> 17, <64,1> 5, <64,2> 21, <64,3> 22, <64,4> 23, <64,5> 24, <64,6> 25, <65,1> 21, <65,2> 22, <65,3> 23, <65,4> 24, <65,5> 25, <66,1> 11, <66,2> 12;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 4, <03> 3, <04> 5, <05> 5, <06> 4, <07> 4, <08> 3, <09> 4, <10> 3, <11> 3, <12> 5, <13> 2, <14> 4, <15> 4, <16> 3, <17> 4, <18> 3, <19> 3, <20> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 3, <01,2> 27, <01,3> 38, <02,1> 4, <02,2> 43, <02,3> 51, <02,4> 55, <03,1> 1, <03,2> 25, <03,3> 42, <04,1> 36, <04,2> 40, <04,3> 42, <04,4> 53, <04,5> 54, <05,1> 10, <05,2> 15, <05,3> 39, <05,4> 48, <05,5> 53, <06,1> 10, <06,2> 44, <06,3> 56, <06,4> 62, <07,1> 26, <07,2> 51, <07,3> 53, <07,4> 54, <08,1> 45, <08,2> 46, <08,3> 54, <09,1> 24, <09,2> 26, <09,3> 38, <09,4> 66, <10,1> 4, <10,2> 62, <10,3> 64, <11,1> 22, <11,2> 51, <11,3> 64, <12,1> 4, <12,2> 25, <12,3> 26, <12,4> 38, <12,5> 46, <13,1> 38, <13,2> 62, <14,1> 4, <14,2> 8, <14,3> 34, <14,4> 55, <15,1> 21, <15,2> 32, <15,3> 39, <15,4> 46, <16,1> 10, <16,2> 47, <16,3> 61, <17,1> 21, <17,2> 25, <17,3> 36, <17,4> 45, <18,1> 13, <18,2> 21, <18,3> 36, <19,1> 13, <19,2> 15, <19,3> 55, <20,1> 3, <20,2> 11, <20,3> 61;

param CurriculumHasEventsCount[Curricula] := <01> 8, <02> 12, <03> 8, <04> 16, <05> 13, <06> 12, <07> 11, <08> 8, <09> 10, <10> 10, <11> 9, <12> 12, <13> 6, <14> 11, <15> 10, <16> 10, <17> 12, <18> 9, <19> 8, <20> 12;

param nbTeachers := 33;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 3, <06> 3, <07> 2, <08> 1, <09> 3, <10> 3, <11> 3, <12> 3, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 3, <24> 3, <25> 3, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 3, <33> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 28, <02,1> 30, <03,1> 29, <04,1> 27, <05,1> 15, <05,2> 62, <05,3> 63, <06,1> 16, <06,2> 64, <06,3> 65, <07,1> 17, <07,2> 66, <08,1> 18, <09,1> 11, <09,2> 54, <09,3> 55, <10,1> 12, <10,2> 56, <10,3> 57, <11,1> 13, <11,2> 58, <11,3> 59, <12,1> 14, <12,2> 60, <12,3> 61, <13,1> 19, <14,1> 20, <15,1> 31, <16,1> 32, <17,1> 33, <18,1> 8, <18,2> 48, <18,3> 49, <19,1> 7, <19,2> 46, <19,3> 47, <20,1> 6, <20,2> 44, <20,3> 45, <21,1> 5, <21,2> 42, <21,3> 43, <22,1> 4, <22,2> 40, <22,3> 41, <23,1> 3, <23,2> 38, <23,3> 39, <24,1> 2, <24,2> 36, <24,3> 37, <25,1> 1, <25,2> 34, <25,3> 35, <26,1> 22, <27,1> 21, <28,1> 24, <29,1> 23, <30,1> 26, <31,1> 25, <32,1> 10, <32,2> 52, <32,3> 53, <33,1> 9, <33,2> 50, <33,3> 51;

param TeacherHasEventsCount[Teachers] := <01> 2, <02> 4, <03> 4, <04> 2, <05> 10, <06> 10, <07> 5, <08> 3, <09> 10, <10> 9, <11> 10, <12> 12, <13> 4, <14> 3, <15> 4, <16> 3, <17> 3, <18> 8, <19> 8, <20> 9, <21> 10, <22> 9, <23> 8, <24> 8, <25> 9, <26> 4, <27> 3, <28> 2, <29> 2, <30> 3, <31> 2, <32> 9, <33> 8;

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
