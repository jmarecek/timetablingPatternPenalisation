param nbPeriodsPerDay := 5;
param nbDaySingletonChecks := 5;
param nbRooms := 15;
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

param RoomHasCapacity[Rooms] := <01> 40, <02> 40, <03> 50, <04> 50, <05> 50, <06> 60, <07> 185, <08> 245, <09> 245, <10> 245, <11> 245, <12> 245, <13> 255, <14> 255, <15> 310;

param CourseHasName[Courses] := <01> "Course001", <02> "Course002", <03> "Course003", <04> "Course004", <05> "Course005", <06> "Course006", <07> "Course007", <08> "Course008", <09> "Course009", <10> "Course010", <11> "Course011", <12> "Course012", <13> "Course013", <14> "Course014", <15> "Course015", <16> "Course016", <17> "Course017", <18> "Course018", <19> "Course019", <20> "Course020", <21> "Course021", <22> "Course022", <23> "Course023", <24> "Course024", <25> "Course025", <26> "Course026", <27> "Course027", <28> "Course028", <29> "Course029", <30> "Course030", <31> "Course031", <32> "Course032", <33> "Course033", <34> "Course034", <35> "Course035", <36> "Course036", <37> "Course037", <38> "Course038", <39> "Course039", <40> "Course040", <41> "Course041", <42> "Course042", <43> "Course043", <44> "Course044", <45> "Course045", <46> "Course046", <47> "Course047", <48> "Course048", <49> "Course049", <50> "Course050", <51> "Course051", <52> "Course052", <53> "Course053", <54> "Course054", <55> "Course055", <56> "Course056", <57> "Course057", <58> "Course058", <59> "Course059", <60> "Course060", <61> "Course061", <62> "Course062", <63> "Course063", <64> "Course064", <65> "Course065", <66> "Course066", <67> "Course067", <68> "Course068", <69> "Course069", <70> "Course070", <71> "Course071", <72> "Course072", <73> "Course073", <74> "Course074", <75> "Course075", <76> "Course076", <77> "Course077", <78> "Course078", <79> "Course079", <80> "Course080", <81> "Course081", <82> "Course082", <83> "Course083", <84> "Course084", <85> "Course085", <86> "Course086", <87> "Course087", <88> "Course088", <89> "Course089", <90> "Course090", <91> "Course091", <92> "Course092", <93> "Course093", <94> "Course094", <95> "Course095", <96> "Course096", <97> "Course097", <98> "Course098", <99> "Course099", <100> "Course100", <101> "Course101";

param CourseHasTeacher[Courses] := <01> "t00", <02> "t01", <03> "t02", <04> "t03", <05> "t04", <06> "t05", <07> "t06", <08> "t07", <09> "t08", <10> "t09", <11> "t10", <12> "t11", <13> "t12", <14> "t13", <15> "t14", <16> "t15", <17> "t16", <18> "t17", <19> "t18", <20> "t19", <21> "t20", <22> "t21", <23> "t22", <24> "t23", <25> "t24", <26> "t25", <27> "t26", <28> "t27", <29> "t28", <30> "t29", <31> "t30", <32> "t31", <33> "t32", <34> "t33", <35> "t34", <36> "t35", <37> "t36", <38> "t37", <39> "t38", <40> "t39", <41> "t40", <42> "t41", <43> "t42", <44> "t43", <45> "t44", <46> "t45", <47> "t46", <48> "t47", <49> "t48", <50> "t49", <51> "t00", <52> "t00", <53> "t01", <54> "t01", <55> "t02", <56> "t02", <57> "t03", <58> "t03", <59> "t04", <60> "t04", <61> "t05", <62> "t05", <63> "t06", <64> "t06", <65> "t07", <66> "t07", <67> "t08", <68> "t08", <69> "t09", <70> "t09", <71> "t10", <72> "t10", <73> "t11", <74> "t11", <75> "t12", <76> "t12", <77> "t13", <78> "t13", <79> "t14", <80> "t14", <81> "t15", <82> "t15", <83> "t16", <84> "t16", <85> "t17", <86> "t17", <87> "t18", <88> "t18", <89> "t19", <90> "t19", <91> "t20", <92> "t20", <93> "t21", <94> "t21", <95> "t22", <96> "t22", <97> "t23", <98> "t23", <99> "t24", <100> "t24", <101> "t25";

