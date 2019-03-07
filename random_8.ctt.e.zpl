param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 18;
param nbDays := 5;
param nbCurricula := 30;
param nbCourses := 102;
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

param RoomHasCapacity[Rooms] := <01> 65, <02> 80, <03> 80, <04> 90, <05> 110, <06> 135, <07> 150, <08> 155, <09> 155, <10> 155, <11> 225, <12> 225, <13> 225, <14> 290, <15> 290, <16> 290, <17> 345, <18> 345;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068", <69> "Course069", <70> "Course070", <71> "Course071", <72> "Course072", <73> "Course073", <74> "Course074", <75> "Course075", <76> "Course076", <77> "Course077", <78> "Course078", <79> "Course079", <80> "Course080", <81> "Course081", <82> "Course082", <83> "Course083", <84> "Course084", <85> "Course085", <86> "Course086", <87> "Course087", <88> "Course088", <89> "Course089", <90> "Course090", <91> "Course091", <92> "Course092", <93> "Course093", <94> "Course094", <95> "Course095", <96> "Course096", <97> "Course097", <98> "Course098", <99> "Course099", <100> "Course100", <101> "Course101", <102> "Course102";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t33", <35> "t34", <36> "t35", <37> "t36", <38> "t37", <39> "t38", <40> "t39", <41> "t40", <42> "t41", <43> "t42", <44> "t43", <45> "t44", <46> "t45", <47> "t46", <48> "t47", <49> "t48", <50> "t49", <51> "t00", <52> "t00", <53> "t01", <54> "t01", <55> "t02", <56> "t02", <57> "t03", <58> "t03", <59> "t04", <60> "t04", <61> "t05", <62> "t05", <63> "t06", <64> "t06", <65> "t07", <66> "t07", <67> "t08", <68> "t08", <69> "t09", <70> "t09", <71> "t10", <72> "t10", <73> "t11", <74> "t11", <75> "t12", <76> "t12", <77> "t13", <78> "t13", <79> "t14", <80> "t14", <81> "t15", <82> "t15", <83> "t16", <84> "t16", <85> "t17", <86> "t17", <87> "t18", <88> "t18", <89> "t19", <90> "t19", <91> "t20", <92> "t20", <93> "t21", <94> "t21", <95> "t22", <96> "t22", <97> "t23", <98> "t23", <99> "t24", <100> "t24", <101> "t25", <102> "t25";

param CourseHasStudents[Courses] := <01> 64, <02> 119, <03> 204, <04> 251, <05> 194, <06> 249, <07> 210, <08> 258, <09> 88, <10> 230, <11> 171, <12> 126, <13> 184, <14> 256, <15> 249, <16> 309, <17> 35, <18> 342, <19> 223, <20> 337, <21> 181, <22> 343, <23> 80, <24> 249, <25> 72, <26> 166, <27> 106, <28> 236, <29> 231, <30> 98, <31> 69, <32> 317, <33> 249, <34> 211, <35> 210, <36> 314, <37> 90, <38> 252, <39> 214, <40> 74, <41> 303, <42> 50, <43> 34, <44> 22, <45> 64, <46> 257, <47> 74, <48> 66, <49> 209, <50> 42, <51> 258, <52> 190, <53> 215, <54> 132, <55> 155, <56> 161, <57> 278, <58> 104, <59> 297, <60> 191, <61> 91, <62> 256, <63> 149, <64> 338, <65> 314, <66> 299, <67> 167, <68> 65, <69> 101, <70> 269, <71> 268, <72> 180, <73> 106, <74> 30, <75> 186, <76> 148, <77> 242, <78> 38, <79> 51, <80> 118, <81> 183, <82> 135, <83> 231, <84> 233, <85> 290, <86> 121, <87> 77, <88> 28, <89> 105, <90> 27, <91> 147, <92> 139, <93> 221, <94> 141, <95> 63, <96> 258, <97> 150, <98> 165, <99> 111, <100> 46, <101> 317, <102> 299;

