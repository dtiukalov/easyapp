#include <tc.h>
#include <tc_util.h>
#include <windows.h>
	
#include "../shared/itk_utils.h"

extern "C" int webitk_save_file(const char* file_content, char** transient_path) {
	int ifail = ITK_ok;

	char filePath[1000];
	char *tmpDir = NULL;
	int pid = 0;
	FILE *fp = NULL;

	tmpDir = (char *) TC_getenv("TC_TMP_DIR");
	if (!tmpDir || !*tmpDir) {
		tmpDir = (char *) TC_getenv("TMPDIR");
	}
	if (!tmpDir || !*tmpDir) {
		tmpDir = (char *) TC_getenv("TEMP");
	}
#ifdef WIN32
	pid = GetCurrentProcessId();
#else
	pid = getpid();
#endif
	sprintf(filePath, "%s\webitk_save_file.%d.txt", tmpDir, pid);

	fp = fopen(filePath, "w");
	if (!fp) {
		fprintf(stderr, "Can't open [%s] for write!\n", filePath);
		goto CLEANUP;
	}

	fputs(file_content, fp);

	fclose(fp);
	fp = NULL;

	*transient_path = MEM_string_copy(filePath);

	CLEANUP: if (fp)
		fclose(fp);

	EXIT: return ifail;
}

extern "C" int webitk_save_file2(const char* file_content, char** transient_path) {
	int ifail = ITK_ok;

	char filePath[1000];
	char *tmpDir = NULL;
	int pid = 0;
	FILE *fp = NULL;

	tmpDir = (char *) TC_getenv("TC_TMP_DIR");
	if (!tmpDir || !*tmpDir) {
		tmpDir = (char *) TC_getenv("TMPDIR");
	}
	if (!tmpDir || !*tmpDir) {
		tmpDir = (char *) TC_getenv("TEMP");
	}
#ifdef WIN32
	pid = GetCurrentProcessId();
#else
	pid = getpid();
#endif
	sprintf(filePath, "%s\webitk_save_file222.%d.csv", tmpDir, pid);

	fp = fopen(filePath, "w");
	if (!fp) {
		fprintf(stderr, "Can't open [%s] for write!\n", filePath);
		goto CLEANUP;
	}

	fputs(file_content, fp);

	fclose(fp);
	fp = NULL;

	*transient_path = MEM_string_copy(filePath);

	CLEANUP: if (fp)
		fclose(fp);

	EXIT: return ifail;
}
