import { urlencoded } from 'body-parser';
import * as exp from 'express';
import { toguro, getAllUsers, getUser, createUser } from './utils/helpers';

const app = exp.default();

app.use(urlencoded({ extended: true }));

app.get('/getAllUsers', async (req, res) => {
	const users = await getAllUsers();

	return res.send(users);
});

app.get('/getUser', async (req, res) => {
	const query = String(req.query.username);

	const user = await getUser(query);

	if (!user) {
		return res.sendStatus(404);
	}

	return res.send({
		userName: user?.userName,
		userDiscord: user?.userDiscord,
	});
});

app.post('/createUser', (req, res) => {
	createUser(req.body.username, req.body.password);
	return res.sendStatus(200);
});

// 3e397b06-767a-4ec2-943e-f509dc5a7c17

app.get('/toguro', (req, res) => {
	res.send(toguro());
});

const port = 3333;

app.listen(port, () => {
	console.log(`Ouvindo no port ${port}`);
});
