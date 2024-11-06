Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079E1DED63
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892606; cv=fail; b=atkL+deWo81a5w9ppDXlldgt5p5xk8N0Pdbp7OiCweGcxWP3iAGElu8NTku07dwhKIMjg0feVIBN59bEEq3oG5SPpvAOhmYwBgnpQlpkIiC+qGyxp+cRtt2pe/YeVYHo7hal2UqPOVdHZFJOKkvJjqz/ZdNZjyVJSmMWGBGUNI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892606; c=relaxed/simple;
	bh=G104copjaZPfP8qLU9G4OIymUgyypdvATpxTEEXC5cA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ujk/U+EVxZiYWgwwvxG0nBXmBSj5S11ud/DD2wH/IDU4iidksn9qwd075UMYWUk/JN7PnaQwJFpl7do81suSt8vpnc0MfoVc6A+oCOaOSXQFwPTjz0opXOf2ob1oe4Eel56KD8k4iCrKFt7vk0YVZCwAm6D7L8/gOgFV+CunOU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k6DV3tJ1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dyHToHJA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k6DV3tJ1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dyHToHJA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69BafH010398
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=e+PXFobPEGeeYEPK
	LvkggZTKy8t5kSRXiocBI9zQHWg=; b=k6DV3tJ1Sv/jNPxpw6FMFHLuP1JC8XJC
	02u7fiwn1M5nVEPxfgNkFz7CQ1LF7WH4zgjFsay2YeV71L0yDj/cgHCSCVFSbkxV
	XwHlj6hXr8iCNt8pZDsffmLrFchSvC//YJQxck5VqtdKLQhlgBksTUPlfESMjl75
	AkzgwOxOlQ+XlOLUPj5hcINIwzyqygrbTd9QPIJ1bthkmH4oR0cE99FXB8NzIDo8
	GBsOimmgXOroPL/bRPHYXwFxgYxWTqSCGAqjYkDJ/4Nuiyryzr7RCDJlsMkiOWQQ
	MQODhPigfB2FOZyUuPMkBEKGAu95UtRE4GCmUdlFAZygg6+0GtYgqg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpsqk31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6BHqOC008594
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah8dt4f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM4YDcnPLAkWRsrTxkiCr0jIz69X3OMmAFHzA8bOUDF3c56qsNTgNxVAoh2pszR/AfdZHxFur6NtiI/e6tEZIl8X/mgFXF0YXOjo4pbCkVFoFzPD9a6as7HKeGfmpzfhK+6dpFstWna1M9FpzW1I2K1FOv+xC2E05O3RcdRIFpzvM1u4AMo6MRyMrisLzOWpJbuUbA797yyz9X8bHdzvvvtKwm/WR7idTESUu3VulcPDmkRt3jxSIqDQPkZJ+vp7tkOe+KBM0gmcLkpiNnr5K3YbvH3e+V6uuhfyzS2pId/ii7FgO2lQp8K1b6yUMnuckfzidwt6Oj0BzbgbUs3Kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+PXFobPEGeeYEPKLvkggZTKy8t5kSRXiocBI9zQHWg=;
 b=aOYq8n7DvSU0htXup6KPEv5JEdYIy3dS+1kXm+1LcRsNQei5MLC9ZhVuaW6PnJVHaZB384N5SqNZ4L1QJHCExB2AFMCIqsQrFGx1cdRgwP/yLXSCIiZqtHg45VroyO4Ke/UmQZd5sW3dq5ifMaR5JAY759FibGf7DbXo6f4c0COHXYOhkEk8LsAHDBYkplo4a+V/dE8k0CNxL2E8l4CWscrqICwKAV6RSkQf+Fb5/+UraFiI5TnjC3hWwI5b1A0nPjl8jvntSVIn+ixemIyXjtRmbnzKWc1nHocKNFqTrjdJxZva8kAoF4uglIIIcelIQO7RsUgLFy3Z0P39f3WhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+PXFobPEGeeYEPKLvkggZTKy8t5kSRXiocBI9zQHWg=;
 b=dyHToHJA0T6eWdTBIc+g5prxWQ2mGrQ+IO8dJBsklYRFrSn5CpE7jg/bRWRserNB5+bpc7sugManFWwNde9QUylFkgQazIy7oWhEVT3LcBAYRzSxBU5Xdjq0zw3+fyjRjPzmTNVR78kt/vxFFnLJNvbmRgVOpg8kw1S2S4Wc0r8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:29:59 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:29:59 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v7 0/6] usdt typed args, translators and arg mapping