param CourseHasStudents[Courses] := <01> 24, <02> 296, <03> 108, <04> 167, <05> 269, <06> 301, <07> 223, <08> 81, <09> 207, <10> 291, <11> 292, <12> 159, <13> 29, <14> 302, <15> 212, <16> 41, <17> 61, <18> 224, <19> 212, <20> 159, <21> 219, <22> 71, <23> 209, <24> 236, <25> 136, <26> 235, <27> 147, <28> 176, <29> 215, <30> 234, <31> 247, <32> 21, <33> 52, <34> 25, <35> 208, <36> 258, <37> 111, <38> 268, <39> 244, <40> 130, <41> 280, <42> 274, <43> 134, <44> 118, <45> 277, <46> 300, <47> 29, <48> 126, <49> 174, <50> 343, <51> 190, <52> 205, <53> 193, <54> 256, <55> 330, <56> 346, <57> 339, <58> 206, <59> 135, <60> 322, <61> 125, <62> 138, <63> 225, <64> 123, <65> 103, <66> 225, <67> 245, <68> 106, <69> 269, <70> 152, <71> 252, <72> 306, <73> 137, <74> 267, <75> 112, <76> 247, <77> 214, <78> 152, <79> 34, <80> 143, <81> 136, <82> 336, <83> 284, <84> 299, <85> 103, <86> 86, <87> 208, <88> 213, <89> 228, <90> 297, <91> 339, <92> 334, <93> 269, <94> 126, <95> 117, <96> 277, <97> 262, <98> 269, <99> 313, <100> 107, <101> 122;

param CourseHasEvents[Courses] := <01> 2, <02> 3, <03> 2, <04> 4, <05> 4, <06> 2, <07> 4, <08> 4, <09> 3, <10> 2, <11> 4, <12> 4, <13> 4, <14> 2, <15> 4, <16> 2, <17> 4, <18> 4, <19> 3, <20> 2, <21> 2, <22> 3, <23> 4, <24> 4, <25> 4, <26> 4, <27> 2, <28> 2, <29> 2, <30> 3, <31> 4, <32> 3, <33> 2, <34> 4, <35> 4, <36> 3, <37> 4, <38> 2, <39> 2, <40> 4, <41> 2, <42> 2, <43> 3, <44> 4, <45> 2, <46> 3, <47> 3, <48> 3, <49> 4, <50> 3, <51> 4, <52> 2, <53> 2, <54> 4, <55> 2, <56> 2, <57> 4, <58> 2, <59> 2, <60> 4, <61> 4, <62> 2, <63> 3, <64> 3, <65> 2, <66> 2, <67> 4, <68> 2, <69> 2, <70> 3, <71> 3, <72> 2, <73> 3, <74> 4, <75> 2, <76> 2, <77> 3, <78> 4, <79> 3, <80> 3, <81> 4, <82> 2, <83> 4, <84> 2, <85> 2, <86> 4, <87> 3, <88> 3, <89> 2, <90> 4, <91> 2, <92> 2, <93> 3, <94> 4, <95> 3, <96> 3, <97> 2, <98> 4, <99> 2, <100> 3, <101> 4;

param CourseHasMindays[Courses] := <01> 1, <02> 2, <03> 1, <04> 3, <05> 3, <06> 1, <07> 3, <08> 3, <09> 2, <10> 1, <11> 3, <12> 3, <13> 3, <14> 1, <15> 3, <16> 1, <17> 3, <18> 3, <19> 2, <20> 1, <21> 1, <22> 2, <23> 3, <24> 3, <25> 3, <26> 3, <27> 1, <28> 1, <29> 1, <30> 2, <31> 3, <32> 2, <33> 1, <34> 3, <35> 3, <36> 2, <37> 3, <38> 1, <39> 1, <40> 3, <41> 1, <42> 1, <43> 2, <44> 3, <45> 1, <46> 2, <47> 2, <48> 2, <49> 3, <50> 2, <51> 3, <52> 1, <53> 1, <54> 3, <55> 1, <56> 1, <57> 3, <58> 1, <59> 1, <60> 3, <61> 3, <62> 1, <63> 2, <64> 2, <65> 1, <66> 1, <67> 3, <68> 1, <69> 1, <70> 2, <71> 2, <72> 1, <73> 2, <74> 3, <75> 1, <76> 1, <77> 2, <78> 3, <79> 2, <80> 2, <81> 3, <82> 1, <83> 3, <84> 1, <85> 1, <86> 3, <87> 2, <88> 2, <89> 1, <90> 3, <91> 1, <92> 1, <93> 2, <94> 3, <95> 2, <96> 2, <97> 1, <98> 3, <99> 1, <100> 2, <101> 3;

