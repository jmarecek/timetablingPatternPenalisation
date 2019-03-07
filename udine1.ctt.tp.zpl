param nbPeriodsPerDay := 4;
param nbDaySingletonChecks := 4;
param nbRooms := 12;
param nbDays := 5;
param nbCurricula := 22;
param nbCourses := 46;
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

param RoomHasCapacity[Rooms] := <01> 312, <02> 216, <03> 216, <04> 216, <05> 216, <06> 312, <07> 105, <08> 30, <09> 32, <10> 50, <11> 42, <12> 42;

param CourseHasName[Courses] := <01> "Mat1C", <02> "Mat1E", <03> "Mat1G", <04> "Mat1M", <05> "AnMat2C", <06> "Dis", <07> "SceCosC", <08> "ArcTec", <09> "TecCos", <10> "Geotec", <11> "CosIdr", <12> "CalStr", <13> "IngTer", <14> "IdrAppl", <15> "RilAmb", <16> "AnMat2E", <17> "EcoOrAz", <18> "Eltec", <19> "MetMat", <20> "EletIIE", <21> "Campi", <22> "AnMat2G", <23> "Stat", <24> "ImpInd", <25> "EcoOrg", <26> "GestAz", <27> "MachIG", <28> "EletIIG", <29> "ImpMecG", <30> "RicOp", <31> "EcoIng", <32> "MachIM", <33> "TerFlu", <34> "ImpMecM", <35> "MecVib", <36> "GeoAppl", <37> "EspGeo", <38> "GeotecDAB", <39> "ElCam", <40> "MetMatDUE", <41> "EltecEs", <42> "EletIIEs", <43> "EleSisDig", <44> "CCIAA2", <45> "CCIAA3", <46> "Inglese";

param CourseHasTeacher[Courses] := <01> "Rossi", <02> "Gialli", <03> "Verdi", <04> "Neri", <05> "Blu", <06> "Viola", <07> "Ocra", <08> "Indaco", <09> "Rosa", <10> "Scarlatti", <11> "Amaranto", <12> "Celeste", <13> "Arancio", <14> "Porpora", <15> "Marroni", <16> "Sabbia", <17> "Perla", <18> "Grigi", <19> "Bianchi", <20> "Rosso", <21> "Prugna", <22> "Sabbia", <23> "Lilla", <24> "Turchese", <25> "Oliva", <26> "Chiari", <27> "Scuri", <28> "Rosso", <29> "Fumo", <30> "Cremisi", <31> "Indaco", <32> "Scuro", <33> "Bruno", <34> "Seppia", <35> "Antracite", <36> "Piombo", <37> "Verdepino", <38> "Bluastro", <39> "Blunotte", <40> "Limone", <41> "Oliva", <42> "Porpora", <43> "Zaffiro", <44> "Rossi", <45> "Rossi", <46> "Smith";

param CourseHasStudents[Courses] := <01> 100, <02> 100, <03> 100, <04> 100, <05> 100, <06> 100, <07> 80, <08> 80, <09> 80, <10> 10, <11> 80, <12> 30, <13> 30, <14> 30, <15> 10, <16> 80, <17> 80, <18> 70, <19> 70, <20> 70, <21> 70, <22> 80, <23> 80, <24> 80, <25> 80, <26> 80, <27> 80, <28> 70, <29> 70, <30> 80, <31> 100, <32> 80, <33> 80, <34> 70, <35> 70, <36> 20, <37> 20, <38> 20, <39> 20, <40> 20, <41> 20, <42> 20, <43> 20, <44> 20, <45> 20, <46> 20;

param CourseHasEvents[Courses] := <01> 5, <02> 5, <03> 5, <04> 5, <05> 5, <06> 5, <07> 5, <08> 5, <09> 5, <10> 5, <11> 5, <12> 5, <13> 5, <14> 5, <15> 5, <16> 5, <17> 5, <18> 5, <19> 5, <20> 5, <21> 5, <22> 5, <23> 5, <24> 5, <25> 5, <26> 5, <27> 5, <28> 5, <29> 5, <30> 5, <31> 5, <32> 5, <33> 5, <34> 5, <35> 5, <36> 3, <37> 3, <38> 6, <39> 6, <40> 3, <41> 1, <42> 1, <43> 3, <44> 2, <45> 2, <46> 2;