Date: Wed,  6 Nov 2024 11:29:36 +0000
Message-ID: <20241106112942.264351-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::22) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 344f36b7-da94-4c41-b6c4-08dcfe5658b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aw5+8NK5hwFaL1UNny2Fwj/+UUpTXqE6nIM6HpLCc7dINKmXK6cws4gftb/T?=
 =?us-ascii?Q?VdRziynijahpGGc3rc1kGSCyV3A7f/qVrw/G/zhmhUPMpuYWwMtF0Ry3tTsX?=
 =?us-ascii?Q?dTjxHeQb+xifC9BWy7TbApbov0eMjaLgq7gDSqZonldYp8wjAPXcAvMIahBc?=
 =?us-ascii?Q?nWQXPOOCSMb4Fw5zg/mo7lHr2PwjFG+NQMk2phdCzOczNiMikvobHeQEhHP9?=
 =?us-ascii?Q?vo1ZbVVZL1xm5Jr9ALT9bNzOXUIYanpFYOMcjH7ku4Im/kOJVhIBst/IBtum?=
 =?us-ascii?Q?nWzrPrAdcsClTJFH9DUtkcJchg5q0e52lN91R+EoreL/rjlhfz+UY2L7phGj?=
 =?us-ascii?Q?XzXlJgOuky0lCIWykhm4j/4vJFeOu2JCI5vF56lhbWZstDeJ5d2KGiBnaYJQ?=
 =?us-ascii?Q?MEuIv7+fzltylQ9hnSsbpd4vpSCcG66DQ1ZCTuuekRsdBrwyRk+B5QbzUeJ4?=
 =?us-ascii?Q?2E8fTyck83C8hQJry7r+quSSCgOdvGUePZkwyc9ZBUVMuCo8UhhaM0dBADGI?=
 =?us-ascii?Q?BeHoYsh7Z+UEkAS62On32BMGP6BPg3wqR/OLjkPihGX0KYNToN7b79eQf9vh?=
 =?us-ascii?Q?ezC+Y32L0cAd0kK7gqZ+ZPWh3W3dOfG22elpzDeZfomTfZBCznekP1J+UXP1?=
 =?us-ascii?Q?oMsHUaR3ajaHRST2a/6aNjAzC3+gKggY3ZhNGj0htGMr2grS3LlCkvQAHYvD?=
 =?us-ascii?Q?ad5ZLVd5nb1A9I8lNTb3t140Um0nEQfc80qcWdEuILQHisQT9xeVE1BOruDn?=
 =?us-ascii?Q?1RWxFqUUuv//SFVlGk4tAms9/SfO3NiEKAmkKyBHCm9U/1wHe3TBz95fnoFb?=
 =?us-ascii?Q?R6mqSMKY2kZRzi27OUZeCmLtNbbmDYeS3DIWvwtkMSnzlGzLBjUbBrSKIw0B?=
 =?us-ascii?Q?MSEdflMf8VijM5riiZXKFnh+eITWhlK/g8qU6RKKrkW2B3fxaUq+lPxaKIQk?=
 =?us-ascii?Q?kv/ZE7an1oNUTZiwSNzbwA2g3sig+th5gARj4yds0R/3lwAxohZiWELMrADN?=
 =?us-ascii?Q?LL/+kWVNXgTYJWs1RN611I3jSV697tuLmoSJFPSn1ZExi3NeQXKYhotsfnnk?=
 =?us-ascii?Q?hyMQCDAZiQRBfflVIu1n6x5/Didh5Szt3FPRzp0DCxL4uoKHdiHed1EoE2kn?=
 =?us-ascii?Q?qw7mS09njj0a3Vle51+C8YgWWaJo32xwSp006x0SO6AQPyzFN0w1xW0qlbyw?=
 =?us-ascii?Q?Yc6Tv8ArkiEsonv9v3GML+JCgqanpGcuEOJUgHSs9E7nw1FXZDyCsBQgwKSk?=
 =?us-ascii?Q?ZKVE5OoaWD+j1HCqe6hW8OTgjzMGdJL82DD7etYLJWdf6vpVj5zVQuZ8QYbI?=
 =?us-ascii?Q?0aBNeDW35wCf7seBxyuiHHtd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EgZSQfZcydaVup/md2A5BbBHLO4jSgRXhOkvbhg/XnhBPzq0fDhJIuRE4JTD?=
 =?us-ascii?Q?q2odtYu4U+05B21o0I1gS4SWb3ve7EYHHKSrjv0+QEBpTaCnkcyNTukNymev?=
 =?us-ascii?Q?r556pEZfnEdvVaxpxgvUduUwCO+b7+XBABtv0k8PQUpr4Bmyy7sGlAwbh8oY?=
 =?us-ascii?Q?+5uWo5f89gXIxmv5dEGqkZX4j5i2EAauZKSo/6YYDlHe88mYLnYJU0EOzrA/?=
 =?us-ascii?Q?Wg1/Q/3rD96lrygis5eEFvdncDgVbGjO8CBBUhdjUS7JEXFYv3D2icMx74Os?=
 =?us-ascii?Q?nRgov0HvyaVRqN3MAXI3SKdoUE7fbrsPkj8CRsPBXZ5g7un29228Aely6z2u?=
 =?us-ascii?Q?usxEJ6VgmyRMDSUjRrhDwYZTx90kKmiIWGEFZVguxYeoq2ihsBEKIej7RFDb?=
 =?us-ascii?Q?r3n77LsIHgmmjDRlPR0gjVjcxF6n+pMXbkXn95MexOP9R5YFR26sRpdIcPIx?=
 =?us-ascii?Q?VWiD2VauFbB2P0xxVVQ8U7545lZ9nPkVQARSn1ujTwEJAPqJQZkku6z21/C8?=
 =?us-ascii?Q?V64F1rB5C911o/xgfHvZOysQ/b8wzW3OyPgq3Uz3Yio0eCs/qZGlrX6KeAro?=
 =?us-ascii?Q?rBtOLnpXQ26aUq9i8PZ09jx1JdpEL8yG+Lz04Sjk8G3QEL3wyhLq79K0QvrM?=
 =?us-ascii?Q?BXFjA3rw7sj3Hk9gVzk1mbpBKMc/5iRyKyrwblz2vBtxqizlt6gepKF72I4M?=
 =?us-ascii?Q?VKYPR/qLFZ5H3W/NkPWRwafFSuT1RoBHCqaQHaXGDkbsVwb+2Du14rbA0+Tv?=
 =?us-ascii?Q?kErwHZvvatAZXLSf53asTW8bNwwCTTyGYB7tQKPCu66/XtLd6ePqz7TsXSAX?=
 =?us-ascii?Q?+PhlCyXsQHK2iuKRw9tWdQ7BvblHA3XnzO1po4rR+GonLidUk1COYrt3oc6o?=
 =?us-ascii?Q?PslE2Y9n9TkW65pMJYC/wIZxbmkJUpWRKZLOZRB64rOUGaf3CWsGkx7qeNPv?=
 =?us-ascii?Q?hiV12O4xfI3onSyW2ZYtP9L305/1bMtf9t8kU7dIVA5H+d+CzMoYIQgF2EvB?=
 =?us-ascii?Q?WZjCpYibOndAWRe+pJiOEphCvzzvUMaaB8LWfng2Kzb0GYUjxBiNmMUfDVav?=
 =?us-ascii?Q?sD3apri/gQdHT5XXMLQw9RbjMmmrpSIjeID/kkRFIxnepBshAO71um3aLL3l?=
 =?us-ascii?Q?aWGePZg9l9QAjZpbXGXYVTpK7chSM/z5z8BDcHHYEIKKmS9OyaW/39oVW/uR?=
 =?us-ascii?Q?/rpYzMa92jTKWtf80JepOVaf+Gm/9r0rUT3NJicLkWfXIIUxsFELhPKkj+ee?=
 =?us-ascii?Q?ZkqwiGttA8fNeDLJwgP3maHKlkaUakZ++JIpEnMKJGyz5JHgN+aV63jS6V5k?=
 =?us-ascii?Q?jNWv4WxaWqZhOctu2S+Hhl//WMWsWWjlbY4D6ETMQ9uVtRFHJ1r76f43LP54?=
 =?us-ascii?Q?9OB7r88RbaD7lV6oOpcp4fL8LC7EAUgvYp1aWwIyGnGoZXWAbAvgPycq5AdB?=
 =?us-ascii?Q?pXfELy9yHFlmxFOV3I+JW3xSADhfTnAIEPdUzD47lZHvq/TZxYDhXErQYp4g?=
 =?us-ascii?Q?fx8ZOr7ZR+a5q1Kn5xAM//MAD/irIrA5A2jWs77/+byVYjCLUnW23DOrPQX9?=
 =?us-ascii?Q?cO61SuhTq5WoRWLzHyv9I6NWHXTpglfsF2CUpC/rxE2vizo5cvg9Y6R3QpoN?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KYX889nj/MqH4/voAyMdEiFPlrHJL999xFNO2U7IN+KfdayzIJOkCwsQH7tZIdm8cxweQzQAocP5dhpZypj27A1cEsZmdQVOUFORAIlYaraTHu5izdY2LnCiRikpzi4UkkVWvjdpV8SIxUJmjmHMAujKFdkCr0KpaWbk031l6vn17MhY14//39ZhbdkFAiPgpofMpx6SNzbQ6fCQD7bE3lMTiI8UfH52NrqbiCQ1q1cdcup/53x/Q8gsMMRXZIiXXcx1mldRv2Z//ROub0/jpKPrdAGbhbV9YF6+HvUCpkR3SZU4bhjthMPEF353dpwQchOx0T42MCVhS+OsFMSS9gpP/KycgB/YpQb/bi0hkcEYnJeRUB++gsE2Co46LhOr1+RwdWra87ot2k9uKm3LDbqmb3LhTDNmE4x1iUUKRkf/NxgJEkoOF0+utmn5+UeA7oC4hmTiwqmC5sPpVPXiyCMhWYohCtUU8M78BewMHVdUS3UhliOn1sZh10fEuJd14f/3BZnaGMUX43u2dGoPFWE1qmybI7UjFs2WR3i2EKonJSvaNIBvEtLZIghONHb31MG5b/SnYX8ISJmJqwxhYsxxIE65dqpyuoL+Qeq3b+I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344f36b7-da94-4c41-b6c4-08dcfe5658b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:29:58.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KacUYzzOfzCXzHYuq75re0bDQJ716PwqfA1ZPI3sS3Zm9phS+ljqRPdBFvgVVLpsUv3Ok5szKWTvvQRf/dwJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-ORIG-GUID: Gzd-hSfd1667lGWTfkAh04uxps8aFuKp