param CourseHasDeprecatedPeriodsCount[Courses] := <01> 0, <02> 6, <03> 5, <04> 4, <05> 4, <06> 0, <07> 4, <08> 8, <09> 6, <10> 2, <11> 4, <12> 3, <13> 11, <14> 0, <15> 0, <16> 0, <17> 2, <18> 5, <19> 4, <20> 0, <21> 0, <22> 3, <23> 0, <24> 0, <25> 5, <26> 3, <27> 2, <28> 6, <29> 11, <30> 0, <31> 0, <32> 3, <33> 2, <34> 3, <35> 2, <36> 5, <37> 8, <38> 0, <39> 9, <40> 4, <41> 1, <42> 5, <43> 11, <44> 8, <45> 0, <46> 0, <47> 4, <48> 1, <49> 0, <50> 6, <51> 3, <52> 1, <53> 2, <54> 4, <55> 2, <56> 8, <57> 4, <58> 0, <59> 0, <60> 3, <61> 0, <62> 12, <63> 2, <64> 1, <65> 10, <66> 5, <67> 1, <68> 4, <69> 10, <70> 1, <71> 5, <72> 5, <73> 4, <74> 9, <75> 2, <76> 0, <77> 0, <78> 2, <79> 5, <80> 0, <81> 0, <82> 0, <83> 7, <84> 3, <85> 12, <86> 3, <87> 8, <88> 8, <89> 13, <90> 2, <91> 0, <92> 0, <93> 6, <94> 4, <95> 0, <96> 0, <97> 2, <98> 0, <99> 5, <100> 0, <101> 0;

