#define _CRT_SECURE_NO_DEPRECATE��

#include <stdio.h>
#include <string.h>

#include <sys/types.h>
#include <sys/stat.h>

//����ͨ����Ҫ������ͷ�ļ�����Ҫ���صĿ��ļ�
#include <WinSock2.h>
#pragma comment(lib, "WS2_32.lib")

#define PRINTF(str) printf("[%s - %d]"#str"=%s\n", __func__, __LINE__, str);

void error_die(const char* str) {
	perror(str);
	exit(1);
}
//ʵ�������ʼ��
//����ֵ���׽��֣����������׽��֣�
//�˿�
//������port��ʾ�˿�
int startup(unsigned short* port) {
	//1.����ͨ�ŵĳ�ʼ��
	WSADATA data;
	int ret = WSAStartup(
		MAKEWORD(1, 1),     //1.1�汾��Э��
		&data);
	if (ret) {
		//ret ��= 0
		//return -1;
		error_die("WSAStartup");
	}

	//2.�����׽���
	int server_socket = socket(PF_INET,//�׽�������
		SOCK_STREAM,//������
		IPPROTO_TCP);
	if (server_socket == -1) {
		//��ӡ������ʾ������������
		error_die("�׽���");
	}

	//3.���ö˿ڿɸ���
	int opt = 1;
	ret = setsockopt(server_socket, SOL_SOCKET, SO_REUSEADDR,
		(const char*)&opt, sizeof(opt));
	if (ret == -1) {
		error_die("setsockopt");
	}

	//���÷������˵������ַ
	struct sockaddr_in server_addr;
	memset(&server_addr, 0, sizeof(server_addr));
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(*port);
	server_addr.sin_addr.s_addr = 0;

	//���׽���
	if (bind(server_socket, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
		error_die("bind");
	}

	//��̬����˿�
	int nameLen = sizeof(server_addr);
	if (*port == 0) {
		if (getsockname(server_socket, (struct sockaddr*)&server_addr, &nameLen) < 0) {
			error_die("getsockname");
		}
		*port = server_addr.sin_port;
	}

	//������������
	if (listen(server_socket, 5) < 0) {
		error_die("error_die");
	}

	return server_socket;
}


//��ָ���Ŀͻ����׽���sock����ȡһ�����ݣ����浽buff��
//����ʵ�ʶ�ȡ�����ֽ���
int get_line(int sock, char* buff, int size) {
	char c = 0;
	int i = 0;

	// \r\n
	while (i < size - 1 && c != '\n') {
		int n = recv(sock, &c, 1, 0);
		if (n > 0) {
			if (c == '\r') {
				n = recv(sock, &c, 1, MSG_PEEK);
				if (n > 0 && c == '\n') {
					recv(sock, &c, 1, 0);
				}
				else {
					c = '\n';
				}
			}
			buff[i++] = c;
		}
		else {
			c = '\n';
		}
	}

	buff[i] = 0;
	return i;
}

void unimplement(int client) {
	//��ָ�����׽��֣�����һ����ʾ��û��ʵ�ֵĴ���ҳ��

}

void not_found(int client) {
	//ʲôʱ�򲻴��� 404
	char buff[1024];

	strcpy(buff, "HTTP/1.0 404 NOT FOUND\r\n");
	send(client, buff, strlen(buff), 0);

	strcpy(buff, "Server: YrHttpd/0.1\r\n");
	send(client, buff, strlen(buff), 0);

	strcpy(buff, "Conten-type:text/html\r\n");
	send(client, buff, strlen(buff), 0);

	strcpy(buff, "\r\n");
	send(client, buff, strlen(buff), 0);

	//����404��ҳ����
	sprintf(buff,
	"<HTML>                      \
	    <TITLE>NOT FOUND</TITLE>  \
		<BODY>                    \
		   <H1> NOT FOUND </H1>   \
		</BODY>                   \
    </HTML>"
	);
	send(client, buff, strlen(buff), 0);
	

}

void headers(int client) {  // const char* type
	//������Ӧ����ͷ��Ϣ
	char buff[1024];

	strcpy(buff, "HTTP/1.0 200 OK\r\n");
	send(client, buff, strlen(buff), 0);

	strcpy(buff, "Server: YrHttpd/0.1\r\n");
	send(client, buff, strlen(buff), 0);

	//sprintf(buff, "Content-type: %s\r\n", type);
	//send(client, buff, strlen(buff), 0);

	strcpy(buff, "Conten-type:text/html\r\n");
	send(client, buff, strlen(buff), 0);

	strcpy(buff, "Conten-type:image\r\n");
	send(client, buff, strlen(buff), 0);

	strcpy(buff, "\r\n");
	send(client, buff, strlen(buff), 0);

}

void cat(int client, FILE* resource) {
	char buff[4096];
	int count = 0;

	while (1){
		int ret = fread(buff, sizeof(char), sizeof(buff), resource);
		if (ret <= 0) {
			break;
		}
		send(client, buff, ret, 0);
		count += ret;
	}
	
	printf("һ������[%d]�ֽڸ������\n", count);
}

const char* getHeadType(const char* fileName) {
	const char* ret = "text/html";
	const char* p = strrchr(fileName, '.');
	if (!p) return ret;

	p++;
	if (!strcmp(p, "css")) ret = "text/css";
	else if (!strcmp(p, "jpg")) ret = "image/jpeg";
	else if (!strcmp(p, "png")) ret = "image/png";
	else if (!strcmp(p, "js")) ret = "application/x-javascript";

	return ret;
}

void server_file(int client, const char* fileName) {
	int numchars = 1;
	char buff[1024];

	//���������ݰ���ʣ�������ж���
	while (numchars > 0 && strcmp(buff, "\n")) {
		numchars = get_line(client, buff, sizeof(buff));
		PRINTF(buff);
	}

	FILE* resource = NULL;  //fopen(fileName, "r");
	if (strcmp(fileName, "htdocs/index.html") == 0) {
		resource = fopen(fileName, "r");
	}
	else {
		resource = fopen(fileName, "rb");
	}


	if (resource == NULL) {
		not_found(client);
	}
	else {
		
		//��ʽ������Դ�������
		headers(client, getHeadType(fileName));

		//�����������Դ��Ϣ
		cat(client, resource);

		printf("�ļ���Դ�������!\n");
	}
	
	fclose(resource);
}


//�����û�������̺߳���
DWORD WINAPI accept_request(LPVOID arg) {
	char buff[1024];       //1k

	int client = (SOCKET)arg;//�ͻ����׽���

	//��ȡһ������
	int numchars = get_line(client, buff, sizeof(buff));
	PRINTF(buff);

	char method[255];  
	int j = 0, i=0;
	while (!isspace(buff[j]) && i < sizeof(method) - 1) {
		method[i++] = buff[j++];
	}
	method[i] = 0;
	PRINTF(method);

	//�������ķ��������������Ƿ�֧��
	if (_stricmp(method, "GET") && _stricmp(method, "POST")) {
		//�����������һ��������ʾҳ��
		unimplement(client);
		return 0;
	}
		
	//������Դ�ļ���·��
	char url[255];//�洢�������Դ������·��
	i = 0;
	//������Դ·��ǰ��Ŀո�
	while (isspace(buff[j]) && j < sizeof(buff)) j++;

	while (!isspace(buff[j]) && i < sizeof(url) - 1 && j < sizeof(buff)) {
		url[i++] = buff[j++];
	}
	url[i] = 0;
	PRINTF(url); 

	char path[512] = "";
	sprintf(path, "htdocs%s", url);
	if (path[strlen(path) - 1] == '/') {
		strcat(path, "index.html");
	}
	PRINTF(path);

	struct stat status;
	if (stat(path, &status) == -1) {
		//�������ʣ�����ݶ�ȡ���
		while (numchars > 0 && strcmp(buff, "\n")) {
			numchars = get_line(client, buff, sizeof(buff));
		}

		not_found(client);
	}
	else {
		if ((status.st_mode & S_IFMT) == S_IFDIR) {
			strcat(path, "/index.html");
		}

		server_file(client, path);
	}


	closesocket(client);
	return 0;
}

int main(void) {
	unsigned short port = 80;
	//���*port��ֵ��0�����Զ�����˿�
	int server_sock = startup(&port);
	printf("httpd�������Ѿ����������ڼ��� %d �˿�...", port);

	struct sockaddr_in client_addr;
	int client_addr_len = sizeof(client_addr);

	while (1) {
		//����ʽ�ȴ��û�ͨ��������������
		//struct sockaddr_in client_addr;
		//int client_addr_len = sizeof(client_addr);
		int client_sock = accept(server_sock, (struct sockaddr*)&client_addr, &client_addr_len);
		if (client_sock == -1) {
			error_die("accept");
		}

		//����һ���µ��߳�
		DWORD threadId = 0;
		CreateThread(0, 0, accept_request, (void*)client_sock, 0, &threadId);

	}

	closesocket(server_sock);
	return 0;
}