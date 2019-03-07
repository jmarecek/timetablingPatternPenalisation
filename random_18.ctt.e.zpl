param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 15;
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

param RoomHasCapacity[Rooms] := <01> 50, <02> 70, <03> 110, <04> 120, <05> 120, <06> 130, <07> 170, <08> 265, <09> 265, <10> 265, <11> 300, <12> 300, <13> 300, <14> 300, <15> 320;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068", <69> "Course069", <70> "Course070", <71> "Course071", <72> "Course072", <73> "Course073", <74> "Course074", <75> "Course075", <76> "Course076", <77> "Course077", <78> "Course078", <79> "Course079", <80> "Course080", <81> "Course081", <82> "Course082", <83> "Course083", <84> "Course084", <85> "Course085", <86> "Course086", <87> "Course087", <88> "Course088", <89> "Course089", <90> "Course090", <91> "Course091", <92> "Course092", <93> "Course093", <94> "Course094", <95> "Course095", <96> "Course096", <97> "Course097", <98> "Course098", <99> "Course099", <100> "Course100", <101> "Course101", <102> "Course102";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t33", <35> "t34", <36> "t35", <37> "t36", <38> "t37", <39> "t38", <40> "t39", <41> "t40", <42> "t41", <43> "t42", <44> "t43", <45> "t44", <46> "t45", <47> "t46", <48> "t47", <49> "t48", <50> "t49", <51> "t00", <52> "t00", <53> "t01", <54> "t01", <55> "t02", <56> "t02", <57> "t03", <58> "t03", <59> "t04", <60> "t04", <61> "t05", <62> "t05", <63> "t06", <64> "t06", <65> "t07", <66> "t07", <67> "t08", <68> "t08", <69> "t09", <70> "t09", <71> "t10", <72> "t10", <73> "t11", <74> "t11", <75> "t12", <76> "t12", <77> "t13", <78> "t13", <79> "t14", <80> "t14", <81> "t15", <82> "t15", <83> "t16", <84> "t16", <85> "t17", <86> "t17", <87> "t18", <88> "t18", <89> "t19", <90> "t19", <91> "t20", <92> "t20", <93> "t21", <94> "t21", <95> "t22", <96> "t22", <97> "t23", <98> "t23", <99> "t24", <100> "t24", <101> "t25", <102> "t25";

param CourseHasStudents[Courses] := <01> 237, <02> 49, <03> 281, <04> 337, <05> 234, <06> 205, <07> 104, <08> 149, <09> 172, <10> 194, <11> 25, <12> 25, <13> 127, <14> 125, <15> 55, <16> 263, <17> 147, <18> 311, <19> 179, <20> 138, <21> 329, <22> 315, <23> 166, <24> 32, <25> 111, <26> 204, <27> 80, <28> 144, <29> 161, <30> 52, <31> 241, <32> 218, <33> 82, <34> 215, <35> 59, <36> 144, <37> 155, <38> 114, <39> 96, <40> 128, <41> 120, <42> 157, <43> 20, <44> 232, <45> 202, <46> 181, <47> 157, <48> 177, <49> 68, <50> 212, <51> 347, <52> 154, <53> 158, <54> 280, <55> 342, <56> 304, <57> 160, <58> 44, <59> 107, <60> 36, <61> 263, <62> 178, <63> 147, <64> 331, <65> 93, <66> 197, <67> 98, <68> 170, <69> 187, <70> 102, <71> 172, <72> 262, <73> 196, <74> 172, <75> 270, <76> 71, <77> 248, <78> 323, <79> 259, <80> 211, <81> 263, <82> 268, <83> 139, <84> 41, <85> 215, <86> 139, <87> 152, <88> 330, <89> 58, <90> 349, <91> 236, <92> 170, <93> 76, <94> 257, <95> 234, <96> 123, <97> 77, <98> 121, <99> 81, <100> 130, <101> 84, <102> 118;

