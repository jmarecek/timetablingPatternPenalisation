param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 15;
param nbDays := 5;
param nbCurricula := 30;
param nbCourses := 104;
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

param RoomHasCapacity[Rooms] := <01> 75, <02> 75, <03> 85, <04> 85, <05> 155, <06> 155, <07> 235, <08> 235, <09> 265, <10> 295, <11> 315, <12> 315, <13> 315, <14> 320, <15> 320;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068", <69> "Course069", <70> "Course070", <71> "Course071", <72> "Course072", <73> "Course073", <74> "Course074", <75> "Course075", <76> "Course076", <77> "Course077", <78> "Course078", <79> "Course079", <80> "Course080", <81> "Course081", <82> "Course082", <83> "Course083", <84> "Course084", <85> "Course085", <86> "Course086", <87> "Course087", <88> "Course088", <89> "Course089", <90> "Course090", <91> "Course091", <92> "Course092", <93> "Course093", <94> "Course094", <95> "Course095", <96> "Course096", <97> "Course097", <98> "Course098", <99> "Course099", <100> "Course100", <101> "Course101", <102> "Course102", <103> "Course103", <104> "Course104";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t33", <35> "t34", <36> "t35", <37> "t36", <38> "t37", <39> "t38", <40> "t39", <41> "t40", <42> "t41", <43> "t42", <44> "t43", <45> "t44", <46> "t45", <47> "t46", <48> "t47", <49> "t48", <50> "t49", <51> "t00", <52> "t00", <53> "t01", <54> "t01", <55> "t02", <56> "t02", <57> "t03", <58> "t03", <59> "t04", <60> "t04", <61> "t05", <62> "t05", <63> "t06", <64> "t06", <65> "t07", <66> "t07", <67> "t08", <68> "t08", <69> "t09", <70> "t09", <71> "t10", <72> "t10", <73> "t11", <74> "t11", <75> "t12", <76> "t12", <77> "t13", <78> "t13", <79> "t14", <80> "t14", <81> "t15", <82> "t15", <83> "t16", <84> "t16", <85> "t17", <86> "t17", <87> "t18", <88> "t18", <89> "t19", <90> "t19", <91> "t20", <92> "t20", <93> "t21", <94> "t21", <95> "t22", <96> "t22", <97> "t23", <98> "t23", <99> "t24", <100> "t24", <101> "t25", <102> "t25", <103> "t26", <104> "t26";

param CourseHasStudents[Courses] := <01> 191, <02> 73, <03> 231, <04> 136, <05> 302, <06> 326, <07> 184, <08> 202, <09> 245, <10> 61, <11> 75, <12> 308, <13> 323, <14> 125, <15> 326, <16> 144, <17> 184, <18> 222, <19> 67, <20> 36, <21> 307, <22> 195, <23> 300, <24> 331, <25> 346, <26> 117, <27> 321, <28> 247, <29> 215, <30> 332, <31> 227, <32> 213, <33> 327, <34> 312, <35> 147, <36> 264, <37> 209, <38> 191, <39> 329, <40> 31, <41> 246, <42> 216, <43> 39, <44> 140, <45> 113, <46> 300, <47> 197, <48> 108, <49> 295, <50> 59, <51> 202, <52> 65, <53> 322, <54> 125, <55> 312, <56> 27, <57> 322, <58> 127, <59> 324, <60> 323, <61> 202, <62> 61, <63> 232, <64> 43, <65> 79, <66> 249, <67> 286, <68> 331, <69> 185, <70> 48, <71> 168, <72> 328, <73> 88, <74> 175, <75> 40, <76> 27, <77> 77, <78> 192, <79> 300, <80> 25, <81> 218, <82> 89, <83> 302, <84> 161, <85> 155, <86> 286, <87> 236, <88> 178, <89> 51, <90> 136, <91> 110, <92> 187, <93> 103, <94> 331, <95> 215, <96> 62, <97> 234, <98> 51, <99> 88, <100> 182, <101> 53, <102> 306, <103> 304, <104> 306;

