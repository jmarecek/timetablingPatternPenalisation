param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 18;
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

param RoomHasCapacity[Rooms] := <01> 100, <02> 100, <03> 100, <04> 110, <05> 110, <06> 110, <07> 135, <08> 135, <09> 140, <10> 150, <11> 170, <12> 210, <13> 210, <14> 230, <15> 245, <16> 285, <17> 285, <18> 345;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068", <69> "Course069", <70> "Course070", <71> "Course071", <72> "Course072", <73> "Course073", <74> "Course074", <75> "Course075", <76> "Course076", <77> "Course077", <78> "Course078", <79> "Course079", <80> "Course080", <81> "Course081", <82> "Course082", <83> "Course083", <84> "Course084", <85> "Course085", <86> "Course086", <87> "Course087", <88> "Course088", <89> "Course089", <90> "Course090", <91> "Course091", <92> "Course092", <93> "Course093", <94> "Course094", <95> "Course095", <96> "Course096", <97> "Course097", <98> "Course098", <99> "Course099", <100> "Course100", <101> "Course101", <102> "Course102", <103> "Course103", <104> "Course104";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t33", <35> "t34", <36> "t35", <37> "t36", <38> "t37", <39> "t38", <40> "t39", <41> "t40", <42> "t41", <43> "t42", <44> "t43", <45> "t44", <46> "t45", <47> "t46", <48> "t47", <49> "t48", <50> "t49", <51> "t00", <52> "t00", <53> "t01", <54> "t01", <55> "t02", <56> "t02", <57> "t03", <58> "t03", <59> "t04", <60> "t04", <61> "t05", <62> "t05", <63> "t06", <64> "t06", <65> "t07", <66> "t07", <67> "t08", <68> "t08", <69> "t09", <70> "t09", <71> "t10", <72> "t10", <73> "t11", <74> "t11", <75> "t12", <76> "t12", <77> "t13", <78> "t13", <79> "t14", <80> "t14", <81> "t15", <82> "t15", <83> "t16", <84> "t16", <85> "t17", <86> "t17", <87> "t18", <88> "t18", <89> "t19", <90> "t19", <91> "t20", <92> "t20", <93> "t21", <94> "t21", <95> "t22", <96> "t22", <97> "t23", <98> "t23", <99> "t24", <100> "t24", <101> "t25", <102> "t25", <103> "t26", <104> "t26";

param CourseHasStudents[Courses] := <01> 182, <02> 260, <03> 199, <04> 269, <05> 239, <06> 192, <07> 178, <08> 128, <09> 304, <10> 336, <11> 280, <12> 84, <13> 103, <14> 177, <15> 218, <16> 241, <17> 224, <18> 254, <19> 272, <20> 165, <21> 77, <22> 317, <23> 107, <24> 340, <25> 333, <26> 192, <27> 331, <28> 239, <29> 135, <30> 68, <31> 78, <32> 200, <33> 196, <34> 260, <35> 151, <36> 338, <37> 71, <38> 32, <39> 235, <40> 23, <41> 106, <42> 194, <43> 331, <44> 21, <45> 323, <46> 165, <47> 291, <48> 323, <49> 162, <50> 65, <51> 324, <52> 214, <53> 79, <54> 152, <55> 244, <56> 108, <57> 50, <58> 123, <59> 47, <60> 50, <61> 71, <62> 36, <63> 80, <64> 279, <65> 215, <66> 216, <67> 32, <68> 24, <69> 173, <70> 99, <71> 161, <72> 68, <73> 325, <74> 311, <75> 141, <76> 291, <77> 346, <78> 140, <79> 143, <80> 265, <81> 120, <82> 232, <83> 180, <84> 263, <85> 315, <86> 300, <87> 264, <88> 137, <89> 139, <90> 107, <91> 234, <92> 53, <93> 170, <94> 212, <95> 264, <96> 167, <97> 192, <98> 192, <99> 141, <100> 208, <101> 140, <102> 186, <103> 330, <104> 67;

