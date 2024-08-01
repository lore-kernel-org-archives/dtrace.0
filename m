Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F93198A03
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518598; cv=fail; b=fgycWEPg0zSybEQ3xhOxD8o4FfBTM03asTvkTY7IusjAR8zs1wLiEiI4W3Iv9jwvnSN9wl06w6+AHZVEawg4Y8ryqIB8gh/VOl2cSTB21guzHVp25kjhs5JLWKBzxsfsowv0GL2yxssb5r/yR4h5vk12p8Ms2lTWnbB+iKpvcBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518598; c=relaxed/simple;
	bh=+32qsHgJb9yUCAfoXRnwnws1la5zColTCfiYmwjFOqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OjEMiqlynawOAf7NjsbpvePhsjm6ODLZgzMlOxFIHrXaQMmAN5QXKHzYyZpLFQjXEnoomtCZzhwZUh/9IR4ICs5FPmBESnwouPBVX6m3/5/FpeDnVEsxflRQGRyQT6ZhZDlcIuMUCnFjdLacS8N0eDhXMTWs6cSD0x3f4+T7V0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GHtxZUwP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eWYQetFZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GHtxZUwP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eWYQetFZ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tVEB030725
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=j3r7wiOtTVRnF4/PYb9C284/yfsv1ncIZUNPZ+fRO6o=; b=
	GHtxZUwP2793sgaC/TlxF5+RzglawzjDp7eHmbM2UXxBf0PH+aKmFLGGXDvT9OZv
	IfR5crtX4DGdLKRgpwanIsBXuYUIXpWmIamctdXecFilxMh5HQ4JyTrsLf8gzdat
	qvu0ftG2csyHszO39rWMXIEqgrdcgFlEEiniMOe6i/sAxGsmxVvot9M/+gCR8F01
	WAnDxB0vqYIc5jJI3vdIeY3zBBKgqc4wryOwBpiYud34kCU4mQnMJdSmTCxP37cW
	gbDdSliDG+jt0mByhhO0wbl4DypRnNksbIxvLRTQnXh1PewEbzd/YNIMq9u19seK
	X2pz9LbOsP/bLupSSYt7MQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msessqjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:23:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471D3cLT028990
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:23:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpt0mup-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:23:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t80QJwPs9k+9VXPLutpfXp4CejQeP7dCSBMakLAtHjbhtCMFDwBfA7jobUQjwtYnyFn3rqp8L6cqlcbevt06dFlbZKLHSXb5laXfSf3JkP/gKD/TWlFr8WYmbQprU8RHHBqryjEW7JAa2KBOYrhuGvIGeIXpj94AJzL47aD4EbtQwcudvlPUDQFJuibQempyuMlzG+cQpUkJ6zRxeNlqh0PR/JdxK8RbPgKX5KA+UYSFMhd/z9bsDxuFzWTO2cvaU2veJoj788hJX2ESHx/Qu8KqYAG0/PooQhiUoazfGXicfCqDXiGAywR2Lm3Cw5rwYJY5l1g7fFllUZCvOH9IHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3r7wiOtTVRnF4/PYb9C284/yfsv1ncIZUNPZ+fRO6o=;
 b=mHD7cmNHw0LJi0kcaZAQoBES7O7Qx6DsHw/N7I67+r9nnDo16RCsaGzHvv0ZY5EqsQ3k7bsPtfO8GSMWrz8fbSyWAV8YNtvFIYZL4AWUaUOKV3HKQ8v90Mk3SMIS2XrtAeyUzpLfwnVENOBaSRhk2nl2LvKv7Qm2808Bf2yZLuvJYMQHglbAdDFnfVxZx9YgnGG1cr1WczIMzAn/bDPodVIFnrHXr8u2mbRwh8Ll+dFfQ2AgRt/xFRBC2ZRXm3VYX9x6BmDKGLwBhFS8tO61V+j0m1xb/WYvo2uQBblKE0Hxr8ol+RgxiBnDXWYvvO6iOQrCDcWWRc+ajjNDnqtqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3r7wiOtTVRnF4/PYb9C284/yfsv1ncIZUNPZ+fRO6o=;
 b=eWYQetFZRTnaHsPzkF9HI12ZEWkfYI7pbfOhNNAWKuH3Of+QJxQ/lWvHchLVdhdwKpL+D/iMp7eTJTtQoeWV9XeCfWvU1SwAnMM3hxCSGjr7rTJqJo+jKcep6hZOyFN43VXlyEH0WyWVme40XaRTQ/uCZfuh3GqQN0kdHc2BiK4=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:23:12 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:23:12 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 9/9] test: work when relocated
