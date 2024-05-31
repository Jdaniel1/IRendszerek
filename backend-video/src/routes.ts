import express from 'express';
import { BorrowController } from './Controller/borrow.controller';
import { CassetteController } from './Controller/cassette.controller';
import { DvdController } from './Controller/dvd.controller';
import { MemberController } from './Controller/member.controller';
import { UserController } from './Controller/user.controller';
import { checkUser } from './protect-routes';

export function getRoutes(): express.Router{
    const router = express.Router();

    const borrowController = new BorrowController();
    const cassetteController = new CassetteController();
    const dvdController = new DvdController();
    const memberController = new MemberController();
    const userController = new UserController(); 

    router.get('/borrow', borrowController.getAll);
    router.get('/borrow/:id', borrowController.getOne);
    router.post('/borrow', checkUser, borrowController.create);
    router.put('/borrow/:id', checkUser, borrowController.update);
    router.delete('/borrow/:id', checkUser, borrowController.delete);

    router.get('/cassette', cassetteController.getAll);
    router.get('/cassette/:id', cassetteController.getOne);
    router.post('/cassette', checkUser, cassetteController.create);
    router.put('/cassette/:id', checkUser, cassetteController.update);
    router.put('/cassette/:id/status', checkUser, cassetteController.update);
    router.delete('/cassette/:id', checkUser, cassetteController.delete);

    router.get('/dvd', dvdController.getAll);
    router.get('/dvd/:id', dvdController.getOne);
    router.post('/dvd', checkUser, dvdController.create);
    router.put('/dvd/:id', checkUser, dvdController.update);
    router.put('/dvd/:id/status', checkUser, dvdController.update);
    router.delete('/dvd/:id', checkUser, dvdController.delete);

    router.get('/member', memberController.getAll);
    router.get('/member/:id', memberController.getOne);
    router.post('/member', checkUser, memberController.create);
    router.put('/member/:id', checkUser, memberController.update);
    router.put('/member/:id/status', checkUser, memberController.update);
    router.delete('/member/:id', checkUser, memberController.delete);

    router.get('/user', userController.getAll);
    router.get('/user/:id', userController.getOne);
    router.post('/user', userController.create);
    router.post('/user/login', userController.login);

    return router;
}