param CourseHasEvents[Courses] := <01> 3, <02> 2, <03> 2, <04> 4, <05> 4, <06> 4, <07> 2, <08> 4, <09> 3, <10> 4, <11> 3, <12> 3, <13> 2, <14> 2, <15> 3, <16> 2, <17> 2, <18> 3, <19> 2, <20> 3, <21> 4, <22> 2, <23> 2, <24> 3, <25> 4, <26> 2, <27> 4, <28> 2, <29> 2, <30> 2, <31> 2, <32> 3, <33> 3, <34> 4, <35> 3, <36> 2, <37> 2, <38> 3, <39> 3, <40> 2, <41> 4, <42> 3, <43> 3, <44> 2, <45> 2, <46> 3, <47> 4, <48> 2, <49> 4, <50> 4, <51> 4, <52> 2, <53> 3, <54> 3, <55> 4, <56> 2, <57> 4, <58> 3, <59> 2, <60> 3, <61> 2, <62> 3, <63> 3, <64> 3, <65> 4, <66> 2, <67> 4, <68> 4, <69> 2, <70> 4, <71> 4, <72> 2, <73> 2, <74> 3, <75> 3, <76> 4, <77> 3, <78> 4, <79> 4, <80> 2, <81> 4, <82> 2, <83> 2, <84> 3, <85> 2, <86> 2, <87> 2, <88> 3, <89> 4, <90> 3, <91> 2, <92> 4, <93> 3, <94> 4, <95> 3, <96> 3, <97> 2, <98> 3, <99> 3, <100> 2, <101> 3, <102> 3, <103> 2, <104> 2;