param CourseHasMindays[Courses] := <01> 4, <02> 4, <03> 4, <04> 4, <05> 4, <06> 4, <07> 4, <08> 4, <09> 4, <10> 4, <11> 4, <12> 4, <13> 4, <14> 4, <15> 4, <16> 4, <17> 4, <18> 4, <19> 4, <20> 4, <21> 4, <22> 4, <23> 4, <24> 4, <25> 4, <26> 4, <27> 4, <28> 4, <29> 4, <30> 4, <31> 4, <32> 4, <33> 4, <34> 4, <35> 4, <36> 3, <37> 3, <38> 4, <39> 4, <40> 3, <41> 1, <42> 1, <43> 2, <44> 1, <45> 1, <46> 2;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 0, <03> 0, <04> 0, <05> 0, <06> 0, <07> 0, <08> 4, <09> 0, <10> 0, <11> 0, <12> 0, <13> 8, <14> 5, <15> 0, <16> 3, <17> 0, <18> 0, <19> 0, <20> 0, <21> 0, <22> 0, <23> 0, <24> 0, <25> 0, <26> 0, <27> 0, <28> 0, <29> 0, <30> 0, <31> 0, <32> 0, <33> 0, <34> 0, <35> 0, <36> 0, <37> 0, <38> 0, <39> 0, <40> 0, <41> 0, <42> 0, <43> 0, <44> 0, <45> 0, <46> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <08,1> 17, <08,2> 18, <08,3> 19, <08,4> 20, <13,1> 1, <13,2> 2, <13,3> 3, <13,4> 4, <13,5> 5, <13,6> 9, <13,7> 13, <13,8> 17, <14,1> 4, <14,2> 8, <14,3> 12, <14,4> 16, <14,5> 20, <16,1> 18, <16,2> 7, <16,3> 8;

param CurriculumHasCoursesCount[Curricula] := <01> 2, <02> 2, <03> 2, <04> 2, <05> 2, <06> 3, <07> 2, <08> 2, <09> 2, <10> 2, <11> 2, <12> 2, <13> 2, <14> 2, <15> 2, <16> 2, <17> 2, <18> 2, <19> 4, <20> 3, <21> 5, <22> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 5, <01,2> 6, <02,1> 7, <02,2> 8, <03,1> 9, <03,2> 10, <04,1> 11, <04,2> 12, <05,1> 11, <05,2> 13, <06,1> 11, <06,2> 14, <06,3> 15, <07,1> 16, <07,2> 17, <08,1> 18, <08,2> 19, <09,1> 20, <09,2> 21, <10,1> 22, <10,2> 23, <11,1> 24, <11,2> 25, <12,1> 26, <12,2> 28, <13,1> 26, <13,2> 27, <14,1> 29, <14,2> 30, <15,1> 22, <15,2> 31, <16,1> 7, <16,2> 24, <17,1> 32, <17,2> 33, <18,1> 34, <18,2> 35, <19,1> 36, <19,2> 37, <19,3> 40, <19,4> 46, <20,1> 38, <20,2> 39, <20,3> 46, <21,1> 18, <21,2> 40, <21,3> 41, <21,4> 44, <21,5> 46, <22,1> 20, <22,2> 42, <22,3> 43, <22,4> 45, <22,5> 46;

param CurriculumHasEventsCount[Curricula] := <01> 10, <02> 10, <03> 10, <04> 10, <05> 10, <06> 15, <07> 10, <08> 10, <09> 10, <10> 10, <11> 10, <12> 10, <13> 10, <14> 10, <15> 10, <16> 10, <17> 10, <18> 10, <19> 11, <20> 14, <21> 13, <22> 13;

