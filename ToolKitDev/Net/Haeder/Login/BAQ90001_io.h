typedef struct _BAQ90001_InRec
{
	char		cust_type[1];		/* "1": 개인, "2": 법인 */ //개인법인
	char		cust_no[16];		/* 고객주번및 사업자번호 */ //주민번호
	char		cust_nm[40];		/* 고객성명 */
}BAQ90001_InRec;

typedef struct _BAQ90001_OutRec
{
	char		username[40];		/* 사용자 성명 */
	char		cust_no[16];		/* 고객주번및 사업자번호 */
	char		sc_existyn[1];		/* 소유, "N":없음 */
	char		sk_dn_yn[1];		/* SignKorea DN 여부 */
	char		dn_existyn[1];		/* DN 정보 존재 유무 */
	char		dspwfailcount[3];	/* 전자인증 비밀번호 오류 횟수 */
	char		dn[256];            /* Distinguished Name */
	char		dn_stat[1];         /* DN 상태 */
//0:유효인증서, 1:폐지인증서, 2:정지인증서
//3:만료인증서, 4:미발급인증서, 5:미등록인증서
//X:DN확인불가(상태조회시 지연처리(중계))
//E:DN확인불가(상태조회시 비상상태(증전))
//T:DN확인불가(상태조회시 비상상태(본사))
}BAQ90001_OutRec;
