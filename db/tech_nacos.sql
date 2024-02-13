/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.30.135(老寇）
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : 192.168.30.135:3306
 Source Schema         : tech_nacos

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 13/02/2024 20:38:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2308 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (2260, 'seataServer.properties', 'SEATA_GROUP', '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=seata.laokou.org:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\nclient.metadataMaxAgeMs=30000\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=true\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n# You can choose from the following options: fastjson, jackson, gson\ntcc.contextJsonParserType=fastjson\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.\nstore.mode=redis\nstore.lock.mode=redis\nstore.session.mode=redis\n#Used for password encryption\nstore.publicKey=\n\n#If `store.mode,store.lock.mode,store.session.mode` are not equal to `file`, you can remove the configuration block.\nstore.file.dir=file_store/data\nstore.file.maxBranchSessionSize=16384\nstore.file.maxGlobalSessionSize=512\nstore.file.fileWriteBufferCacheSize=16384\nstore.file.flushDiskMode=async\nstore.file.sessionReloadReadSize=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\nstore.db.url=jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba_seata?useUnicode=true&rewriteBatchedStatements=true\nstore.db.user=root\nstore.db.password=laokou123\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#These configurations are required if the `store mode` is `redis`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `redis`, you can remove the configuration block.\nstore.redis.mode=single\nstore.redis.type=pipeline\nstore.redis.single.host=redis.laokou.org\nstore.redis.single.port=6379\nstore.redis.sentinel.masterName=\nstore.redis.sentinel.sentinelHosts=\nstore.redis.sentinel.sentinelPassword=\nstore.redis.maxConn=10\nstore.redis.minConn=1\nstore.redis.maxTotal=100\nstore.redis.database=0\nstore.redis.password=laokou123\nstore.redis.queryLimit=100\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=false\nserver.enableParallelRequestHandle=true\nserver.enableParallelHandleBranch=false\n\nserver.raft.cluster=seata.laokou.org:7091,seata.laokou.org:7092,seata.laokou.org:7093\nserver.raft.snapshotInterval=600\nserver.raft.applyBatch=32\nserver.raft.maxAppendBufferSize=262144\nserver.raft.maxReplicatorInflightMsgs=256\nserver.raft.disruptorBufferSize=16384\nserver.raft.electionTimeoutMs=2000\nserver.raft.reporterEnabled=false\nserver.raft.reporterInitialDelay=60\nserver.raft.serialization=jackson\nserver.raft.compressor=none\nserver.raft.sync=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898', '4ca23d5da9142daebd613f15e97d3839', '2023-11-27 16:36:34', '2023-11-27 18:28:02', 'nacos', '0:0:0:0:0:0:0:1', 'laokou-seata', 'a61abd4c-ef96-42a5-99a1-616adee531f3', 'seata配置', '', '', 'properties', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 706 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
INSERT INTO `config_tags_relation` VALUES (15, 'datasource', '', 'application-common-datasource.yaml', 'LAOKOU_GROUP', 'a61abd4c-ef96-42a5-99a1-616adee531f3', 526);

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `checksum` int NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '1.0', 'init', 'SQL', 'V1.0__init.sql', -1541720402, 'root', '2024-02-13 17:26:21', 177, 1);
INSERT INTO `flyway_schema_history` VALUES (2, '1.1', 'insert', 'SQL', 'V1.1__insert.sql', 1262303880, 'root', '2024-02-13 17:26:21', 67, 1);
INSERT INTO `flyway_schema_history` VALUES (3, '1.2', 'update', 'SQL', 'V1.2__update.sql', -352633530, 'root', '2024-02-13 17:26:21', 7, 1);
INSERT INTO `flyway_schema_history` VALUES (4, '1.3', 'update', 'SQL', 'V1.3__update.sql', 436400420, 'root', '2024-02-13 17:26:21', 6, 1);
INSERT INTO `flyway_schema_history` VALUES (5, '1.4', 'update', 'SQL', 'V1.4__update.sql', -976500635, 'root', '2024-02-13 17:26:21', 5, 1);
INSERT INTO `flyway_schema_history` VALUES (6, '1.5', 'update', 'SQL', 'V1.5__update.sql', 192649542, 'root', '2024-02-13 17:26:21', 3, 1);
INSERT INTO `flyway_schema_history` VALUES (7, '1.6', 'update', 'SQL', 'V1.6__update.sql', -17154928, 'root', '2024-02-13 17:26:21', 5, 1);
INSERT INTO `flyway_schema_history` VALUES (8, '1.7', 'update', 'SQL', 'V1.7__update.sql', 1868693240, 'root', '2024-02-13 17:26:21', 2, 1);

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3117 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (16, 3092, 'application-common-redis.yaml', 'LAOKOU_GROUP', '', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\n# spring\nspring:\n  data:\n    # redis\n    redis:\n      client-type: lettuce\n      host: redis.laokou.org\n      port: 6379\n      password: ENC(XVR9OF604T3+2BINpvvCohjr7/KM/vuP3ZgYpu+FX/h3uogFI3sh26h8wHPBE+rj)\n      connect-timeout: 60000ms #连接超时时长（毫秒）\n      timeout: 60000ms #超时时长（毫秒）\n      lettuce:\n        pool:\n          max-active: 20 #连接池最大连接数（使用负值表示无极限）\n          max-wait: -1 #连接池最大阻塞等待时间（使用负值表示没有限制）\n          max-idle: 10 #连接池最大空闲连接\n          min-idle: 5 #连接池最小空间连接', 'c8c0e7fbaa49086163b00c1c8e1fa454', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (17, 3093, 'application-common.yaml', 'LAOKOU_GROUP', '', '# spring\nspring:\n  # security\n  security:\n    oauth2:\n      resource-server:\n        enabled: true\n        request-matcher:\n          ignore-patterns:\n            GET:\n              - /**/v3/api-docs/**=laokou-gateway\n              - /v3/api-docs/**=laokou-auth,laokou-admin\n              - /swagger-ui.html=laokou-admin,laokou-gateway,laokou-auth\n              - /swagger-ui/**=laokou-admin,laokou-gateway,laokou-auth\n              - /actuator/**=laokou-admin,laokou-gateway,laokou-auth\n              - /error=laokou-admin,laokou-auth\n              - /v1/tenants/option-list=laokou-admin,laokou-gateway\n              - /v1/tenants/id=laokou-admin,laokou-gateway\n              - /favicon.ico=laokou-gateway\n              - /v1/captchas/{uuid}=laokou-gateway,laokou-auth\n              - /v1/secrets=laokou-gateway,laokou-auth\n              - /graceful-shutdown=laokou-auth\n              - /oauth2/authorize=laokou-gateway\n              - /ws=laokou-gateway\n            DELETE:\n              - /v1/logouts=laokou-admin,laokou-gateway\n  # task\n  task-execution:\n    thread-name-prefix: laokou-ttl-task-\n    pool:\n      core-size: 17\n      keep-alive: 180s\n  cloud:\n    # 解决集成sentinel，openfeign启动报错，官方下个版本修复\n    openfeign:\n      compression:\n        response:\n          enabled: true\n        request:\n          enabled: true\n      # FeignAutoConfiguration、OkHttpFeignLoadBalancerConfiguration、OkHttpClient#getClient、FeignClientProperties、OptionsFactoryBean#getObject\n      # 在BeanFactory调用getBean()时，不是调用getBean，是调用getObject(),因此，getObject()相当于代理了getBean(),而且getObject()对Options初始化，是直接从openfeign.default获取配置值的\n      okhttp:\n        enabled: true\n      circuitbreaker:\n        enabled: true\n      httpclient:\n        enabled: false\n        hc5:\n          enabled: false\n        disable-ssl-validation: true\n      client:\n        config:\n          default:\n            connectTimeout: 120000 #连接超时\n            readTimeout: 120000 #读取超时\n            logger-level: full\n      lazy-attributes-resolution: true\n    # sentinel\n    sentinel:\n      eager: true #开启饥饿加载，直接初始化\n      transport:\n        port: 8769\n        dashboard: sentinel.laokou.org:8972\n\n# actuator\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"\n  endpoint:\n    health:\n      show-details: always\n\n# springdoc\nspringdoc:\n  swagger-ui:\n    path: /swagger-ui.html\n\n# server\nserver:\n  servlet:\n    encoding:\n      charset: UTF-8\n  undertow:\n    threads:\n      # 设置IO线程数，来执行非阻塞任务，负责多个连接数\n      io: 16\n      # 工作线程数\n      worker: 256\n    # 每块buffer的空间大小\n    buffer-size: 1024\n    # 分配堆外内存\n    direct-buffers: true\n\n# feign\nfeign:\n  sentinel:\n    enabled: true\n    default-rule: default\n    rules:\n      # https://sentinelguard.io/zh-cn/docs/circuit-breaking.html\n      default:\n        - grade: 2 # 异常数策略\n          count: 1 # 异常数模式下为对应的阈值\n          timeWindow: 30 # 熔断时长，单位为 s（经过熔断时长后熔断器会进入探测恢复状态（HALF-OPEN 状态），若接下来的一个请求成功完成（没有错误）则结束熔断，否则会再次被熔断。ERROR_COUNT）\n          statIntervalMs: 1000 # 统计时长（单位为 ms），如 60*1000 代表分钟级（1.8.0 引入）\n          minRequestAmount: 5 # 熔断触发的最小请求数，请求数小于该值时即使异常比率超出阈值也不会熔断', '248d439908a418f6f7fd72cc28790b28', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (26, 3094, 'router.json', 'LAOKOU_GROUP', 'laokou-gateway', '[\n  {\n    \"id\": \"laokou-auth\",\n    \"uri\": \"lb://laokou-auth\",\n    \"predicates\": [\n      {\n        \"name\": \"Path\",\n        \"args\": {\n          \"pattern\": \"/auth/**\"\n        }\n      },\n      {\n        \"name\": \"Weight\",\n        \"args\": {\n          \"_genkey_0\": \"auth\",\n          \"_genkey_1\": \"100\"\n        }\n      }\n    ],\n    \"filters\": [\n      {\n        \"name\": \"StripPrefix\",\n        \"args\": {\n          \"parts\": \"1\"\n        }\n      },\n      {\n        \"name\": \"RewritePath\",\n        \"args\": {\n          \"_genkey_0\": \"/auth/(?<path>.*)\",\n          \"_genkey_1\": \"/$\\\\{path}\"\n        }\n      }\n    ],\n    \"metadata\": {\n      \"version\": \"2.0\"\n    },\n    \"order\": 1\n  },\n  {\n    \"id\": \"laokou-admin\",\n    \"uri\": \"lb://laokou-admin\",\n    \"predicates\": [\n      {\n        \"name\": \"Path\",\n        \"args\": {\n          \"pattern\": \"/admin/**\"\n        }\n      },\n      {\n        \"name\": \"Weight\",\n        \"args\": {\n          \"_genkey_0\": \"admin\",\n          \"_genkey_1\": \"100\"\n        }\n      }\n    ],\n    \"filters\": [\n      {\n        \"name\": \"StripPrefix\",\n        \"args\": {\n          \"parts\": \"1\"\n        }\n      },\n      {\n        \"name\": \"RewritePath\",\n        \"args\": {\n          \"_genkey_0\": \"/admin/(?<path>.*)\",\n          \"_genkey_1\": \"/$\\\\{path}\"\n        }\n      }\n    ],\n    \"metadata\": {\n      \"version\": \"2.0\"\n    },\n    \"order\": 1\n  },\n  {\n    \"id\": \"open-api\",\n    \"uri\": \"http://127.0.0.1:5555\",\n    \"predicates\": [\n      {\n        \"name\": \"Path\",\n        \"args\": {\n          \"pattern\": \"/v3/api-docs/**\"\n        }\n      },\n      {\n        \"name\": \"Weight\",\n        \"args\": {\n          \"_genkey_0\": \"open-api\",\n          \"_genkey_1\": \"100\"\n        }\n      }\n    ],\n    \"filters\": [\n      {\n        \"name\": \"RewritePath\",\n        \"args\": {\n          \"_genkey_0\": \"/v3/api-docs/(?<path>.*)\",\n          \"_genkey_1\": \"/$\\\\{path}/v3/api-docs\"\n        }\n      }\n    ],\n    \"metadata\": {},\n    \"order\": 1\n  },\n  {\n    \"id\": \"laokou-im\",\n    \"uri\": \"lb:wss://laokou-im\",\n    \"predicates\": [\n      {\n        \"name\": \"Path\",\n        \"args\": {\n          \"pattern\": \"/im/**\"\n        }\n      },\n      {\n        \"name\": \"Weight\",\n        \"args\": {\n          \"_genkey_0\": \"im\",\n          \"_genkey_1\": \"100\"\n        }\n      }\n    ],\n    \"filters\": [\n      {\n        \"name\": \"StripPrefix\",\n        \"args\": {\n          \"parts\": \"1\"\n        }\n      },\n      {\n        \"name\": \"RewritePath\",\n        \"args\": {\n          \"_genkey_0\": \"/im/(?<path>.*)\",\n          \"_genkey_1\": \"/$\\\\{path}\"\n        }\n      }\n    ],\n    \"metadata\": {\n      \"version\": \"2.0\"\n    },\n    \"order\": 1\n  },\n  {\n    \"id\": \"laokou-flowable\",\n    \"uri\": \"lb://laokou-flowable\",\n    \"predicates\": [\n      {\n        \"name\": \"Path\",\n        \"args\": {\n          \"pattern\": \"/flowable/**\"\n        }\n      },\n      {\n        \"name\": \"Weight\",\n        \"args\": {\n          \"_genkey_0\": \"flowable\",\n          \"_genkey_1\": \"100\"\n        }\n      }\n    ],\n    \"filters\": [\n      {\n        \"name\": \"StripPrefix\",\n        \"args\": {\n          \"parts\": \"1\"\n        }\n      },\n      {\n        \"name\": \"RewritePath\",\n        \"args\": {\n          \"_genkey_0\": \"/flowable/(?<path>.*)\",\n          \"_genkey_1\": \"/$\\\\{path}\"\n        }\n      }\n    ],\n    \"metadata\": {\n      \"version\": \"2.0\"\n    },\n    \"order\": 1\n  }\n]', 'b773792ee46cfa7c4e87356c577820f4', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (82, 3095, 'application-monitor.yaml', 'LAOKOU_GROUP', 'laokou-monitor', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\n# spring\nspring:\n  boot:\n    # admin\n    admin:\n      discovery:\n        ignored-services:\n          - laokou-im\n      notify:\n        mail:\n          from: 2413176044@qq.com\n          to: 2413176044@qq.com\n          template: META-INF/spring-boot-admin-server/mail/status-changed.html\n  # security\n  security:\n    user:\n      # root\n      name: ENC(esZnNM2DrSxZhgTOzu11W2fVsJDDZ1b12aPopMMHCS7lF5+BJun9ri6y5pTUdj6L)\n      # laokou123\n      password: ENC(mHjKcITM5U60bq7M4fxh4yUQ9L3PPWPskvnWRE0PVxIqQ34Ztx7zOESwWCdjeWPW)\n  # mail\n  mail:\n    host: smtp.qq.com\n    password: ENC(JDMVbM278SLa9qbk5oMeJUs6St0dpLRSQyI7lPKGUFFzxSMZcfps2+vXBVyAXXB34Hj2GHzgRhEdDR1bX3eweA==)\n    default-encoding: UTF-8\n    username: 2413176044@qq.com\n\n# actuator\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"\n  endpoint:\n    health:\n      show-details: always', 'de1c37757329b0ad75488bf39024489c', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (103, 3096, 'application-common-elasticsearch.yaml', 'LAOKOU_GROUP', '', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\nspring:\n  # elasticsearch\n  elasticsearch:\n    uris:\n     - http://elasticsearch.laokou.org:9200\n    username: ENC(svQedUe/LhX4+kE58LA73GTbkn0xR1Nz4P9hIalcloHMkQ8BCur8LiptBZ9DI78f)\n    password: ENC(XVR9OF604T3+2BINpvvCohjr7/KM/vuP3ZgYpu+FX/h3uogFI3sh26h8wHPBE+rj)\n    connection-timeout: 30s\n    socket-timeout: 30s', 'a3c6f97f7752b1472e919c4f3ca02c87', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1254, 3097, 'application-common-seata.yaml', 'LAOKOU_GROUP', '', '# seata\nseata:\n  client:\n    tm:\n      default-global-transaction-timeout: 30000\n  config:\n    type: nacos\n    nacos:\n      server-addr: nacos.laokou.org\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n      username: nacos\n      password: nacos\n      group: SEATA_GROUP\n      data-id: seataServer.properties\n  registry:\n    type: nacos\n    nacos:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n      group: SEATA_GROUP\n      username: nacos\n      password: nacos\n      server-addr: nacos.laokou.org\n  enabled: true\n  tx-service-group: default_tx_group\n  data-source-proxy-mode: AT', 'f1b17fa1b21e361999cc93e8d19dfe2f', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1270, 3098, 'application-common-rocketmq.yaml', 'LAOKOU_GROUP', '', 'rocketmq:\n  producer:\n    group: laokou_producer_group\n  name-server: rocketmq.laokou.org:9876\n  consumer:\n    pull-batch-size: 16', '540e67a6edad605be9959a9652d383e2', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1273, 3099, 'application-gateway.yaml', 'LAOKOU_GROUP', 'laokou-gateway', '# springdoc\nspring:\n  cloud:\n    gateway:\n      ip:\n        enabled: true\n        label: black\nspringdoc:\n  swagger-ui:\n    urls:\n      - name: admin\n        url: /v3/api-docs/admin\n      - name: auth\n        url: /v3/api-docs/auth', 'fe482cd291193a1bd85295c5dd363221', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1475, 3100, 'application-sms.yaml', 'LAOKOU_GROUP', 'laokou-sms', 'sms:\n  # 0：国阳云\n  type: 0\n  gyy:\n    templateId: 908e94ccf08b4476ba6c876d13f084ad\n    signId: 3f45af8aa12f4d59be8b1f18b650ad81\n    appcode: 6b3e98d5f39848cba9615d576ce78d9e', 'c5d95dadb7e5b2fe9db27ce8cae73118', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1477, 3101, 'application-mail.yaml', 'LAOKOU_GROUP', 'laokou-mail', 'spring:\n  # mail\n  mail:\n    host: smtp.qq.com\n    username: 2413176044@qq.com\n    password: hhqkeodvfywfebaf\n    default-encoding: UTF-8', '665c8cf5a8522b5f64ae86f9e816e89e', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1567, 3102, 'gateway-flow.json', 'LAOKOU_GROUP', 'laokou-gateway', '[\n  {\n    \"resource\": \"laokou-auth\",\n    \"grade\": 1,\n    \"count\": 300,\n    \"intervalSec\": 1,\n    \"burst\": 1000,\n    \"controlBehavior\": 0\n  },\n  {\n    \"resource\": \"laokou-admin\",\n    \"grade\": 1,\n    \"count\": 300,\n    \"intervalSec\": 1,\n    \"burst\": 1000,\n    \"controlBehavior\": 0\n  }\n]', 'c5fbcf8031ce039bb97bd44cbfbca16b', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1568, 3103, 'auth-flow.json', 'LAOKOU_GROUP', 'laokou-auth', '[\n  {\n    \"resource\": \"/v1/captchas/{uuid}\",\n    \"limitApp\": \"default\",\n    \"count\": 300,\n    \"grade\": 1,\n    \"strategy\": 0,\n    \"controlBehavior\": 0\n  },\n  {\n    \"resource\": \"/v1/secrets\",\n    \"limitApp\": \"default\",\n    \"count\": 300,\n    \"grade\": 1,\n    \"strategy\": 0,\n    \"controlBehavior\": 0\n  }\n]', '095ca881af8089664d3852771a743894', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1569, 3104, 'admin-flow.json', 'LAOKOU_GROUP', 'laokou-admin', '[\n  {\n    \"resource\": \"/v1/users/profile\",\n    \"limitApp\": \"default\",\n    \"count\": 300,\n    \"grade\": 1,\n    \"strategy\": 0,\n    \"controlBehavior\": 0\n  }\n]', '9860e7087b9cf7707d78c2fedb740cab', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1570, 3105, 'admin-degrade.json', 'LAOKOU_GROUP', 'laokou-admin', '[\n  {\n    \"resource\": \"POST:https://laokou-flowable/work/task/api/query\",\n    \"count\": 200,\n    \"grade\": 0,\n    \"slowRatioThreshold\": 0.1,\n    \"minRequestAmount\": 5,\n    \"timeWindow\": 30\n  },\n  {\n    \"resource\": \"POST:https://laokou-flowable/work/definition/api/query\",\n    \"count\": 200,\n    \"grade\": 0,\n    \"slowRatioThreshold\": 0.1,\n    \"minRequestAmount\": 5,\n    \"timeWindow\": 30\n  }\n]', '2c0d4de0716f94bd6878b0a68d3faa0f', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (1799, 3106, 'application-common-monitor.yaml', 'LAOKOU_GROUP', '', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\n# spring\nspring:\n  # https://codecentric.github.io/spring-boot-admin/current\n  boot:\n    # admin\n    admin:\n      client:\n        url: https://monitor.laokou.org:5000\n        # root\n        username: ENC(esZnNM2DrSxZhgTOzu11W2fVsJDDZ1b12aPopMMHCS7lF5+BJun9ri6y5pTUdj6L)\n        # laokou123\n        password: ENC(mHjKcITM5U60bq7M4fxh4yUQ9L3PPWPskvnWRE0PVxIqQ34Ztx7zOESwWCdjeWPW)', '7d934a9e4b0ebe9803a17ccd520dca3e', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2019, 3107, 'application-admin.yaml', 'LAOKOU_GROUP', 'laokou-admin', '# 请查看laokou-common-shardingsphere的CryptoUtil，public-key有默认值,需要使用该工具类加密\npublic-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJ4o6sn4WoPmbs7DR9mGQzuuUQM9erQTVPpwxIzB0ETYkyKffO097qXVRLA6KPmaV+/siWewR7vpfYYjWajw5KkCAwEAAQ==\ndataSources:\n  master:\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\n    driverClassName: com.mysql.cj.jdbc.Driver\n    jdbcUrl: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba_user?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n    username: ENC(VZamSTMi224AH6RUtJGXNldiDp/XEL2ozRhBUu/o9ChodT4JEb9kE/j0EFhXKbjsfvLVacUW0AUzetA6OrNJug==)\n    password: ENC(laIHkPM/z03tYjA95hES4+BhyjyhvrPjJynrC65oDyXnUTP0Tge1UxwERWFBbHoOOQZ2GzzUrRhEYJ3jFb89eQ==)\n  slave:\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\n    driverClassName: com.mysql.cj.jdbc.Driver\n    jdbcUrl: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba_user?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n    username: ENC(VZamSTMi224AH6RUtJGXNldiDp/XEL2ozRhBUu/o9ChodT4JEb9kE/j0EFhXKbjsfvLVacUW0AUzetA6OrNJug==)\n    password: ENC(laIHkPM/z03tYjA95hES4+BhyjyhvrPjJynrC65oDyXnUTP0Tge1UxwERWFBbHoOOQZ2GzzUrRhEYJ3jFb89eQ==)\nrules: \n- !SHARDING  \n  tables:\n    boot_sys_user:\n      actualDataNodes: master.boot_sys_user_$->{2022..2099}0$->{1..9},master.boot_sys_user_$->{2022..2099}$->{10..12}\n      tableStrategy:\n        standard:\n          shardingColumn: create_date\n          shardingAlgorithmName: laokou_table_inline\n      keyGenerateStrategy:\n        column: id\n        keyGeneratorName: snowflake\n  shardingAlgorithms:\n    laokou_table_inline:\n      # 时间范围分片算法\n      type: INTERVAL\n      props:\n          # 分片键的时间戳格式\n        datetime-pattern: \"yyyy-MM-dd HH:mm:ss\"\n        # 真实表的后缀格式\n        sharding-suffix-pattern: \"yyyyMM\"\n        # 时间分片下界值\n        datetime-lower: \"2022-01-01 00:00:00\"\n        # 时间分片上界值\n        datetime-upper: \"2099-12-31 23:59:59\"\n        # 分片间隔\n        datetime-interval-amount: 1\n        # 按月分表\n        datetime-interval-unit: \"months\"\n  keyGenerators:\n    snowflake:\n      type: SNOWFLAKE\n      props:\n        work-id: 123\n- !READWRITE_SPLITTING\n  dataSources:\n    laokou_readwrite_data_sources:\n      staticStrategy:\n        writeDataSourceName: master\n        readDataSourceNames:\n          - slave\n      loadBalancerName: laokou_load_balance_algorithm\n  loadBalancers:\n    laokou_load_balance_algorithm:\n      type: ROUND_ROBIN\nprops:\n  sql-show: true', '05e9717dd34584cb265716b5417d610a', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2022, 3108, 'laokou-admin.yaml', 'LAOKOU_GROUP', 'laokou-admin', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\n# spring\nspring:\n  datasource:\n    dynamic:\n      # 默认false,建议线上关闭\n      p6spy: false\n      #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候会抛出异常,不启动则使用默认数据源\n      strict: false\n      datasource:\n        # user:\n        #   driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n        #   url: jdbc:shardingsphere:nacos:application-admin.yaml\n        # login_log:\n        #   driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n        #   url: jdbc:shardingsphere:nacos:application-auth.yaml\n        master:\n          type: com.zaxxer.hikari.HikariDataSource\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true&rewriteBatchedStatements=true\n          username: ENC(OuDQnY2CK0z2t+sq1ihFaFHWve1KjJoRo1aPyAghuRAf9ad3BO6AjcJRA+1b/nZw)\n          password: ENC(XVR9OF604T3+2BINpvvCohjr7/KM/vuP3ZgYpu+FX/h3uogFI3sh26h8wHPBE+rj)\n          # https://blog.csdn.net/u014644574/article/details/123680515\n          hikari:\n            pool-name: HikariCP\n            connection-timeout: 180000\n            validation-timeout: 3000\n            idle-timeout: 180000\n            max-lifetime: 1800000\n            maximum-pool-size: 60\n            minimum-idle: 10\n            is-read-only: false\n  xxl-job:\n    admin:\n      address: http://xxl.job.laokou.org:9095/xxl-job-admin\n    executor:\n      app-name: laokou-admin\n      port: -1\n      log-path: ./logs/xxl-job/laokou-admin\n      access-token: yRagfkAddGXdTySYTFzhvMguinulMIMSCcXUbljWDhe\n      intentionalities: 7\n  default-config:\n    # 流程KEY\n    definition-key: \"Process_88888888\"\n    # 租户表\n    tenant-tables:\n      - boot_sys_audit_log\n      - boot_sys_dept\n      - boot_sys_dict\n      - boot_sys_menu\n      - boot_sys_message\n      - boot_sys_message_detail\n      - boot_sys_operate_log\n      - boot_sys_oss\n      - boot_sys_oss_log\n      - boot_sys_resource\n      - boot_sys_resource_audit\n      - boot_sys_role\n      - boot_sys_role_dept\n      - boot_sys_role_menu\n      - boot_sys_user\n      - boot_sys_user_role\n      - undo_log\n    domain-names:\n      - laokou.org\n      - laokouyun.org\n      - laokou.org.cn\n    tenant-prefix: \"tenant\"\n    remove-params:\n      - \"username\"\n      - \"password\"\n      - \"mobile\"\n      - \"mail\"\n    graceful-shutdown-services:\n      - \"laokou-flowable\"\n      - \"laokou-admin\"\n      - \"laokou-auth\"\n# mybatis-plus\nmybatis-plus:\n  # 全局处理\n  global-config:\n    db-config:\n      column-format: \"`%s`\"\n  tenant:\n    ignore-tables:\n      - boot_sys_tenant\n      - boot_sys_source\n      - boot_sys_package_menu\n      - boot_sys_package\n      - boot_sys_login_log\n    enabled: true\n  slow-sql:\n    enabled: true\n  mapper-locations: classpath*:/mapper/**/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl\n\ndubbo:\n  application:\n    id: laokou-admin\n    name: laokou-admin\n    qos-port: 33333\n  protocol:\n    id: dubbo\n    name: dubbo\n    port: -1\n  registry:\n    address: nacos://nacos.laokou.org:8848\n    username: nacos\n    group: DUBBO_GROUP\n    password: nacos\n    parameters:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n      register-consumer-url: true\n    protocol: nacos\n  metadata-report:\n    address: nacos://nacos.laokou.org:8848\n    username: nacos\n    group: DUBBO_GROUP\n    password: nacos\n    parameters:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n  config-center:\n    address: nacos://nacos.laokou.org:8848\n    username: nacos\n    group: DUBBO_GROUP\n    password: nacos\n    parameters:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n  consumer:\n    check: false\n    timeout: 5000', '947e12b564df53210701b4eea118893c', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2024, 3109, 'application-auth.yaml', 'LAOKOU_GROUP', 'laokou-auth', '# 请查看laokou-common-shardingsphere的CryptoUtil，public-key有默认值,需要使用该工具类加密\npublic-key: MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJ4o6sn4WoPmbs7DR9mGQzuuUQM9erQTVPpwxIzB0ETYkyKffO097qXVRLA6KPmaV+/siWewR7vpfYYjWajw5KkCAwEAAQ==\ndataSources:\n  master:\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\n    driverClassName: com.mysql.cj.jdbc.Driver\n    jdbcUrl: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba_login_log?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n    username: ENC(VZamSTMi224AH6RUtJGXNldiDp/XEL2ozRhBUu/o9ChodT4JEb9kE/j0EFhXKbjsfvLVacUW0AUzetA6OrNJug==)\n    password: ENC(laIHkPM/z03tYjA95hES4+BhyjyhvrPjJynrC65oDyXnUTP0Tge1UxwERWFBbHoOOQZ2GzzUrRhEYJ3jFb89eQ==)\n  slave:\n    dataSourceClassName: com.zaxxer.hikari.HikariDataSource\n    driverClassName: com.mysql.cj.jdbc.Driver\n    jdbcUrl: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba_login_log?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n    username: ENC(VZamSTMi224AH6RUtJGXNldiDp/XEL2ozRhBUu/o9ChodT4JEb9kE/j0EFhXKbjsfvLVacUW0AUzetA6OrNJug==)\n    password: ENC(laIHkPM/z03tYjA95hES4+BhyjyhvrPjJynrC65oDyXnUTP0Tge1UxwERWFBbHoOOQZ2GzzUrRhEYJ3jFb89eQ==)\nrules:\n- !SHARDING\n  tables:\n    boot_sys_login_log:\n      actualDataNodes: master.boot_sys_login_log_$->{2022..2099}0$->{1..9},master.boot_sys_login_log_$->{2022..2099}$->{10..12}\n      tableStrategy:\n        standard:\n          shardingColumn: create_date\n          shardingAlgorithmName: laokou_table_inline\n      keyGenerateStrategy:\n        column: id\n        keyGeneratorName: snowflake\n  shardingAlgorithms:\n    laokou_table_inline:\n      # 时间范围分片算法\n      type: INTERVAL\n      props:\n        # 分片键的时间戳格式\n        datetime-pattern: \"yyyy-MM-dd HH:mm:ss\"\n        # 真实表的后缀格式\n        sharding-suffix-pattern: \"yyyyMM\"\n        # 时间分片下界值\n        datetime-lower: \"2022-01-01 00:00:00\"\n        # 时间分片上界值\n        datetime-upper: \"2099-12-31 23:59:59\"\n        # 分片间隔\n        datetime-interval-amount: 1\n        # 按月分表\n        datetime-interval-unit: \"months\"\n  keyGenerators:\n    snowflake:\n      type: SNOWFLAKE\n- !READWRITE_SPLITTING\n  dataSources:\n    laokou_readwrite_data_sources:\n      staticStrategy:\n        writeDataSourceName: master\n        readDataSourceNames:\n          - slave\n      loadBalancerName: laokou_load_balance_algorithm\n  loadBalancers:\n    laokou_load_balance_algorithm:\n      type: ROUND_ROBIN\nprops:\n  sql-show: true', '671a56280a05075becc829e7b04207c5', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2025, 3110, 'laokou-auth.yaml', 'LAOKOU_GROUP', 'laokou-auth', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\n# spring\nspring:\n  datasource:\n    dynamic:\n      # 默认false,建议线上关闭\n      p6spy: false\n      #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候会抛出异常,不启动则使用默认数据源\n      strict: false\n      datasource:\n        # user:\n        #   driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n        #   url: jdbc:shardingsphere:nacos:application-admin.yaml\n        # login_log:\n        #   driver-class-name: org.apache.shardingsphere.driver.ShardingSphereDriver\n        #   url: jdbc:shardingsphere:nacos:application-auth.yaml\n        master:\n          type: com.zaxxer.hikari.HikariDataSource\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n          username: ENC(OuDQnY2CK0z2t+sq1ihFaFHWve1KjJoRo1aPyAghuRAf9ad3BO6AjcJRA+1b/nZw)\n          password: ENC(XVR9OF604T3+2BINpvvCohjr7/KM/vuP3ZgYpu+FX/h3uogFI3sh26h8wHPBE+rj)\n          # https://blog.csdn.net/u014644574/article/details/123680515\n          hikari:\n            connection-timeout: 60000\n            validation-timeout: 3000\n            idle-timeout: 60000\n            max-lifetime: 60000\n            maximum-pool-size: 30\n            minimum-idle: 10\n            is-read-only: false\n  xxl-job:\n    admin:\n      address: http://xxl.job.laokou.org:9095/xxl-job-admin\n    executor:\n      app-name: laokou-auth\n      port: -1\n      log-path: ./logs/xxl-job/laokou-auth\n      access-token: yRagfkAddGXdTySYTFzhvMguinulMIMSCcXUbljWDhe\n      intentionalities: 7\n# mybatis-plus\nmybatis-plus:\n  # 全局处理\n  global-config:\n    db-config:\n      column-format: \"`%s`\"\n  tenant:\n    enabled: true\n    ignore-tables:\n      - boot_sys_source\n      - boot_sys_tenant\n  slow-sql:\n    enabled: false\n  mapper-locations: classpath*:/mapper/**/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl', 'c50a326739ab265b758d4477612f1720', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2026, 3111, 'laokou-flowable.yaml', 'LAOKOU_GROUP', 'laokou-flowable', '# jasypt\njasypt:\n  encryptor:\n    password: 5201314wumeihua\n\n# spring\nspring:\n  datasource:\n    dynamic:\n      # 默认false,建议线上关闭\n      p6spy: false\n      #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候会抛出异常,不启动则使用默认数据源\n      strict: false\n      primary: flowable\n      datasource:\n        master:\n          type: com.zaxxer.hikari.HikariDataSource\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n          username: ENC(OuDQnY2CK0z2t+sq1ihFaFHWve1KjJoRo1aPyAghuRAf9ad3BO6AjcJRA+1b/nZw)\n          password: ENC(XVR9OF604T3+2BINpvvCohjr7/KM/vuP3ZgYpu+FX/h3uogFI3sh26h8wHPBE+rj)\n          # https://blog.csdn.net/u014644574/article/details/123680515\n          hikari:\n            connection-timeout: 60000\n            validation-timeout: 3000\n            idle-timeout: 60000\n            max-lifetime: 60000\n            maximum-pool-size: 30\n            minimum-idle: 10\n            is-read-only: false\n        flowable:\n          type: com.zaxxer.hikari.HikariDataSource\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://mysql.laokou.org:3306/kcloud_platform_alibaba_flowable?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai&useSSL=false\n          username: ENC(OuDQnY2CK0z2t+sq1ihFaFHWve1KjJoRo1aPyAghuRAf9ad3BO6AjcJRA+1b/nZw)\n          password: ENC(XVR9OF604T3+2BINpvvCohjr7/KM/vuP3ZgYpu+FX/h3uogFI3sh26h8wHPBE+rj)\n          # https://blog.csdn.net/u014644574/article/details/123680515\n          hikari:\n            connection-timeout: 60000\n            validation-timeout: 3000\n            idle-timeout: 60000\n            max-lifetime: 60000\n            maximum-pool-size: 30\n            minimum-idle: 10\n            is-read-only: false\n# mybatis-plus\nmybatis-plus:\n  # 全局处理\n  global-config:\n    db-config:\n      column-format: \"`%s`\"\n  slow-sql:\n    enabled: false\n  mapper-locations: classpath*:/mapper/**/*.xml\n  configuration:\n    log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl', '59bff23ea21ce71474b4debf8e4ad6c6', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2115, 3112, 'org.laokou.report.api.ReportServiceI', 'mapping', '', 'laokou-report', '71e5929efefebed76b3a11b3fe301ac0', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2118, 3113, 'laokou-report.yaml', 'LAOKOU_GROUP', 'laokou-report', 'dubbo:\n  application:\n    id: laokou-report\n    name: laokou-report\n    qos-port: 33334\n  registry:\n    address: nacos://nacos.laokou.org:8848\n    username: nacos\n    group: DUBBO_GROUP\n    password: nacos\n    parameters:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n  metadata-report:\n    address: nacos://nacos.laokou.org:8848\n    username: nacos\n    group: DUBBO_GROUP\n    password: nacos\n    parameters:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n  config-center:\n    address: nacos://nacos.laokou.org:8848\n    username: nacos\n    group: DUBBO_GROUP\n    password: nacos\n    parameters:\n      namespace: a61abd4c-ef96-42a5-99a1-616adee531f3\n  protocol:\n    id: dubbo\n    name: dubbo\n    port: -1\n  provider:\n    threads: 20000\n    threadpool: fixed\n    timeout: 5000\n  scan:\n    base-packages: org.laokou.report.api\n  consumer:\n    check: false\n    timeout: 5000', 'c47794c8c0ea33ae0a745b1fbef0530a', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2159, 3114, 'application-common-kafka.yaml', 'LAOKOU_GROUP', '', 'spring:\n  kafka:\n    bootstrap-servers: kafka.laokou.org:9092\n    consumer:\n      # 禁用自动提交（按周期）已消费offset\n      enable-auto-commit: false\n      # 单次poll()调用返回的记录数\n      max-poll-records: 50\n      key-deserializer: org.apache.kafka.common.serialization.StringDeserializer\n      value-deserializer: org.apache.kafka.common.serialization.StringDeserializer\n    producer:\n      # 发生错误后，消息重发的次数。\n      retries: 5\n      #当有多个消息需要被发送到同一个分区时，生产者会把它们放在同一个批次里。该参数指定了一个批次可以使用的内存大小，按照字节数计算。\n      batch-size: 16384\n      # 设置生产者内存缓冲区的大小。\n      buffer-memory: 33554432\n      # 键的序列化方式\n      key-serializer: org.apache.kafka.common.serialization.StringSerializer\n      # 值的序列化方式\n      value-serializer: org.apache.kafka.common.serialization.StringSerializer\n      # acks=0 ： 生产者在成功写入消息之前不会等待任何来自服务器的响应。\n      # acks=1 ： 只要集群的首领节点收到消息，生产者就会收到一个来自服务器成功响应。\n      # acks=all ：只有当所有参与复制的节点全部收到消息时，生产者才会收到一个来自服务器的成功响应。\n      acks: 0\n    listener:\n      # 在侦听器容器中运行的线程数。\n      concurrency: 5\n      # listner负责ack，每调用一次，就立即commit\n      ack-mode: manual\n      # 批量batch类型\n      type: batch\n      # topic不存在报错\n      missing-topics-fatal: false', '157c7aaa53329ababa1aab96b9878fad', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2178, 3115, 'laokou-logstash.yaml', 'LAOKOU_GROUP', 'laokou-logstash', 'spring:\n  xxl-job:\n    admin:\n      address: http://xxl.job.laokou.org:9095/xxl-job-admin\n    executor:\n      app-name: laokou-logstash\n      port: -1\n      log-path: ./logs/xxl-job/laokou-logstash\n      access-token: yRagfkAddGXdTySYTFzhvMguinulMIMSCcXUbljWDhe\n      intentionalities: 7', '81c3de6319db8560c68935977f2d141f', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');
INSERT INTO `his_config_info` VALUES (2307, 3116, 'application-common-flyway.yaml', 'LAOKOU_GROUP', '', 'spring:\r\n  flyway:\r\n    # 起始版本\r\n    baseline-version: 0\r\n    # 历史记录\r\n    baseline-on-migrate: true\r\n    # 避免数据被意外清空\r\n    clean-disabled: false', 'd3ec18f7c8327f45c48a7783f6d48b64', '2024-02-13 18:15:58', '2024-02-13 18:16:01', NULL, '0:0:0:0:0:0:0:1', 'D', 'a61abd4c-ef96-42a5-99a1-616adee531f3', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('ADMIN', ':*:*', 'rw');
INSERT INTO `permissions` VALUES ('ADMIN', 'a61abd4c-ef96-42a5-99a1-616adee531f3:*:*', 'rw');
INSERT INTO `permissions` VALUES ('ROLE_ADMIN', ':*:*', 'rw');
INSERT INTO `permissions` VALUES ('ROLE_ADMIN', 'a61abd4c-ef96-42a5-99a1-616adee531f3:*:*', 'rw');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('laokou', 'ADMIN');
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (2, '1', 'a61abd4c-ef96-42a5-99a1-616adee531f3', 'laokou', 'laokou', 'nacos', 1673556960289, 1673556960289);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('laokou', '$2a$10$75WIn2J5FoX9F5wEBdFsL.0cKdv5h8QqBMKMWBABhWAxKB4TO8WZq', 1);
INSERT INTO `users` VALUES ('nacos', '$2a$10$oVX1zRtaql9Jbsyzaaovx.TU2M6Bw0ZpCbPYWOIED58d1ougzaFRm', 1);

SET FOREIGN_KEY_CHECKS = 1;