Date: Thu,  1 Aug 2024 14:21:56 +0100
Message-ID: <20240801132156.286780-10-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0418.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::9) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8c29ef-983a-49b5-558a-08dcb22d17ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?axPU99HAkiO3y9J1xqEs21kp6dF69dn61X5KiMp2nNYpK8oaLW5nOAcG5jnT?=
 =?us-ascii?Q?JRS8WDSGMSbx2h2y8pNX5MP9czToq3/UHLJ9RDFAH7Sn3cFKRRMQZTZ77tnP?=
 =?us-ascii?Q?RvgizSanZ2Sd7nF279g2gbaLHhZB2cyWgtUn/tt4KGDUg/wfDQFVtvz1hXAH?=
 =?us-ascii?Q?drQBumKUOigNn2HvrYArhKQqJj9UOstmmBrtG7Y2IfpcmWvll/jhs9O0sRF9?=
 =?us-ascii?Q?K4C942jpa/q4b7IKHh0nDNZ1zFkThdpnbVV0Xsb23ae+lpW7ZPDFYm/zzfv+?=
 =?us-ascii?Q?o4dLec5kLEwVk7LVE9FPOt2QVeuBrSvVEgiOvboXD8gTMzG3RxmwUPCFSjfv?=
 =?us-ascii?Q?7xexZVBOXyeCSNjhhRB916Bl9rLQjST0wElsZhF9LoVip8POn6W7/+vqB58Q?=
 =?us-ascii?Q?3D0/kzJOaFA5rzI/vG0/qJ+tf+A0BkWmw5CSDJvI1YwGMthVLJivV/sXSFcX?=
 =?us-ascii?Q?WsrGGHKDWVC53R6DlZwDlvn/+qbdlUF4UzExxkppXpaovQwEEcCOe0szvM67?=
 =?us-ascii?Q?LLf1ceKhx0a9Qa/Rp8wVS11lD19EcSekF+Hky5NawqExrEDGPq9MKPRfsnZ5?=
 =?us-ascii?Q?arLKbW7jTfeuus8uhM9BpERGpwuN1tJMyYLrywhC61YmXLfWa88ohjtxhh8P?=
 =?us-ascii?Q?dwiOeh2qAhNqykm9739EutsJrmZFQnhZ0VFaLMYUsVfd/BLx6L/i/lf6iAFx?=
 =?us-ascii?Q?Ly5F8wEY+0wY+/HLd3A6e3nX96epluzWAVK42PtO4R60mPsChTFvjMXUXQRF?=
 =?us-ascii?Q?8LnIw2PT+EqA7rRvVuMbd0/s5g1QlncJN0nIY2oIE9Sbhwx8mUaTlvsw6sIW?=
 =?us-ascii?Q?bkqtj+qVpARedDraOgOJE2STs8Kp8AVKRAYvRx3ZKw2fTPg6QaG2vB7uPFw+?=
 =?us-ascii?Q?V3mo29vGcA1qGpMfVxmQjwOzE6/8k6KaoDanpymGJ/X229KFmXuUgJ/HEoVf?=
 =?us-ascii?Q?ZSq0T45uCjJ8vDHQMWaEHrvkotZIZEK7T1AntZrtgOQNfgZFOK95305Xe0s9?=
 =?us-ascii?Q?1KQuM3GYBPM27Ua7q3sbhiaQObRiv6eju8TaF/17KnYH6GuGilDZ74tT0ppm?=
 =?us-ascii?Q?DRn6EFCKdDnJK6gFBwO+vi4tLNl7tVLgzGtC/bpfm32vkgaLMht3Z7N95hEu?=
 =?us-ascii?Q?7Y9+ffHcvH1J95L2cLjyZTfu9QUu5HhjihtUkag69Qvpo8un9WwR2CDGrFac?=
 =?us-ascii?Q?BbVC6kxX4t/C3D94py+fbXlOwshRDiuNuznT1466meC6Lc+Vt+nOh+GPbZtR?=
 =?us-ascii?Q?54Z69624Rv3oPRD6Ya1B+BBssEl/m+1XmuqpJE3xhGsu7W1PV9AvPJjzAKN3?=
 =?us-ascii?Q?6VPdv6eKzZ7M9yMgY1zmpiTT5AZ+5JcyTOwD3DMGPCn5lw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s3VtsVzwIgAtlBRKg1CB6P5I+EbP325lmOpabxHH9riGue9Z1bw9+LiQvT7y?=
 =?us-ascii?Q?Ak/jCvyfdMULl9uxgeIH+Wt4LkjSLL4beYqecYTU+6KUlLX8kFRnQY6q14jA?=
 =?us-ascii?Q?iXw2z1PKWSV6BJqnCNzNQbM9kOUt1q3/FUPg53NXnB4k/C0DnFSqSfD28ZYH?=
 =?us-ascii?Q?oGfTv3Cat8ojxnXaEtftNhsy0lVpQNbh3jt17gduUuoAhfwdO2xaseXwULDm?=
 =?us-ascii?Q?x00t7AxGKJ0nTl+qNbKmGCqOzabB4Ly4bSWYSu1kMKMGn85hdXztpqkeah1v?=
 =?us-ascii?Q?4h/DPF0sKZzXan8YIwA4jL1WG3AASCCvzqWJYW1uWGb3QTNmZFW7BAgvCFdi?=
 =?us-ascii?Q?4k7BC+EYFSs9fWYuxyf0hW1HDiesAARGtfIE8EZb37ZmfsYacv45HQqrpYsT?=
 =?us-ascii?Q?334N8ANCvCdHaYilANEXuIBjSIXaDY0LKIPsZyixOgIMIq2Kv5wbfR3x7Eoj?=
 =?us-ascii?Q?aBBfbGeK0YnfCz5KVJEMUawIJW7tR7y9eZmT1Hw3chJnowRlZYNGTS13eEVU?=
 =?us-ascii?Q?mgUoRWVGRm9H+Luo6nSrYgJ/zHrwHmf1Dsxc2V1yyaMP5L+bDyemhTCtlAAP?=
 =?us-ascii?Q?V6nHOew+2EaJuVF4ttbDdLXQolBGGo8YoetMw8eSJAIbb32WDObQuE3XD9OW?=
 =?us-ascii?Q?ZdYPh+Kq0tDOF7PUanybr39dZ0qrulxaBOuBKImZjUNCqs9df68zFH4So3+T?=
 =?us-ascii?Q?KvziOePyIMbvK5EfACrqCGBPjNjC6fezAFVu+BWx1ykOD5fSZmtvuTpWwBmy?=
 =?us-ascii?Q?63Tt2AsmR3eaStHDu2M6q534dqcOv25zqJHe0w+jvg6yF1AHoAL+JTjqXkKh?=
 =?us-ascii?Q?K/ZHfV7XVEqTFOLQDS66tIwGCceos5YR7p6raKkcTWE+a3cQrpfCinBN8NrD?=
 =?us-ascii?Q?PaUmJpj4xqL81SJJZ/PPDSma3nUrgV50uHPAhzbcmYIjr0w3u8GREDSK0HZQ?=
 =?us-ascii?Q?7UIqw5GGHXD++K3Nuk5JOBY1xNVRN3BG6n7DmoOuOW5zQaRgttRlV+kEhiUF?=
 =?us-ascii?Q?wM58Ts2Vfm/eYXGQotyW/V9WplmY/cgsb5pPiwIaLlnnabeAIyHfbaFMflH1?=
 =?us-ascii?Q?MIlu929DHAa7eWhAChEZtVqRDqH5hx2EN9p4hxi/jr7YhZTEU9ohlU/AbdI9?=
 =?us-ascii?Q?9D8V6M6CNnkzjFycwJ2kQoROub0YDbT9Wjr7QaRFG1oQMGzm466tGOgMC5wt?=
 =?us-ascii?Q?SYss4/4uV3VP+BPy/w11lQ9UbPDaNMbcxuM4YY2gCNhy509DCxa2u6R8J5qG?=
 =?us-ascii?Q?p6p/teeb8D7cY2EIA8c++M6bWn298f1iHh3zJGY381duLFb688njmvyAfpFw?=
 =?us-ascii?Q?PurpPeLhIIyBCM+tnDDF3fJo7qW3ggOhWdh8PbRILDQ5w2hDl26Hpydjj65D?=
 =?us-ascii?Q?BKkyOixlak+Iv24XgHIWDBcKT9VovnRL3wLw4pZqHjwFmo6mKigz+gSW0SiZ?=
 =?us-ascii?Q?mpvoeKCr5B1hkHywjm7Gj0Pq5PzoaY5QmAl1FCswIjFcgx5Z6mWfatnse98t?=
 =?us-ascii?Q?iah/WOFshtzhkaERgxg8H5SW3DlvoEzAMuVkxUC9eeh4EFYtv1s9VTo/YnXs?=
 =?us-ascii?Q?Lz9dZYX92AysncfZ/fLv6BX2qwr+rUOVdFBLnNqTd1X9Mu7k/HShmnW6G8yH?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	26uxbiQLEU65mAyaMmK4WWsBnUVw2SKDW305RaTDsK8u7sk7+bsSLxu4t0e/ej+Tv2aLJxiS4xrDizGhBeCsh4khIMtcWm4S+Laj3NFibM+hbRLTOyyTOTeXe7U4bCm4tYjVhexFKoxb9xJdNndQzC32iVZyowz51qSw7X+R8TpinIdvJD7DqHLvFpN0vkxfq2L2VFXfDT8rnTHZ0dVfoDB+Lsd4Bdqc/UX6cUs+nJQssI9Y4QtKsRX6oMqnKH3/XzPqJcMGomoIcBcdVZxvMGyC8iOXYwX7m9HCNXo2dEnDHgSrcToZ1pEzQAcdKj7tpqe71/1avq0qge+ArUCW3B2s0iwqrGY+/YFMCbTBv1Fnnrmwv7naaoZkCJKhuykNIdoQ3qxu0hbunLgyCI3gM9bI0iP2Ca2k/e3aoQ6qgodphgvj/AUhg2ZwjjD+NZmMapsxPuVfE0+mqX4rgZJg7SQ1dmRZLuPzipvypure2tHKRqPOUMptb+x5CbmKerjd74ebeIf8Lhx8NJsy5bu22fWdrBDhJ4NF5r/tDyZVzrHLGw60haYzhvnRP5pqFRiiQs23IHc03c6O/NrJl04ZZQZprYmvYPmxAWSBHhJkksk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8c29ef-983a-49b5-558a-08dcb22d17ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:23:12.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJFTjqnqQMyrIXfMgsTN1SFoqk2yhNIY6Os/dpHOANkoeATbiJScjCRPiXA0nGZWIn8+5VYk7NHA+EhSpCac8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: PdkUo9zU40uJikCsxVhN7TnTiWLIMyOE
