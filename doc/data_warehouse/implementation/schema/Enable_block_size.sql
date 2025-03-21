-- start with cdb
ALTER SESSION SET CONTAINER = CDB$ROOT;
SHOW CON_NAME

SHOW PARAMETER db_block_size;
SHOW PARAMETER db_32k_cache_size;

ALTER SYSTEM SET DB_32K_CACHE_SIZE = 256M SCOPE = SPFILE;
SHUTDOWN IMMEDIATE;
STARTUP;
SHOW PARAMETER db_32k_cache_size