#ifndef ITK_UTILS_H
#define ITK_UTILS_H

#include <tc.h>
#include <emh.h>
#include <emh_errors.h>

#ifdef __cplusplus
#include <fclasses/ifail.hxx>
#include <fclasses/ResultCheck.hxx>
extern "C" {
#endif

#ifdef ITKCALL
# undef ITKCALL
#endif

#define ARRAY_SIZE(a) (sizeof((a))/sizeof(a[0]))

#define ITKCALL(x)   \
{   \
	char *err_string = NULL;   \
	if((ifail = (x)) != ITK_ok)   \
	{    \
		if(EMH_ask_error_text (ifail, &err_string)) goto EXIT;   \
		TC_write_syslog("[ERROR] %d ERROR MSG: %s.\n", ifail, err_string);   \
		TC_write_syslog("[ERROR] Function: %s FILE: %s LINE: %d\n",#x, __FILE__, __LINE__);   \
		fprintf(stderr, "[ERROR] %d ERROR MSG: %s.\n", ifail, err_string);   \
		fprintf(stderr, "[ERROR] Function: %s FILE: %s LINE: %d\n",#x, __FILE__, __LINE__);   \
		if (err_string != NULL) MEM_free (err_string);   \
		goto CLEANUP;   \
	}   \
}

#define LOGITKCALL(x)   \
{   \
	char *err_string = NULL;   \
	if((ifail = (x)) != ITK_ok)   \
	{    \
		if(EMH_ask_error_text (ifail, &err_string)) goto EXIT;   \
		TC_write_syslog("[ERROR] %d ERROR MSG: %s.\n", ifail, err_string);   \
		TC_write_syslog("[ERROR] Function: %s FILE: %s LINE: %d\n",#x, __FILE__, __LINE__);   \
		fprintf(stderr, "[ERROR] %d ERROR MSG: %s.\n", ifail, err_string);   \
		fprintf(stderr, "[ERROR] Function: %s FILE: %s LINE: %d\n",#x, __FILE__, __LINE__);   \
		if (err_string != NULL) MEM_free (err_string);   \
	}   \
}

#define ITKFREE(x)  \
	{if(x) { MEM_free(x); x = NULL; }}

#define ITKFREEALL(x, n) \
	{if(n>0 && x) { \
		for(int i=0; i<n; i++) { if(x[i]) MEM_free(x[i]); } \
		MEM_free(x); x = NULL; \
	}}

#define USERERR(m) \
{ \
	ifail = 919999; \
	EMH_store_error_s1( EMH_severity_user_error, ifail, m); \
	TC_write_syslog("[ERROR] %d User Error: %s.\n", ifail, m);   \
	TC_write_syslog("[ERROR] FILE: %s LINE: %d\n", __FILE__, __LINE__);   \
	fprintf(stderr, "[ERROR] %d User Error: %s.\n", ifail, m);   \
	fprintf(stderr, "[ERROR] FILE: %s LINE: %d\n", __FILE__, __LINE__);   \
	goto CLEANUP; \
}

#define FUSERERR(f, ...) \
{ \
	char m[5000]; \
	ifail = 919999; \
	sprintf(m, f, __VA_ARGS__); \
	EMH_store_error_s1( EMH_severity_user_error, ifail, m); \
	TC_write_syslog("[ERROR] %d User Error: %s.\n", ifail, m);   \
	TC_write_syslog("[ERROR] FILE: %s LINE: %d\n", __FILE__, __LINE__);   \
	fprintf(stderr, "[ERROR] %d User Error: %s.\n", ifail, m);   \
	fprintf(stderr, "[ERROR] FILE: %s LINE: %d\n", __FILE__, __LINE__);   \
	goto CLEANUP; \
}
static int UserFail(const char* f, ...) {
	va_list va;
	int ifail = 919999;
	char m[5000];
	va_start(va,f);
	vsprintf(m, f, va);
	va_end(va);
	EMH_store_error_s1(EMH_severity_user_error, ifail, m);
	return ifail;
}

#ifdef __cplusplus
}
#endif

#endif // ITK_UTILS_H
