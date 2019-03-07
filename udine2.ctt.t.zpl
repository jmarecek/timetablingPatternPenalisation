param nbPeriodsPerDay := 4;
param nbDaySingletonChecks := 4;
param nbRooms := 12;
param nbDays := 5;
param nbCurricula := 33;
param nbCourses := 52;
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

param CourseHasName[Courses] := <01> "Fis1C", <02> "Fis1E", <03> "Fis1G", <04> "Fis1M", <05> "FonInfC", <06> "FonInfE", <07> "MecRazC", <08> "TecMat", <09> "FisAmb", <10> "GeoApp", <11> "Idro", <12> "StoArc", <13> "TecUrb", <14> "TeoStr", <15> "ProStr", <16> "ArcCom", <17> "CosStr", <18> "DinStr", <19> "IngSan", <20> "IngSanLab", <21> "SisApp", <22> "RetLog", <23> "FisTecE", <24> "ConAutE", <25> "ModNum", <26> "CalEle", <27> "DisTec", <28> "MecRazG", <29> "EltecG", <30> "FisTec", <31> "ConAutG", <32> "OrgPro", <33> "SisEla", <34> "DisMac", <35> "EltecM", <36> "FisTecM", <37> "TecMecI", <38> "DisAss", <39> "ProMac", <40> "MecSol", <41> "Fluido", <42> "IdraDAUR", <43> "IngChi", <44> "CamEle", <45> "AziEle", <46> "EcoOrg", <47> "EleInd", <48> "CCIAA2", <49> "CCIAA3", <50> "Chimica", <51> "Inglese", <52> "Inglese2";

param CourseHasTeacher[Courses] := <01> "Verdi", <02> "Rossini", <03> "Verdi", <04> "Bellini", <05> "Corelli", <06> "Donizetti", <07> "Puccini", <08> "Tartini", <09> "Piranesi", <10> "Vivaldi", <11> "Monteverdi", <12> "Allegri", <13> "Albinoni", <14> "Boccherini", <15> "Carulli", <16> "Cherubini", <17> "Cimarosa", <18> "Clementi", <19> "Mascagni", <20> "Mascagni", <21> "Monti", <22> "da_Palestrina", <23> "Paisiello", <24> "Pergolesi", <25> "Ponchielli", <26> "Sacchini", <27> "Sammartini", <28> "Scarlatti", <29> "Stradella", <30> "Traetta", <31> "Viotti", <32> "Vitali", <33> "Berio", <34> "Bononcini", <35> "Bonporti", <36> "Bottesini", <37> "Brunetti", <38> "Cafaro", <39> "Caccini", <40> "Carissimi", <41> "Cifariello", <42> "Conti", <43> "DallAbaco", <44> "Draghi", <45> "Duni", <46> "Fantini", <47> "Ferrabosco", <48> "Franceschini", <49> "Franceschini", <50> "Freschi", <51> "Frescobaldi", <52> "Pacini";

param CourseHasStudents[Courses] := <01> 120, <02> 120, <03> 120, <04> 120, <05> 120, <06> 120, <07> 100, <08> 100, <09> 80, <10> 30, <11> 30, <12> 30, <13> 40, <14> 30, <15> 30, <16> 30, <17> 40, <18> 30, <19> 30, <20> 30, <21> 30, <22> 100, <23> 90, <24> 90, <25> 80, <26> 80, <27> 100, <28> 100, <29> 80, <30> 80, <31> 80, <32> 80, <33> 80, <34> 100, <35> 80, <36> 80, <37> 80, <38> 70, <39> 70, <40> 20, <41> 20, <42> 20, <43> 20, <44> 20, <45> 20, <46> 20, <47> 20, <48> 20, <49> 20, <50> 30, <51> 20, <52> 20;

param CourseHasEvents[Courses] := <01> 5, <02> 5, <03> 5, <04> 5, <05> 3, <06> 3, <07> 5, <08> 5, <09> 5, <10> 5, <11> 5, <12> 5, <13> 5, <14> 5, <15> 5, <16> 5, <17> 5, <18> 5, <19> 3, <20> 2, <21> 5, <22> 5, <23> 5, <24> 5, <25> 5, <26> 5, <27> 5, <28> 5, <29> 5, <30> 5, <31> 5, <32> 5, <33> 5, <34> 5, <35> 5, <36> 5, <37> 5, <38> 5, <39> 5, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 3, <48> 2, <49> 2, <50> 5, <51> 2, <52> 2;

