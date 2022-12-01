import { PrismaClient } from '@prisma/client';

export const toguro = ():string => {
	return `
	<style>p { margin: 0; color: red; }</style>	
	<p> ---- </p>
	<p>|o  o|</p>
	<p>| v  |</p>
	<p>| -- |  TOGURO LIVES</p>
	<p>_|  |_</p>
	`;
};

const prisma = new PrismaClient();

export const getAllUsers = async () => {
	prisma.$connect();

	const users = await prisma.user.findMany();

	prisma.$disconnect();

	return users;
};

export const getUser = async (userName: string) => {
	prisma.$connect();

	const user = await prisma.user.findFirst({
		where: {
			userName: userName,
		},
	});

	prisma.$disconnect();

	return user;
};

export const createUser = async (username: string, password: string) => {
	prisma.$connect();

	console.log(username, password);

	prisma.$disconnect();
};
