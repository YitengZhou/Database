DROP TABLE IF EXISTS Attends_event;
DROP TABLE IF EXISTS Member_skill;
DROP TABLE IF EXISTS Member_role;
DROP TABLE IF EXISTS Skill;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Member;

CREATE TABLE Member (
    email            VARCHAR(200) PRIMARY KEY,
    name             VARCHAR(100) NOT NULL UNIQUE,
    student_number   INTEGER(10)  NULL,
    Hoverboard_level INTEGER(2)   NOT NULL
);

CREATE TABLE Event (
    event_ID         INTEGER(10)  PRIMARY KEY AUTO_INCREMENT,
    data             DATE         NOT NULL UNIQUE,
    location         VARCHAR(200) NOT NULL UNIQUE,
    event_name       VARCHAR(200) NOT NULL,
    description      VARCHAR(500) NULL,
    organiser_email  VARCHAR(200) NOT NULL,
    FOREIGN KEY (organiser_email) REFERENCES Member(email)
);

CREATE TABLE Skill (
    skill_ID         INTEGER(10)  PRIMARY KEY AUTO_INCREMENT,
    skill_name       VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Member_role (
    role_id          INTEGER(10)  AUTO_INCREMENT,
    email            VARCHAR(200),
    role_name        VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (email) REFERENCES Member(email),
    PRIMARY KEY (role_id, email)
);

CREATE TABLE Member_skill (
    email            VARCHAR(200),
    skill_ID         INTEGER(10),
    level            INTEGER(2)   NOT NULL,
    FOREIGN KEY (email) REFERENCES Member(email),
    FOREIGN KEY (skill_ID) REFERENCES Skill(skill_ID),
    PRIMARY KEY (email, skill_ID)
);

CREATE TABLE Attends_event (
    email            VARCHAR(200),
    event_ID         INTEGER(10),
    FOREIGN KEY (email) REFERENCES Member(email),
    FOREIGN KEY (event_ID) REFERENCES Event(event_ID),
    PRIMARY KEY (email, event_ID)
);
