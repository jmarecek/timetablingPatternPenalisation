param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 10;
param nbDays := 5;
param nbCurricula := 57;
param nbCourses := 55;
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

param RoomHasCapacity[Rooms] := <01> 312, <02> 216, <03> 216, <04> 216, <05> 216, <06> 312, <07> 105, <08> 50, <09> 42, <10> 100;

param CourseHasName[Courses] := <01> "Mat2C", <02> "Mat2E", <03> "Mat2G", <04> "Mat2M", <05> "EcoIngC", <06> "EcoIngEM", <07> "EcoIngG", <08> "Fis2C", <09> "DisArc", <10> "GeoAppl", <11> "Idra", <12> "LitGeo", <13> "MecCom", <14> "TecEle", <15> "Topo", <16> "CosEdi", <17> "CosSis", <18> "ImpTec", <19> "InfIdr", <20> "PinTer", <21> "ProStr", <22> "MetPro", <23> "LabEle1", <24> "TeoSeg", <25> "ComEle", <26> "ProCir", <27> "ProCirL", <28> "Fis2G", <29> "EcoIng2G", <30> "Elettr1G", <31> "SciCos", <32> "ChiInd", <33> "EnergG", <34> "ImpChi", <35> "ModSim", <36> "SciMatG", <37> "TeoSisG", <38> "AcuApp", <39> "MacIIG", <40> "MarInd", <41> "ProEff", <42> "SciComG", <43> "SciPolG", <44> "SocInd", <45> "TecMat", <46> "TecChiM", <47> "MetalM", <48> "MecMacM", <49> "CosMacM", <50> "ProAss", <51> "TecMec", <52> "FonChi", <53> "MisEle", <54> "CCIAA2", <55> "Inglese";

param CourseHasTeacher[Courses] := <01> "Dante_Alighieri", <02> "Sibilla_Aleramo", <03> "Ludovico_Ariosto", <04> "Ludovico_Ariosto", <05> "Giovanni_Boccaccio", <06> "Dino_Buzzati", <07> "Italo_Calvino", <08> "Dino_Campana", <09> "Giosue_Carducci", <10> "Carlo_Cassola", <11> "Gabriele_DAnnunzio", <12> "Grazia_Deledda", <13> "Antonio_Fogazzaro", <14> "Ugo_Foscolo", <15> "Carlo_Emilio_Gadda", <16> "Antonio_Fogazzaro", <17> "Carlo_Goldoni", <18> "Giacomo_Leopardi", <19> "Primo_Levi", <20> "Alessandro_Manzoni", <21> "Eugenio_Montale", <22> "Vincenzo_Monti", <23> "Elsa_Morante", <24> "Alberto_Moravia", <25> "Ippolito_Nievo", <26> "Pier_Paolo_Pasolini", <27> "Pier_Paolo_Pasolini", <28> "Luigi_Pirandello", <29> "Marco_Polo", <30> "Leonardo_Sciascia", <31> "Matilde_Serao", <32> "Ignazio_Silone", <33> "Italo_Svevo", <34> "Giovanni_Verga", <35> "Elio_Vittorini", <36> "Claudio_Magris", <37> "Gianni_Rodari", <38> "Torquato_Tasso", <39> "Cesare_Beccaria", <40> "Gioacchino_Belli", <41> "Pietro_Bembo", <42> "Giordano_Bruno", <43> "Tommaso_Campanella", <44> "Giambattista_Vico", <45> "Carlo_Cattaneo", <46> "Giovanni_Della_Casa", <47> "Guido_Gozzano", <48> "Francesco_Petrarca", <49> "Giovanni_Pascoli", <50> "Giovanni_Pascoli", <51> "Angelo_Poliziano", <52> "Luigi_Pulci", <53> "Ruzzante", <54> "Emilio_Salgari", <55> "William_Shakespeare";

