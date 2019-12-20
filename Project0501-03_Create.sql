CREATE TABLE [Oaks.Member] (
	memId INTEGER NOT NULL, 
	memFirstName VARCHAR (25),
	memLastName VARCHAR (25), 
	placeOfEmployment VARCHAR(50), 
	memStreet VARCHAR (100), 
	memCity VARCHAR(50), 
	memState VARCHAR (50), 
	memZip INTEGER , 
	memCellNumber VARCHAR(14), 
	memHomeNumber VARCHAR (12), 
	memEmailId VARCHAR (60), 
	proxy VARCHAR(90),
	proxyId INTEGER,
	CONSTRAINT pk_Member_memId PRIMARY KEY (memId) );


CREATE TABLE [Oaks.Student] (
	stdId INTEGER NOT NULL,
	stdFirstName VARCHAR (25),
	stdLastName VARCHAR (25),
	stdDOB DATE,
	sex VARCHAR (1),
	stdEnrollmentDate DATE,
	expAttendance VARCHAR (7),
	stdGrade VARCHAR (50),
	stdStreet VARCHAR (100),
	stdCity VARCHAR (50),
	stdState VARCHAR (50),
	stdZip INTEGER,
	enrollmentAgreement CHAR(1), 
	fingerprintReceipt CHAR(1), 
	physicalExamForm CHAR(1),
	childCareReport CHAR(1), 
	liabilityRelease CHAR(1), 
	medicalAdministratorAuthorisation CHAR(1), 
	immuneCertificate CHAR(1)
	CONSTRAINT pk_Student_stdId PRIMARY KEY (stdId) );