param CourseHasMindays[Courses] := <01> 5, <02> 5, <03> 5, <04> 5, <05> 3, <06> 3, <07> 4, <08> 4, <09> 4, <10> 4, <11> 4, <12> 4, <13> 4, <14> 4, <15> 3, <16> 4, <17> 4, <18> 4, <19> 3, <20> 1, <21> 4, <22> 4, <23> 4, <24> 4, <25> 4, <26> 4, <27> 4, <28> 4, <29> 4, <30> 4, <31> 4, <32> 4, <33> 4, <34> 4, <35> 4, <36> 4, <37> 4, <38> 4, <39> 4, <40> 3, <41> 3, <42> 3, <43> 3, <44> 2, <45> 3, <46> 3, <47> 3, <48> 1, <49> 1, <50> 4, <51> 1, <52> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 0, <03> 0, <04> 0, <05> 0, <06> 0, <07> 4, <08> 5, <09> 4, <10> 0, <11> 0, <12> 4, <13> 0, <14> 0, <15> 4, <16> 4, <17> 14, <18> 0, <19> 4, <20> 0, <21> 4, <22> 7, <23> 5, <24> 0, <25> 5, <26> 0, <27> 4, <28> 0, <29> 0, <30> 0, <31> 4, <32> 0, <33> 0, <34> 4, <35> 8, <36> 4, <37> 0, <38> 6, <39> 4, <40> 8, <41> 5, <42> 0, <43> 5, <44> 10, <45> 8, <46> 0, <47> 10, <48> 0, <49> 0, <50> 4, <51> 0, <52> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <07,1> 17, <07,2> 18, <07,3> 19, <07,4> 20, <08,1> 1, <08,2> 17, <08,3> 18, <08,4> 19, <08,5> 20, <09,1> 17, <09,2> 18, <09,3> 19, <09,4> 20, <12,1> 1, <12,2> 2, <12,3> 3, <12,4> 4, <15,1> 1, <15,2> 2, <15,3> 3, <15,4> 4, <16,1> 1, <16,2> 2, <16,3> 3, <16,4> 4, <17,1> 1, <17,2> 17, <17,3> 18, <17,4> 19, <17,5> 20, <17,6> 4, <17,7> 8, <17,8> 11, <17,9> 12, <17,10> 16, <17,11> 17, <17,12> 18, <17,13> 19, <17,14> 20, <19,1> 17, <19,2> 18, <19,3> 19, <19,4> 20, <21,1> 17, <21,2> 18, <21,3> 19, <21,4> 20, <22,1> 1, <22,2> 2, <22,3> 3, <22,4> 4, <22,5> 6, <22,6> 9, <22,7> 20, <23,1> 1, <23,2> 17, <23,3> 18, <23,4> 19, <23,5> 20, <25,1> 1, <25,2> 17, <25,3> 18, <25,4> 19, <25,5> 20, <27,1> 1, <27,2> 2, <27,3> 3, <27,4> 4, <31,1> 17, <31,2> 18, <31,3> 19, <31,4> 20, <34,1> 17, <34,2> 18, <34,3> 19, <34,4> 20, <35,1> 1, <35,2> 5, <35,3> 9, <35,4> 10, <35,5> 11, <35,6> 12, <35,7> 13, <35,8> 17, <36,1> 9, <36,2> 10, <36,3> 11, <36,4> 12, <38,1> 9, <38,2> 10, <38,3> 17, <38,4> 18, <38,5> 19, <38,6> 20, <39,1> 17, <39,2> 18, <39,3> 19, <39,4> 20, <40,1> 1, <40,2> 2, <40,3> 3, <40,4> 4, <40,5> 5, <40,6> 6, <40,7> 7, <40,8> 8, <41,1> 1, <41,2> 17, <41,3> 18, <41,4> 19, <41,5> 20, <43,1> 1, <43,2> 17, <43,3> 18, <43,4> 19, <43,5> 20, <44,1> 1, <44,2> 2, <44,3> 3, <44,4> 4, <44,5> 5, <44,6> 6, <44,7> 17, <44,8> 18, <44,9> 19, <44,10> 20, <45,1> 1, <45,2> 2, <45,3> 3, <45,4> 4, <45,5> 5, <45,6> 6, <45,7> 7, <45,8> 8, <47,1> 1, <47,2> 2, <47,3> 3, <47,4> 4, <47,5> 5, <47,6> 6, <47,7> 17, <47,8> 18, <47,9> 19, <47,10> 20, <50,1> 17, <50,2> 18, <50,3> 19, <50,4> 20;