param CourseHasEvents[Courses] := <01> 3, <02> 3, <03> 3, <04> 2, <05> 2, <06> 4, <07> 2, <08> 3, <09> 4, <10> 2, <11> 2, <12> 4, <13> 2, <14> 2, <15> 3, <16> 4, <17> 4, <18> 2, <19> 4, <20> 2, <21> 3, <22> 2, <23> 3, <24> 3, <25> 2, <26> 4, <27> 4, <28> 2, <29> 2, <30> 4, <31> 3, <32> 2, <33> 2, <34> 2, <35> 2, <36> 3, <37> 3, <38> 2, <39> 3, <40> 2, <41> 3, <42> 3, <43> 2, <44> 4, <45> 4, <46> 3, <47> 4, <48> 2, <49> 4, <50> 2, <51> 2, <52> 2, <53> 2, <54> 2, <55> 4, <56> 3, <57> 4, <58> 3, <59> 4, <60> 4, <61> 4, <62> 4, <63> 4, <64> 4, <65> 4, <66> 4, <67> 4, <68> 3, <69> 4, <70> 4, <71> 3, <72> 4, <73> 2, <74> 3, <75> 2, <76> 2, <77> 3, <78> 3, <79> 4, <80> 3, <81> 3, <82> 3, <83> 3, <84> 3, <85> 4, <86> 2, <87> 2, <88> 3, <89> 2, <90> 2, <91> 3, <92> 4, <93> 2, <94> 2, <95> 2, <96> 4, <97> 4, <98> 2, <99> 2, <100> 4, <101> 2, <102> 3;

