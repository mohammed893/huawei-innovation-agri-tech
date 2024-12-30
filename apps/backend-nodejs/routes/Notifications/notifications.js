const express = require('express');
const notifyRouter = express.Router();
const { notifyAppointmentChange, notifyPaymentStatus } = require('../../middleware/socket.controller');

// Route to notify when an appointment status changes
notifyRouter.post('/appointment', (req, res) => {
    const { doctor_id, patient_id, status } = req.body; // status = { booked / rescheduled / canceled}
    const appointmentDetails = { doctor_id, patient_id, status };
    notifyAppointmentChange(appointmentDetails);  // Send notification for appointment status change
    return res.status(200).send('Appointment notification sent');
});

// Route to notify when payment status changes
notifyRouter.post('/payment', (req, res) => {
    const { id, paymentStatus } = req.body; // paymentStatus = { successful / failed }
    notifyPaymentStatus(id, paymentStatus);  // Send notification for payment status change
    return res.status(200).send('Payment status notification sent');
});

module.exports = {notifyRouter};