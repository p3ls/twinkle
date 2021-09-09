include (CMakePushCheckState)
include (CheckCXXSourceCompiles)

FIND_PATH(ILBC_INCLUDE_DIR ilbc/iLBC_decode.h)
FIND_LIBRARY(ILBC_LIBRARIES NAMES ilbc)

IF(ILBC_INCLUDE_DIR AND ILBC_LIBRARIES)
	SET(ILBC_FOUND TRUE)

	# Check if libilbc can be used without 'extern "C"'
	CMAKE_PUSH_CHECK_STATE()
	LIST(APPEND CMAKE_REQUIRED_INCLUDES "${ILBC_INCLUDE_DIR}")
	LIST(APPEND CMAKE_REQUIRED_LIBRARIES "-lilbc")
	SET(CMAKE_REQUIRED_QUIET TRUE)
	CHECK_CXX_SOURCE_COMPILES("
		#include <ilbc/iLBC_decode.h>

		int main() {
			iLBC_Dec_Inst_t *iLBCdec_inst;
			initDecode(iLBCdec_inst, 0, 0);
			return 0;
		}
	" ILBC_CPP)
	CMAKE_POP_CHECK_STATE()
ENDIF(ILBC_INCLUDE_DIR AND ILBC_LIBRARIES)

IF(ILBC_FOUND)
	IF (NOT Ilbc_FIND_QUIETLY)
		MESSAGE(STATUS "Found ilbc includes:	${ILBC_INCLUDE_DIR}/ilbc/iLBC_decode.h")
		MESSAGE(STATUS "Found ilbc library: ${ILBC_LIBRARIES}")
	ENDIF (NOT Ilbc_FIND_QUIETLY)
ELSE(ILBC_FOUND)
	IF (Ilbc_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could NOT find ilbc development files")
	ENDIF (Ilbc_FIND_REQUIRED)
ENDIF(ILBC_FOUND)