X-Proofpoint-GUID: PdkUo9zU40uJikCsxVhN7TnTiWLIMyOE

We do this by adding a variable to the pkg-config files that points at
the dtrace binary, then using that.  To make this work when the prefix
is changed, runtest.sh sets its own PKG_CONFIG_PATH to a directory
relative to the testsuite.  This will fail if the pkg-config install
path is also changed, but in that case presumably the person installing
it has arranged for pkg-config to find the pkg-config files in the
installed location.  Fix a couple of tests that are assuming the
location of the dtrace binary can be used to determine whether the
installed testsuite is in use.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.sh                           | 13 +++++++++++--
 test/unittest/usdt/tst.manyprocs.sh  |  2 +-
 test/unittest/usdt/tst.multitrace.sh |  2 +-
 uts/Build                            |  3 ++-
 uts/dtrace.pc.in                     |  1 +
 uts/dtrace_sdt.pc.in                 |  1 +
 6 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/runtest.sh b/runtest.sh
index 16a1a77bd394..792b2f4f25c7 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -18,6 +18,7 @@ shopt -s nullglob extglob
 unset CDPATH
 unset POSIXLY_CORRECT  # Interferes with 'wait'
 export LC_COLLATE="C"
+export dtrace="/usr/sbin/dtrace"
 
 arch="$(uname -m)"
 