param CourseHasMindays[Courses] := <01> 2, <02> 2, <03> 2, <04> 1, <05> 1, <06> 3, <07> 1, <08> 2, <09> 3, <10> 1, <11> 1, <12> 3, <13> 1, <14> 1, <15> 2, <16> 3, <17> 3, <18> 1, <19> 3, <20> 1, <21> 2, <22> 1, <23> 2, <24> 2, <25> 1, <26> 3, <27> 3, <28> 1, <29> 1, <30> 3, <31> 2, <32> 1, <33> 1, <34> 1, <35> 1, <36> 2, <37> 2, <38> 1, <39> 2, <40> 1, <41> 2, <42> 2, <43> 1, <44> 3, <45> 3, <46> 2, <47> 3, <48> 1, <49> 3, <50> 1, <51> 1, <52> 1, <53> 1, <54> 1, <55> 3, <56> 2, <57> 3, <58> 2, <59> 3, <60> 3, <61> 3, <62> 3, <63> 3, <64> 3, <65> 3, <66> 3, <67> 3, <68> 2, <69> 3, <70> 3, <71> 2, <72> 3, <73> 1, <74> 2, <75> 1, <76> 1, <77> 2, <78> 2, <79> 3, <80> 2, <81> 2, <82> 2, <83> 2, <84> 2, <85> 3, <86> 1, <87> 1, <88> 2, <89> 1, <90> 1, <91> 2, <92> 3, <93> 1, <94> 1, <95> 1, <96> 3, <97> 3, <98> 1, <99> 1, <100> 3, <101> 1, <102> 2;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 10, <02> 0, <03> 0, <04> 2, <05> 1, <06> 5, <07> 1, <08> 0, <09> 7, <10> 1, <11> 0, <12> 0, <13> 0, <14> 2, <15> 3, <16> 10, <17> 4, <18> 0, <19> 2, <20> 8, <21> 0, <22> 10, <23> 0, <24> 4, <25> 4, <26> 2, <27> 5, <28> 6, <29> 3, <30> 0, <31> 10, <32> 4, <33> 8, <34> 0, <35> 8, <36> 5, <37> 3, <38> 4, <39> 0, <40> 4, <41> 0, <42> 2, <43> 0, <44> 1, <45> 0, <46> 4, <47> 0, <48> 0, <49> 0, <50> 11, <51> 9, <52> 4, <53> 5, <54> 0, <55> 4, <56> 5, <57> 0, <58> 5, <59> 4, <60> 0, <61> 0, <62> 0, <63> 0, <64> 8, <65> 4, <66> 3, <67> 7, <68> 0, <69> 6, <70> 0, <71> 2, <72> 9, <73> 2, <74> 0, <75> 4, <76> 2, <77> 5, <78> 0, <79> 3, <80> 1, <81> 3, <82> 0, <83> 0, <84> 0, <85> 5, <86> 4, <87> 4, <88> 12, <89> 0, <90> 8, <91> 4, <92> 13, <93> 7, <94> 0, <95> 0, <96> 2, <97> 8, <98> 0, <99> 3, <100> 16, <101> 5, <102> 4;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 1, <01,2> 2, <01,3> 3, <01,4> 4, <01,5> 5, <01,6> 6, <01,7> 7, <01,8> 8, <01,9> 9, <01,10> 10, <04,1> 21, <04,2> 22, <05,1> 6, <06,1> 6, <06,2> 11, <06,3> 12, <06,4> 13, <06,5> 14, <07,1> 16, <09,1> 1, <09,2> 2, <09,3> 3, <09,4> 4, <09,5> 11, <09,6> 12, <09,7> 13, <10,1> 16, <14,1> 20, <14,2> 25, <15,1> 21, <15,2> 22, <15,3> 23, <16,1> 11, <16,2> 12, <16,3> 13, <16,4> 14, <16,5> 15, <16,6> 21, <16,7> 22, <16,8> 23, <16,9> 24, <16,10> 25, <17,1> 1, <17,2> 2, <17,3> 3, <17,4> 21, <19,1> 24, <19,2> 25, <20,1> 7, <20,2> 8, <20,3> 9, <20,4> 10, <20,5> 21, <20,6> 22, <20,7> 23, <20,8> 24, <22,1> 11, <22,2> 12, <22,3> 13, <22,4> 14, <22,5> 15, <22,6> 21, <22,7> 22, <22,8> 23, <22,9> 24, <22,10> 25, <24,1> 11, <24,2> 12, <24,3> 13, <24,4> 14, <25,1> 16, <25,2> 17, <25,3> 18, <25,4> 19, <26,1> 1, <26,2> 2, <27,1> 21, <27,2> 22, <27,3> 23, <27,4> 24, <27,5> 25, <28,1> 10, <28,2> 11, <28,3> 12, <28,4> 13, <28,5> 14, <28,6> 15, <29,1> 16, <29,2> 17, <29,3> 18, <31,1> 1, <31,2> 2, <31,3> 3, <31,4> 4, <31,5> 5, <31,6> 11, <31,7> 12, <31,8> 13, <31,9> 14, <31,10> 15, <32,1> 6, <32,2> 7, <32,3> 8, <32,4> 9, <33,1> 6, <33,2> 7, <33,3> 8, <33,4> 21, <33,5> 22, <33,6> 23, <33,7> 24, <33,8> 25, <35,1> 6, <35,2> 7, <35,3> 8, <35,4> 9, <35,5> 10, <35,6> 13, <35,7> 14, <35,8> 15, <36,1> 1, <36,2> 2, <36,3> 3, <36,4> 4, <36,5> 5, <37,1> 11, <37,2> 12, <37,3> 16, <38,1> 12, <38,2> 13, <38,3> 14, <38,4> 15, <40,1> 11, <40,2> 12, <40,3> 21, <40,4> 22, <42,1> 16, <42,2> 17, <44,1> 16, <46,1> 16, <46,2> 17, <46,3> 18, <46,4> 19, <50,1> 6, <50,2> 7, <50,3> 8, <50,4> 16, <50,5> 17, <50,6> 18, <50,7> 19, <50,8> 22, <50,9> 23, <50,10> 24, <50,11> 25, <51,1> 1, <51,2> 2, <51,3> 3, <51,4> 4, <51,5> 5, <51,6> 7, <51,7> 8, <51,8> 9, <51,9> 10, <52,1> 16, <52,2> 17, <52,3> 18, <52,4> 19, <53,1> 1, <53,2> 2, <53,3> 3, <53,4> 4, <53,5> 5, <55,1> 21, <55,2> 22, <55,3> 23, <55,4> 24, <56,1> 21, <56,2> 22, <56,3> 23, <56,4> 24, <56,5> 25, <58,1> 10, <58,2> 11, <58,3> 12, <58,4> 13, <58,5> 14, <59,1> 16, <59,2> 17, <59,3> 18, <59,4> 19, <64,1> 12, <64,2> 13, <64,3> 14, <64,4> 15, <64,5> 22, <64,6> 23, <64,7> 24, <64,8> 25, <65,1> 9, <65,2> 10, <65,3> 19, <65,4> 20, <66,1> 11, <66,2> 12, <66,3> 13, <67,1> 9, <67,2> 10, <67,3> 16, <67,4> 17, <67,5> 18, <67,6> 19, <67,7> 20, <69,1> 10, <69,2> 11, <69,3> 12, <69,4> 13, <69,5> 14, <69,6> 15, <71,1> 6, <71,2> 20, <72,1> 2, <72,2> 3, <72,3> 4, <72,4> 5, <72,5> 21, <72,6> 22, <72,7> 23, <72,8> 24, <72,9> 25, <73,1> 11, <73,2> 12, <75,1> 3, <75,2> 4, <75,3> 5, <75,4> 11, <76,1> 19, <76,2> 20, <77,1> 11, <77,2> 12, <77,3> 13, <77,4> 14, <77,5> 15, <79,1> 3, <79,2> 4, <79,3> 5, <80,1> 20, <81,1> 6, <81,2> 10, <81,3> 11, <85,1> 6, <85,2> 7, <85,3> 11, <85,4> 12, <85,5> 16, <86,1> 17, <86,2> 18, <86,3> 19, <86,4> 20, <87,1> 22, <87,2> 23, <87,3> 24, <87,4> 25, <88,1> 8, <88,2> 9, <88,3> 10, <88,4> 11, <88,5> 12, <88,6> 13, <88,7> 15, <88,8> 16, <88,9> 17, <88,10> 18, <88,11> 19, <88,12> 20, <90,1> 7, <90,2> 8, <90,3> 9, <90,4> 10, <90,5> 22, <90,6> 23, <90,7> 24, <90,8> 25, <91,1> 21, <91,2> 22, <91,3> 23, <91,4> 24, <92,1> 1, <92,2> 2, <92,3> 3, <92,4> 4, <92,5> 5, <92,6> 8, <92,7> 9, <92,8> 10, <92,9> 16, <92,10> 17, <92,11> 18, <92,12> 19, <92,13> 20, <93,1> 6, <93,2> 7, <93,3> 8, <93,4> 9, <93,5> 19, <93,6> 20, <93,7> 21, <96,1> 16, <96,2> 17, <97,1> 6, <97,2> 7, <97,3> 8, <97,4> 9, <97,5> 21, <97,6> 22, <97,7> 23, <97,8> 24, <99,1> 6, <99,2> 7, <99,3> 8, <100,1> 6, <100,2> 7, <100,3> 8, <100,4> 9, <100,5> 10, <100,6> 11, <100,7> 16, <100,8> 17, <100,9> 18, <100,10> 19, <100,11> 20, <100,12> 21, <100,13> 22, <100,14> 23, <100,15> 24, <100,16> 25, <101,1> 6, <101,2> 7, <101,3> 8, <101,4> 9, <101,5> 10, <102,1> 12, <102,2> 13, <102,3> 14, <102,4> 15;

