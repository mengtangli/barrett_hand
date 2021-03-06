FILE(READ /proc/cpuinfo PROC_CPUINFO)

SET(VENDOR_ID_RX "vendor_id[ \t]*:[ \t]*([a-zA-Z]+)\n")
STRING(REGEX MATCH "${VENDOR_ID_RX}" VENDOR_ID "${PROC_CPUINFO}")
STRING(REGEX REPLACE "${VENDOR_ID_RX}" "\\1" VENDOR_ID "${VENDOR_ID}")
MESSAGE(STATUS "VENDOR_ID : ${VENDOR_ID}")

SET(CPU_FAMILY_RX "cpu family[ \t]*:[ \t]*([0-9]+)")
STRING(REGEX MATCH "${CPU_FAMILY_RX}" CPU_FAMILY "${PROC_CPUINFO}")
STRING(REGEX REPLACE "${CPU_FAMILY_RX}" "\\1" CPU_FAMILY "${CPU_FAMILY}")
MESSAGE(STATUS "CPU_FAMILY : ${CPU_FAMILY}")

SET(MODEL_RX "model[ \t]*:[ \t]*([0-9]+)")
STRING(REGEX MATCH "${MODEL_RX}" MODEL "${PROC_CPUINFO}")
STRING(REGEX REPLACE "${MODEL_RX}" "\\1" MODEL "${MODEL}")
MESSAGE(STATUS "MODEL : ${MODEL}")