@@ -574,7 +575,15 @@ if [[ -z $USE_INSTALLED ]]; then
     export dtprobed_pid=$!
     ZAPTHESE+=($dtprobed_pid)
 else
-    dtrace="/usr/sbin/dtrace"
+    # If we don't have a pkg-config path, try to point at a plausible
+    # one given DTrace's default install paths.  This will fail if
+    # the pkg-config path is changed as well: in that case, presumably
+    # the person changing that path has pointed pkg-config at it anyway.
+    if [[ -z $PKG_CONFIG_PATH ]]; then
+        export PKG_CONFIG_PATH="$(pwd)/../../../share/pkgconfig"
+    fi
+
+    dtrace="$(pkg-config --variable=dtrace dtrace)"
     test_libdir="installed"
     test_ldflags=""
     test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt) $(pkg-config --cflags dtrace)"
@@ -584,8 +593,8 @@ else
         exit 1
     fi
 fi
-export dtrace
 export test_cppflags
+export test_libdir
 
 # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
 # does, add a bunch of options designed to make GCC output look like it used
diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
index a899470dfa0e..f820ed231c38 100755
--- a/test/unittest/usdt/tst.manyprocs.sh
+++ b/test/unittest/usdt/tst.manyprocs.sh
@@ -82,7 +82,7 @@ done
 # should contain at most five or so DOFs, even though 512
 # processes left stale DOF around.  (Allow up to ten in
 # case the most recent cleanup is still underway.)