param CourseHasEvents[Courses] := <01> 2, <02> 2, <03> 3, <04> 2, <05> 2, <06> 2, <07> 2, <08> 2, <09> 2, <10> 4, <11> 2, <12> 3, <13> 2, <14> 4, <15> 2, <16> 2, <17> 4, <18> 4, <19> 2, <20> 4, <21> 4, <22> 2, <23> 2, <24> 3, <25> 2, <26> 2, <27> 3, <28> 4, <29> 2, <30> 4, <31> 2, <32> 4, <33> 4, <34> 3, <35> 2, <36> 3, <37> 3, <38> 4, <39> 3, <40> 3, <41> 3, <42> 4, <43> 2, <44> 2, <45> 2, <46> 3, <47> 4, <48> 4, <49> 2, <50> 4, <51> 2, <52> 2, <53> 4, <54> 2, <55> 3, <56> 3, <57> 2, <58> 4, <59> 3, <60> 2, <61> 4, <62> 2, <63> 4, <64> 3, <65> 3, <66> 2, <67> 3, <68> 4, <69> 2, <70> 3, <71> 4, <72> 3, <73> 3, <74> 3, <75> 3, <76> 4, <77> 4, <78> 2, <79> 2, <80> 2, <81> 2, <82> 3, <83> 4, <84> 3, <85> 4, <86> 4, <87> 3, <88> 4, <89> 4, <90> 3, <91> 3, <92> 2, <93> 4, <94> 3, <95> 3, <96> 3, <97> 3, <98> 2, <99> 3, <100> 2, <101> 2, <102> 3, <103> 3, <104> 2;

