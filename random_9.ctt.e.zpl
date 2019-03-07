param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 18;
param nbDays := 5;
param nbCurricula := 30;
param nbCourses := 101;
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

param RoomHasCapacity[Rooms] := <01> 50, <02> 110, <03> 200, <04> 205, <05> 235, <06> 235, <07> 275, <08> 275, <09> 275, <10> 295, <11> 295, <12> 300, <13> 300, <14> 300, <15> 305, <16> 305, <17> 335, <18> 335;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068", <69> "Course069", <70> "Course070", <71> "Course071", <72> "Course072", <73> "Course073", <74> "Course074", <75> "Course075", <76> "Course076", <77> "Course077", <78> "Course078", <79> "Course079", <80> "Course080", <81> "Course081", <82> "Course082", <83> "Course083", <84> "Course084", <85> "Course085", <86> "Course086", <87> "Course087", <88> "Course088", <89> "Course089", <90> "Course090", <91> "Course091", <92> "Course092", <93> "Course093", <94> "Course094", <95> "Course095", <96> "Course096", <97> "Course097", <98> "Course098", <99> "Course099", <100> "Course100", <101> "Course101";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t33", <35> "t34", <36> "t35", <37> "t36", <38> "t37", <39> "t38", <40> "t39", <41> "t40", <42> "t41", <43> "t42", <44> "t43", <45> "t44", <46> "t45", <47> "t46", <48> "t47", <49> "t48", <50> "t49", <51> "t00", <52> "t00", <53> "t01", <54> "t01", <55> "t02", <56> "t02", <57> "t03", <58> "t03", <59> "t04", <60> "t04", <61> "t05", <62> "t05", <63> "t06", <64> "t06", <65> "t07", <66> "t07", <67> "t08", <68> "t08", <69> "t09", <70> "t09", <71> "t10", <72> "t10", <73> "t11", <74> "t11", <75> "t12", <76> "t12", <77> "t13", <78> "t13", <79> "t14", <80> "t14", <81> "t15", <82> "t15", <83> "t16", <84> "t16", <85> "t17", <86> "t17", <87> "t18", <88> "t18", <89> "t19", <90> "t19", <91> "t20", <92> "t20", <93> "t21", <94> "t21", <95> "t22", <96> "t22", <97> "t23", <98> "t23", <99> "t24", <100> "t24", <101> "t25";

param CourseHasStudents[Courses] := <01> 330, <02> 225, <03> 327, <04> 185, <05> 310, <06> 233, <07> 62, <08> 132, <09> 147, <10> 81, <11> 153, <12> 111, <13> 248, <14> 197, <15> 222, <16> 325, <17> 300, <18> 107, <19> 289, <20> 243, <21> 324, <22> 298, <23> 301, <24> 78, <25> 252, <26> 101, <27> 341, <28> 338, <29> 192, <30> 308, <31> 132, <32> 140, <33> 214, <34> 111, <35> 102, <36> 62, <37> 208, <38> 51, <39> 140, <40> 203, <41> 175, <42> 49, <43> 39, <44> 190, <45> 152, <46> 79, <47> 261, <48> 145, <49> 323, <50> 204, <51> 199, <52> 202, <53> 177, <54> 148, <55> 131, <56> 25, <57> 139, <58> 30, <59> 26, <60> 45, <61> 104, <62> 116, <63> 246, <64> 316, <65> 139, <66> 250, <67> 166, <68> 63, <69> 110, <70> 97, <71> 85, <72> 131, <73> 78, <74> 174, <75> 250, <76> 200, <77> 214, <78> 269, <79> 179, <80> 199, <81> 158, <82> 303, <83> 41, <84> 192, <85> 256, <86> 236, <87> 308, <88> 105, <89> 286, <90> 153, <91> 247, <92> 321, <93> 303, <94> 191, <95> 37, <96> 61, <97> 25, <98> 212, <99> 171, <100> 88, <101> 346;