param CourseHasEvents[Courses] := <01> 3, <02> 4, <03> 2, <04> 2, <05> 4, <06> 4, <07> 3, <08> 3, <09> 2, <10> 4, <11> 2, <12> 3, <13> 2, <14> 4, <15> 2, <16> 2, <17> 2, <18> 2, <19> 4, <20> 3, <21> 4, <22> 2, <23> 3, <24> 2, <25> 4, <26> 4, <27> 2, <28> 4, <29> 3, <30> 2, <31> 3, <32> 2, <33> 4, <34> 2, <35> 3, <36> 2, <37> 3, <38> 2, <39> 4, <40> 3, <41> 3, <42> 3, <43> 2, <44> 3, <45> 4, <46> 2, <47> 3, <48> 2, <49> 3, <50> 4, <51> 3, <52> 3, <53> 3, <54> 4, <55> 3, <56> 3, <57> 4, <58> 4, <59> 2, <60> 4, <61> 4, <62> 4, <63> 4, <64> 3, <65> 2, <66> 3, <67> 3, <68> 2, <69> 2, <70> 3, <71> 4, <72> 2, <73> 2, <74> 2, <75> 2, <76> 2, <77> 3, <78> 4, <79> 3, <80> 3, <81> 3, <82> 4, <83> 3, <84> 4, <85> 4, <86> 3, <87> 2, <88> 4, <89> 3, <90> 2, <91> 2, <92> 3, <93> 2, <94> 4, <95> 2, <96> 3, <97> 3, <98> 4, <99> 4, <100> 3, <101> 3, <102> 1;