param CourseHasMindays[Courses] := <01> 1, <02> 1, <03> 2, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 3, <11> 1, <12> 2, <13> 1, <14> 3, <15> 1, <16> 1, <17> 3, <18> 3, <19> 1, <20> 3, <21> 3, <22> 1, <23> 1, <24> 2, <25> 1, <26> 1, <27> 2, <28> 3, <29> 1, <30> 3, <31> 1, <32> 3, <33> 3, <34> 2, <35> 1, <36> 2, <37> 2, <38> 3, <39> 2, <40> 2, <41> 2, <42> 3, <43> 1, <44> 1, <45> 1, <46> 2, <47> 3, <48> 3, <49> 1, <50> 3, <51> 1, <52> 1, <53> 3, <54> 1, <55> 2, <56> 2, <57> 1, <58> 3, <59> 2, <60> 1, <61> 3, <62> 1, <63> 3, <64> 2, <65> 2, <66> 1, <67> 2, <68> 3, <69> 1, <70> 2, <71> 3, <72> 2, <73> 2, <74> 2, <75> 2, <76> 3, <77> 3, <78> 1, <79> 1, <80> 1, <81> 1, <82> 2, <83> 3, <84> 2, <85> 3, <86> 3, <87> 2, <88> 3, <89> 3, <90> 2, <91> 2, <92> 1, <93> 3, <94> 2, <95> 2, <96> 2, <97> 2, <98> 1, <99> 2, <100> 1, <101> 1, <102> 2, <103> 2, <104> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 12, <02> 7, <03> 1, <04> 2, <05> 4, <06> 0, <07> 3, <08> 3, <09> 5, <10> 5, <11> 5, <12> 6, <13> 3, <14> 3, <15> 0, <16> 0, <17> 3, <18> 4, <19> 0, <20> 2, <21> 10, <22> 7, <23> 0, <24> 3, <25> 6, <26> 4, <27> 0, <28> 5, <29> 1, <30> 5, <31> 5, <32> 3, <33> 4, <34> 1, <35> 3, <36> 4, <37> 2, <38> 10, <39> 0, <40> 3, <41> 8, <42> 5, <43> 4, <44> 4, <45> 1, <46> 2, <47> 0, <48> 2, <49> 0, <50> 4, <51> 5, <52> 5, <53> 0, <54> 4, <55> 3, <56> 8, <57> 2, <58> 2, <59> 3, <60> 1, <61> 0, <62> 5, <63> 5, <64> 0, <65> 0, <66> 0, <67> 3, <68> 8, <69> 5, <70> 3, <71> 3, <72> 7, <73> 0, <74> 0, <75> 5, <76> 7, <77> 7, <78> 4, <79> 2, <80> 4, <81> 10, <82> 5, <83> 3, <84> 6, <85> 5, <86> 3, <87> 4, <88> 0, <89> 3, <90> 5, <91> 0, <92> 2, <93> 0, <94> 0, <95> 0, <96> 0, <97> 0, <98> 0, <99> 9, <100> 10, <101> 1, <102> 0, <103> 0, <104> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 1, <01,2> 2, <01,3> 3, <01,4> 4, <01,5> 5, <01,6> 8, <01,7> 9, <01,8> 10, <01,9> 21, <01,10> 22, <01,11> 23, <01,12> 24, <02,1> 11, <02,2> 12, <02,3> 13, <02,4> 14, <02,5> 16, <02,6> 17, <02,7> 18, <03,1> 16, <04,1> 6, <04,2> 7, <05,1> 6, <05,2> 11, <05,3> 12, <05,4> 13, <07,1> 8, <07,2> 9, <07,3> 10, <08,1> 1, <08,2> 2, <08,3> 16, <09,1> 11, <09,2> 12, <09,3> 15, <09,4> 24, <09,5> 25, <10,1> 16, <10,2> 17, <10,3> 18, <10,4> 19, <10,5> 20, <11,1> 5, <11,2> 21, <11,3> 22, <11,4> 23, <11,5> 24, <12,1> 2, <12,2> 3, <12,3> 4, <12,4> 5, <12,5> 24, <12,6> 25, <13,1> 6, <13,2> 7, <13,3> 8, <14,1> 13, <14,2> 14, <14,3> 15, <17,1> 16, <17,2> 17, <17,3> 18, <18,1> 1, <18,2> 3, <18,3> 4, <18,4> 5, <20,1> 1, <20,2> 2, <21,1> 1, <21,2> 2, <21,3> 3, <21,4> 4, <21,5> 5, <21,6> 16, <21,7> 17, <21,8> 18, <21,9> 19, <21,10> 20, <22,1> 19, <22,2> 20, <22,3> 21, <22,4> 22, <22,5> 23, <22,6> 24, <22,7> 25, <24,1> 21, <24,2> 22, <24,3> 23, <25,1> 11, <25,2> 12, <25,3> 13, <25,4> 14, <25,5> 15, <25,6> 16, <26,1> 1, <26,2> 2, <26,3> 3, <26,4> 10, <28,1> 11, <28,2> 12, <28,3> 13, <28,4> 14, <28,5> 15, <29,1> 20, <30,1> 1, <30,2> 2, <30,3> 3, <30,4> 6, <30,5> 7, <31,1> 6, <31,2> 7, <31,3> 8, <31,4> 9, <31,5> 10, <32,1> 6, <32,2> 7, <32,3> 8, <33,1> 11, <33,2> 12, <33,3> 13, <33,4> 14, <34,1> 15, <35,1> 3, <35,2> 4, <35,3> 5, <36,1> 7, <36,2> 8, <36,3> 9, <36,4> 10, <37,1> 16, <37,2> 17, <38,1> 6, <38,2> 7, <38,3> 11, <38,4> 12, <38,5> 13, <38,6> 14, <38,7> 17, <38,8> 18, <38,9> 19, <38,10> 20, <40,1> 1, <40,2> 2, <40,3> 3, <41,1> 3, <41,2> 4, <41,3> 5, <41,4> 9, <41,5> 10, <41,6> 11, <41,7> 12, <41,8> 13, <42,1> 21, <42,2> 22, <42,3> 23, <42,4> 24, <42,5> 25, <43,1> 16, <43,2> 17, <43,3> 18, <43,4> 19, <44,1> 6, <44,2> 7, <44,3> 8, <44,4> 9, <45,1> 10, <46,1> 6, <46,2> 7, <48,1> 11, <48,2> 12, <50,1> 9, <50,2> 10, <50,3> 16, <50,4> 17, <51,1> 6, <51,2> 7, <51,3> 8, <51,4> 9, <51,5> 10, <52,1> 6, <52,2> 7, <52,3> 8, <52,4> 9, <52,5> 10, <54,1> 9, <54,2> 10, <54,3> 14, <54,4> 15, <55,1> 13, <55,2> 14, <55,3> 15, <56,1> 8, <56,2> 9, <56,3> 10, <56,4> 11, <56,5> 18, <56,6> 19, <56,7> 20, <56,8> 21, <57,1> 16, <57,2> 17, <58,1> 21, <58,2> 22, <59,1> 16, <59,2> 17, <59,3> 18, <60,1> 6, <62,1> 6, <62,2> 7, <62,3> 8, <62,4> 9, <62,5> 10, <63,1> 4, <63,2> 5, <63,3> 18, <63,4> 19, <63,5> 20, <67,1> 18, <67,2> 19, <67,3> 20, <68,1> 18, <68,2> 19, <68,3> 20, <68,4> 21, <68,5> 22, <68,6> 23, <68,7> 24, <68,8> 25, <69,1> 11, <69,2> 12, <69,3> 13, <69,4> 14, <69,5> 15, <70,1> 14, <70,2> 15, <70,3> 16, <71,1> 6, <71,2> 7, <71,3> 8, <72,1> 6, <72,2> 7, <72,3> 8, <72,4> 9, <72,5> 10, <72,6> 14, <72,7> 15, <75,1> 6, <75,2> 7, <75,3> 8, <75,4> 9, <75,5> 10, <76,1> 1, <76,2> 2, <76,3> 3, <76,4> 4, <76,5> 5, <76,6> 6, <76,7> 7, <77,1> 9, <77,2> 10, <77,3> 21, <77,4> 22, <77,5> 23, <77,6> 24, <77,7> 25, <78,1> 8, <78,2> 9, <78,3> 10, <78,4> 25, <79,1> 6, <79,2> 7, <80,1> 9, <80,2> 10, <80,3> 24, <80,4> 25, <81,1> 5, <81,2> 11, <81,3> 12, <81,4> 13, <81,5> 14, <81,6> 16, <81,7> 17, <81,8> 18, <81,9> 19, <81,10> 20, <82,1> 16, <82,2> 17, <82,3> 18, <82,4> 19, <82,5> 20, <83,1> 10, <83,2> 24, <83,3> 25, <84,1> 3, <84,2> 4, <84,3> 5, <84,4> 23, <84,5> 24, <84,6> 25, <85,1> 16, <85,2> 17, <85,3> 18, <85,4> 19, <85,5> 20, <86,1> 8, <86,2> 9, <86,3> 10, <87,1> 7, <87,2> 8, <87,3> 9, <87,4> 10, <89,1> 3, <89,2> 4, <89,3> 5, <90,1> 6, <90,2> 7, <90,3> 8, <90,4> 21, <90,5> 22, <92,1> 9, <92,2> 10, <99,1> 1, <99,2> 6, <99,3> 7, <99,4> 8, <99,5> 15, <99,6> 21, <99,7> 22, <99,8> 23, <99,9> 24, <100,1> 6, <100,2> 7, <100,3> 8, <100,4> 9, <100,5> 10, <100,6> 11, <100,7> 12, <100,8> 13, <100,9> 14, <100,10> 15, <101,1> 10;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 5, <03> 5, <04> 5, <05> 3, <06> 4, <07> 4, <08> 5, <09> 5, <10> 4, <11> 3, <12> 5, <13> 3, <14> 3, <15> 3, <16> 3, <17> 3, <18> 5, <19> 3, <20> 3, <21> 5, <22> 4, <23> 5, <24> 3, <25> 4, <26> 4, <27> 4, <28> 5, <29> 4, <30> 5;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 38, <01,2> 65, <01,3> 90, <02,1> 24, <02,2> 25, <02,3> 49, <02,4> 87, <02,5> 99, <03,1> 20, <03,2> 43, <03,3> 51, <03,4> 59, <03,5> 71, <04,1> 37, <04,2> 66, <04,3> 77, <04,4> 79, <04,5> 92, <05,1> 32, <05,2> 55, <05,3> 87, <06,1> 48, <06,2> 74, <06,3> 89, <06,4> 95, <07,1> 1, <07,2> 2, <07,3> 19, <07,4> 81, <08,1> 22, <08,2> 28, <08,3> 31, <08,4> 71, <08,5> 100, <09,1> 19, <09,2> 38, <09,3> 59, <09,4> 93, <09,5> 98, <10,1> 20, <10,2> 35, <10,3> 45, <10,4> 65, <11,1> 64, <11,2> 71, <11,3> 92, <12,1> 3, <12,2> 9, <12,3> 57, <12,4> 79, <12,5> 84, <13,1> 7, <13,2> 56, <13,3> 59, <14,1> 12, <14,2> 23, <14,3> 75, <15,1> 55, <15,2> 59, <15,3> 74, <16,1> 6, <16,2> 27, <16,3> 86, <17,1> 38, <17,2> 68, <17,3> 98, <18,1> 60, <18,2> 71, <18,3> 79, <18,4> 83, <18,5> 102, <19,1> 2, <19,2> 37, <19,3> 97, <20,1> 52, <20,2> 90, <20,3> 99, <21,1> 24, <21,2> 62, <21,3> 68, <21,4> 78, <21,5> 83, <22,1> 43, <22,2> 48, <22,3> 70, <22,4> 78, <23,1> 8, <23,2> 15, <23,3> 36, <23,4> 61, <23,5> 88, <24,1> 34, <24,2> 42, <24,3> 80, <25,1> 10, <25,2> 34, <25,3> 74, <25,4> 98, <26,1> 10, <26,2> 16, <26,3> 68, <26,4> 97, <27,1> 26, <27,2> 59, <27,3> 87, <27,4> 91, <28,1> 7, <28,2> 27, <28,3> 29, <28,4> 31, <28,5> 85, <29,1> 46, <29,2> 48, <29,3> 54, <29,4> 85, <30,1> 34, <30,2> 44, <30,3> 49, <30,4> 63, <30,5> 78;