param CurriculumHasCoursesCount[Curricula] := <01> 4, <02> 4, <03> 3, <04> 3, <05> 4, <06> 3, <07> 2, <08> 5, <09> 4, <10> 4, <11> 4, <12> 4, <13> 4, <14> 4, <15> 3, <16> 3, <17> 5, <18> 3, <19> 5, <20> 4, <21> 5, <22> 3, <23> 3, <24> 3, <25> 4, <26> 5, <27> 4, <28> 3, <29> 5, <30> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 11, <01,2> 28, <01,3> 31, <01,4> 38, <02,1> 20, <02,2> 41, <02,3> 73, <02,4> 76, <03,1> 11, <03,2> 67, <03,3> 74, <04,1> 45, <04,2> 52, <04,3> 90, <05,1> 7, <05,2> 11, <05,3> 35, <05,4> 70, <06,1> 6, <06,2> 10, <06,3> 82, <07,1> 8, <07,2> 67, <08,1> 18, <08,2> 41, <08,3> 44, <08,4> 46, <08,5> 86, <09,1> 11, <09,2> 71, <09,3> 95, <09,4> 98, <10,1> 45, <10,2> 55, <10,3> 86, <10,4> 90, <11,1> 14, <11,2> 62, <11,3> 76, <11,4> 93, <12,1> 47, <12,2> 79, <12,3> 81, <12,4> 85, <13,1> 16, <13,2> 42, <13,3> 53, <13,4> 88, <14,1> 25, <14,2> 37, <14,3> 63, <14,4> 94, <15,1> 25, <15,2> 70, <15,3> 73, <16,1> 9, <16,2> 70, <16,3> 102, <17,1> 38, <17,2> 42, <17,3> 59, <17,4> 69, <17,5> 93, <18,1> 41, <18,2> 49, <18,3> 72, <19,1> 6, <19,2> 47, <19,3> 68, <19,4> 80, <19,5> 86, <20,1> 15, <20,2> 21, <20,3> 58, <20,4> 78, <21,1> 16, <21,2> 34, <21,3> 54, <21,4> 62, <21,5> 95, <22,1> 20, <22,2> 35, <22,3> 84, <23,1> 15, <23,2> 17, <23,3> 76, <24,1> 6, <24,2> 18, <24,3> 26, <25,1> 21, <25,2> 29, <25,3> 35, <25,4> 67, <26,1> 10, <26,2> 36, <26,3> 58, <26,4> 73, <26,5> 100, <27,1> 3, <27,2> 13, <27,3> 30, <27,4> 96, <28,1> 10, <28,2> 11, <28,3> 49, <29,1> 30, <29,2> 50, <29,3> 63, <29,4> 75, <29,5> 101, <30,1> 65, <30,2> 85, <30,3> 89;