param CourseHasEvents[Courses] := <01> 3, <02> 2, <03> 3, <04> 4, <05> 4, <06> 2, <07> 3, <08> 3, <09> 4, <10> 2, <11> 2, <12> 2, <13> 2, <14> 2, <15> 2, <16> 2, <17> 3, <18> 3, <19> 3, <20> 4, <21> 4, <22> 2, <23> 2, <24> 2, <25> 4, <26> 2, <27> 4, <28> 3, <29> 4, <30> 3, <31> 2, <32> 2, <33> 3, <34> 3, <35> 3, <36> 3, <37> 2, <38> 3, <39> 3, <40> 3, <41> 4, <42> 4, <43> 4, <44> 2, <45> 3, <46> 2, <47> 2, <48> 4, <49> 4, <50> 2, <51> 4, <52> 4, <53> 3, <54> 2, <55> 4, <56> 3, <57> 4, <58> 2, <59> 4, <60> 2, <61> 4, <62> 3, <63> 2, <64> 3, <65> 2, <66> 2, <67> 4, <68> 3, <69> 3, <70> 4, <71> 2, <72> 3, <73> 3, <74> 4, <75> 4, <76> 2, <77> 4, <78> 3, <79> 4, <80> 3, <81> 3, <82> 3, <83> 4, <84> 3, <85> 4, <86> 3, <87> 4, <88> 2, <89> 2, <90> 2, <91> 4, <92> 3, <93> 4, <94> 2, <95> 2, <96> 3, <97> 4, <98> 2, <99> 3, <100> 2, <101> 4;

