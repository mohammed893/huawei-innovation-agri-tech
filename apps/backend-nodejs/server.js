const express = require('express');
const friendsRouter = require('./Routes/friends.router');
const MessageRouter = require('./Routes/messages.router');
const app = express();
const PORT = 3000;

//start time 
app.use((req , res , next) => {
    const start = Date.now();
    next();
    const delta = Date.now() - start;
    console.log(`${req.method}${req.baseUrl} ${req.url} ${delta}ms`);
});
app.use(express.json());
app.use('/site' , express.static('public'));
app.use('/friends', friendsRouter);
app.use('/messages',MessageRouter)
app.listen(PORT , () => {
    console.log(`Listening on port ${PORT} ...`);
})
