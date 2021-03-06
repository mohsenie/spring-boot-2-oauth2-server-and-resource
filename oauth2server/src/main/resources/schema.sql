-----------------------------------------H2--------------------------------------------
---------------------------------------------------------------------------------------
--drop table oauth_client_details if exists;
--create table oauth_client_details (
--    client_id varchar(256) primary key,
--    resource_ids varchar(256),
--    client_secret varchar(256),
--    scope varchar(256),
--    authorized_grant_types varchar(256),
--    web_server_redirect_uri varchar(256),
--    authorities varchar(256),
--    access_token_validity integer,
--    refresh_token_validity integer,
--    additional_information varchar(4096),
--    autoapprove varchar(256)
--);
--
--drop table oauth_access_token if exists;
--create table oauth_access_token (
--  token_id VARCHAR(256),
--  token LONGVARBINARY,
--  authentication_id VARCHAR(256) PRIMARY KEY,
--  user_name VARCHAR(256),
--  client_id VARCHAR(256),
--  authentication LONGVARBINARY,
--  refresh_token VARCHAR(256)
--);
--
--drop table oauth_refresh_token if exists;
--create table oauth_refresh_token (
--  token_id VARCHAR(256),
--  token LONGVARBINARY,
--  authentication LONGVARBINARY
--);
--
--drop table users if exists;
--create table users(
--    username varchar_ignorecase(256) not null primary key,
--    password varchar_ignorecase(256) not null,
--    enabled boolean not null
--);
--
--drop table groups if exists;
--create table groups (
--    id bigint generated by default as identity(start with 0) primary key,
--    group_name varchar_ignorecase(50) not null
--);
--
--drop table group_authorities if exists;
--create table group_authorities (
--    group_id bigint not null,
--    authority varchar(50) not null,
--    constraint fk_group_authorities_group foreign key(group_id) references groups(id)
--);
--
--drop table group_members if exists;
--create table group_members (
--    id bigint generated by default as identity(start with 0) primary key,
--    username varchar(50) not null,
--    group_id bigint not null,
--    constraint fk_group_members_group foreign key(group_id) references groups(id)
--);

-------------------------------------------------------------------------------------

--------------------------------------MySQL------------------------------------------
-------------------------------------------------------------------------------------
drop table if exists users;
drop table if exists group_authorities;
drop table if exists group_members;
drop table if exists groups;
drop table if exists oauth_refresh_token;
drop table if exists oauth_access_token;
drop table if exists oauth_client_details;

CREATE TABLE oauth_client_details (
  client_id varchar(255) NOT NULL,
  resource_ids varchar(255) DEFAULT NULL,
  client_secret varchar(255) DEFAULT NULL,
  scope varchar(255) DEFAULT NULL,
  authorized_grant_types varchar(255) DEFAULT NULL,
  web_server_redirect_uri varchar(255) DEFAULT NULL,
  authorities varchar(255) DEFAULT NULL,
  access_token_validity integer(11) DEFAULT NULL,
  refresh_token_validity integer(11) DEFAULT NULL,
  additional_information varchar(255) DEFAULT NULL,
  autoapprove varchar(255) DEFAULT NULL
);


create table `oauth_access_token` (
  token_id VARCHAR(255),
  token LONGBLOB,
  authentication_id VARCHAR(255),
  user_name VARCHAR(255),
  client_id VARCHAR(255),
  authentication LONGBLOB,
  refresh_token VARCHAR(255)
);

create table `oauth_refresh_token`(
  token_id VARCHAR(255),
  token LONGBLOB,
  authentication LONGBLOB
);

create table users(
    id int NOT NULL AUTO_INCREMENT,
    username varchar(256) not null,
    password varchar(256) not null,
    enabled boolean not null,
    PRIMARY KEY (id)
);

drop table if exists groups;
create table groups (
    id bigint NOT NULL AUTO_INCREMENT,
    group_name varchar(50) not null,
    PRIMARY KEY (id)
);

create table group_authorities (
    group_id bigint not null,
    authority varchar(50) not null,
    CONSTRAINT fk_group_authorities_group FOREIGN KEY (group_id)
    REFERENCES groups(id)
);

create table group_members (
    group_id bigint not null,
    username varchar(50) not null,
    CONSTRAINT fk_group_members_group FOREIGN KEY (group_id)
    REFERENCES groups(id)
);