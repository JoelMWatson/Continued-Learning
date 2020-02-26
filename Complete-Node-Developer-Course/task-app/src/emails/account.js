const sgMail = require('@sendgrid/mail');

// associate with our key
sgMail.setApiKey(process.env.SENDGRID_API_KEY);

// Welcome Email
const sendWelcomeEmail = (email, name) => {
    sgMail.send({
        to: email,
        from: 'Joel@raincityprogramming.com',
        subject: 'Welcome New User',
        text: `Welcome to the Task App, ${name}. Let me know how you get along with the app.`
    });
};

// Cancellation Email
const sendCancellationEmail = (email, name) => {
    sgMail.send({
        to: email,
        from: 'Joel@raincityprogramming.com',
        subject: 'Sorry To See You Go',
        text: `Goodbye ${name}, we hope to see you again sometime soon. Please let us know if there was any way we could have kept you as a customer.`
    });
};

module.exports = { sendWelcomeEmail, sendCancellationEmail };