param CourseHasMindays[Courses] := <01> 2, <02> 1, <03> 1, <04> 3, <05> 3, <06> 3, <07> 1, <08> 3, <09> 2, <10> 3, <11> 2, <12> 2, <13> 1, <14> 1, <15> 2, <16> 1, <17> 1, <18> 2, <19> 1, <20> 2, <21> 3, <22> 1, <23> 1, <24> 2, <25> 3, <26> 1, <27> 3, <28> 1, <29> 1, <30> 1, <31> 1, <32> 2, <33> 2, <34> 3, <35> 2, <36> 1, <37> 1, <38> 2, <39> 2, <40> 1, <41> 3, <42> 2, <43> 2, <44> 1, <45> 1, <46> 2, <47> 3, <48> 1, <49> 3, <50> 3, <51> 3, <52> 1, <53> 2, <54> 2, <55> 3, <56> 1, <57> 3, <58> 2, <59> 1, <60> 2, <61> 1, <62> 2, <63> 2, <64> 2, <65> 3, <66> 1, <67> 3, <68> 3, <69> 1, <70> 3, <71> 3, <72> 1, <73> 1, <74> 2, <75> 2, <76> 3, <77> 2, <78> 3, <79> 3, <80> 1, <81> 3, <82> 1, <83> 1, <84> 2, <85> 1, <86> 1, <87> 1, <88> 2, <89> 3, <90> 2, <91> 1, <92> 3, <93> 2, <94> 3, <95> 2, <96> 2, <97> 1, <98> 2, <99> 2, <100> 1, <101> 2, <102> 2, <103> 1, <104> 1;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 4, <02> 5, <03> 16, <04> 1, <05> 3, <06> 3, <07> 5, <08> 5, <09> 0, <10> 5, <11> 4, <12> 14, <13> 6, <14> 4, <15> 0, <16> 0, <17> 0, <18> 8, <19> 0, <20> 3, <21> 0, <22> 0, <23> 9, <24> 6, <25> 4, <26> 4, <27> 5, <28> 0, <29> 0, <30> 4, <31> 4, <32> 0, <33> 3, <34> 5, <35> 6, <36> 5, <37> 0, <38> 0, <39> 0, <40> 5, <41> 2, <42> 1, <43> 3, <44> 3, <45> 1, <46> 5, <47> 3, <48> 0, <49> 3, <50> 2, <51> 2, <52> 1, <53> 2, <54> 1, <55> 2, <56> 0, <57> 2, <58> 0, <59> 3, <60> 7, <61> 2, <62> 0, <63> 8, <64> 0, <65> 4, <66> 3, <67> 5, <68> 3, <69> 0, <70> 0, <71> 6, <72> 4, <73> 0, <74> 0, <75> 4, <76> 0, <77> 5, <78> 5, <79> 2, <80> 2, <81> 0, <82> 10, <83> 3, <84> 5, <85> 1, <86> 6, <87> 6, <88> 0, <89> 9, <90> 5, <91> 3, <92> 0, <93> 8, <94> 7, <95> 13, <96> 5, <97> 3, <98> 0, <99> 3, <100> 0, <101> 0, <102> 2, <103> 2, <104> 2;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <01,1> 20, <01,2> 21, <01,3> 22, <01,4> 23, <02,1> 11, <02,2> 12, <02,3> 13, <02,4> 14, <02,5> 15, <03,1> 1, <03,2> 2, <03,3> 3, <03,4> 4, <03,5> 5, <03,6> 7, <03,7> 8, <03,8> 9, <03,9> 10, <03,10> 11, <03,11> 12, <03,12> 13, <03,13> 14, <03,14> 18, <03,15> 19, <03,16> 20, <04,1> 16, <05,1> 13, <05,2> 14, <05,3> 15, <06,1> 11, <06,2> 12, <06,3> 13, <07,1> 1, <07,2> 2, <07,3> 3, <07,4> 4, <07,5> 5, <08,1> 11, <08,2> 12, <08,3> 18, <08,4> 19, <08,5> 20, <10,1> 21, <10,2> 22, <10,3> 23, <10,4> 24, <10,5> 25, <11,1> 7, <11,2> 8, <11,3> 9, <11,4> 10, <12,1> 4, <12,2> 5, <12,3> 6, <12,4> 7, <12,5> 8, <12,6> 9, <12,7> 11, <12,8> 12, <12,9> 13, <12,10> 14, <12,11> 15, <12,12> 23, <12,13> 24, <12,14> 25, <13,1> 6, <13,2> 7, <13,3> 8, <13,4> 9, <13,5> 14, <13,6> 15, <14,1> 5, <14,2> 13, <14,3> 14, <14,4> 15, <18,1> 8, <18,2> 9, <18,3> 10, <18,4> 11, <18,5> 12, <18,6> 13, <18,7> 14, <18,8> 15, <20,1> 8, <20,2> 9, <20,3> 10, <23,1> 11, <23,2> 12, <23,3> 13, <23,4> 14, <23,5> 16, <23,6> 17, <23,7> 18, <23,8> 19, <23,9> 20, <24,1> 19, <24,2> 20, <24,3> 21, <24,4> 22, <24,5> 23, <24,6> 24, <25,1> 20, <25,2> 21, <25,3> 22, <25,4> 23, <26,1> 2, <26,2> 3, <26,3> 4, <26,4> 5, <27,1> 10, <27,2> 11, <27,3> 12, <27,4> 13, <27,5> 14, <30,1> 1, <30,2> 16, <30,3> 17, <30,4> 18, <31,1> 22, <31,2> 23, <31,3> 24, <31,4> 25, <33,1> 6, <33,2> 7, <33,3> 8, <34,1> 4, <34,2> 5, <34,3> 6, <34,4> 24, <34,5> 25, <35,1> 11, <35,2> 16, <35,3> 17, <35,4> 18, <35,5> 19, <35,6> 20, <36,1> 16, <36,2> 17, <36,3> 18, <36,4> 19, <36,5> 20, <40,1> 16, <40,2> 17, <40,3> 18, <40,4> 19, <40,5> 20, <41,1> 24, <41,2> 25, <42,1> 16, <43,1> 14, <43,2> 15, <43,3> 16, <44,1> 18, <44,2> 19, <44,3> 20, <45,1> 20, <46,1> 16, <46,2> 17, <46,3> 18, <46,4> 19, <46,5> 20, <47,1> 15, <47,2> 19, <47,3> 20, <49,1> 11, <49,2> 12, <49,3> 16, <50,1> 14, <50,2> 15, <51,1> 19, <51,2> 20, <52,1> 16, <53,1> 14, <53,2> 15, <54,1> 25, <55,1> 24, <55,2> 25, <57,1> 21, <57,2> 22, <59,1> 11, <59,2> 12, <59,3> 13, <60,1> 1, <60,2> 2, <60,3> 3, <60,4> 4, <60,5> 5, <60,6> 16, <60,7> 17, <61,1> 14, <61,2> 15, <63,1> 6, <63,2> 7, <63,3> 8, <63,4> 21, <63,5> 22, <63,6> 23, <63,7> 24, <63,8> 25, <65,1> 12, <65,2> 13, <65,3> 14, <65,4> 15, <66,1> 13, <66,2> 14, <66,3> 15, <67,1> 16, <67,2> 21, <67,3> 22, <67,4> 23, <67,5> 24, <68,1> 6, <68,2> 7, <68,3> 8, <71,1> 13, <71,2> 14, <71,3> 15, <71,4> 18, <71,5> 19, <71,6> 20, <72,1> 6, <72,2> 7, <72,3> 8, <72,4> 9, <75,1> 21, <75,2> 22, <75,3> 23, <75,4> 24, <77,1> 1, <77,2> 2, <77,3> 3, <77,4> 4, <77,5> 5, <78,1> 6, <78,2> 7, <78,3> 21, <78,4> 22, <78,5> 25, <79,1> 9, <79,2> 10, <80,1> 24, <80,2> 25, <82,1> 1, <82,2> 11, <82,3> 12, <82,4> 13, <82,5> 14, <82,6> 15, <82,7> 17, <82,8> 18, <82,9> 19, <82,10> 20, <83,1> 13, <83,2> 14, <83,3> 15, <84,1> 21, <84,2> 22, <84,3> 23, <84,4> 24, <84,5> 25, <85,1> 20, <86,1> 3, <86,2> 4, <86,3> 5, <86,4> 11, <86,5> 12, <86,6> 20, <87,1> 5, <87,2> 21, <87,3> 22, <87,4> 23, <87,5> 24, <87,6> 25, <89,1> 12, <89,2> 13, <89,3> 14, <89,4> 15, <89,5> 16, <89,6> 17, <89,7> 18, <89,8> 19, <89,9> 20, <90,1> 11, <90,2> 12, <90,3> 13, <90,4> 14, <90,5> 15, <91,1> 11, <91,2> 12, <91,3> 13, <93,1> 1, <93,2> 2, <93,3> 3, <93,4> 4, <93,5> 5, <93,6> 18, <93,7> 19, <93,8> 20, <94,1> 6, <94,2> 7, <94,3> 8, <94,4> 9, <94,5> 10, <94,6> 16, <94,7> 17, <95,1> 2, <95,2> 3, <95,3> 4, <95,4> 5, <95,5> 16, <95,6> 17, <95,7> 18, <95,8> 19, <95,9> 20, <95,10> 21, <95,11> 22, <95,12> 23, <95,13> 24, <96,1> 11, <96,2> 12, <96,3> 13, <96,4> 14, <96,5> 15, <97,1> 15, <97,2> 21, <97,3> 22, <99,1> 16, <99,2> 17, <99,3> 18, <102,1> 14, <102,2> 15, <103,1> 14, <103,2> 15, <104,1> 4, <104,2> 5;

