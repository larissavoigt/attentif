DROP DATABASE IF EXISTS attentif;

CREATE DATABASE attentif;

USE attentif;

CREATE TABLE users(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  facebook_id VARCHAR(30) NOT NULL UNIQUE,
  token TEXT NOT NULL,
  name VARCHAR(255) NOT NULL,
  INDEX(facebook_id)
);

CREATE TABLE entries(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  rate INT UNSIGNED NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO users (facebook_id,token,name) VALUES (0, "abcd", "Friend");

INSERT INTO entries (user_id, rate, description, created_at) VALUES

(1, 30, "Today I was diagnosed with dementia. Receiving a diagnosis can be a difficult and emotional time. The diagnosis came as a shock but it provided answers to the problems I have been having.", "2015-10-02 20:24:13"),

(1, 50, "Today’s is an okay day!", "2015-10-02 11:50:01"),

(1, 100, "A couple of weeks ago, my adopted-daughter got married. There was a wedding and reception in California, followed by a reception in Colorado the following week (where my new son-in-law is from). My Aunt and cousins live in the same Colorado town as Cameron, so between wedding receptions, we drove out to Colorado and vacationed with family while supporting Maurina and Cameron with their family and friends out there. Needless to say, the past few weeks have been super busy, fun, stressful, exciting...such a mix of emotions!! My heart is so happy, love my family.!", "2015-10-02 23:01:00"),

(1, 80, "Last Friday night, we had our first 'big' event for The DEANA Foundation. It was a 'Karaoke For a Cause' night and we hosted it at an adult daycare facility in Riverside. I'm feeling so good about the results of this fundraiser !", "2015-10-03 13:20:50"),

(1, 20, "I'm not writing this post for sympathy. As much as I hate what this disease has done, I am happy. I do not resent that help in the least. Unfortunately, this is a part of life (I would've been happier to deal with it much later in life!) and there are many other families who suffer far worse with their loved ones.", "2015-10-04 10:55:00");