param CourseHasStudents[Courses] := <01> 110, <02> 120, <03> 150, <04> 120, <05> 110, <06> 240, <07> 150, <08> 100, <09> 80, <10> 80, <11> 80, <12> 60, <13> 60, <14> 60, <15> 60, <16> 30, <17> 30, <18> 30, <19> 30, <20> 30, <21> 30, <22> 100, <23> 80, <24> 80, <25> 30, <26> 30, <27> 30, <28> 100, <29> 100, <30> 80, <31> 80, <32> 30, <33> 30, <34> 30, <35> 70, <36> 30, <37> 30, <38> 30, <39> 30, <40> 30, <41> 30, <42> 30, <43> 30, <44> 30, <45> 30, <46> 100, <47> 80, <48> 80, <49> 70, <50> 40, <51> 40, <52> 30, <53> 20, <54> 20, <55> 20;

param CourseHasEvents[Courses] := <01> 5, <02> 5, <03> 5, <04> 5, <05> 3, <06> 3, <07> 3, <08> 5, <09> 5, <10> 5, <11> 5, <12> 5, <13> 5, <14> 5, <15> 5, <16> 5, <17> 5, <18> 5, <19> 5, <20> 5, <21> 5, <22> 5, <23> 1, <24> 5, <25> 5, <26> 4, <27> 1, <28> 5, <29> 5, <30> 5, <31> 5, <32> 5, <33> 5, <34> 5, <35> 5, <36> 5, <37> 5, <38> 5, <39> 5, <40> 5, <41> 5, <42> 5, <43> 5, <44> 5, <45> 5, <46> 5, <47> 5, <48> 5, <49> 5, <50> 5, <51> 5, <52> 3, <53> 3, <54> 2, <55> 2;