param CourseHasDeprecatedPeriods[Courses * ListPeriods] := <02,1> 18, <02,2> 19, <02,3> 20, <02,4> 21, <02,5> 22, <02,6> 23, <03,1> 1, <03,2> 2, <03,3> 3, <03,4> 4, <03,5> 5, <04,1> 16, <04,2> 17, <04,3> 18, <04,4> 19, <05,1> 17, <05,2> 18, <05,3> 19, <05,4> 20, <07,1> 6, <07,2> 21, <07,3> 22, <07,4> 23, <08,1> 7, <08,2> 8, <08,3> 9, <08,4> 10, <08,5> 16, <08,6> 17, <08,7> 18, <08,8> 19, <09,1> 11, <09,2> 12, <09,3> 13, <09,4> 14, <09,5> 15, <09,6> 20, <10,1> 4, <10,2> 5, <11,1> 22, <11,2> 23, <11,3> 24, <11,4> 25, <12,1> 13, <12,2> 14, <12,3> 15, <13,1> 6, <13,2> 7, <13,3> 8, <13,4> 9, <13,5> 10, <13,6> 13, <13,7> 14, <13,8> 15, <13,9> 16, <13,10> 17, <13,11> 18, <17,1> 9, <17,2> 10, <18,1> 16, <18,2> 17, <18,3> 18, <18,4> 19, <18,5> 20, <19,1> 22, <19,2> 23, <19,3> 24, <19,4> 25, <22,1> 6, <22,2> 7, <22,3> 8, <25,1> 21, <25,2> 22, <25,3> 23, <25,4> 24, <25,5> 25, <26,1> 3, <26,2> 4, <26,3> 5, <27,1> 1, <27,2> 11, <28,1> 3, <28,2> 4, <28,3> 5, <28,4> 13, <28,5> 14, <28,6> 15, <29,1> 1, <29,2> 2, <29,3> 6, <29,4> 7, <29,5> 8, <29,6> 9, <29,7> 10, <29,8> 12, <29,9> 13, <29,10> 14, <29,11> 15, <32,1> 11, <32,2> 12, <32,3> 13, <33,1> 24, <33,2> 25, <34,1> 6, <34,2> 7, <34,3> 8, <35,1> 21, <35,2> 22, <36,1> 11, <36,2> 12, <36,3> 13, <36,4> 14, <36,5> 15, <37,1> 16, <37,2> 17, <37,3> 18, <37,4> 21, <37,5> 22, <37,6> 23, <37,7> 24, <37,8> 25, <39,1> 12, <39,2> 13, <39,3> 14, <39,4> 15, <39,5> 16, <39,6> 17, <39,7> 18, <39,8> 19, <39,9> 20, <40,1> 11, <40,2> 12, <40,3> 13, <40,4> 14, <41,1> 1, <42,1> 11, <42,2> 12, <42,3> 13, <42,4> 14, <42,5> 15, <43,1> 6, <43,2> 7, <43,3> 8, <43,4> 9, <43,5> 10, <43,6> 11, <43,7> 12, <43,8> 13, <43,9> 14, <43,10> 24, <43,11> 25, <44,1> 1, <44,2> 2, <44,3> 3, <44,4> 10, <44,5> 21, <44,6> 22, <44,7> 23, <44,8> 24, <47,1> 6, <47,2> 7, <47,3> 8, <47,4> 9, <48,1> 6, <50,1> 1, <50,2> 2, <50,3> 3, <50,4> 4, <50,5> 5, <50,6> 11, <51,1> 18, <51,2> 19, <51,3> 20, <52,1> 15, <53,1> 4, <53,2> 5, <54,1> 12, <54,2> 13, <54,3> 14, <54,4> 15, <55,1> 14, <55,2> 15, <56,1> 1, <56,2> 2, <56,3> 3, <56,4> 15, <56,5> 16, <56,6> 17, <56,7> 18, <56,8> 19, <57,1> 4, <57,2> 5, <57,3> 10, <57,4> 16, <60,1> 11, <60,2> 19, <60,3> 20, <62,1> 1, <62,2> 2, <62,3> 3, <62,4> 4, <62,5> 5, <62,6> 16, <62,7> 17, <62,8> 21, <62,9> 22, <62,10> 23, <62,11> 24, <62,12> 25, <63,1> 19, <63,2> 20, <64,1> 1, <65,1> 16, <65,2> 17, <65,3> 18, <65,4> 19, <65,5> 20, <65,6> 21, <65,7> 22, <65,8> 23, <65,9> 24, <65,10> 25, <66,1> 4, <66,2> 5, <66,3> 8, <66,4> 9, <66,5> 10, <67,1> 5, <68,1> 22, <68,2> 23, <68,3> 24, <68,4> 25, <69,1> 11, <69,2> 12, <69,3> 13, <69,4> 14, <69,5> 15, <69,6> 16, <69,7> 17, <69,8> 18, <69,9> 19, <69,10> 20, <70,1> 1, <71,1> 11, <71,2> 12, <71,3> 13, <71,4> 14, <71,5> 15, <72,1> 1, <72,2> 11, <72,3> 12, <72,4> 13, <72,5> 14, <73,1> 7, <73,2> 8, <73,3> 9, <73,4> 10, <74,1> 1, <74,2> 2, <74,3> 3, <74,4> 4, <74,5> 5, <74,6> 16, <74,7> 17, <74,8> 18, <74,9> 19, <75,1> 14, <75,2> 15, <78,1> 21, <78,2> 22, <79,1> 6, <79,2> 7, <79,3> 8, <79,4> 9, <79,5> 10, <83,1> 3, <83,2> 4, <83,3> 5, <83,4> 22, <83,5> 23, <83,6> 24, <83,7> 25, <84,1> 6, <84,2> 7, <84,3> 8, <85,1> 1, <85,2> 2, <85,3> 6, <85,4> 7, <85,5> 8, <85,6> 9, <85,7> 10, <85,8> 11, <85,9> 12, <85,10> 13, <85,11> 14, <85,12> 15, <86,1> 16, <86,2> 17, <86,3> 18, <87,1> 1, <87,2> 6, <87,3> 7, <87,4> 21, <87,5> 22, <87,6> 23, <87,7> 24, <87,8> 25, <88,1> 16, <88,2> 17, <88,3> 18, <88,4> 19, <88,5> 22, <88,6> 23, <88,7> 24, <88,8> 25, <89,1> 6, <89,2> 7, <89,3> 8, <89,4> 11, <89,5> 12, <89,6> 13, <89,7> 14, <89,8> 15, <89,9> 21, <89,10> 22, <89,11> 23, <89,12> 24, <89,13> 25, <90,1> 9, <90,2> 10, <93,1> 19, <93,2> 20, <93,3> 22, <93,4> 23, <93,5> 24, <93,6> 25, <94,1> 21, <94,2> 22, <94,3> 23, <94,4> 24, <97,1> 9, <97,2> 10, <99,1> 6, <99,2> 7, <99,3> 8, <99,4> 9, <99,5> 10;