param CurriculumHasEventsCount[Curricula] := <01> 10, <02> 13, <03> 15, <04> 13, <05> 10, <06> 14, <07> 8, <08> 14, <09> 15, <10> 11, <11> 9, <12> 12, <13> 8, <14> 8, <15> 9, <16> 9, <17> 10, <18> 15, <19> 8, <20> 8, <21> 15, <22> 11, <23> 15, <24> 9, <25> 12, <26> 13, <27> 11, <28> 13, <29> 13, <30> 13;

param nbTeachers := 50;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 3, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 1, <24> 1, <25> 1, <26> 1, <27> 3, <28> 3, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 3, <36> 3, <37> 3, <38> 3, <39> 3, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 3, <48> 3, <49> 3, <50> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 50, <02,1> 49, <03,1> 44, <04,1> 43, <05,1> 42, <06,1> 41, <07,1> 48, <08,1> 47, <09,1> 46, <10,1> 45, <11,1> 28, <12,1> 30, <13,1> 29, <14,1> 27, <14,2> 103, <14,3> 104, <15,1> 15, <15,2> 79, <15,3> 80, <16,1> 16, <16,2> 81, <16,3> 82, <17,1> 17, <17,2> 83, <17,3> 84, <18,1> 18, <18,2> 85, <18,3> 86, <19,1> 11, <19,2> 71, <19,3> 72, <20,1> 12, <20,2> 73, <20,3> 74, <21,1> 13, <21,2> 75, <21,3> 76, <22,1> 14, <22,2> 77, <22,3> 78, <23,1> 37, <24,1> 38, <25,1> 35, <26,1> 36, <27,1> 19, <27,2> 87, <27,3> 88, <28,1> 20, <28,2> 89, <28,3> 90, <29,1> 31, <30,1> 32, <31,1> 39, <32,1> 40, <33,1> 33, <34,1> 34, <35,1> 8, <35,2> 65, <35,3> 66, <36,1> 7, <36,2> 63, <36,3> 64, <37,1> 6, <37,2> 61, <37,3> 62, <38,1> 5, <38,2> 59, <38,3> 60, <39,1> 4, <39,2> 57, <39,3> 58, <40,1> 3, <40,2> 55, <40,3> 56, <41,1> 2, <41,2> 53, <41,3> 54, <42,1> 1, <42,2> 51, <42,3> 52, <43,1> 22, <43,2> 93, <43,3> 94, <44,1> 21, <44,2> 91, <44,3> 92, <45,1> 24, <45,2> 97, <45,3> 98, <46,1> 23, <46,2> 95, <46,3> 96, <47,1> 26, <47,2> 101, <47,3> 102, <48,1> 25, <48,2> 99, <48,3> 100, <49,1> 10, <49,2> 69, <49,3> 70, <50,1> 9, <50,2> 67, <50,3> 68;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 2, <03> 2, <04> 2, <05> 4, <06> 3, <07> 4, <08> 4, <09> 3, <10> 2, <11> 4, <12> 4, <13> 2, <14> 8, <15> 6, <16> 7, <17> 11, <18> 12, <19> 9, <20> 9, <21> 9, <22> 10, <23> 3, <24> 4, <25> 2, <26> 3, <27> 9, <28> 11, <29> 2, <30> 4, <31> 3, <32> 3, <33> 4, <34> 3, <35> 7, <36> 9, <37> 8, <38> 7, <39> 8, <40> 9, <41> 8, <42> 6, <43> 9, <44> 9, <45> 8, <46> 8, <47> 7, <48> 7, <49> 9, <50> 9;

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
