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

(1, 50, "Today I am feeling okay!", "2015-10-02 11:50:01"),

(1, 100, "A couple of weeks ago, my adopted-daughter got married. There was a wedding and reception in California, followed by a reception in Colorado the following week (where my new son-in-law is from). My Aunt and cousins live in the same Colorado town as Cameron, so between wedding receptions, we drove out to Colorado and vacationed with family while supporting Maurina and Cameron with their family and friends out there. Needless to say, the past few weeks have been super busy, fun, stressful, exciting...such a mix of emotions!! My heart is so happy, love my family.!", "2015-10-02 23:01:00"),

(1, 80, "Last Friday night, we had our first 'big' event for The DEANA Foundation. It was a 'Karaoke For a Cause' night and we hosted it at an adult daycare facility in Riverside. I'm feeling so good about the results of this fundraiser !", "2015-10-03 13:20:50"),

(1, 20, "I'm not writing this post for sympathy. As much as I hate what this disease has done, I am happy. I do not resent that help in the least. Unfortunately, this is a part of life (I would've been happier to deal with it much later in life!) and there are many other families who suffer far worse with their loved ones.", "2015-10-04 10:55:00"),

(1, 35, "One of the things I like about writing this diary is remembering the road. I have been feeling a bit melancholy today as this reminds me of what the future holds for me and my family.", "2015-10-05 09:10:54"),

(1, 00, "The reality is that there are no survivors of dementia. It is a disease that ravages a person day by day, inch by inch.", "2015-10-06 03:01:52"),

(1, 90, "Family is everything to me. I'm really glad that we were able to do this together!", "2015-10-07 09:50:10"),

(1, 65, "", "2015-10-08 14:00:00"),

(1, 50, "I'm fine", "2015-10-09 23:55:09"),

(1, 80, "I have an amazing family. I tear up just thinking about how awesome they are. I couldn't have asked for a better way to spend all of these celebrations than with my family. !", "2015-10-10 14:20:00"),

(1, 75, "Today was a great day!", "2015-10-11 21:50:20"),

(1, 15, "But then I am reminded that this is a disease of the brain; when the brain dies, eventually the body will catch up. Even though I know what the future holds, I ask myself, am I ready for that?", "2015-10-12 13:20:03"),

(1, 70, "Last summer, we traveled to Arizona to move my brother (and his family) out of his apartment and into a house. My dad came up with a seemingly great idea: let Joe and Natalie host Thanksgiving this year in their new place.", "2015-10-13 07:30:00"),

(1, 78, "I absolutely love the holiday season. The changing seasons, the chill in the air, the scents of pumpkin and holiday spices, the feeling of gratitude and helping others in need...I love everything about this season-from October until January.", "2015-10-13 10:00:45"),

(1, 65, "While driving to my shopping destinations yesterday, I was alone in my thoughts. It's a rare occasion that I drive anywhere alone; those quiet moments always cause me to pause and reflect.", "2015-10-14 21:00:15"),

(1, 55, "I used to think homeopathy was for a bunch of hippies. In my mind, medicine was the answer to ailments. If natural remedies worked, then why did our ancestors die of so many sicknesses? (On the other hand, I don't think our ancestors had many of the chronic illnesses we now see in our society).", "2015-10-15 19:05:10"),

(1, 40, "", "2015-10-16 14:12:00"),

(1, 15, "Dementia is an emotional roller coaster. There are constantly ups and downs-or should I say downs and even more downs. ", "2015-10-18 20:50:42"),

(1, 88, "Today is the annual Walk To End Alzheimer's in our area. ", "2015-10-19 17:35:12"),

(1, 75, "The past couple of weeks have been somewhat of a whirlwind. Quite frankly, I'm a bit tired and ready for the weekend!!", "2015-10-20 10:20:00"),

(1, 90, "It's been an adventure! I am so thankful for all the friends and family who have helped me in all of this and who have been patient while I work out all the kinks in the schedule.", "2015-10-21 12:30:07"),

(1, 20, "", "2015-10-21 13:23:30"),

(1, 25, "", "2015-10-22 10:12:46"),

(1, 05, "", "2015-10-23 09:33:14"),

(1, 00, "Today, I feel sad. I hold back my tears for fate that awaits my own family.", "2015-10-24 23:58:12"),

(1, 60, "This week has been especially rough", "2015-10-25 11:45:16"),

(1, 10, "One thing that we have learned with this disease is how to be resourceful. Sometimes you've got to roll with the punches and take it one day at a time.", "2015-10-26 20:00:00"),

(1, 78, "I can't quite explain it, but ever since my diagnosis I've had this prompting to be proactive in the dementia community. I think I've shared one experience before, where I had this distinct thought that I could either let this trial overcome me or I could try to learn something from all of this and do something positive in spite of it. ", "2015-10-27 13:20:49"),

(1, 70, "I feel like I'm not alone. I'm looking forward to giving back to my dementia community!!", "2015-10-29 16:06:13"),

(1, 55, "It’s been kind of hard for me to write lately", "2015-10-30 07:12:23"),

(1, 40, "As my disease progresses, my routines and rituals continue to change. One week, I have things figured out. The next week, everything is disrupted.", "2015-10-31 13:25:00");