param CourseHasMindays[Courses] := <01> 2, <02> 1, <03> 2, <04> 3, <05> 3, <06> 1, <07> 2, <08> 2, <09> 3, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 1, <16> 1, <17> 2, <18> 2, <19> 2, <20> 3, <21> 3, <22> 1, <23> 1, <24> 1, <25> 3, <26> 1, <27> 3, <28> 2, <29> 3, <30> 2, <31> 1, <32> 1, <33> 2, <34> 2, <35> 2, <36> 2, <37> 1, <38> 2, <39> 2, <40> 2, <41> 3, <42> 3, <43> 3, <44> 1, <45> 2, <46> 1, <47> 1, <48> 3, <49> 3, <50> 1, <51> 3, <52> 3, <53> 2, <54> 1, <55> 3, <56> 2, <57> 3, <58> 1, <59> 3, <60> 1, <61> 3, <62> 2, <63> 1, <64> 2, <65> 1, <66> 1, <67> 3, <68> 2, <69> 2, <70> 3, <71> 1, <72> 2, <73> 2, <74> 3, <75> 3, <76> 1, <77> 3, <78> 2, <79> 3, <80> 2, <81> 2, <82> 2, <83> 3, <84> 2, <85> 3, <86> 2, <87> 3, <88> 1, <89> 1, <90> 1, <91> 3, <92> 2, <93> 3, <94> 1, <95> 1, <96> 2, <97> 3, <98> 1, <99> 2, <100> 1, <101> 3;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 1, <02> 0, <03> 0, <04> 5, <05> 0, <06> 3, <07> 3, <08> 2, <09> 5, <10> 7, <11> 3, <12> 0, <13> 5, <14> 3, <15> 1, <16> 5, <17> 0, <18> 5, <19> 0, <20> 7, <21> 4, <22> 0, <23> 6, <24> 3, <25> 0, <26> 3, <27> 3, <28> 0, <29> 4, <30> 0, <31> 8, <32> 4, <33> 8, <34> 0, <35> 0, <36> 0, <37> 0, <38> 0, <39> 5, <40> 2, <41> 0, <42> 0, <43> 1, <44> 0, <45> 0, <46> 0, <47> 5, <48> 1, <49> 5, <50> 4, <51> 0, <52> 0, <53> 9, <54> 0, <55> 5, <56> 4, <57> 0, <58> 9, <59> 2, <60> 3, <61> 4, <62> 6, <63> 0, <64> 5, <65> 7, <66> 0, <67> 6, <68> 4, <69> 8, <70> 5, <71> 1, <72> 10, <73> 1, <74> 3, <75> 0, <76> 12, <77> 0, <78> 6, <79> 1, <80> 0, <81> 3, <82> 9, <83> 0, <84> 2, <85> 4, <86> 0, <87> 2, <88> 0, <89> 5, <90> 14, <91> 9, <92> 1, <93> 4, <94> 13, <95> 3, <96> 21, <97> 7, <98> 0, <99> 1, <100> 0, <101> 4;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 1, <04,1> 6, <04,2> 7, <04,3> 8, <04,4> 9, <04,5> 10, <06,1> 3, <06,2> 4, <06,3> 5, <07,1> 23, <07,2> 24, <07,3> 25, <08,1> 14, <08,2> 15, <09,1> 6, <09,2> 7, <09,3> 8, <09,4> 9, <09,5> 10, <10,1> 1, <10,2> 2, <10,3> 16, <10,4> 17, <10,5> 18, <10,6> 19, <10,7> 20, <11,1> 5, <11,2> 16, <11,3> 17, <13,1> 21, <13,2> 22, <13,3> 23, <13,4> 24, <13,5> 25, <14,1> 3, <14,2> 4, <14,3> 5, <15,1> 15, <16,1> 16, <16,2> 17, <16,3> 18, <16,4> 19, <16,5> 20, <18,1> 21, <18,2> 22, <18,3> 23, <18,4> 24, <18,5> 25, <20,1> 4, <20,2> 5, <20,3> 9, <20,4> 10, <20,5> 21, <20,6> 22, <20,7> 23, <21,1> 21, <21,2> 22, <21,3> 23, <21,4> 24, <23,1> 20, <23,2> 21, <23,3> 22, <23,4> 23, <23,5> 24, <23,6> 25, <24,1> 5, <24,2> 24, <24,3> 25, <26,1> 13, <26,2> 14, <26,3> 15, <27,1> 1, <27,2> 2, <27,3> 20, <29,1> 1, <29,2> 2, <29,3> 11, <29,4> 12, <31,1> 11, <31,2> 12, <31,3> 13, <31,4> 14, <31,5> 16, <31,6> 17, <31,7> 18, <31,8> 19, <32,1> 2, <32,2> 3, <32,3> 4, <32,4> 5, <33,1> 3, <33,2> 4, <33,3> 5, <33,4> 20, <33,5> 21, <33,6> 22, <33,7> 23, <33,8> 24, <39,1> 1, <39,2> 2, <39,3> 3, <39,4> 4, <39,5> 20, <40,1> 21, <40,2> 22, <43,1> 10, <47,1> 11, <47,2> 12, <47,3> 13, <47,4> 14, <47,5> 15, <48,1> 15, <49,1> 18, <49,2> 19, <49,3> 20, <49,4> 24, <49,5> 25, <50,1> 6, <50,2> 7, <50,3> 8, <50,4> 9, <53,1> 11, <53,2> 12, <53,3> 15, <53,4> 18, <53,5> 19, <53,6> 20, <53,7> 21, <53,8> 22, <53,9> 23, <55,1> 11, <55,2> 12, <55,3> 13, <55,4> 19, <55,5> 20, <56,1> 22, <56,2> 23, <56,3> 24, <56,4> 25, <58,1> 2, <58,2> 3, <58,3> 4, <58,4> 5, <58,5> 21, <58,6> 22, <58,7> 23, <58,8> 24, <58,9> 25, <59,1> 1, <59,2> 2, <60,1> 8, <60,2> 9, <60,3> 10, <61,1> 12, <61,2> 13, <61,3> 14, <61,4> 15, <62,1> 3, <62,2> 4, <62,3> 5, <62,4> 23, <62,5> 24, <62,6> 25, <64,1> 19, <64,2> 20, <64,3> 21, <64,4> 22, <64,5> 23, <65,1> 13, <65,2> 14, <65,3> 15, <65,4> 17, <65,5> 18, <65,6> 19, <65,7> 20, <67,1> 6, <67,2> 7, <67,3> 8, <67,4> 9, <67,5> 16, <67,6> 17, <68,1> 1, <68,2> 2, <68,3> 16, <68,4> 17, <69,1> 1, <69,2> 2, <69,3> 3, <69,4> 16, <69,5> 17, <69,6> 18, <69,7> 19, <69,8> 20, <70,1> 1, <70,2> 2, <70,3> 3, <70,4> 4, <70,5> 5, <71,1> 16, <72,1> 6, <72,2> 7, <72,3> 8, <72,4> 11, <72,5> 12, <72,6> 21, <72,7> 22, <72,8> 23, <72,9> 24, <72,10> 25, <73,1> 11, <74,1> 13, <74,2> 14, <74,3> 15, <76,1> 1, <76,2> 2, <76,3> 3, <76,4> 6, <76,5> 7, <76,6> 8, <76,7> 9, <76,8> 10, <76,9> 12, <76,10> 13, <76,11> 14, <76,12> 15, <78,1> 11, <78,2> 12, <78,3> 17, <78,4> 18, <78,5> 19, <78,6> 20, <79,1> 1, <81,1> 6, <81,2> 7, <81,3> 8, <82,1> 1, <82,2> 2, <82,3> 3, <82,4> 4, <82,5> 10, <82,6> 21, <82,7> 22, <82,8> 23, <82,9> 25, <84,1> 16, <84,2> 17, <85,1> 6, <85,2> 7, <85,3> 8, <85,4> 9, <87,1> 6, <87,2> 21, <89,1> 6, <89,2> 7, <89,3> 8, <89,4> 9, <89,5> 10, <90,1> 6, <90,2> 7, <90,3> 8, <90,4> 9, <90,5> 11, <90,6> 12, <90,7> 13, <90,8> 14, <90,9> 15, <90,10> 16, <90,11> 17, <90,12> 18, <90,13> 19, <90,14> 25, <91,1> 11, <91,2> 12, <91,3> 13, <91,4> 14, <91,5> 21, <91,6> 22, <91,7> 23, <91,8> 24, <91,9> 25, <92,1> 1, <93,1> 18, <93,2> 19, <93,3> 20, <93,4> 21, <94,1> 11, <94,2> 12, <94,3> 13, <94,4> 14, <94,5> 16, <94,6> 17, <94,7> 18, <94,8> 19, <94,9> 21, <94,10> 22, <94,11> 23, <94,12> 24, <94,13> 25, <95,1> 18, <95,2> 19, <95,3> 20, <96,1> 1, <96,2> 2, <96,3> 3, <96,4> 4, <96,5> 6, <96,6> 7, <96,7> 8, <96,8> 9, <96,9> 10, <96,10> 14, <96,11> 15, <96,12> 16, <96,13> 17, <96,14> 18, <96,15> 19, <96,16> 20, <96,17> 21, <96,18> 22, <96,19> 23, <96,20> 24, <96,21> 25, <97,1> 1, <97,2> 2, <97,3> 3, <97,4> 16, <97,5> 17, <97,6> 18, <97,7> 19, <99,1> 20, <101,1> 22, <101,2> 23, <101,3> 24, <101,4> 25;

