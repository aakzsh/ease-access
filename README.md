# easeaccess

An app to help out seniors or anyone to get technical help, no matter how simple or tough it may be.

## Running Locally

Clone the project and create new Firebase credentials for your usage, and then run ```flutter run```

## Work Schema

### User Side

here, the user just need to enter a username. If they're an existing user, they'll be logged in with an email of format username@ease.access. If they're new, a new account will be created for them using the same email. Now on the dashboard, there are 4 direct action buttnons/icons.
1. A user can ask a new question, the question they ask is uploaded on the firestore in the "questions" document, which can later be accessed.
2. A user can view their asked questions, and view answers to them if available. This basically takes all questions and matches which ones were uploaded by the current user on firestore, and hence returns a list for that which is showed to user using ListView.
3. Thirdly, a user can open up common tips page, it has some basic tips that everyone using tech should be aware of.
4. At last, they can logout and their firebase session will end.

### Volunteer Side

Here, a volunteer can view questions and answer them, and that'll let them gain coins (+20 per question answered), which will be visible in the profile section. My next target is to make these coins redeemable for something nice.
The dashboard on volunteer side shows questions that are asked by users, a volunteer can upload text and a video url as the answer to that question, hence earning 20 coins and helping the user. The exisitng question Map on firestore DB is updated with values of answer and video url (video url is optional)
Volunteer can also see their coins collected and the star level they're at, in the profile panel of the app.