param CurriculumHasCoursesCount[Curricula] := <01> 3, <02> 4, <03> 4, <04> 4, <05> 5, <06> 5, <07> 4, <08> 3, <09> 5, <10> 5, <11> 4, <12> 3, <13> 5, <14> 4, <15> 3, <16> 4, <17> 4, <18> 3, <19> 5, <20> 3, <21> 5, <22> 5, <23> 4, <24> 5, <25> 3, <26> 4, <27> 4, <28> 4, <29> 4, <30> 4;

param CurriculumHasCourses[Curricula * ListCourses] := <01,1> 12, <01,2> 13, <01,3> 62, <02,1> 19, <02,2> 48, <02,3> 57, <02,4> 58, <03,1> 8, <03,2> 43, <03,3> 59, <03,4> 73, <04,1> 19, <04,2> 35, <04,3> 64, <04,4> 88, <05,1> 8, <05,2> 32, <05,3> 52, <05,4> 59, <05,5> 67, <06,1> 3, <06,2> 8, <06,3> 70, <06,4> 92, <06,5> 94, <07,1> 26, <07,2> 37, <07,3> 79, <07,4> 99, <08,1> 2, <08,2> 45, <08,3> 64, <09,1> 23, <09,2> 31, <09,3> 86, <09,4> 92, <09,5> 93, <10,1> 18, <10,2> 36, <10,3> 82, <10,4> 90, <10,5> 93, <11,1> 7, <11,2> 11, <11,3> 65, <11,4> 73, <12,1> 28, <12,2> 47, <12,3> 95, <13,1> 21, <13,2> 33, <13,3> 35, <13,4> 58, <13,5> 60, <14,1> 6, <14,2> 8, <14,3> 43, <14,4> 99, <15,1> 18, <15,2> 80, <15,3> 85, <16,1> 20, <16,2> 29, <16,3> 34, <16,4> 44, <17,1> 2, <17,2> 40, <17,3> 60, <17,4> 100, <18,1> 20, <18,2> 37, <18,3> 45, <19,1> 24, <19,2> 46, <19,3> 66, <19,4> 75, <19,5> 77, <20,1> 5, <20,2> 92, <20,3> 98, <21,1> 16, <21,2> 23, <21,3> 29, <21,4> 67, <21,5> 101, <22,1> 13, <22,2> 27, <22,3> 48, <22,4> 73, <22,5> 99, <23,1> 7, <23,2> 11, <23,3> 15, <23,4> 98, <24,1> 7, <24,2> 10, <24,3> 20, <24,4> 33, <24,5> 69, <25,1> 57, <25,2> 79, <25,3> 95, <26,1> 34, <26,2> 37, <26,3> 41, <26,4> 78, <27,1> 35, <27,2> 74, <27,3> 89, <27,4> 96, <28,1> 26, <28,2> 55, <28,3> 57, <28,4> 62, <29,1> 12, <29,2> 75, <29,3> 81, <29,4> 88, <30,1> 19, <30,2> 40, <30,3> 52, <30,4> 91;