-if [[ $dtrace != "/usr/sbin/dtrace" ]] && [[ -n $DTRACE_OPT_DOFSTASHPATH ]]; then
+if [[ $test_libdir != "installed" ]] && [[ -n $DTRACE_OPT_DOFSTASHPATH ]]; then
     NUMDOFS="$(find $DTRACE_OPT_DOFSTASHPATH/stash/dof -type f | wc -l)"
     if [[ $NUMDOFS -gt 10 ]]; then
 	echo "DOF stash contains too many old DOFs: $NUMDOFS" >&2
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index 84cf1e8caa54..dcabde620c03 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -123,7 +123,7 @@ ONE=$!
 # if re-executed with a newer version of dtprobed with incompatible
 # parse state.  Overwrite the parsed DOF with crap first, to force
 # a failure if it simply doesn't reparse at all.
-if [[ $dtrace != "/usr/sbin/dtrace" ]] && [[ -n $dtprobed_pid ]]; then
+if [[ $test_libdir != "installed" ]] && [[ -n $dtprobed_pid ]]; then
     sleep 1
     for parsed in $DTRACE_OPT_DOFSTASHPATH/stash/dof-pid/*/*/parsed/*; do
 	echo 'a' > $parsed
diff --git a/uts/Build b/uts/Build
index 7948e9f2d084..181819410624 100644
--- a/uts/Build
+++ b/uts/Build
@@ -37,6 +37,7 @@ install::
 		(cd $(uts_DIR) && \
 		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
 			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
-			-e 's,@VERSION@,$(VERSION),g' < \
+			-e 's,@VERSION@,$(VERSION),g;' \
+			-e 's,@DTRACE@,$(SBINDIR)/dtrace,g' < \
 			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
 	done
diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
index 58aa46fc75c9..9977082c5a7c 100644
--- a/uts/dtrace.pc.in
+++ b/uts/dtrace.pc.in
@@ -1,5 +1,6 @@
 includedir = @INCLUDEDIR@
 libdir = @LIBDIR@
+dtrace = @DTRACE@
 
 Name: DTrace
 Description: DTrace consumer headers
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
index c5506f9355d9..32474bc3f75d 100644
--- a/uts/dtrace_sdt.pc.in
+++ b/uts/dtrace_sdt.pc.in
@@ -1,4 +1,5 @@
 sdtincludedir = @SDTINCLUDEDIR@
+dtrace = @DTRACE@
 
 Name: DTrace SDT
 Description: DTrace raw SDT headers
-- 
2.46.0.277.ge12b8151ed