param CurriculumHasCoursesCount[Curricula] := <01> 5, <02> 5, <03> 4, <04> 5, <05> 4, <06> 3, <07> 3, <08> 3, <09> 4, <10> 4, <11> 4, <12> 5, <13> 5, <14> 5, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 5, <22> 3, <23> 5, <24> 5, <25> 5, <26> 3, <27> 4, <28> 5, <29> 3, <30> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 1, <01,2> 20, <01,3> 76, <01,4> 93, <01,5> 96, <02,1> 6, <02,2> 61, <02,3> 81, <02,4> 85, <02,5> 98, <03,1> 35, <03,2> 65, <03,3> 79, <03,4> 94, <04,1> 38, <04,2> 66, <04,3> 80, <04,4> 89, <04,5> 100, <05,1> 3, <05,2> 79, <05,3> 86, <05,4> 95, <06,1> 36, <06,2> 43, <06,3> 91, <07,1> 43, <07,2> 62, <07,3> 98, <08,1> 13, <08,2> 63, <08,3> 70, <09,1> 41, <09,2> 50, <09,3> 64, <09,4> 83, <10,1> 11, <10,2> 49, <10,3> 70, <10,4> 89, <11,1> 18, <11,2> 58, <11,3> 59, <11,4> 72, <12,1> 1, <12,2> 28, <12,3> 38, <12,4> 72, <12,5> 82, <13,1> 18, <13,2> 28, <13,3> 39, <13,4> 92, <13,5> 93, <14,1> 26, <14,2> 56, <14,3> 74, <14,4> 78, <14,5> 91, <15,1> 14, <15,2> 39, <15,3> 64, <16,1> 77, <16,2> 81, <16,3> 101, <17,1> 6, <17,2> 46, <17,3> 51, <18,1> 6, <18,2> 40, <18,3> 72, <19,1> 17, <19,2> 28, <19,3> 53, <20,1> 2, <20,2> 42, <20,3> 55, <21,1> 16, <21,2> 23, <21,3> 36, <21,4> 70, <21,5> 101, <22,1> 5, <22,2> 26, <22,3> 99, <23,1> 3, <23,2> 43, <23,3> 53, <23,4> 54, <23,5> 98, <24,1> 1, <24,2> 3, <24,3> 10, <24,4> 71, <24,5> 75, <25,1> 41, <25,2> 42, <25,3> 46, <25,4> 64, <25,5> 75, <26,1> 38, <26,2> 60, <26,3> 70, <27,1> 13, <27,2> 35, <27,3> 51, <27,4> 89, <28,1> 16, <28,2> 37, <28,3> 74, <28,4> 86, <28,5> 94, <29,1> 9, <29,2> 68, <29,3> 97, <30,1> 11, <30,2> 20, <30,3> 22;

