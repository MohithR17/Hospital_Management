\c postgres
drop database hospital;
create database hospital;
\c hospital

create table doctor
(
    did BIGSERIAL not null,
    fname varchar(30) not null,
    mname varchar(30),
    lname varchar(30) not null,
    specialization char(30) not null,
    gender char(7),
    email varchar(30),
    primary key (did)
);

create table patient 
(
    pid BIGSERIAL not null,
    primary key (pid),
    -- docid int not null,
    -- disease varchar(30),
    fname varchar(30) not null,
    mname varchar(30),
    lname varchar(30) not null,
    DOB date CHECK(CURRENT_DATE >= DOB),
    password varchar(200),
    email varchar(30)
    -- foreign key (docid) references doctor(did) 
);

create table appointment
(
    appointmentid BIGSERIAL not null,
    patid int not null,
    primary key (appointmentid),
    docid int not null,
    appointmenttime time,
    appointmentdate date CHECK(CURRENT_DATE <= appointmentdate),
    appointmenttype char(30) DEFAULT 'online',
    foreign key (patid) references patient(pid),
    foreign key (docid) references doctor(did)
);

create table room
(
    roomno int not null DEFAULT 10,
    primary key (roomno),
    availability boolean not null,
    cost int not null CHECK(cost >= 0),
    roomtype varchar(30) not null
);

create table medicine
(
    srno BIGSERIAL not null,
    primary key (srno),
    availableamt int CHECK(availableamt >= 0),
    name varchar(30) not null unique,
    cost int not null CHECK(cost >= 0),
    mfddate date not null CHECK(CURRENT_DATE >= mfddate),
    expperiod int not null
);

create table test
(
    testid BIGSERIAL not null,
    primary key (testid),
    cost int not null CHECK(cost >= 0),
    testtype char(30) not null,
    testname char(30) not null unique
);

create table nurse
(
    nurseid BIGSERIAL not null,
    primary key (nurseid),
    fname varchar(30) not null,
    mname varchar(30),
    lname varchar(30) not null,
    qualification char(30) not null DEFAULT 'Auxiliary Nurse & Midwife',
    email varchar(30)
);

create table bill
(
    billid BIGSERIAL not null,
    patid int not null,
    primary key (billid),
    medicinecost int CHECK(medicinecost >= 0),
    roomcost int CHECK(roomcost >= 0),
    testcost int CHECK(testcost >= 0),
    foreign key (patid) references patient(pid)
);

create table inpatient
(
    inpatid int not null,
    foreign key (inpatid) references patient(pid),
    roomid int not null,
    foreign key (roomid) references room(roomno),
    admdate date,
    disdate date
);



create table nursegovernsroom
(
    rid int not null,
    nid int not null,
    foreign key (nid) references nurse(nurseid),
    foreign key (rid) references room(roomno)
);

create table patienttakesmedicine
(
    patid int not null,
    mid int not null,
    foreign key (patid) references patient(pid),
    foreign key (mid) references medicine(srno)
);

create table patientistested
(
    patid int not null,
    tid int not null,
    foreign key (patid) references patient(pid),
    foreign key (tid) references test(testid)
);