param CourseHasMindays[Courses] := <01> 4, <02> 4, <03> 4, <04> 4, <05> 3, <06> 3, <07> 3, <08> 4, <09> 4, <10> 4, <11> 4, <12> 4, <13> 4, <14> 4, <15> 4, <16> 4, <17> 4, <18> 4, <19> 4, <20> 4, <21> 4, <22> 4, <23> 1, <24> 3, <25> 3, <26> 2, <27> 1, <28> 4, <29> 4, <30> 4, <31> 4, <32> 4, <33> 4, <34> 4, <35> 4, <36> 4, <37> 4, <38> 4, <39> 4, <40> 4, <41> 4, <42> 4, <43> 4, <44> 4, <45> 4, <46> 4, <47> 4, <48> 3, <49> 4, <50> 4, <51> 4, <52> 3, <53> 2, <54> 1, <55> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 0, <03> 0, <04> 0, <05> 0, <06> 0, <07> 0, <08> 0, <09> 7, <10> 15, <11> 6, <12> 15, <13> 0, <14> 0, <15> 17, <16> 0, <17> 0, <18> 11, <19> 8, <20> 5, <21> 10, <22> 0, <23> 0, <24> 14, <25> 12, <26> 13, <27> 0, <28> 0, <29> 0, <30> 13, <31> 5, <32> 6, <33> 13, <34> 0, <35> 10, <36> 0, <37> 1, <38> 5, <39> 11, <40> 17, <41> 7, <42> 8, <43> 0, <44> 0, <45> 10, <46> 0, <47> 17, <48> 5, <49> 12, <50> 9, <51> 0, <52> 4, <53> 13, <54> 0, <55> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <09,1> 18, <09,2> 19, <09,3> 20, <09,4> 21, <09,5> 22, <09,6> 23, <09,7> 24, <10,1> 3, <10,2> 4, <10,3> 5, <10,4> 8, <10,5> 9, <10,6> 10, <10,7> 13, <10,8> 14, <10,9> 15, <10,10> 18, <10,11> 19, <10,12> 20, <10,13> 23, <10,14> 24, <10,15> 25, <11,1> 1, <11,2> 21, <11,3> 22, <11,4> 23, <11,5> 24, <11,6> 25, <12,1> 3, <12,2> 4, <12,3> 5, <12,4> 8, <12,5> 9, <12,6> 10, <12,7> 13, <12,8> 14, <12,9> 15, <12,10> 18, <12,11> 19, <12,12> 20, <12,13> 23, <12,14> 24, <12,15> 25, <15,1> 3, <15,2> 4, <15,3> 5, <15,4> 8, <15,5> 9, <15,6> 10, <15,7> 13, <15,8> 14, <15,9> 15, <15,10> 18, <15,11> 19, <15,12> 20, <15,13> 21, <15,14> 22, <15,15> 23, <15,16> 24, <15,17> 25, <18,1> 4, <18,2> 5, <18,3> 9, <18,4> 10, <18,5> 14, <18,6> 15, <18,7> 19, <18,8> 20, <18,9> 23, <18,10> 24, <18,11> 25, <19,1> 1, <19,2> 6, <19,3> 11, <19,4> 16, <19,5> 21, <19,6> 23, <19,7> 24, <19,8> 25, <20,1> 1, <20,2> 2, <20,3> 3, <20,4> 11, <20,5> 12, <21,1> 1, <21,2> 2, <21,3> 18, <21,4> 19, <21,5> 20, <21,6> 21, <21,7> 22, <21,8> 23, <21,9> 24, <21,10> 25, <24,1> 1, <24,2> 6, <24,3> 7, <24,4> 8, <24,5> 9, <24,6> 10, <24,7> 11, <24,8> 12, <24,9> 13, <24,10> 14, <24,11> 15, <24,12> 16, <24,13> 17, <24,14> 21, <25,1> 6, <25,2> 7, <25,3> 8, <25,4> 9, <25,5> 10, <25,6> 11, <25,7> 12, <25,8> 16, <25,9> 17, <25,10> 18, <25,11> 19, <25,12> 20, <26,1> 8, <26,2> 9, <26,3> 10, <26,4> 11, <26,5> 12, <26,6> 13, <26,7> 14, <26,8> 15, <26,9> 16, <26,10> 17, <26,11> 18, <26,12> 19, <26,13> 20, <30,1> 1, <30,2> 2, <30,3> 3, <30,4> 4, <30,5> 5, <30,6> 6, <30,7> 7, <30,8> 22, <30,9> 23, <30,10> 24, <30,11> 25, <30,12> 8, <30,13> 10, <31,1> 14, <31,2> 15, <31,3> 23, <31,4> 24, <31,5> 25, <32,1> 1, <32,2> 21, <32,3> 22, <32,4> 23, <32,5> 24, <32,6> 25, <33,1> 1, <33,2> 2, <33,3> 3, <33,4> 4, <33,5> 5, <33,6> 9, <33,7> 10, <33,8> 18, <33,9> 19, <33,10> 20, <33,11> 23, <33,12> 24, <33,13> 25, <35,1> 1, <35,2> 2, <35,3> 3, <35,4> 4, <35,5> 5, <35,6> 6, <35,7> 7, <35,8> 23, <35,9> 24, <35,10> 25, <37,1> 1, <38,1> 1, <38,2> 6, <38,3> 11, <38,4> 16, <38,5> 21, <39,1> 3, <39,2> 4, <39,3> 5, <39,4> 6, <39,5> 8, <39,6> 11, <39,7> 13, <39,8> 16, <39,9> 18, <39,10> 21, <39,11> 23, <40,1> 1, <40,2> 4, <40,3> 5, <40,4> 6, <40,5> 9, <40,6> 10, <40,7> 11, <40,8> 14, <40,9> 15, <40,10> 16, <40,11> 19, <40,12> 20, <40,13> 21, <40,14> 22, <40,15> 23, <40,16> 24, <40,17> 25, <41,1> 1, <41,2> 2, <41,3> 3, <41,4> 4, <41,5> 5, <41,6> 22, <41,7> 23, <42,1> 7, <42,2> 8, <42,3> 9, <42,4> 10, <42,5> 17, <42,6> 18, <42,7> 19, <42,8> 20, <45,1> 1, <45,2> 2, <45,3> 3, <45,4> 4, <45,5> 5, <45,6> 6, <45,7> 7, <45,8> 8, <45,9> 24, <45,10> 25, <47,1> 1, <47,2> 2, <47,3> 3, <47,4> 4, <47,5> 5, <47,6> 8, <47,7> 9, <47,8> 10, <47,9> 13, <47,10> 14, <47,11> 15, <47,12> 18, <47,13> 19, <47,14> 20, <47,15> 23, <47,16> 24, <47,17> 25, <48,1> 1, <48,2> 2, <48,3> 3, <48,4> 4, <48,5> 5, <49,1> 3, <49,2> 4, <49,3> 5, <49,4> 8, <49,5> 9, <49,6> 10, <49,7> 13, <49,8> 14, <49,9> 15, <49,10> 18, <49,11> 19, <49,12> 20, <50,1> 13, <50,2> 14, <50,3> 15, <50,4> 18, <50,5> 19, <50,6> 20, <50,7> 23, <50,8> 24, <50,9> 25, <52,1> 1, <52,2> 23, <52,3> 24, <52,4> 25, <53,1> 8, <53,2> 9, <53,3> 10, <53,4> 11, <53,5> 12, <53,6> 13, <53,7> 14, <53,8> 15, <53,9> 16, <53,10> 17, <53,11> 18, <53,12> 19, <53,13> 20;

