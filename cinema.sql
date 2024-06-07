CREATE TABLE "Cinema" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"Name" VARCHAR(50),
"Location" VARCHAR(50) NOT NULL,
"Screen" VARCHAR(50)
);

CREATE TABLE "Screen" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"Capacity" INT,
"Seats" INT,
"CinemaId" UUID,
CONSTRAINT FK_Screen_CinemaId FOREIGN KEY ("CinemaId") REFERENCES "Cinema" ("Id")
);

CREATE TABLE "Seat" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"SeatNumber" INT,
"IsAvable" BIT
);

CREATE TABLE "Movie" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"Title" VARCHAR(50),
"Duration" INT,
"Genre" VARCHAR(50)
);

CREATE TABLE "ShowTime" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"Time" TIME,
"Date" DATE,
"MovieId" UUID,
"ScreenId" UUID,
CONSTRAINT FK_ShowTime_Movie_MovieId FOREIGN KEY ("MovieId") REFERENCES "Movie" ("Id"),
CONSTRAINT FK_ShowTime_Screen_ScreenId FOREIGN KEY ("ScreenId") REFERENCES "Screen" ("Id")
);

CREATE TABLE "Customer" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"Name" VARCHAR(50)
);

CREATE TABLE "Reservation" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"ShowTimeId" UUID,
"CustomerId" UUID,
CONSTRAINT FK_Reservation_ShowTimeId FOREIGN KEY ("ShowTimeId") REFERENCES "ShowTime" ("Id"),
CONSTRAINT FK_Reservation_CustomerId FOREIGN KEY ("CustomerId") REFERENCES "Customer" ("Id")
);

CREATE TABLE "ReservationSeat" (
"Id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
"ReservationId" UUID,
"SeatId" UUID,
"ShowTimeId" UUID,
CONSTRAINT FK_ReservationSeat_Reservation_ReservationId FOREIGN KEY ("ReservationId") REFERENCES "Reservation" ("Id"),
CONSTRAINT FK_ReservationSeat_SeatId FOREIGN KEY ("SeatId") REFERENCES "Seat" ("Id"),
CONSTRAINT FK_ReservationSeat_ShowTime_ShowTimeId FOREIGN KEY ("ShowTimeId") REFERENCES "ShowTime" ("Id")
);

INSERT INTO Cinema VALUES(0, 'Centar za kulturu','Djakovo','D1');
INSERT INTO Cinema VALUES(1, 'Cinestar','Osijek','Cine1');