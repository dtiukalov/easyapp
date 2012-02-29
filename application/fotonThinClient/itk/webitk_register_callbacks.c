#include <tc/tc.h>
#include <tccore/custom.h>
#include <server_exits/user_server_exits.h>
#include <epm/epm.h>

#include "shared/itk_utils.h"

extern int webitk_save_file(const char* file_content, char** transient_path);
extern int webitk_save_file2(const char* file_content, char** transient_path);

static int webitk_handle_string(int *decision, va_list args) {
	int ifail = ITK_ok;

	int input_code; /* <I> */
	const char* input_string; /* <I> */
	int* output_code; /* <O> */
	char** output_string; /* <OF> */

	*decision = ALL_CUSTOMIZATIONS;

	input_code = va_arg(args, int);
	input_string = va_arg(args, char*);
	output_code = va_arg(args,int*);
	output_string = va_arg(args,char**);

	fprintf(stderr, " ****** web invoked itk code=%3d, string=[%s] \n", input_code,
			input_string);

	*output_code = 0;
	*output_string = NULL;

	switch (input_code) {
	case 101: // save file
	//	*decision = ONLY_CURRENT_CUSTOMIZATION; // recognized here, don't further call other custom libraries
		*output_code = ifail = webitk_save_file(input_string, output_string);
		break;
	case 102: // save file
//		*decision = ONLY_CURRENT_CUSTOMIZATION; // recognized here, don't further call other custom libraries
		*output_code = ifail = webitk_save_file2(input_string, output_string);
		break;
	default:
		// not recognized, leave it to other custom libraries
		break;
	}

	CLEANUP: EXIT: return ifail;
}

static int webitk_handle_taglist(int *decision, va_list args) {
	int ifail = ITK_ok;

	int input_code; /* <I> */
	const char* input_string; /* <I> */
	tag_t input_tag; /* <I> */
	tag_t* output_tag; /* <O> */
	char** output_string; /* <OF> */
	int* output_count; /* <O> */
	tag_t** output_taglist; /* <OF> output_count */

	*decision = ALL_CUSTOMIZATIONS;

	input_code = va_arg(args, int);
	input_string = va_arg(args, char*);
	input_tag = va_arg(args,tag_t);
	output_tag = va_arg(args,tag_t*);
	output_string = va_arg(args,char**);
	output_count = va_arg(args,int*);
	output_taglist = va_arg(args,tag_t**);

	fprintf(stderr, " ** web invoked itk code=%3d, string=[%s], tag=%8d \n",
			input_code, input_string, input_tag);

	*output_tag = NULLTAG;
	*output_string = NULL;
	*output_count = 0;
	*output_taglist = NULL;

	switch (input_code) {
	default:
		// not recognized, leave it to other custom libraries
		break;
	}

	CLEANUP: EXIT: return ifail;
}

static int register_callbacks(const char* libname) {
	int ifail = ITK_ok;

	fprintf(stderr, " ** Registering callbacks for %s ... \n", libname);

	ITKCALL(CUSTOM_register_exit(libname, "USER_invoke_user_code_string", (CUSTOM_EXIT_ftn_t) webitk_handle_string));
	ITKCALL(CUSTOM_register_exit(libname, "USER_invoke_user_code_taglist", (CUSTOM_EXIT_ftn_t) webitk_handle_taglist));

	CLEANUP: EXIT: return ifail;
}

/**
 * Custom library entry point
 */
extern DLLAPI int webitk_register_callbacks() {
	return register_callbacks("webitk");
}

/**
 * Custom library entry point
 * In case on Linux/UNIX, the custom library file would have a lib prefix
 */
extern DLLAPI int libwebitk_register_callbacks() {
	return register_callbacks("libwebitk");
}