param CurriculumHasCoursesCount[Curricula] := <01> 2, <02> 2, <03> 2, <04> 2, <05> 2, <06> 2, <07> 2, <08> 2, <09> 2, <10> 2, <11> 2, <12> 2, <13> 2, <14> 2, <15> 2, <16> 2, <17> 3, <18> 2, <19> 3, <20> 2, <21> 2, <22> 3, <23> 2, <24> 2, <25> 2, <26> 2, <27> 2, <28> 2, <29> 2, <30> 2, <31> 2, <32> 2, <33> 2, <34> 2, <35> 2, <36> 2, <37> 2, <38> 2, <39> 2, <40> 2, <41> 2, <42> 2, <43> 2, <44> 2, <45> 2, <46> 2, <47> 2, <48> 2, <49> 3, <50> 2, <51> 2, <52> 2, <53> 2, <54> 2, <55> 3, <56> 5, <57> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 1, <01,2> 5, <02,1> 1, <02,2> 5, <03,1> 8, <03,2> 29, <04,1> 11, <04,2> 48, <05,1> 10, <05,2> 11, <06,1> 9, <06,2> 11, <07,1> 13, <07,2> 15, <08,1> 14, <08,2> 15, <09,1> 12, <09,2> 15, <10,1> 17, <10,2> 21, <11,1> 18, <11,2> 21, <12,1> 20, <12,2> 21, <13,1> 16, <13,2> 21, <14,1> 19, <14,2> 21, <15,1> 2, <15,2> 6, <16,1> 22, <16,2> 28, <17,1> 23, <17,2> 24, <17,3> 30, <18,1> 25, <18,2> 37, <19,1> 25, <19,2> 26, <19,3> 27, <20,1> 3, <20,2> 7, <21,1> 28, <21,2> 29, <22,1> 23, <22,2> 30, <22,3> 31, <23,1> 31, <23,2> 46, <24,1> 32, <24,2> 34, <25,1> 35, <25,2> 36, <26,1> 33, <26,2> 35, <27,1> 35, <27,2> 49, <28,1> 35, <28,2> 37, <29,1> 40, <29,2> 41, <30,1> 41, <30,2> 44, <31,1> 40, <31,2> 42, <32,1> 42, <32,2> 44, <33,1> 40, <33,2> 43, <34,1> 43, <34,2> 44, <35,1> 40, <35,2> 47, <36,1> 44, <36,2> 47, <37,1> 38, <37,2> 40, <38,1> 38, <38,2> 44, <39,1> 18, <39,2> 40, <40,1> 18, <40,2> 44, <41,1> 39, <41,2> 40, <42,1> 39, <42,2> 44, <43,1> 40, <43,2> 45, <44,1> 44, <44,2> 45, <45,1> 4, <45,2> 6, <46,1> 8, <46,2> 46, <47,1> 47, <47,2> 48, <48,1> 36, <48,2> 49, <49,1> 23, <49,2> 30, <49,3> 49, <50,1> 33, <50,2> 49, <51,1> 50, <51,2> 51, <52,1> 35, <52,2> 37, <53,1> 18, <53,2> 39, <54,1> 42, <54,2> 43, <55,1> 15, <55,2> 52, <55,3> 55, <56,1> 23, <56,2> 24, <56,3> 30, <56,4> 54, <56,5> 55, <57,1> 26, <57,2> 53, <57,3> 55;

