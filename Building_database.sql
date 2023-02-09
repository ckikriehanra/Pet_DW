USE [Pet_finder_DW];

CREATE TABLE State_DIM(
	State_key INT IDENTITY(1, 1) NOT NULL,
	State VARCHAR(255)
);

ALTER TABLE [dbo].[State_DIM]
ADD CONSTRAINT PK_State_DIM PRIMARY KEY (State_key);


CREATE TABLE Rescuer_DIM(
	RescuER_key INT IDENTITY(1, 1) NOT NULL,
	RescuER_ID INT
);

ALTER TABLE [dbo].[Rescuer_DIM]
ADD CONSTRAINT PK_Rescuer_DIM PRIMARY KEY(RescuER_key);


DROP TABLE [dbo].[Pet_DIM];
CREATE TABLE Pet_DIM(
	Pet_key INT IDENTITY(1, 1) NOT NULL,
	Pet_type VARCHAR(3),
	Breed1 VARCHAR(255),
	Breed2 VARCHAR(255),
	Gender VARCHAR(6),
	Color1 VARCHAR(255),
	Color2 VARCHAR(255),
	Color3 VARCHAR(255),
	Maturity_size VARCHAR(13),
	Fur_length VARCHAR(13),
	Vaccinated VARCHAR(8),
	Dewormed VARCHAR(8),
	Sterilized VARCHAR(8),
	Health VARCHAR(14)
);

ALTER TABLE [dbo].[Pet_DIM]
ADD CONSTRAINT PK_Pet_DIM PRIMARY KEY (Pet_key);


DROP TABLE Pet_periodic_FACT_table;
CREATE TABLE Pet_periodic_FACT_table(
	Pet_FACT_key INT IDENTITY(1, 1) NOT NULL,
	Pet_key INT,
	Rescuer_key INT,
	State_key INT ,
	Age TINYINT,
	Quantity TINYINT,
	Fee SMALLINT,
	Pet_Start_date DATETIME,
	Pet_End_date DATETIME
);

ALTER TABLE Pet_periodic_FACT_table
ADD CONSTRAINT PK_Pet_periodic_FACT_table PRIMARY KEY (Pet_FACT_key);

ALTER TABLE [dbo].[Pet_periodic_FACT_table]
ADD CONSTRAINT FK_Pet_periodic_FACT_table_to_Pet_DIM FOREIGN KEY (Pet_key) REFERENCES [dbo].[Pet_DIM](Pet_key);
ALTER TABLE [dbo].[Pet_periodic_FACT_table]
ADD CONSTRAINT FK_Pet_periodic_FACT_table_to_State_DIM FOREIGN KEY (State_key) REFERENCES [dbo].[State_DIM](State_key);
ALTER TABLE [dbo].[Pet_periodic_FACT_table]
ADD CONSTRAINT FK_Pet_periodic_FACT_table_to_Rescuer_DIM FOREIGN KEY (Rescuer_key) REFERENCES [dbo].[Rescuer_DIM](Rescuer_key);