param CurriculumHasCoursesCount[Curricula] := <01> 2, <02> 2, <03> 2, <04> 2, <05> 2, <06> 2, <07> 2, <08> 2, <09> 2, <10> 2, <11> 2, <12> 3, <13> 2, <14> 2, <15> 2, <16> 2, <17> 2, <18> 2, <19> 2, <20> 2, <21> 2, <22> 2, <23> 4, <24> 2, <25> 2, <26> 2, <27> 2, <28> 2, <29> 2, <30> 4, <31> 5, <32> 4, <33> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 1, <01,2> 5, <02,1> 1, <02,2> 5, <03,1> 7, <03,2> 8, <04,1> 9, <04,2> 35, <05,1> 13, <05,2> 15, <06,1> 12, <06,2> 13, <07,1> 10, <07,2> 13, <08,1> 11, <08,2> 13, <09,1> 13, <09,2> 14, <10,1> 16, <10,2> 17, <11,1> 17, <11,2> 21, <12,1> 17, <12,2> 19, <12,3> 20, <13,1> 17, <13,2> 18, <14,1> 2, <14,2> 6, <15,1> 22, <15,2> 28, <16,1> 23, <16,2> 24, <17,1> 25, <17,2> 26, <18,1> 3, <18,2> 6, <19,1> 3, <19,2> 6, <20,1> 27, <20,2> 28, <21,1> 29, <21,2> 30, <22,1> 31, <22,2> 37, <23,1> 32, <23,2> 33, <23,3> 45, <23,4> 47, <24,1> 32, <24,2> 33, <25,1> 4, <25,2> 5, <26,1> 7, <26,2> 34, <27,1> 35, <27,2> 36, <28,1> 31, <28,2> 37, <29,1> 38, <29,2> 39, <30,1> 9, <30,2> 40, <30,3> 41, <30,4> 51, <31,1> 11, <31,2> 19, <31,3> 42, <31,4> 43, <31,5> 51, <32,1> 24, <32,2> 44, <32,3> 48, <32,4> 51, <33,1> 45, <33,2> 46, <33,3> 47, <33,4> 49, <33,5> 51;

param CurriculumHasEventsCount[Curricula] := <01> 8, <02> 8, <03> 10, <04> 10, <05> 10, <06> 10, <07> 10, <08> 10, <09> 10, <10> 10, <11> 10, <12> 10, <13> 10, <14> 8, <15> 10, <16> 10, <17> 10, <18> 8, <19> 8, <20> 10, <21> 10, <22> 10, <23> 16, <24> 10, <25> 8, <26> 10, <27> 10, <28> 10, <29> 10, <30> 13, <31> 16, <32> 12, <33> 13;

param nbTeachers := 49;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 2, <06> 1, <07> 1, <08> 1, <09> 2, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 1, <19> 1, <20> 1, <21> 1, <22> 1, <23> 1, <24> 2, <25> 1, <26> 1, <27> 1, <28> 1, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 1, <36> 1, <37> 1, <38> 1, <39> 1, <40> 1, <41> 1, <42> 1, <43> 1, <44> 1, <45> 1, <46> 1, <47> 1, <48> 1, <49> 1;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 47, <02,1> 5, <03,1> 24, <04,1> 31, <05,1> 19, <05,2> 20, <06,1> 22, <07,1> 40, <08,1> 46, <09,1> 48, <09,2> 49, <10,1> 51, <11,1> 36, <12,1> 16, <13,1> 6, <14,1> 45, <15,1> 4, <16,1> 9, <17,1> 2, <18,1> 32, <19,1> 15, <20,1> 44, <21,1> 41, <22,1> 17, <23,1> 28, <24,1> 1, <24,2> 3, <25,1> 7, <26,1> 33, <27,1> 42, <28,1> 18, <29,1> 52, <30,1> 26, <31,1> 29, <32,1> 39, <33,1> 34, <34,1> 35, <35,1> 13, <36,1> 38, <37,1> 10, <38,1> 12, <39,1> 50, <40,1> 21, <41,1> 37, <42,1> 11, <43,1> 30, <44,1> 27, <45,1> 14, <46,1> 43, <47,1> 25, <48,1> 23, <49,1> 8;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 3, <03> 5, <04> 5, <05> 5, <06> 5, <07> 3, <08> 3, <09> 4, <10> 2, <11> 5, <12> 5, <13> 3, <14> 3, <15> 5, <16> 5, <17> 5, <18> 5, <19> 5, <20> 3, <21> 3, <22> 5, <23> 5, <24> 10, <25> 5, <26> 5, <27> 3, <28> 5, <29> 2, <30> 5, <31> 5, <32> 5, <33> 5, <34> 5, <35> 5, <36> 5, <37> 5, <38> 5, <39> 5, <40> 5, <41> 5, <42> 5, <43> 5, <44> 5, <45> 5, <46> 3, <47> 5, <48> 5, <49> 5;

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
  + 2 * (sum <cu> in Curricula: sum <d> in Days: sum <sc> in DaySingletonChecks: SingletonChecks[cu,d,sc]) 
  + 5 * (sum <c> in Courses: CourseMinDayViolations[c])
;

subto ctSessionAllocation: 
  forall <c> in Courses:
  sum <r> in Rooms: 
  sum <p> in Periods: 
  Taught[p,r,c] == CourseHasEvents[c]; 

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