param CurriculumHasEventsCount[Curricula] := <01> 8, <02> 8, <03> 10, <04> 10, <05> 10, <06> 10, <07> 10, <08> 10, <09> 10, <10> 10, <11> 10, <12> 10, <13> 10, <14> 10, <15> 8, <16> 10, <17> 11, <18> 10, <19> 10, <20> 8, <21> 10, <22> 11, <23> 10, <24> 10, <25> 10, <26> 10, <27> 10, <28> 10, <29> 10, <30> 10, <31> 10, <32> 10, <33> 10, <34> 10, <35> 10, <36> 10, <37> 10, <38> 10, <39> 10, <40> 10, <41> 10, <42> 10, <43> 10, <44> 10, <45> 8, <46> 10, <47> 10, <48> 10, <49> 11, <50> 10, <51> 10, <52> 10, <53> 10, <54> 10, <55> 10, <56> 15, <57> 9;

param nbTeachers := 51;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 2, <08> 1, <09> 1, <10> 1, <11> 1, <12> 2, <13> 1, <14> 1, <15> 1, <16> 1, <17> 1, <18> 1, <19> 1, <20> 1, <21> 1, <22> 1, <23> 1, <24> 1, <25> 1, <26> 1, <27> 1, <28> 1, <29> 1, <30> 2, <31> 1, <32> 1, <33> 1, <34> 1, <35> 1, <36> 1, <37> 1, <38> 1, <39> 2, <40> 1, <41> 1, <42> 1, <43> 1, <44> 1, <45> 1, <46> 1, <47> 1, <48> 1, <49> 1, <50> 1, <51> 1;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 6, <02,1> 21, <03,1> 31, <04,1> 19, <05,1> 33, <06,1> 24, <07,1> 49, <07,2> 50, <08,1> 14, <09,1> 18, <10,1> 25, <11,1> 2, <12,1> 13, <12,2> 16, <13,1> 39, <14,1> 15, <15,1> 1, <16,1> 8, <17,1> 40, <18,1> 12, <19,1> 45, <20,1> 34, <21,1> 30, <22,1> 36, <23,1> 37, <24,1> 9, <25,1> 55, <26,1> 23, <27,1> 7, <28,1> 44, <29,1> 5, <30,1> 3, <30,2> 4, <31,1> 32, <32,1> 54, <33,1> 17, <34,1> 47, <35,1> 51, <36,1> 48, <37,1> 28, <38,1> 43, <39,1> 26, <39,2> 27, <40,1> 38, <41,1> 10, <42,1> 22, <43,1> 20, <44,1> 35, <45,1> 52, <46,1> 46, <47,1> 42, <48,1> 11, <49,1> 53, <50,1> 29, <51,1> 41;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 5, <03> 5, <04> 5, <05> 5, <06> 5, <07> 10, <08> 5, <09> 5, <10> 5, <11> 5, <12> 10, <13> 5, <14> 5, <15> 5, <16> 5, <17> 5, <18> 5, <19> 5, <20> 5, <21> 5, <22> 5, <23> 5, <24> 5, <25> 2, <26> 1, <27> 3, <28> 5, <29> 3, <30> 10, <31> 5, <32> 2, <33> 5, <34> 5, <35> 5, <36> 5, <37> 5, <38> 5, <39> 5, <40> 5, <41> 5, <42> 5, <43> 5, <44> 5, <45> 3, <46> 5, <47> 5, <48> 5, <49> 3, <50> 5, <51> 5;

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
