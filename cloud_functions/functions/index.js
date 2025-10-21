const functions = require('firebase-functions/v1')
const admin = require('firebase-admin')


admin.initializeApp()

exports.pushNotifications = functions.database.ref('/chats/{chatId}/{messageId}')
.onCreate((snap, context) => {
    console.log('New message added')


    const value = snap.val()
    const sentBy = value.sentBy;
    const sentTo = value.sentTo;

    const name = admin.database().ref(`/status/${sentBy}/name`).once('value')
    const token = admin.database().ref(`/status/${sentTo}/token`).once('value')

    Promise.all([name, token]).then( async (values) => {
        const name = values[0].val()
        const token = values[1].val()

        if (token == null) return {error: 'No token'}

        const payload = {
            token: token,
            notification: {
                title: name,
                body: value.message
            }
        }

        try {
             await admin.messaging().send(payload)
            console.log('Successfully message sent');
            return {success: true}
        } catch (error) {
            console.log('Error', error);
            return {error: error.code}
        }
    })

})
