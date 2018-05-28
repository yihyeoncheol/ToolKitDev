#ifndef __AppVersion__
#define __AppVersion__
typedef struct
{
	char	ver_opt		  [1];		/* 버전옵션
                                     '1':iPhone
                                     '2':android */
}VERSION_IN;

typedef struct
{
	char	version     [3];      /* 	버전			*/
	char	level1      [3];      /* 	레벨1		*/
	char	level2		[3];      /* 	레벨2		*/
	char	chng_dt		[8];      /* 	변경일자		*/
}VERSION_OUT;

#endif