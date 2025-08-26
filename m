Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D230CD91
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756245903; cv=fail; b=HU8dCxO+R3YVQ5I4Wog+MYviFNfZ6sstpEUxK5YlyDHQrCSpkjfcPK7mimupooCyzdVdvHmlKQ2s/gNDUjLZZwlioNBZ2bqx5kW6fgSRhN2kxgwCF+gKJ5gCn648xCta3mwj/s2cFlCNZltKcdiaD6I4Z0AVimTc32zMM1cwuBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756245903; c=relaxed/simple;
	bh=wHOnKCkbo4R3+jBe4qhU8IuAukiS3VXH+mcqDauBfGk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FsHK2FftSASotcSxuyxp1xOp5E7VPiG5jnlCOsGuPC+e1tdbOTB0n0a56dui0B+9lx8I4VQo3XqZZOGDyfIIfX3hWFF05nqg9SPhxifKamPLntklcZ7gwHydDrSS4bwkGHq72jQQvKRoo5xU6TG33BYyhwTt389dR66Bumt8FU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Da2cqdDa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z1vpW/tV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Da2cqdDa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z1vpW/tV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLLLEP010427
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Y94wMHvZNbzPydfIhvz1R+usfu/+t9xZy1JBLE0Ns9c=; b=
	Da2cqdDaEoxxmh2I0vDOjU0lgAC4Xn4shHsm8U+sxobpFWMwh8gUwAGhDXN7NZKt
	Rm4TVHNaoy08rJzBalVnSL4PAzfJMaj/aAyiaa2YlctwYPTmDsrUg47L8i52ir1B
	nYJs4zXcyiKhU0Wv6gJSh2ioINS8obkIJbdi9Ef9pLf3qybU/Ke3S4iTfKC39yfw
	0NBDVD2PBy+LVHPunr4MGkViqmWfGpycOE/VNFJXTPa+fFwQYL3Bi4l+dnMj5nqQ
	HITLkIp6cmCFZoP1djdMlqZfBL7XzOsA5wnn5rkXOUkhZ2WS9WAVJBi880Y9U4L1
	8OALD7cX57T2vFcGB/pX7w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58s5de2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:05:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKv6ab005017
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:05:00 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8aavwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uprjbbg+C/qyiphsqdp6PqA8hpAZ5vQ1+4SSwwWjfXxSshL/PGUetkKsTQwXGirvBw0XwQLd+lx83y199W8lpe/ZyJsbo/Q+Y9WFEWORVGyvY8xWRCZvxT6cXGdoSTeOnDEDeM65HNl+UJ1jrljy6y1R87+xUkXxluHITYi39vaYNu+bh1K+qLdWjq93S2H5nqxvCiymmYMpZHqRbTQeTvN2TyJBypyQpnMcStCglW7jTaFjM+FEZsHTEoGjz3XRgACR1vPBiR8NnKrbIiab2iCxriyTlXn2stwE5EgZgodHgYKcg539bHjFu0IOazzWwLhfECXa5fKpxMKJaLGNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y94wMHvZNbzPydfIhvz1R+usfu/+t9xZy1JBLE0Ns9c=;
 b=nfP0OzW3v/html3qWz9RCL0ZqRfAekPAYENyGlWuYPp4Eu3/CqcHLQCrD7a3qmFLpfMh6s4wUSsBrqQH3OtN7iMRAbj2xP7GKkbH43XFLzANFad2sMlKrHgi44BeAQCDCAmPZw6f6MqZWlP2E1POOYSgBP3v9dgrxEp9VFlh+xfKUu85iGlc0yxrOLurzYfBdfB3PD4MfdQMNHnhS/NfNcbnRDj8QjFl0xXt4eJug4j3NO1Q8+xxOU6Yj82MJQa5U8AXEoWrospv1wrubhyeyTtZ4CKXsaaH83JeL7bGIQKZRMU56LNwEzUsQE/GO8+WfEhpnhZR/PTo452OF744yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y94wMHvZNbzPydfIhvz1R+usfu/+t9xZy1JBLE0Ns9c=;
 b=z1vpW/tVZ3F/IA6g6dqisBGoT1fWCMjaAWFNBNCTmHzjLlKwDwzIqJtEjmLEnA1j1MKw7HDq2od+QsvZThG2bRIbYWFHhLoX8YuqQj3MReZzwnHX+KpoDmQpJqb+XooYQN4Uh59YUtfR55lwB/RryGrhvvc7jgN+MMdGe4OPkZc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4265.namprd10.prod.outlook.com (2603:10b6:5:217::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 22:04:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Tue, 26 Aug 2025
 22:04:56 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Convert ip6_finish_output to rawfbt
Date: Tue, 26 Aug 2025 18:04:54 -0400
Message-Id: <20250826220454.5003-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: fcff1ecf-2ecc-4d45-a3f0-08dde4ec97be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IeNds0S3tRqO1ZRQW202y3LR0md1BjnSMLed5gDTAQ9dq18vFrduHCBBtDOn?=
 =?us-ascii?Q?f0d9Ho1TEE7GK+dz2MppReAggGpc8j2wTXbJk8t8h0U2FDsHqljJ38sBBdaM?=
 =?us-ascii?Q?drtEPyPLKdFRdukP528TJHD5mm+BH/7O/Vci5XD9V1fDvs/VtTUKt3bp861N?=
 =?us-ascii?Q?k5J9fVBVExetw/vm4bQBMgSZxxnoPbTFPeZBUffkrUbPTKhOTrFYnLIOvecv?=
 =?us-ascii?Q?C6a1F2RBXCMLjrOc6VLQ6/C92nfeZhGKIOyCBWpHl156eB1zt0Eq+a+ERAFH?=
 =?us-ascii?Q?RF3a3Oh7Tzbj11L69etdvDbZd5+0FCF6duqIy9zIM+8I8yY/1JkGSLh30SPd?=
 =?us-ascii?Q?AcygByXoIxWFph+SWbxmOmyFFmG3HrcxERip2vJ5t4+CjbOlWL8j0UFcxW8R?=
 =?us-ascii?Q?Baz9zoeiR34ZFvGFks+JtFii8CAiiK0FwP7EnSLPDrfOZ/Ll+V6xh2nm4BN+?=
 =?us-ascii?Q?RSfngwos+gsyp5uoXVcgAkKcmlObZSr5vulFU0H3yKfGq9z0NOvWKQjjjaJH?=
 =?us-ascii?Q?N9tJ2jgPwKnJhvHiEt9sg/koFaLUv6cspLBvXt2X48ljpDfhhk/33KNwJErA?=
 =?us-ascii?Q?c31AFPY9IIQryhiPOPyJODaeIXY5gkOGg/TxPw9BEuZ80IGuA7G1rNy4yyh7?=
 =?us-ascii?Q?F/jL6niPxGTAFPs9SVWDPqCXtX7AMdw+DvmAPU5FQYc8BTxAnulFRRISUDCG?=
 =?us-ascii?Q?YWnBEScG22g6v5ZlAZKE5dVmYH7TQ6W2I7YLnU92zas0ALMVKrHYav0hv1RF?=
 =?us-ascii?Q?2cO8587ZFOEJHs0JrmvWbG3rqFtsuceap2QHKJXWDF0Mod+x4dFOcxKflVxv?=
 =?us-ascii?Q?3X7yQvI6I6kRM6JsumudRkWG5TNFkECaTXtK16lVx9+7zAT63OQeQPXuCSUI?=
 =?us-ascii?Q?aW0cw6wiCx3cfg3JNAJ330d11AHIkziSvx6gqnVlzvImTxLWgfCVb+Y4WEPm?=
 =?us-ascii?Q?KrcVih23fUmQyEMSJpDo9YLGtKXR+UVM1ZRuagVRrI5nb4Zk/kzWZFHBw03p?=
 =?us-ascii?Q?fKSvhygLSxBCeYNRot3Z3Zy7rceMxtALxFAzna4dhPpkuRAbAlfSaChQ5EDg?=
 =?us-ascii?Q?2EkyxForDst19784G+BMAmpmM/ZLaf1VrMErpDv2Gy2DFlPtb14uALQ++HKg?=
 =?us-ascii?Q?w+20VGF2soCr6G1DQ64v79hmSmM0czY+EMT7CakViM9Ts8+kHgjVxPSrakOy?=
 =?us-ascii?Q?aw6gPmyhSoPVlXjL8SLcRGU5ZJ+DM7RXo0VTqgzwC1eFYU3gZ8kQhFrpS/pZ?=
 =?us-ascii?Q?YIuShBLirC4O7evTP5rZkxduBKQ5YYnaMxk4caHCucQjKAK9YAgDpsplnmZL?=
 =?us-ascii?Q?2iLgdg58IQEfomj87u1UJkTcjfY5sj8SzF0bgiqYoUXTvkG362CU4geuDhOw?=
 =?us-ascii?Q?daAvjQko6TPD2YPLD5uUfDUCy0gbCG0Gv4DkRIVc5p4CWnGhOS1k4if3/p9T?=
 =?us-ascii?Q?ouFBIbQ2guc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CMBidgte3N3mUvoVkJFHpwg5qzY2S4u65ifu1QJqdu2aq0lIr59skJIJiwqN?=
 =?us-ascii?Q?QLmWllmJjcZc7AG4FoXjumCrbz870vV4u8nX8Rf5SsThPCScnFmR0S3J3F3K?=
 =?us-ascii?Q?9Cdch64kLjY3PRIQSLqm+oIVirJQgr9S/3dDzndpYIFi5Ga04vjdc0pOkpoF?=
 =?us-ascii?Q?fJHfvr4jnkPV3EdxuTW5co58eSqwlzWDb9KcVJvaUmkxupwHUJMCc9rW6r71?=
 =?us-ascii?Q?ntg15FBRnorJl8XFt0JW7TSlKI4aKYO1jmst70dnBmX9IOm6Qh4FAxDqcrHi?=
 =?us-ascii?Q?HWYasmogQWf6Pe7KGpUWDc5RjwWeqPfbDzIdB8dLD92SfYWgcjgLZYNkzo46?=
 =?us-ascii?Q?kQYB1bAQ9NH/89y1GKN4ftCBHnVDhL99brJOcpw1FS81MoeoKsc0dDAUuUCq?=
 =?us-ascii?Q?ZWBrw0k+qXfxoenK8SfMchNdms2vtaQGv8hlvSe3m6cWQNjZvaS8uGJeqeA9?=
 =?us-ascii?Q?Wc3rOc/zAVgNBMvpm8u60ni8XA/xKXB//LrQtT07qJuk7/adVg1uaoP5pNiP?=
 =?us-ascii?Q?wTtky9Q7FNBn8mbMrBffDGCDCBHXIUwOI5g/ZFenj++fv7f3CQdNMpKou5wM?=
 =?us-ascii?Q?+l73ZxG19U5Zy5FwkXa6cYzj+Aj/4/NOoCNzFwxRGzsN3rYaFbaaFRPcNx/l?=
 =?us-ascii?Q?pVwD/bjXLwIGWa5sXFh8ZdS+M7DdxDT8AMQyzVharQ4zOsGCi9FNZU9rdrUO?=
 =?us-ascii?Q?GebsNuNWtpWFR1EpvPK00uS9Dh4IxNcCUyerfza5OYtPfl5aikZvzMEAADwz?=
 =?us-ascii?Q?JxCz3Kj0svXy/eh/kHUhYHeLjrE75tIeWMSe+ZvOJ+DP/B74xWZwiOMkNPM0?=
 =?us-ascii?Q?zPUFhksSnEs31sbvw2MlWaD9s6nWv78jJ3+FnyB6HeWOlu83IO1uMFOd69vH?=
 =?us-ascii?Q?5mh2jktHZBosJym9W3ltpWEC2ZcfMrZfrlqTAiu2SDhswhoDn/32vYqFlv3t?=
 =?us-ascii?Q?nD47/+ko0VPf3ArJQp7emk47C6kTf2ECFwDcSJhKP7dNIYZp4Q67iMqKC7uy?=
 =?us-ascii?Q?bRE7mIaYH9uv8XRqsATg+KihTtIwKFR6ZBisB6N2luY5KVr4KRGrnqadE8cI?=
 =?us-ascii?Q?/VzxdXuxGd3TgZ6ezJNrpZoto5QuuYCp2AiXZuV+5l8eGaZFAay1e/+ol0YW?=
 =?us-ascii?Q?elxVHKoGlfQh4K6T+DNZclYOQlxAADo+JojeH6fiE3r19Wt1xilVCO5TQmEa?=
 =?us-ascii?Q?DwVs6H9inm1GVzRqC1Eds9y3rovYTnWgApYqjVouMNM2io/GuZdHG6M3fepH?=
 =?us-ascii?Q?AvvQgFVlK7DITZe3mzVO11vEncL3JmAKvaAt8o/2nLrmewdWF3HlX2VlMXFr?=
 =?us-ascii?Q?1GTomMfaJzdxrzLHWe89/TqQoL0M8JdnEvraOO6N50FopZ+ci9BQxMoudu1T?=
 =?us-ascii?Q?X8vCUx7ykB6zp0DusOEKsXiZ/LzNkWDhH4ohXSmuZWN/RRCQpCxx+xm7NRSK?=
 =?us-ascii?Q?BkmfbcKRY+4p6pnXOg4nhnk+tO96moYLdML3s6v+PZwCJIeU2KTxSfb/N5VA?=
 =?us-ascii?Q?M0OFTb8D844TZGePxRQfbMBiDYTZ45nDk2tNdV2WPWo+0zzv4To3+8/+kddO?=
 =?us-ascii?Q?Cqpskt9TC80UDzn6De6c2YVoW3Xz+XPDyncoTefB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vz+SJeD2QlWrwbXHzjY/dwXSqK59XH9f5f3frb1cR1xSO/dv8/K4Nx1gnIcMp6waMb16Q2W82bnYLMDLgKNWzaksm5cM2fEOcKBXgkt8dXQsYTv/uOSUNWHISVFPm+4Tv/HPGcVz1fwXjLvP9APZCtad8cAUKlv9vXHVRjporwZ7hmUZPMcmsypukNxvfLTzzY0Bs2qGZFrTgKBYzw/cjoT0wMTZrZZIpvpNFXoDm121uSz8JMkwYAyLylMwm7yeYfYJzrFpIdSgw9AfPCissL/8E7AP9Mm4L1lmUIOJM9kYTL6tWUPSXYd7acRmNibKeC4G/c5UaPxmoH/4pCViDCzuQ5/rCLB+nQFjBd+RUWathda9jX0L9aP7NT5rH5mJDH2YeDN7B4fFM1TZxCMJ8tnN//Zcw5KGKHGTlbuBJofnHxrpXLrHiddyvfUQvjkYBD+14FxGzROQEvr4dXDc0s7hLzWJDhucGrUoNJnOwHAAzf3WtCK+Iv1If6viGmQ52RhRkXluwH/glxo4Rgj4Vv/m8rKSHQHX0dVuhpGUKtm298T25lq2L5oGoJr+v/pNzWnpDtEYSTn5+Vsm1qC0rQqhvJiIJ/sq9b6iUQnOb6M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcff1ecf-2ecc-4d45-a3f0-08dde4ec97be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 22:04:56.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tckr2ZVIAvMp9rDemJx/FMUUBpIv47swmd3Gr2Cd/Jul3bfmVNmm4Q1+3iK6Yv7pT0fq05fzuqDWrJLK9QefuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4265
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508260193
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68ae2f8c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QKC5odjNFtLZx23cvuoA:9 cc=ntf
 awl=host:12068
X-Proofpoint-GUID: 7wx5adL96_hyWD-XEyAZIDWSkvyzieWj
X-Proofpoint-ORIG-GUID: 7wx5adL96_hyWD-XEyAZIDWSkvyzieWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfX1wDo6UFnCmZP
 FX4mswSzXCVGv7uUu1aPXbW/l6qrecugQ9gK8ie/kNxyBB3b7ZMKwsGkfAUiHDHoa8zSw0Jv/B/
 e0aqd01t5N4CozoWP8h62UTwLbTHZBNxqFGc81A8UNEug5Mog23W4ym0UQfa4gOSOYHjbnEl0ji
 T344SmV8JH/JzoJITv6yNX9EPWRZrhHzcQaHsb+5NQH7QS7NUS/nr8EsscO4QzCdAFunQwa9aDh
 uSvnmESv8Hp1nsrvpSewgV8NiSXguKRLu4j5zPU6MhRf0DmEopA4aamnZt/vRNOu6EHNNtVYbwn
 43+3/UFdn5lIvcmB7U6o9fJwmTJoGcN2OdZ4bOH1i68AZmcIDqsZ4suVjT5dvhNfRn80YjFrOWc
 wLr/I3ZYkYTqYHjrxygnNmsmnDSExA==

From: Eugene Loh <eugene.loh@oracle.com>

With commit fe2101e55 ("fbt: implement based on fentry/fexit probes")
test/unittest/ip/tst.ipv6localicmp.sh started to fail.  The problem
appears to be that fbt::ip6_finish_output:entry, which is needed for
ip:::send, does not fire.

Use rawfbt for this probe to revert back to kprobes in this case.

Other fbt probes may also be impacted, but this case showed up in testing.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
index e09198061..5384346bd 100644
--- a/libdtrace/dt_prov_ip.c
+++ b/libdtrace/dt_prov_ip.c
@@ -25,7 +25,7 @@ static probe_dep_t	probes[] = {
 	{ "send",
 	  DTRACE_PROBESPEC_NAME,	"fbt::ip_finish_output:entry" },
 	{ "send",
-	  DTRACE_PROBESPEC_NAME,	"fbt::ip6_finish_output:entry" },
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_finish_output:entry" },
 	{ NULL, }
 };
 
-- 
2.47.3