param CourseHasMindays[Courses] := <01> 2, <02> 3, <03> 1, <04> 1, <05> 3, <06> 3, <07> 2, <08> 2, <09> 1, <10> 3, <11> 1, <12> 2, <13> 1, <14> 3, <15> 1, <16> 1, <17> 1, <18> 1, <19> 3, <20> 2, <21> 3, <22> 1, <23> 2, <24> 1, <25> 3, <26> 3, <27> 1, <28> 3, <29> 2, <30> 1, <31> 2, <32> 1, <33> 3, <34> 1, <35> 2, <36> 1, <37> 2, <38> 1, <39> 3, <40> 2, <41> 2, <42> 2, <43> 1, <44> 2, <45> 3, <46> 1, <47> 2, <48> 1, <49> 2, <50> 3, <51> 2, <52> 2, <53> 2, <54> 3, <55> 2, <56> 2, <57> 3, <58> 3, <59> 1, <60> 3, <61> 3, <62> 3, <63> 3, <64> 2, <65> 1, <66> 2, <67> 2, <68> 1, <69> 1, <70> 2, <71> 3, <72> 1, <73> 1, <74> 1, <75> 1, <76> 1, <77> 2, <78> 3, <79> 2, <80> 2, <81> 2, <82> 3, <83> 2, <84> 3, <85> 3, <86> 2, <87> 1, <88> 3, <89> 2, <90> 1, <91> 1, <92> 2, <93> 1, <94> 3, <95> 1, <96> 2, <97> 2, <98> 3, <99> 3, <100> 2, <101> 2, <102> 0;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 8, <03> 0, <04> 5, <05> 0, <06> 0, <07> 6, <08> 4, <09> 3, <10> 0, <11> 3, <12> 0, <13> 2, <14> 0, <15> 0, <16> 7, <17> 0, <18> 0, <19> 4, <20> 7, <21> 6, <22> 10, <23> 6, <24> 0, <25> 0, <26> 1, <27> 10, <28> 8, <29> 0, <30> 0, <31> 5, <32> 8, <33> 8, <34> 1, <35> 0, <36> 7, <37> 7, <38> 3, <39> 0, <40> 10, <41> 2, <42> 8, <43> 0, <44> 6, <45> 0, <46> 0, <47> 4, <48> 0, <49> 12, <50> 8, <51> 2, <52> 5, <53> 0, <54> 0, <55> 0, <56> 0, <57> 3, <58> 6, <59> 3, <60> 0, <61> 5, <62> 3, <63> 0, <64> 4, <65> 4, <66> 5, <67> 1, <68> 7, <69> 0, <70> 4, <71> 0, <72> 0, <73> 0, <74> 7, <75> 5, <76> 0, <77> 0, <78> 0, <79> 3, <80> 8, <81> 2, <82> 0, <83> 8, <84> 6, <85> 5, <86> 5, <87> 10, <88> 5, <89> 0, <90> 0, <91> 5, <92> 0, <93> 5, <94> 5, <95> 2, <96> 0, <97> 5, <98> 10, <99> 0, <100> 9, <101> 4, <102> 8;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <02,1> 13, <02,2> 14, <02,3> 15, <02,4> 21, <02,5> 22, <02,6> 23, <02,7> 24, <02,8> 25, <04,1> 4, <04,2> 5, <04,3> 6, <04,4> 7, <04,5> 8, <07,1> 11, <07,2> 16, <07,3> 17, <07,4> 18, <07,5> 19, <07,6> 20, <08,1> 6, <08,2> 7, <08,3> 8, <08,4> 9, <09,1> 1, <09,2> 2, <09,3> 3, <11,1> 21, <11,2> 22, <11,3> 23, <13,1> 1, <13,2> 2, <16,1> 4, <16,2> 5, <16,3> 21, <16,4> 22, <16,5> 23, <16,6> 24, <16,7> 25, <19,1> 6, <19,2> 7, <19,3> 8, <19,4> 9, <20,1> 4, <20,2> 5, <20,3> 6, <20,4> 7, <20,5> 8, <20,6> 9, <20,7> 10, <21,1> 2, <21,2> 3, <21,3> 4, <21,4> 5, <21,5> 6, <21,6> 7, <22,1> 16, <22,2> 17, <22,3> 18, <22,4> 19, <22,5> 20, <22,6> 21, <22,7> 22, <22,8> 23, <22,9> 24, <22,10> 25, <23,1> 2, <23,2> 3, <23,3> 4, <23,4> 5, <23,5> 11, <23,6> 12, <26,1> 20, <27,1> 6, <27,2> 7, <27,3> 8, <27,4> 9, <27,5> 16, <27,6> 17, <27,7> 18, <27,8> 19, <27,9> 20, <27,10> 25, <28,1> 1, <28,2> 2, <28,3> 3, <28,4> 4, <28,5> 5, <28,6> 16, <28,7> 17, <28,8> 18, <31,1> 21, <31,2> 22, <31,3> 23, <31,4> 24, <31,5> 25, <32,1> 3, <32,2> 4, <32,3> 5, <32,4> 16, <32,5> 17, <32,6> 18, <32,7> 19, <32,8> 20, <33,1> 1, <33,2> 2, <33,3> 3, <33,4> 4, <33,5> 5, <33,6> 11, <33,7> 12, <33,8> 13, <34,1> 25, <36,1> 9, <36,2> 10, <36,3> 11, <36,4> 16, <36,5> 17, <36,6> 18, <36,7> 19, <37,1> 9, <37,2> 10, <37,3> 11, <37,4> 12, <37,5> 13, <37,6> 14, <37,7> 15, <38,1> 6, <38,2> 7, <38,3> 10, <40,1> 2, <40,2> 3, <40,3> 4, <40,4> 5, <40,5> 10, <40,6> 11, <40,7> 12, <40,8> 13, <40,9> 14, <40,10> 15, <41,1> 4, <41,2> 5, <42,1> 6, <42,2> 7, <42,3> 15, <42,4> 16, <42,5> 17, <42,6> 18, <42,7> 19, <42,8> 20, <44,1> 19, <44,2> 20, <44,3> 22, <44,4> 23, <44,5> 24, <44,6> 25, <47,1> 16, <47,2> 17, <47,3> 18, <47,4> 19, <49,1> 1, <49,2> 2, <49,3> 3, <49,4> 4, <49,5> 5, <49,6> 7, <49,7> 8, <49,8> 9, <49,9> 10, <49,10> 16, <49,11> 17, <49,12> 18, <50,1> 1, <50,2> 2, <50,3> 3, <50,4> 16, <50,5> 17, <50,6> 18, <50,7> 19, <50,8> 20, <51,1> 11, <51,2> 12, <52,1> 6, <52,2> 7, <52,3> 8, <52,4> 9, <52,5> 10, <57,1> 23, <57,2> 24, <57,3> 25, <58,1> 17, <58,2> 18, <58,3> 19, <58,4> 20, <58,5> 24, <58,6> 25, <59,1> 23, <59,2> 24, <59,3> 25, <61,1> 1, <61,2> 2, <61,3> 3, <61,4> 4, <61,5> 5, <62,1> 8, <62,2> 9, <62,3> 10, <64,1> 16, <64,2> 17, <64,3> 18, <64,4> 19, <65,1> 1, <65,2> 2, <65,3> 3, <65,4> 4, <66,1> 11, <66,2> 12, <66,3> 13, <66,4> 14, <66,5> 15, <67,1> 15, <68,1> 11, <68,2> 12, <68,3> 13, <68,4> 14, <68,5> 15, <68,6> 16, <68,7> 17, <70,1> 2, <70,2> 3, <70,3> 4, <70,4> 5, <74,1> 6, <74,2> 7, <74,3> 8, <74,4> 16, <74,5> 17, <74,6> 18, <74,7> 19, <75,1> 16, <75,2> 17, <75,3> 18, <75,4> 19, <75,5> 20, <79,1> 5, <79,2> 24, <79,3> 25, <80,1> 2, <80,2> 3, <80,3> 4, <80,4> 5, <80,5> 6, <80,6> 7, <80,7> 8, <80,8> 9, <81,1> 24, <81,2> 25, <83,1> 11, <83,2> 12, <83,3> 13, <83,4> 16, <83,5> 17, <83,6> 18, <83,7> 19, <83,8> 20, <84,1> 6, <84,2> 7, <84,3> 8, <84,4> 9, <84,5> 10, <84,6> 25, <85,1> 11, <85,2> 12, <85,3> 13, <85,4> 14, <85,5> 15, <86,1> 16, <86,2> 17, <86,3> 18, <86,4> 19, <86,5> 20, <87,1> 1, <87,2> 6, <87,3> 7, <87,4> 11, <87,5> 12, <87,6> 13, <87,7> 14, <87,8> 15, <87,9> 19, <87,10> 20, <88,1> 16, <88,2> 17, <88,3> 18, <88,4> 19, <88,5> 20, <91,1> 6, <91,2> 9, <91,3> 10, <91,4> 24, <91,5> 25, <93,1> 11, <93,2> 12, <93,3> 13, <93,4> 14, <93,5> 15, <94,1> 6, <94,2> 7, <94,3> 8, <94,4> 9, <94,5> 10, <95,1> 16, <95,2> 17, <97,1> 1, <97,2> 2, <97,3> 3, <97,4> 4, <97,5> 5, <98,1> 1, <98,2> 2, <98,3> 3, <98,4> 4, <98,5> 5, <98,6> 11, <98,7> 12, <98,8> 13, <98,9> 14, <98,10> 15, <100,1> 1, <100,2> 2, <100,3> 3, <100,4> 4, <100,5> 16, <100,6> 17, <100,7> 18, <100,8> 19, <100,9> 20, <101,1> 6, <101,2> 7, <101,3> 8, <101,4> 9, <102,1> 2, <102,2> 3, <102,3> 4, <102,4> 5, <102,5> 21, <102,6> 22, <102,7> 23, <102,8> 24;

