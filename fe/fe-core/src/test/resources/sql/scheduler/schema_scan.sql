[sql]
select * from information_schema.session_variables
[scheduler]
PLAN FRAGMENT 0(F00)
  DOP: 16
  INSTANCES
    INSTANCE(0-F00#0)
      BE: 10001

[fragment]
PLAN FRAGMENT 0
 OUTPUT EXPRS:1: VARIABLE_NAME | 2: VARIABLE_VALUE
  PARTITION: UNPARTITIONED

  RESULT SINK

  0:SCAN SCHEMA
[end]

[sql]
select * from information_schema.be_tablets
[scheduler]
PLAN FRAGMENT 0(F01)
  DOP: 16
  INSTANCES
    INSTANCE(0-F01#0)
      BE: 10002

PLAN FRAGMENT 1(F00)
  DOP: 16
  INSTANCES
    INSTANCE(1-F00#0)
      DESTINATIONS: 0-F01#0
      BE: 10001
      SCAN RANGES
        0:SCAN SCHEMA
          1. <PLACEHOLDER>
    INSTANCE(2-F00#1)
      DESTINATIONS: 0-F01#0
      BE: 10002
      SCAN RANGES
        0:SCAN SCHEMA
          1. <PLACEHOLDER>
    INSTANCE(3-F00#2)
      DESTINATIONS: 0-F01#0
      BE: 10003
      SCAN RANGES
        0:SCAN SCHEMA
          1. <PLACEHOLDER>

[fragment]
PLAN FRAGMENT 0
 OUTPUT EXPRS:1: BE_ID | 2: TABLE_ID | 3: PARTITION_ID | 4: TABLET_ID | 5: NUM_VERSION | 6: MAX_VERSION | 7: MIN_VERSION | 8: NUM_ROWSET | 9: NUM_ROW | 10: DATA_SIZE | 11: INDEX_MEM | 12: CREATE_TIME | 13: STATE | 14: TYPE | 15: DATA_DIR | 16: SHARD_ID | 17: SCHEMA_HASH | 18: INDEX_DISK | 19: MEDIUM_TYPE
  PARTITION: UNPARTITIONED

  RESULT SINK

  1:EXCHANGE

PLAN FRAGMENT 1
 OUTPUT EXPRS:
  PARTITION: RANDOM

  STREAM DATA SINK
    EXCHANGE ID: 01
    UNPARTITIONED

  0:SCAN SCHEMA
[end]