param nbTeachers := 39;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 2, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 2, <19> 1, <20> 1, <21> 2, <22> 1, <23> 1, <24> 1, <25> 2, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 1, <36> 1, <37> 2, <38> 3, <39> 1;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 23, <02,1> 17, <03,1> 5, <04,1> 36, <05,1> 39, <06,1> 46, <07,1> 9, <08,1> 8, <08,2> 31, <09,1> 19, <10,1> 11, <11,1> 6, <12,1> 30, <13,1> 24, <14,1> 43, <15,1> 37, <16,1> 7, <17,1> 13, <18,1> 14, <18,2> 42, <19,1> 18, <20,1> 10, <21,1> 25, <21,2> 41, <22,1> 3, <23,1> 15, <24,1> 26, <25,1> 16, <25,2> 22, <26,1> 32, <27,1> 34, <28,1> 21, <29,1> 2, <30,1> 29, <31,1> 27, <32,1> 12, <33,1> 4, <34,1> 35, <35,1> 38, <36,1> 40, <37,1> 20, <37,2> 28, <38,1> 1, <38,2> 44, <38,3> 45, <39,1> 33;

param TeacherHasEventsCount[Teachers] := <01> 5, <02> 5, <03> 5, <04> 3, <05> 6, <06> 2, <07> 5, <08> 10, <09> 5, <10> 5, <11> 5, <12> 5, <13> 5, <14> 3, <15> 3, <16> 5, <17> 5, <18> 6, <19> 5, <20> 5, <21> 6, <22> 5, <23> 5, <24> 5, <25> 10, <26> 5, <27> 5, <28> 5, <29> 5, <30> 5, <31> 5, <32> 5, <33> 5, <34> 5, <35> 6, <36> 3, <37> 10, <38> 9, <39> 5;

param HasPeriods[Days * PeriodsPerDay] := <01,1> 1, <01,2> 2, <01,3> 3, <01,4> 4, <02,1> 5, <02,2> 6, <02,3> 7, <02,4> 8, <03,1> 9, <03,2> 10, <03,3> 11, <03,4> 12, <04,1> 13, <04,2> 14, <04,3> 15, <04,4> 16, <05,1> 17, <05,2> 18, <05,3> 19, <05,4> 20;

set HasNamedPeriods := {  <1, 1, 2, 3, 4>, <2, 5, 6, 7, 8>, <3, 9, 10, 11, 12>, <4, 13, 14, 15, 16>, <5, 17, 18, 19, 20> };
set BannedCurriculumPatterns := { 
<1, -1, -1, -1, 1, 0>, 
<1, -1, -1, 1, -1, 0>, 
<1, -1, 1, -1, -1, 0>, 
<2, -1, 1, -1, 1, 1>, 
<1, 1, -1, -1, -1, 0>, 
<2, 1, -1, -1, 1, 1>, 
<2, 1, -1, 1, -1, 1>, 
<1, 1, -1, 1, 1, 2>, 
<1, 1, 1, -1, 1, 2>};


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
  forall <penalty, x1, x2, x3, x4, minus> in BannedCurriculumPatterns:
  forall <d, p1, p2, p3, p4> in HasNamedPeriods:
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
      Taught[p4,r,CurriculumHasCourses[cu,cnt]]) - 
  minus)
  <= sum <sc> in DaySingletonChecks: SingletonChecks[cu,d,sc];

subto ctPenalisePatterns1:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4> in HasNamedPeriods: 
  sum <r> in Rooms:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  ( Taught[p1,r,CurriculumHasCourses[cu,cnt]] - 
  Taught[p2,r,CurriculumHasCourses[cu,cnt]] )
  <= SingletonChecks[cu,d,1];
  
subto ctPenalisePatterns2:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4> in HasNamedPeriods:  
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p4,r,CurriculumHasCourses[cu,cnt]] - 
  Taught[p3,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,2];

subto ctPenalisePatterns3:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p2,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p1,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p3,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,3];

subto ctPenalisePatterns4:
  forall <cu> in Curricula:
  forall <d, p1, p2, p3, p4> in HasNamedPeriods:
  sum <cnt> in ListCourses with cnt <= CurriculumHasCoursesCount[cu]:
  sum <r> in Rooms:
  ( Taught[p3,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p2,r,CurriculumHasCourses[cu,cnt]] - 
    Taught[p4,r,CurriculumHasCourses[cu,cnt]] ) 
  <= SingletonChecks[cu,d,4];
