// routes/room.js
const Room = require('../models/room');

// Create room
module.exports = (io, socket) => {
    socket.on('createRoom',async ({ username }) => {
        console.log(username);
        try {
            // Room is created
            let room = new Room();
            // Player's details
            let player = {
              socketID: socket.id,
              username,
              playerType: 'X',
            };
            // Add  player to room
            room.players.push(player);
            // Room creator to make the first move
            room.turn = player;
            // Save room to DB
            room = await room.save();
            console.log(room);
            const roomId = room._id.toString();
            socket.join(roomId);
            //  Alert room memebers of successfully created room
            io.to(roomId).emit("createRoomSuccess", room);
          } catch (e) {
            console.log(e);
          }
    });
};
