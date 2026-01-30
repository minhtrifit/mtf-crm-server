import { Server, Socket } from 'socket.io';
import { Role } from '@/models/User';

export const registerOrderEvents = (io: Server, socket: Socket) => {
  socket.on('join', ({ role, tableId }) => {
    if (role === Role.ADMIN) {
      socket.join('admin');

      io.to('admin').emit('join:result', {
        message: 'Admin join successfully'
      });
    }

    if (role === Role.USER && tableId) {
      socket.join(`table:${tableId}`);

      io.to(`table:${tableId}`).emit('join:result', {
        message: `User[table:${tableId}] join successfully`
      });
    }
  });
};
