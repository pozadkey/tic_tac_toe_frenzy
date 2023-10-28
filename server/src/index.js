const express = require('express');
const http = require('http');

// Start express
const app = express();

//Port
const port = process.env.PORT || 5000;

// Create server
const server = http.createServer(app);

const io = require('socket.io')(server);

//Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json())

//Import DB config
const InitiateMongoServer = require("./config/db");

// Initiate MongoDB 
InitiateMongoServer();

// Connect to socket
io.on('connection', (socket) => {
    console.log('Connected to socket');
    socket.on('createRoom',({ username }) => {
        console.log(username);
    })
});

// Start server
const startServer = () => {
    server.listen(port, (error)=>{
        if (error) throw error.message;
        console.log(`Server is running on port ${port}.`);
    })
}

startServer();