param CurriculumHasCoursesCount[Curricula] := <01> 4, <02> 3, <03> 3, <04> 3, <05> 5, <06> 5, <07> 5, <08> 3, <09> 4, <10> 3, <11> 4, <12> 3, <13> 3, <14> 4, <15> 4, <16> 5, <17> 4, <18> 5, <19> 3, <20> 5, <21> 3, <22> 4, <23> 3, <24> 5, <25> 5, <26> 3, <27> 4, <28> 3, <29> 5, <30> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 7, <01,2> 55, <01,3> 60, <01,4> 87, <02,1> 13, <02,2> 37, <02,3> 40, <03,1> 21, <03,2> 48, <03,3> 49, <04,1> 18, <04,2> 50, <04,3> 97, <05,1> 42, <05,2> 47, <05,3> 56, <05,4> 66, <05,5> 77, <06,1> 25, <06,2> 33, <06,3> 34, <06,4> 57, <06,5> 86, <07,1> 12, <07,2> 69, <07,3> 75, <07,4> 86, <07,5> 87, <08,1> 2, <08,2> 4, <08,3> 70, <09,1> 2, <09,2> 41, <09,3> 83, <09,4> 84, <10,1> 30, <10,2> 67, <10,3> 99, <11,1> 55, <11,2> 56, <11,3> 69, <11,4> 70, <12,1> 2, <12,2> 27, <12,3> 95, <13,1> 74, <13,2> 91, <13,3> 100, <14,1> 19, <14,2> 33, <14,3> 68, <14,4> 85, <15,1> 15, <15,2> 35, <15,3> 53, <15,4> 81, <16,1> 19, <16,2> 20, <16,3> 28, <16,4> 38, <16,5> 47, <17,1> 23, <17,2> 32, <17,3> 33, <17,4> 69, <18,1> 11, <18,2> 21, <18,3> 59, <18,4> 82, <18,5> 93, <19,1> 4, <19,2> 43, <19,3> 74, <20,1> 19, <20,2> 27, <20,3> 45, <20,4> 64, <20,5> 65, <21,1> 7, <21,2> 49, <21,3> 86, <22,1> 54, <22,2> 64, <22,3> 71, <22,4> 79, <23,1> 56, <23,2> 59, <23,3> 102, <24,1> 14, <24,2> 28, <24,3> 49, <24,4> 83, <24,5> 91, <25,1> 16, <25,2> 30, <25,3> 45, <25,4> 86, <25,5> 99, <26,1> 28, <26,2> 67, <26,3> 81, <27,1> 32, <27,2> 70, <27,3> 73, <27,4> 84, <28,1> 30, <28,2> 73, <28,3> 94, <29,1> 6, <29,2> 8, <29,3> 13, <29,4> 38, <29,5> 96, <30,1> 10, <30,2> 30, <30,3> 43, <30,4> 57, <30,5> 98;