param CurriculumHasEventsCount[Curricula] := <01> 16, <02> 15, <03> 11, <04> 12, <05> 12, <06> 11, <07> 9, <08> 8, <09> 13, <10> 12, <11> 12, <12> 15, <13> 16, <14> 16, <15> 8, <16> 11, <17> 8, <18> 8, <19> 9, <20> 10, <21> 15, <22> 9, <23> 14, <24> 14, <25> 17, <26> 9, <27> 11, <28> 13, <29> 11, <30> 8;

param nbTeachers := 50;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 1, <24> 1, <25> 1, <26> 1, <27> 3, <28> 3, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 3, <36> 3, <37> 3, <38> 3, <39> 3, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 2, <48> 3, <49> 3, <50> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 50, <02,1> 49, <03,1> 44, <04,1> 43, <05,1> 42, <06,1> 41, <07,1> 48, <08,1> 47, <09,1> 46, <10,1> 45, <11,1> 28, <12,1> 30, <13,1> 29, <14,1> 27, <15,1> 15, <15,2> 79, <15,3> 80, <16,1> 16, <16,2> 81, <16,3> 82, <17,1> 17, <17,2> 83, <17,3> 84, <18,1> 18, <18,2> 85, <18,3> 86, <19,1> 11, <19,2> 71, <19,3> 72, <20,1> 12, <20,2> 73, <20,3> 74, <21,1> 13, <21,2> 75, <21,3> 76, <22,1> 14, <22,2> 77, <22,3> 78, <23,1> 37, <24,1> 38, <25,1> 35, <26,1> 36, <27,1> 19, <27,2> 87, <27,3> 88, <28,1> 20, <28,2> 89, <28,3> 90, <29,1> 31, <30,1> 32, <31,1> 39, <32,1> 40, <33,1> 33, <34,1> 34, <35,1> 8, <35,2> 65, <35,3> 66, <36,1> 7, <36,2> 63, <36,3> 64, <37,1> 6, <37,2> 61, <37,3> 62, <38,1> 5, <38,2> 59, <38,3> 60, <39,1> 4, <39,2> 57, <39,3> 58, <40,1> 3, <40,2> 55, <40,3> 56, <41,1> 2, <41,2> 53, <41,3> 54, <42,1> 1, <42,2> 51, <42,3> 52, <43,1> 22, <43,2> 93, <43,3> 94, <44,1> 21, <44,2> 91, <44,3> 92, <45,1> 24, <45,2> 97, <45,3> 98, <46,1> 23, <46,2> 95, <46,3> 96, <47,1> 26, <47,2> 101, <48,1> 25, <48,2> 99, <48,3> 100, <49,1> 10, <49,2> 69, <49,3> 70, <50,1> 9, <50,2> 67, <50,3> 68;

param TeacherHasEventsCount[Teachers] := <01> 2, <02> 4, <03> 2, <04> 4, <05> 4, <06> 4, <07> 4, <08> 2, <09> 2, <10> 3, <11> 3, <12> 3, <13> 4, <14> 4, <15> 9, <16> 8, <17> 10, <18> 10, <19> 7, <20> 9, <21> 8, <22> 9, <23> 2, <24> 3, <25> 3, <26> 3, <27> 9, <28> 8, <29> 2, <30> 2, <31> 3, <32> 3, <33> 3, <34> 3, <35> 7, <36> 8, <37> 9, <38> 10, <39> 10, <40> 10, <41> 7, <42> 11, <43> 8, <44> 11, <45> 8, <46> 7, <47> 6, <48> 9, <49> 9, <50> 11;

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

minimize value:  
    (sum <p> in Periods: sum <r> in Rooms: sum <c> in Courses with CourseHasStudents[c] > RoomHasCapacity[r]:
      (Taught[p,r,c] * (CourseHasStudents[c] - RoomHasCapacity[r]))
    ) 
  + 5 * (sum <c> in Courses: CourseMinDayViolations[c])
  + 2 * (sum <cu> in Curricula: sum <d> in Days: PatternPenalties[cu,d]) 
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