param CurriculumHasCoursesCount[Curricula] := <01> 4, <02> 3, <03> 5, <04> 3, <05> 4, <06> 3, <07> 4, <08> 4, <09> 5, <10> 4, <11> 3, <12> 3, <13> 4, <14> 5, <15> 3, <16> 4, <17> 5, <18> 3, <19> 5, <20> 5, <21> 3, <22> 5, <23> 4, <24> 3, <25> 4, <26> 5, <27> 3, <28> 5, <29> 5, <30> 3;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 6, <01,2> 7, <01,3> 31, <01,4> 58, <02,1> 28, <02,2> 43, <02,3> 104, <03,1> 17, <03,2> 20, <03,3> 77, <03,4> 96, <03,5> 102, <04,1> 1, <04,2> 53, <04,3> 63, <05,1> 6, <05,2> 14, <05,3> 43, <05,4> 91, <06,1> 5, <06,2> 16, <06,3> 73, <07,1> 48, <07,2> 54, <07,3> 58, <07,4> 61, <08,1> 16, <08,2> 26, <08,3> 33, <08,4> 67, <09,1> 4, <09,2> 13, <09,3> 54, <09,4> 76, <09,5> 81, <10,1> 2, <10,2> 41, <10,3> 54, <10,4> 66, <11,1> 14, <11,2> 23, <11,3> 63, <12,1> 29, <12,2> 34, <12,3> 77, <13,1> 6, <13,2> 60, <13,3> 63, <13,4> 68, <14,1> 2, <14,2> 3, <14,3> 48, <14,4> 54, <14,5> 58, <15,1> 68, <15,2> 78, <15,3> 82, <16,1> 31, <16,2> 39, <16,3> 83, <16,4> 90, <17,1> 6, <17,2> 18, <17,3> 65, <17,4> 87, <17,5> 90, <18,1> 54, <18,2> 66, <18,3> 92, <19,1> 29, <19,2> 55, <19,3> 68, <19,4> 75, <19,5> 99, <20,1> 8, <20,2> 27, <20,3> 58, <20,4> 70, <20,5> 90, <21,1> 2, <21,2> 11, <21,3> 94, <22,1> 2, <22,2> 17, <22,3> 46, <22,4> 49, <22,5> 95, <23,1> 11, <23,2> 17, <23,3> 77, <23,4> 101, <24,1> 17, <24,2> 19, <24,3> 85, <25,1> 21, <25,2> 72, <25,3> 96, <25,4> 101, <26,1> 21, <26,2> 31, <26,3> 43, <26,4> 62, <26,5> 87, <27,1> 26, <27,2> 58, <27,3> 65, <28,1> 1, <28,2> 20, <28,3> 51, <28,4> 73, <28,5> 101, <29,1> 28, <29,2> 52, <29,3> 58, <29,4> 61, <29,5> 66, <30,1> 22, <30,2> 52, <30,3> 69;

