import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const getUsers = async () => {
	return await prisma.user.findMany()
};
