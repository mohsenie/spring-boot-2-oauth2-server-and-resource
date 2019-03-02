--
--Generate Bcrypt password using https://https://bcrypt-generator.com/
--
INSERT INTO
  oauth_client_details (
    client_id,
    client_secret,
    resource_ids,
    scope,
    authorized_grant_types,
    authorities,
    access_token_validity,
    refresh_token_validity
  )
VALUES
  (
    'client_username',
    '$2a$08$In9aRt5meFFMXaZuurwWreAVMexRTCOW6.ywvtaGbbnLM1XgP.Yma', -- password is bcrypted value of 'pass123'
    'my_resource_1',
    'read,write',
    'authorization_code,check_token,refresh_token,password',
    'ROLE_CLIENT',
    25000,
    500000
  );


INSERT INTO users (username,password,enabled) VALUES ('mohsen', '$2a$08$LpEVGMqc52rVOtmgrlJqFuoToqOfgr6QCY2qke7CnXw0LTI9jz3uC', TRUE); -- password = mypass123
INSERT INTO users (username,password,enabled) VALUES ('anna','$2a$08$Fw60p2xqqq6fRl.8QEoCV.jhrLs2UykQpwpVVVrYOv9YxCKrwr8xG', TRUE); -- password = mypass152

INSERT INTO groups (id, group_name) VALUES (1, 'RESOURCE_USER_AND_ADMIN_GROUP');
INSERT INTO groups (id, group_name) VALUES (2, 'RESOURCE_USER_ONLY_GROUP');

INSERT INTO group_authorities (group_id, authority) VALUES (1, 'AUTHORIZED_RESOURCE_ADMIN');
INSERT INTO group_authorities (group_id, authority) VALUES (1, 'AUTHORIZED_RESOURCE_USER');
INSERT INTO group_authorities (group_id, authority) VALUES (2, 'AUTHORIZED_RESOURCE_USER');

INSERT INTO group_members (username, group_id) VALUES ('mohsen', 1);
INSERT INTO group_members (username, group_id) VALUES ('anna', 2);
