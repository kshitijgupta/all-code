/*
 * rio.cpp
 *
 *  Created on: Apr 7, 2009
 *      Author: luo
 */

#include "./rio.h"
#include "../../global.h"
#include<iostream>
#include <string.h>
#include <netinet/in.h>
using namespace std;

ssize_t rio_readn(int fd, void* usrbuf, size_t n) {

	size_t nleft = n;
	ssize_t nread;
	char* bufp = (char*) usrbuf;

	while (nleft > 0) {

		if ((nread = read(fd, bufp, nleft)) < 0) {
			if (errno== EINTR) //interrupted by sig handler return
				nread = 0; //and call read() again;
			else
				return -1; //errno set by read()
		} else if (nread == 0) 
			break; // EOF
		nleft -= nread;
		bufp += nread;
	}

	return (n - nleft);
}

ssize_t rio_writen(int fd, void* usrbuf, size_t n) {

    size_t nleft = n;
    ssize_t nwriten;
    char* bufp = (char*) usrbuf;

    while (nleft > 0) {
        if ((nwriten = write(fd, bufp, nleft)) <= 0) {
            if (errno== EINTR) // interrupted by sig handler return
                nwriten = 0; // and call write() again
            else 
                return -1; // errno set by write()
        }
        nleft -= nwriten;
        bufp += nwriten;

    }

    return n;
}