X-Proofpoint-GUID: Gzd-hSfd1667lGWTfkAh04uxps8aFuKp

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
mappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to map not only arg[N] but
also argN references (the single existing test for USDT arg mapping
verifies that this works), but the SDT machinery depends on argN being
left unchanged!  So we do the mapping in dt_prov_uprobe.c while reshuffling
things into dt_argdesc_t's, and tell the higher layers that no arg mapping
is ever being performed, then do the actual movement of args in the trampoline
by physically reshuffling the arguments.  This seems to work without breaking
SDT on all supported architectures, and is surprisingly simple (at least, it
surprised me: multiple places where I thought I'd need hundreds of lines of
complex code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types change,
when arg counts change, and when there are no args at all, and that dtrace
-vln produces the right output (all previous tests for USDT -vln, translated
or not, are currently disabled because they all use wildcards: this new one
doesn't).

We also add new tests to test that pid/USDT interoperability does not
break arg mapping and USDT args in general (deferred args are coming,
but are trickier to get working).  That's in a separate commit because
it renames and modifies an existing test significantly (it still does the
same thing).

We also fix a tiny error-path-related bug in usdt encountered in the
course of development.

Changes since v6:
  Move all references to DTPPT_USDT into the patch that defines it
  (one slipped into the first patch by mistake).

Changes since v5:
  Moved a couple of mispositioned hunks between patches.
  Rephrased a couple of terrible comments.
  A few formatting fixes.
  (No conditional added around call to populate_args(), since
  populate_args() doesn't care if the probe is USDT or not: if the
  probe has args, it'll populate them.)

Changes since v4:
  Moved the arg saving into the dt_prov_uprobe trampoline.
  Store the args in one contiguous strtab rather than two distinct
  ones.
  Drop some unnecessary "no xargs, fall back to nargs" code (there are
  always xargs if there are any user-visible args at all, the nargs
  are not user-visible).
  Set up the arguments even if USDT probes with args find that their
  underlying probe is already in place for a pid probe.
  Identify USDT probes reliably and use this to prevent creation of
  multiple USDT probes at the same locus (new DTPPT_USDT probe type:
  DTPPT_OFFSETS is now reserved for pid offset probes).
  Fixed up a few bad comments.
  Added test/unittest/usdt/tst.pid*sh, out of the guts of
  tst.pidprobes.sh, which is renamed and modified to pidprobes.sh and
  called by all three tests.

Changes since v3:
  Rebase against latest dev, adjusting the trampoline: we should now
  handle the overlapping pid and usdt case, though this still being
  verified.
  Eliminate remaining references to 'remapping'.
  Move mis-merged hunk of dt_cg.c changes into the right commit.
  Drop showUSDT arg stuff in favour of Kris's improved version.

Changes since v2:
  Populate dt_argdesc_t's in USDT probe discovery rather than in
  probe_info.

Changes since v1:
  Adapted to review comments (all comments but the stuff around
  trampolines and arg mapping, which I don't understand well
  enough to implement); in particular track xlated args and
  mappings together, and move from a flags word in the
  dof_parser struct's DIT_PROBE record to an arg count

Nick Alcock (6):
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: new tests for USDT arg sanity with overlapping pid probes
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  21 +-
 dtprobed/dtprobed.c                           |  10 +-
 include/dtrace/pid.h                          |   8 +
 libcommon/dof_parser.c                        | 150 ++++++++++----
 libcommon/dof_parser.h                        |  64 +++++-
 libdtrace/dt_cg.c                             |  25 +++
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_pid.c                            |  62 +++++-
 libdtrace/dt_prov_uprobe.c                    | 186 ++++++++++++++++--
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      | 130 ++++++++++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  89 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 ++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   |  56 ++++--
 test/unittest/usdt/tst.argmap-null.d          |  32 +++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 test/unittest/usdt/tst.pidargmap.sh           |  11 ++
 test/unittest/usdt/tst.pidargs.sh             |  11 ++
 24 files changed, 929 insertions(+), 86 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 rename test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (82%)
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

-- 
2.46.0.278.g36e3a12567

