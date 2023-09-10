/*
 Navicat Premium Data Transfer

 Source Server         : SIT
 Source Server Type    : PostgreSQL
 Source Server Version : 150003 (150003)
 Source Host           : 43.229.132.128:5432
 Source Catalog        : user-db
 Source Schema         : register

 Target Server Type    : PostgreSQL
 Target Server Version : 150003 (150003)
 File Encoding         : 65001

 Date: 21/08/2023 16:19:23
*/

CREATE SCHEMA IF NOT EXISTS register;

-- ----------------------------
-- Table structure for otp_verify_logs
-- ----------------------------
DROP TABLE IF EXISTS "register"."otp_verify_logs";
CREATE TABLE "register"."otp_verify_logs" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "receiver" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "otp" varchar(20) COLLATE "pg_catalog"."default",
  "reference" varchar(20) COLLATE "pg_catalog"."default",
  "status" bool NOT NULL DEFAULT false,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) DEFAULT now()
)
;

-- ----------------------------
-- Records of otp_verify_logs
-- ----------------------------
INSERT INTO "register"."otp_verify_logs" VALUES ('4489ebc6-0d7e-49f8-a2c9-079bece5aa83', 'MOBILE', '+66940000001', '123456', 'hDaFHvWf', 'f', '2023-08-17 16:13:51.184315+00', '2023-08-17 16:13:51.184315+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('e363aedb-65f1-4734-b3a8-c3b28a2fe07e', 'EMAIL', 'user+01@gmail.com', '123456', '123456', 'f', '2023-08-17 16:13:49.370143+00', '2023-08-17 16:13:49.370143+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('b6140526-98e7-47ef-ba5b-2a26899aa5fd', 'EMAIL', 'earth+01@gritthailand.com', '682516', 'xbTogTwW', 'f', '2023-08-20 19:49:43.218239+00', '2023-08-20 20:17:09.329208+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('0472d1bd-28e0-4c7e-85db-b94ff638b811', 'EMAIL', 'admin@gritthailand.com', '182810', 'gCgcRYyJ', 'f', '2023-08-17 10:41:00+00', '2023-08-21 05:03:33.633435+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('a8cac574-7839-4ff2-9db8-622122a83a18', 'EMAIL', 'admin.prp@gritthailand.com', '653043', 'QkESxmOS', 'f', '2023-08-21 05:03:49.987559+00', '2023-08-21 06:22:24.616738+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('4734fa8e-894b-4183-a523-5b445a2a65c5', 'MOBILE', '+66999624914', '794125', 'FrrIsUFy', 'f', '2023-08-21 06:10:24.547948+00', '2023-08-21 06:22:25.847905+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('80b8356b-4191-401b-b903-3985199755eb', 'MOBILE', '+037792169719', '476182', 'jlfygxsB', 'f', '2023-08-21 07:53:38.323845+00', '2023-08-21 07:53:38.323845+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('4fb431e6-3eb5-49e5-a9c1-2d00e6e99f63', 'MOBILE', '+637792169719', '435318', 'bKKLprPH', 'f', '2023-08-21 07:53:47.378728+00', '2023-08-21 07:53:47.378728+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('241719a7-06b7-48a3-b731-643b25df3c9f', 'EMAIL', 'peerapon.prp@gmail.com', '216217', 'qMsmzoxc', 'f', '2023-08-21 07:53:36.623894+00', '2023-08-21 07:53:59.652145+00');
INSERT INTO "register"."otp_verify_logs" VALUES ('79022036-4352-4ffa-94be-d569640f4e3b', 'MOBILE', '+66941896377', '651817', 'MYeCHZwe', 'f', '2023-08-17 10:41:00+00', '2023-08-21 07:54:00.691495+00');

-- ----------------------------
-- Indexes structure for table otp_verify_logs
-- ----------------------------
CREATE UNIQUE INDEX "reference_UNIQUE" ON "register"."otp_verify_logs" USING btree (
  "reference" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table otp_verify_logs
-- ----------------------------
ALTER TABLE "register"."otp_verify_logs" ADD CONSTRAINT "PK_690beee5bf538c74468b377a7f8" PRIMARY KEY ("id");