CREATE TABLE [Oaks.StudentMedical] (
	stdMedId INTEGER  NOT NULL,
	stdId INTEGER  NOT NULL,
	medConditions VARCHAR(100), 
	medications VARCHAR (100), 
	tetanusShotDate DATE, 
	foodAllergy VARCHAR (90), 
	drugAllergy VARCHAR (100), 
	signsSymptons VARCHAR (100), 
	responseDescp VARCHAR (200), 
	preventionDescp VARCHAR (200), 
	comments VARCHAR(300), 
	medicalFormVerified VARCHAR(200),
	severity VARCHAR(10)
	CONSTRAINT pk_Medical_stdMedID PRIMARY KEY (stdMedId)
	CONSTRAINT fk_Medical_stdId FOREIGN KEY (stdId)
		REFERENCES [Oaks.Student] (stdId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [Oaks.Provider] (
	providerId INTEGER NOT NULL,
	providerName VARCHAR (200), 
	providerNumber INTEGER, 
	providerStreet VARCHAR (100), 
	providerCity VARCHAR (50), 
	providerState VARCHAR (50), 
	providerZip INTEGER,
	CONSTRAINT pk_Provider_providerId PRIMARY KEY (providerId) );

CREATE TABLE [Oaks.EmergencyContact] (
	emrContactId INTEGER  NOT NULL, 
	stdId INTEGER  NOT NULL, 
	emrFirstName VARCHAR (25), 
	emrLastName VARCHAR (25), 
	emrHomeNumber VARCHAR(14), 
	emrWorkNumber VARCHAR(14), 
	emrContactStreet VARCHAR (100), 
	emrContactCity VARCHAR (50), 
	emrContactState VARCHAR (50), 
	emrContactZip INTEGER ,
	CONSTRAINT pk_Emergency_emrContactId PRIMARY KEY (emrContactId),
	CONSTRAINT fk_Emergency_stdId FOREIGN KEY (stdId)
		REFERENCES [Oaks.Student] (stdId)
		ON DELETE CASCADE ON UPDATE CASCADE );


CREATE TABLE [Oaks.ServiceTask] (
	taskID INTEGER , 
	serviceTask VARCHAR (250), 
	organiser VARCHAR (150),
	CONSTRAINT pk_Service_taskId PRIMARY KEY (taskID) );

CREATE TABLE [Oaks.Classes] (
	classId INTEGER NOT NULL, 
	className VARCHAR (150), 
	classDescription VARCHAR (250),
	CONSTRAINT pk_Classes_classId PRIMARY KEY (classID) );	

CREATE TABLE [Oaks.Staff] (
	staffId INTEGER NOT NULL, 
	staffFirstName VARCHAR (25), 
	staffLastName VARCHAR (25), 
	staffPosition VARCHAR (100), 
	staffPhone VARCHAR(14), 
	staffdateOfBirth DATE, 
	staffStreet VARCHAR (100), 
	staffCity VARCHAR (50), 
	staffState VARCHAR (50),
	staffAttendance VARCHAR (7)
	CONSTRAINT pk_Staff_staffID PRIMARY KEY (staffId) );	
	
CREATE TABLE [Oaks.Membership] (
	stdId INTEGER  NOT NULL, 
	memId INTEGER  NOT NULL, 
	relationshipToChild VARCHAR (15), 
	lastUpdate DATE , 
	additionalInformation VARCHAR (100), 
	coopType VARCHAR (15), 
	coopDays VARCHAR(10), 
	mediaConsent VARCHAR (1), 
	specialPreferences VARCHAR (1),
	CONSTRAINT fk_Membership_stdId FOREIGN KEY (stdId)
		REFERENCES [Oaks.Student] (stdId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Membership_memId FOREIGN KEY (memId)
		REFERENCES [Oaks.Member] (memId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [Oaks.Authorize] (
	stdId INTEGER NOT NULL, 
	providerId INTEGER NOT NULL, 
	memId INTEGER NOT NULL, 
	memPermission VARCHAR (1), 
	autsignature VARCHAR(50), 
	autDate DATE,
	CONSTRAINT fk_Authorize_stdId FOREIGN KEY (stdId)
		REFERENCES [Oaks.Student] (stdId)
		ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_Authorize_memId FOREIGN KEY (memId)
		REFERENCES [Oaks.Member] (memId)
		ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_Authorize_providerId FOREIGN KEY (providerId)
		REFERENCES [Oaks.Provider] (providerId)
		ON DELETE CASCADE ON UPDATE CASCADE );
 

CREATE TABLE [Oaks.Enroll] (
	stdId INTEGER  NOT NULL,
	classId INTEGER NOT NULL,
	CONSTRAINT fk_Enroll_stdId FOREIGN KEY (stdId)
		REFERENCES [Oaks.Student] (stdId)
		ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_Enroll_classId FOREIGN KEY (classId)
		REFERENCES [Oaks.Classes] (classId)
		ON DELETE CASCADE ON UPDATE CASCADE ) ;

CREATE TABLE [Oaks.Teach] (
	classId INTEGER NOT NULL,
	staffId INTEGER NOT NULL,
	CONSTRAINT fk_Teach_classId FOREIGN KEY (classId)
		REFERENCES [Oaks.Classes] (classId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Teach_staffId FOREIGN KEY (staffId)
		REFERENCES [Oaks.Staff] (staffId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [Oaks.Perform] (
	taskId INTEGER  NOT NULL,
	memId INTEGER  NOT NULL,
	memServiceHours INTEGER, 
	datePerformed DATE,
	CONSTRAINT fk_Perform_taskId FOREIGN KEY (taskId)
		REFERENCES [Oaks.ServiceTask] (taskId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Perform_memId FOREIGN KEY (memId)
		REFERENCES [Oaks.Member] (memId)
		ON DELETE CASCADE ON UPDATE CASCADE );

CREATE TABLE [Oaks.Contact] (
	stdId INTEGER  NOT NULL,
	emrContactId INTEGER  NOT NULL,
	CONSTRAINT fk_Contact_stdId FOREIGN KEY (stdId)
		REFERENCES [Oaks.Student] (stdId)
		ON DELETE NO ACTION ON UPDATE NO ACTION ,
	CONSTRAINT fk_Contact_emrContactId FOREIGN KEY (emrContactId)
		REFERENCES [Oaks.EmergencyContact] (emrContactId)
		ON DELETE NO ACTION ON UPDATE NO ACTION ) ;