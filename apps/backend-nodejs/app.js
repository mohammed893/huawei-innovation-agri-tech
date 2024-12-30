const express = require('express');
const {router} = require('./routes/Authentication/Auth');
const {doctorRouter} = require('./routes/Doctor/Doctors');
const {patientRouter} = require('./routes/patient/Patient');
const {AppointmentRouter} = require('./routes/Appointment/appointment');
const {notifyRouter} = require('./routes/Notifications/notifications');
const {generateDailyChannels} = require('./routes/videoSessions/agoraCronJob');
const paymobRouter = require('./routes/Payment/paymob')
const cors = require('cors');
const morgan = require('morgan');

const app = express();
app.use(express.json());
require('dotenv').config();
app.use(express.urlencoded({ extended: true }));
app.use(cors({
    origin: 'http://localhost:5000'
}));

app.use(morgan('combined'));

app.use('/auth', router);
app.use('/doctors', doctorRouter );
app.use('/patients', patientRouter );
app.use('/appointments', AppointmentRouter);
app.use('/notify', notifyRouter);
app.use('/paymob', paymobRouter)


generateDailyChannels();

module.exports = app;