param CurriculumHasEventsCount[Curricula] := <01> 11, <02> 7, <03> 14, <04> 9, <05> 11, <06> 8, <07> 10, <08> 11, <09> 17, <10> 11, <11> 7, <12> 9, <13> 14, <14> 12, <15> 10, <16> 10, <17> 16, <18> 9, <19> 16, <20> 18, <21> 9, <22> 14, <23> 11, <24> 6, <25> 12, <26> 14, <27> 9, <28> 15, <29> 11, <30> 6;

param nbTeachers := 50;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 3, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 1, <24> 1, <25> 1, <26> 1, <27> 3, <28> 3, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 3, <36> 3, <37> 3, <38> 3, <39> 3, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 3, <48> 3, <49> 3, <50> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 50, <02,1> 49, <03,1> 44, <04,1> 43, <05,1> 42, <06,1> 41, <07,1> 48, <08,1> 47, <09,1> 46, <10,1> 45, <11,1> 28, <12,1> 30, <13,1> 29, <14,1> 27, <14,2> 103, <14,3> 104, <15,1> 15, <15,2> 79, <15,3> 80, <16,1> 16, <16,2> 81, <16,3> 82, <17,1> 17, <17,2> 83, <17,3> 84, <18,1> 18, <18,2> 85, <18,3> 86, <19,1> 11, <19,2> 71, <19,3> 72, <20,1> 12, <20,2> 73, <20,3> 74, <21,1> 13, <21,2> 75, <21,3> 76, <22,1> 14, <22,2> 77, <22,3> 78, <23,1> 37, <24,1> 38, <25,1> 35, <26,1> 36, <27,1> 19, <27,2> 87, <27,3> 88, <28,1> 20, <28,2> 89, <28,3> 90, <29,1> 31, <30,1> 32, <31,1> 39, <32,1> 40, <33,1> 33, <34,1> 34, <35,1> 8, <35,2> 65, <35,3> 66, <36,1> 7, <36,2> 63, <36,3> 64, <37,1> 6, <37,2> 61, <37,3> 62, <38,1> 5, <38,2> 59, <38,3> 60, <39,1> 4, <39,2> 57, <39,3> 58, <40,1> 3, <40,2> 55, <40,3> 56, <41,1> 2, <41,2> 53, <41,3> 54, <42,1> 1, <42,2> 51, <42,3> 52, <43,1> 22, <43,2> 93, <43,3> 94, <44,1> 21, <44,2> 91, <44,3> 92, <45,1> 24, <45,2> 97, <45,3> 98, <46,1> 23, <46,2> 95, <46,3> 96, <47,1> 26, <47,2> 101, <47,3> 102, <48,1> 25, <48,2> 99, <48,3> 100, <49,1> 10, <49,2> 69, <49,3> 70, <50,1> 9, <50,2> 67, <50,3> 68;

param TeacherHasEventsCount[Teachers] := <01> 4, <02> 4, <03> 2, <04> 3, <05> 3, <06> 4, <07> 2, <08> 4, <09> 3, <10> 2, <11> 2, <12> 2, <13> 2, <14> 8, <15> 9, <16> 8, <17> 7, <18> 7, <19> 9, <20> 8, <21> 9, <22> 9, <23> 2, <24> 3, <25> 3, <26> 2, <27> 7, <28> 10, <29> 2, <30> 3, <31> 3, <32> 2, <33> 3, <34> 4, <35> 10, <36> 8, <37> 9, <38> 9, <39> 11, <40> 8, <41> 8, <42> 9, <43> 9, <44> 10, <45> 8, <46> 8, <47> 8, <48> 9, <49> 10, <50> 11;

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
