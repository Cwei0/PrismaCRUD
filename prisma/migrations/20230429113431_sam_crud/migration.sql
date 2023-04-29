-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "friendId" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Car" (
    "id" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bought" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Car_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CarBlogs" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "CarBlogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CategoryCarBlogs" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CategoryCarBlogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CarBlogsToCategoryCarBlogs" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_friendId_key" ON "User"("friendId");

-- CreateIndex
CREATE UNIQUE INDEX "Car_userId_key" ON "Car"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_CarBlogsToCategoryCarBlogs_AB_unique" ON "_CarBlogsToCategoryCarBlogs"("A", "B");

-- CreateIndex
CREATE INDEX "_CarBlogsToCategoryCarBlogs_B_index" ON "_CarBlogsToCategoryCarBlogs"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_friendId_fkey" FOREIGN KEY ("friendId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Car" ADD CONSTRAINT "Car_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarBlogs" ADD CONSTRAINT "CarBlogs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CarBlogsToCategoryCarBlogs" ADD CONSTRAINT "_CarBlogsToCategoryCarBlogs_A_fkey" FOREIGN KEY ("A") REFERENCES "CarBlogs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CarBlogsToCategoryCarBlogs" ADD CONSTRAINT "_CarBlogsToCategoryCarBlogs_B_fkey" FOREIGN KEY ("B") REFERENCES "CategoryCarBlogs"("id") ON DELETE CASCADE ON UPDATE CASCADE;
