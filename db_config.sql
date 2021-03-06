/*
	Database	: db_config.db

        The MIT License (MIT)

        Copyright (c) 2015 Andrew O'Connell

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.


*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for "main"."config"
-- ----------------------------
DROP TABLE "config";
CREATE TABLE "config" (
"logInterval"  INTEGER NOT NULL DEFAULT 5,
"transferInterval"  INTEGER NOT NULL DEFAULT 30,
"dsTotal"  INTEGER NOT NULL DEFAULT 0,
"dpTotal"  INTEGER NOT NULL DEFAULT 0,
"alignedData"  INTEGER NOT NULL DEFAULT 0
);

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO "config" VALUES (5, 15, 2, 4);

-- ----------------------------
-- Table structure for "main"."dataPoint"
-- ----------------------------
DROP TABLE "dataPoint";
CREATE TABLE "dataPoint" (
"id"  INTEGER NOT NULL,
"deviceId"  INTEGER NOT NULL,
"name"  TEXT,
"regAddress"  INTEGER NOT NULL,
"regType"  INTEGER NOT NULL,
"modbusCode"  INTEGER NOT NULL,
"scale"  INTEGER NOT NULL DEFAULT 0,
"scaleValue"  REAL NOT NULL DEFAULT 1,
"offset"  REAL NOT NULL DEFAULT 0,
"writeValue"  INTEGER,
PRIMARY KEY ("id" ASC)
);

-- ----------------------------
-- Records of dataPoint
-- ----------------------------
INSERT INTO ""."dataPoint" VALUES (1, 1, 'Freq', 2, 2, 4, null, 0, 1.0, 17.0);
INSERT INTO ""."dataPoint" VALUES (2, 2, 'Write', 9, 1, 6, 991, 0, 0.0, 0.0);
INSERT INTO ""."dataPoint" VALUES (3, 2, 'L2-N', 4, 8, 4, null, 0, 10.0, 0.0);
INSERT INTO ""."dataPoint" VALUES (4, 2, 'L1-N', 6, 5, 4, null, 0, 1.0, 0.0);

-- ----------------------------
-- Table structure for "main"."dataSource"
-- ----------------------------
DROP TABLE "main"."dataSource";
CREATE TABLE "dataSource" (
"deviceId"  INTEGER NOT NULL,
"deviceType"  INTEGER NOT NULL DEFAULT 1,
"deviceTimeout"  INTEGER NOT NULL DEFAULT 5,
"deviceName"  TEXT NOT NULL,
"modbusId"  INTEGER NOT NULL,
"interface"  TEXT NOT NULL DEFAULT ttyS0,
"baudRate"  INTEGER NOT NULL DEFAULT 0,
"parity"  TEXT NOT NULL DEFAULT 0,
"dataBits"  INTEGER NOT NULL DEFAULT 0,
"stopBit"  INTEGER NOT NULL DEFAULT 0,
PRIMARY KEY ("deviceId" ASC)
);

-- ----------------------------
-- Records of dataSource
-- ----------------------------
INSERT INTO ""."dataSource" VALUES (1, 'DINTEGRA1', 1, '/dev/ttyS1', 9600, 'N', 8, 1, 1, 7);
INSERT INTO ""."dataSource" VALUES (2, 'ModbusTCP', 1, '192.168.1.30', 0, 0, 0, 0, 2, 7);

-- ----------------------------
-- Table structure for "main"."server"
-- ----------------------------
DROP TABLE "main"."server";
CREATE TABLE "server" (
"server"  TEXT(255) NOT NULL,
"data"  TEXT(255) NOT NULL,
"error"  TEXT(255) NOT NULL,
"updates"  TEXT(255) NOT NULL
);

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO ""."server" VALUES ('192.168.1.16', '/data', '/error', '/updates');