param CurriculumHasEventsCount[Curricula] := <01> 10, <02> 12, <03> 12, <04> 13, <05> 15, <06> 15, <07> 13, <08> 8, <09> 17, <10> 16, <11> 13, <12> 8, <13> 14, <14> 11, <15> 9, <16> 12, <17> 14, <18> 8, <19> 14, <20> 10, <21> 16, <22> 14, <23> 16, <24> 12, <25> 10, <26> 14, <27> 13, <28> 12, <29> 13, <30> 11;

param nbTeachers := 50;
set Teachers  := { 1 .. nbTeachers };

param TeacherHasCoursesCount[Teachers] := <01> 1, <02> 1, <03> 1, <04> 1, <05> 1, <06> 1, <07> 1, <08> 1, <09> 1, <10> 1, <11> 1, <12> 1, <13> 1, <14> 1, <15> 3, <16> 3, <17> 3, <18> 3, <19> 3, <20> 3, <21> 3, <22> 3, <23> 1, <24> 1, <25> 1, <26> 1, <27> 3, <28> 3, <29> 1, <30> 1, <31> 1, <32> 1, <33> 1, <34> 1, <35> 3, <36> 3, <37> 3, <38> 3, <39> 3, <40> 3, <41> 3, <42> 3, <43> 3, <44> 3, <45> 3, <46> 3, <47> 2, <48> 3, <49> 3, <50> 3;

param TeacherHasCourses[Teachers * ListCourses] := <01,1> 50, <02,1> 49, <03,1> 44, <04,1> 43, <05,1> 42, <06,1> 41, <07,1> 48, <08,1> 47, <09,1> 46, <10,1> 45, <11,1> 28, <12,1> 30, <13,1> 29, <14,1> 27, <15,1> 15, <15,2> 79, <15,3> 80, <16,1> 16, <16,2> 81, <16,3> 82, <17,1> 17, <17,2> 83, <17,3> 84, <18,1> 18, <18,2> 85, <18,3> 86, <19,1> 11, <19,2> 71, <19,3> 72, <20,1> 12, <20,2> 73, <20,3> 74, <21,1> 13, <21,2> 75, <21,3> 76, <22,1> 14, <22,2> 77, <22,3> 78, <23,1> 37, <24,1> 38, <25,1> 35, <26,1> 36, <27,1> 19, <27,2> 87, <27,3> 88, <28,1> 20, <28,2> 89, <28,3> 90, <29,1> 31, <30,1> 32, <31,1> 39, <32,1> 40, <33,1> 33, <34,1> 34, <35,1> 8, <35,2> 65, <35,3> 66, <36,1> 7, <36,2> 63, <36,3> 64, <37,1> 6, <37,2> 61, <37,3> 62, <38,1> 5, <38,2> 59, <38,3> 60, <39,1> 4, <39,2> 57, <39,3> 58, <40,1> 3, <40,2> 55, <40,3> 56, <41,1> 2, <41,2> 53, <41,3> 54, <42,1> 1, <42,2> 51, <42,3> 52, <43,1> 22, <43,2> 93, <43,3> 94, <44,1> 21, <44,2> 91, <44,3> 92, <45,1> 24, <45,2> 97, <45,3> 98, <46,1> 23, <46,2> 95, <46,3> 96, <47,1> 26, <47,2> 101, <48,1> 25, <48,2> 99, <48,3> 100, <49,1> 10, <49,2> 69, <49,3> 70, <50,1> 9, <50,2> 67, <50,3> 68;

param TeacherHasEventsCount[Teachers] := <01> 3, <02> 4, <03> 4, <04> 3, <05> 2, <06> 2, <07> 3, <08> 3, <09> 3, <10> 2, <11> 2, <12> 3, <13> 2, <14> 2, <15> 10, <16> 8, <17> 10, <18> 10, <19> 9, <20> 11, <21> 8, <22> 9, <23> 4, <24> 2, <25> 4, <26> 3, <27> 9, <28> 8, <29> 4, <30> 3, <31> 2, <32> 4, <33> 2, <34> 4, <35> 8, <36> 10, <37> 8, <38> 10, <39> 10, <40> 6, <41> 9, <42> 8, <43> 10, <44> 6, <45> 10, <46> 10, <47> 8, <48> 9, <49> 7, <50> 9;

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