param CurriculumHasEventsCount[Curricula] := <01> 12, <02> 8, <03> 9, <04> 9, <05> 15, <06> 17, <07> 12, <08> 9, <09> 14, <10> 9, <11> 11, <12> 8, <13> 7, <14> 14, <15> 11, <16> 16, <17> 11, <18> 14, <19> 6, <20> 15, <21> 9, <22> 14, <23> 6, <24> 16, <25> 15, <26> 10, <27> 11, <28> 8, <29> 14, <30> 16;

param nbTeachers := 50;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 1, <24> 1, <25> 1, <26> 1, <27> 3, <28> 3, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 3, <36> 3, <37> 3, <38> 3, <39> 3, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 3, <48> 3, <49> 3, <50> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 50, <02,1> 49, <03,1> 44, <04,1> 43, <05,1> 42, <06,1> 41, <07,1> 48, <08,1> 47, <09,1> 46, <10,1> 45, <11,1> 28, <12,1> 30, <13,1> 29, <14,1> 27, <15,1> 15, <15,2> 79, <15,3> 80, <16,1> 16, <16,2> 81, <16,3> 82, <17,1> 17, <17,2> 83, <17,3> 84, <18,1> 18, <18,2> 85, <18,3> 86, <19,1> 11, <19,2> 71, <19,3> 72, <20,1> 12, <20,2> 73, <20,3> 74, <21,1> 13, <21,2> 75, <21,3> 76, <22,1> 14, <22,2> 77, <22,3> 78, <23,1> 37, <24,1> 38, <25,1> 35, <26,1> 36, <27,1> 19, <27,2> 87, <27,3> 88, <28,1> 20, <28,2> 89, <28,3> 90, <29,1> 31, <30,1> 32, <31,1> 39, <32,1> 40, <33,1> 33, <34,1> 34, <35,1> 8, <35,2> 65, <35,3> 66, <36,1> 7, <36,2> 63, <36,3> 64, <37,1> 6, <37,2> 61, <37,3> 62, <38,1> 5, <38,2> 59, <38,3> 60, <39,1> 4, <39,2> 57, <39,3> 58, <40,1> 3, <40,2> 55, <40,3> 56, <41,1> 2, <41,2> 53, <41,3> 54, <42,1> 1, <42,2> 51, <42,3> 52, <43,1> 22, <43,2> 93, <43,3> 94, <44,1> 21, <44,2> 91, <44,3> 92, <45,1> 24, <45,2> 97, <45,3> 98, <46,1> 23, <46,2> 95, <46,3> 96, <47,1> 26, <47,2> 101, <47,3> 102, <48,1> 25, <48,2> 99, <48,3> 100, <49,1> 10, <49,2> 69, <49,3> 70, <50,1> 9, <50,2> 67, <50,3> 68;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 3, <03> 3, <04> 2, <05> 3, <06> 3, <07> 2, <08> 3, <09> 2, <10> 4, <11> 4, <12> 2, <13> 3, <14> 2, <15> 8, <16> 9, <17> 9, <18> 9, <19> 8, <20> 7, <21> 6, <22> 11, <23> 3, <24> 2, <25> 3, <26> 2, <27> 10, <28> 8, <29> 3, <30> 2, <31> 4, <32> 3, <33> 4, <34> 2, <35> 8, <36> 10, <37> 12, <38> 10, <39> 10, <40> 8, <41> 11, <42> 9, <43> 8, <44> 9, <45> 9, <46> 8, <47> 8, <48> 11, <49> 9, <50> 7;

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