param CurriculumHasEventsCount[Curricula] := <01> 9, <02> 9, <03> 9, <04> 8, <05> 10, <06> 9, <07> 7, <08> 14, <09> 9, <10> 12, <11> 10, <12> 15, <13> 12, <14> 11, <15> 8, <16> 11, <17> 15, <18> 11, <19> 16, <20> 12, <21> 14, <22> 7, <23> 9, <24> 10, <25> 11, <26> 14, <27> 13, <28> 8, <29> 14, <30> 10;

param nbTeachers := 50;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 1, <24> 1, <25> 1, <26> 1, <27> 3, <28> 3, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 3, <36> 3, <37> 3, <38> 3, <39> 3, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 3, <48> 3, <49> 3, <50> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 50, <02,1> 49, <03,1> 44, <04,1> 43, <05,1> 42, <06,1> 41, <07,1> 48, <08,1> 47, <09,1> 46, <10,1> 45, <11,1> 28, <12,1> 30, <13,1> 29, <14,1> 27, <15,1> 15, <15,2> 79, <15,3> 80, <16,1> 16, <16,2> 81, <16,3> 82, <17,1> 17, <17,2> 83, <17,3> 84, <18,1> 18, <18,2> 85, <18,3> 86, <19,1> 11, <19,2> 71, <19,3> 72, <20,1> 12, <20,2> 73, <20,3> 74, <21,1> 13, <21,2> 75, <21,3> 76, <22,1> 14, <22,2> 77, <22,3> 78, <23,1> 37, <24,1> 38, <25,1> 35, <26,1> 36, <27,1> 19, <27,2> 87, <27,3> 88, <28,1> 20, <28,2> 89, <28,3> 90, <29,1> 31, <30,1> 32, <31,1> 39, <32,1> 40, <33,1> 33, <34,1> 34, <35,1> 8, <35,2> 65, <35,3> 66, <36,1> 7, <36,2> 63, <36,3> 64, <37,1> 6, <37,2> 61, <37,3> 62, <38,1> 5, <38,2> 59, <38,3> 60, <39,1> 4, <39,2> 57, <39,3> 58, <40,1> 3, <40,2> 55, <40,3> 56, <41,1> 2, <41,2> 53, <41,3> 54, <42,1> 1, <42,2> 51, <42,3> 52, <43,1> 22, <43,2> 93, <43,3> 94, <44,1> 21, <44,2> 91, <44,3> 92, <45,1> 24, <45,2> 97, <45,3> 98, <46,1> 23, <46,2> 95, <46,3> 96, <47,1> 26, <47,2> 101, <47,3> 102, <48,1> 25, <48,2> 99, <48,3> 100, <49,1> 10, <49,2> 69, <49,3> 70, <50,1> 9, <50,2> 67, <50,3> 68;

param TeacherHasEventsCount[Teachers] := <01> 2, <02> 4, <03> 4, <04> 2, <05> 3, <06> 3, <07> 2, <08> 4, <09> 3, <10> 4, <11> 2, <12> 4, <13> 2, <14> 4, <15> 10, <16> 10, <17> 10, <18> 8, <19> 9, <20> 9, <21> 6, <22> 8, <23> 3, <24> 2, <25> 2, <26> 3, <27> 9, <28> 6, <29> 3, <30> 2, <31> 3, <32> 2, <33> 2, <34> 2, <35> 11, <36> 10, <37> 12, <38> 10, <39> 9, <40> 10, <41> 7, <42> 7, <43> 6, <44> 10, <45> 9, <46> 9, <47> 9, <48> 8, <49> 10, <50> 11;

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
