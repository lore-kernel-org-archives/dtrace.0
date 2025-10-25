Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA9246BC6
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761363896; cv=fail; b=Ls+F2UMu7YLBCZkkwmUCeK8qMTXIZZdHdI4HS2knXeP6JM0O3yPi8hO8aUVQRuUJGAoCi9wIOhZbTQ8JxH6y+e3H84tdfdg1ruGOEYfZHWtwBMHExeSrr2+84KyNU9W0Qt3X71BijqpUKxAO/B+H65N4T6aTMdLej+GKMhLZXg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761363896; c=relaxed/simple;
	bh=WZVY9losIyYBM16LzEF64lyDm0641ZhGsUMPfRxWKw0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Wlqgt1qVsckslckh870oluO+PJhMDy/x9Hbt+eaCxt0MawDKyWwx+8FWzVU2axTQx8qcTytEaMN0i3iP3crXeLTr5/iSDVPOekN9SWtNywngGSpyJsaMjNQHuqwl4OdWr6W4ZiLbFTHzXHXUPTnyOycL9PIzCEy4ZlFBmaZrZlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Re8i2wzc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zzQC3cMb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Re8i2wzc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zzQC3cMb"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P3O3Df014843
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 03:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=uUdqwRxTEdAY3YfW7HZ8b2ojI/dmUfdVecH/sLaM1dk=; b=
	Re8i2wzcC1X3yi6xHAKGE3+YcNbg9HCHwpiWZtkgAFyQ6NJZuS5kwBCCp4ZLthsv
	NKWml6p1HvASTTnKqpFghuziv5l/5YMkr81hflZuNXgKs43TvQcIB6Xi84FOKuX+
	oLdtjPgY9FfZ6HqMyx7XXoyebPoMLccCAuiLcrneRd/fPeVe2FV0PeeRZ12R+8H7
	dFXdZmBr1trJkmG5gymd7VVm9iQamHbd3Kb87gwPcwpQjv5Bae5a4jUZPALZ2ShE
	ofPq5vF7f7cQrXwcsfNwb2Em6uPPTIWDY3HjAeZQ7MJ97uMXAb5r7mI5P7JAIKTu
	ZYIcl7XorHLjDjF1AxXQUQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0nf981kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 03:44:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59P1Xjr8015301
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 03:44:52 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n0523rf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 03:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/8IWrp6qxy0oATnse0YOZ5vu0crCnzacZBkl33FxRJE4Yks3lnLefdSS3Q+a1CMs0ALtZB6goaaodxQiW7sMlOfJGH7mR0C/HDhADvA7ggiKFA18YE+qmBWcYozF8Ae1dqyzj89rFwkBSwko1fLZ/Ah+gD2kaO0RPBuOFx2X6m5ca1HuXXwYmm+/6rGattovDruzlRMueMXrv1/ed2KoSex/sUzrs4w7g1qt8Ih0Cgucimi9+/msBm1IvwOgPOvs5q+IBso8xwNK2AnU/Hw83iu3sRP7Yg4cDi5lrhuEn8b0xSdHai6iGV7I/U7wARn27FuYVo+XrgpWGjdaIVz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUdqwRxTEdAY3YfW7HZ8b2ojI/dmUfdVecH/sLaM1dk=;
 b=sjuA/LD/uc7+Kgkv8k9IU7T1CPCWuUP8Gby1SBKoLYbB/8CRi6u+qnTaUFJdJ2SRqcDfT5+f6msGcguYWwM8CYoQ5VDeQdPI7Pqly1ASQZTgNXxrmHkqMsd7Xmw8b0chaJTg1+5hXumD9JCmf8ONWvBEA79kZSFiv3G9GXdNFGoGK3UqgavrkUx56q/Wl47O1Sj8L5+E4wpE65MYymBqirM+gEqcU5pkXgfJteZym6WmW6kTDYHlrTo8BZu2M1kuanglVQzyqn4nz78E1WZjjYkR9s5LSY3oc/2oWO2xyy0zNHH7ML2voz0AlAUhNNPOQmFutk+MKBO/9iH0GU2N4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUdqwRxTEdAY3YfW7HZ8b2ojI/dmUfdVecH/sLaM1dk=;
 b=zzQC3cMbMlAtVsGr5v8stKu4NPSZRpHBAkm4+zbuJ3+pD+HTezHJoAex8ndQ9FxSeTop2FJeQtr4fjZeP9qCg6LTaESNCSrqtF9s9WJJY1eouwiSpNt5eK5UqQn0oBTdZNUkDN5D0TYu9W0q5LLw1mHnak6vRfsJ0twSDFkUvOY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5951.namprd10.prod.outlook.com (2603:10b6:8:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 03:44:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 03:44:48 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Bump up the version to 2.0.4
Date: Fri, 24 Oct 2025 23:44:46 -0400
Message-Id: <20251025034446.5894-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0069.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3182d2-1ee8-46bd-0680-08de1378d8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aCofy/S/YsldgBoeUp2U2KhsPEeYFrb1vJnnTB333Q+LjQ0JPtch5vCDlfRd?=
 =?us-ascii?Q?A3omFeh/KM9JQ21+cqSkvV0Kr25m2ZRMlMsaL0qNWHAB8r7n2aau2mj4eDVa?=
 =?us-ascii?Q?++NduoBhYopwTNw0tIeHDHV6wvx3Y8qfpx7NCJzNbkU3nzppG25xxOF3j67/?=
 =?us-ascii?Q?Dx3F2e9TxFioXDQn2Z3j8io1c7CCi4atFpDMpWSOYIwrzgo24FEX/Sgqa437?=
 =?us-ascii?Q?vxzximJtstGG5pOtwaGsioSK7sqNFIh2O5AkiFxCh87y7Q1BMj+El7wZvm24?=
 =?us-ascii?Q?Rd1ofa/xMUcRSCzQzG+F7rWpkBQpp7FRua7ZvLR1jBuLPi9I/8CSmn/iGKq2?=
 =?us-ascii?Q?mZRT2aX+TkTCplHXhrEjrlVdF9eNS96O/r60pA416KtrvPudLBtTGFInciVN?=
 =?us-ascii?Q?c9KH2lamCcnGsyBjdqLukxZ5JdzRu+JJEIc/i2x//rP7ltmxf3gnZkPuo+0H?=
 =?us-ascii?Q?dMmSLv89lDhpx9vvujGQXvynxpBOxpOD19WrTVJOO/tN+YQSWIfj9IwedjXO?=
 =?us-ascii?Q?+JSNxpRt8JVaV9aR4QwGGN+DJHNK+aFTpupm54GaGoCJbIaLEmipmlzaCJIU?=
 =?us-ascii?Q?dRdbqTzyPrIjVmiq2D4Ey2GKItTxsVDq/a17zHwPluoX2ZYAegNb4RceVs9w?=
 =?us-ascii?Q?T/71xvvH9+KuMiNtqN9kT4lwjAPgFt/thpZ3XgCfAsAFR5EZaI261G1v4aBz?=
 =?us-ascii?Q?lPFKQu9FHX4Ox29z22eNAmyRbzOLSupNd4pAFYXKdr4GgMj/hr9lzDLc4usk?=
 =?us-ascii?Q?9G2evx9H/zgJB46HYU8pmD6zKClEaa9qS4VLYJikp7lypDdQ0bC/8L3udDkR?=
 =?us-ascii?Q?nlDhyJnmMSUdcwRxKkOpVaTOqbgwuARA36WoCSpbWlQSn3o/qUTpFlRqrPie?=
 =?us-ascii?Q?1LJkt/3/xYbvmtijAlamiTVG/BsK7xhc2KVM2UfxbwGN3evCy5V66/nPPT8f?=
 =?us-ascii?Q?rgVpc3oLEUzitZ3YPm+vOUSNOYisNKwUXgKQPM0xGFmyJSqRZ7mPoifXEGWH?=
 =?us-ascii?Q?sDhH/4f63EMO2GwOLElhfpmCRMQjeFPAV4xC8kvfxzh1QdELz5eBSOjbtsgj?=
 =?us-ascii?Q?4qy0AFc4dovedruMM9IUZdpC8XzykQv74xneKPjy/QfR+RasVr+GL1AD/hxw?=
 =?us-ascii?Q?xeuAV0bPhaT6sa3F+4A8FmLlNOyLKWI/fYr7YFOWmrT3NZcx46QaM3YgbHD9?=
 =?us-ascii?Q?vwHlLbyB7Gyq4cWTmLs9PPwwdNW4ZvKkpNsBpQWRlTIj+xVwHzfCrfykHFA5?=
 =?us-ascii?Q?qzUOUB9A6622xCqnZ0Wvp+PBtewsWoKWJYlWNERJZLZ1bkwjsc44qWRk5cK2?=
 =?us-ascii?Q?H78q4mFyvAcDUW+Rrew/ifCuSBeNlMiNDYNFSYVMV/8L+g/6l+m5ICRsSlGH?=
 =?us-ascii?Q?4DBoe/Bf+333dvivEYqfX95HNdtsPHRl0/hRMHyBeBCKIKNmkdybhwoSqz90?=
 =?us-ascii?Q?H+RMcapSluaNL67di0UCJebBzCSGNlvO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YxTqG3YBHVyW3w6KUqyjw6BfwN9syBi+1S6Mzr9JbztQdfqY/wjvYlpb8+Fp?=
 =?us-ascii?Q?0NcTuF44QPnGpZaAeWZEEt7SxEUaZS9Fdaefw+6XmLA93UFQfxq8O07snHW2?=
 =?us-ascii?Q?0+drafpc05FQWXgorvH5oYcJCfNrBHQHcWTmKnm1AgcbultXr9a73tCvMC/R?=
 =?us-ascii?Q?SftE4MD8G+Xz0GPLp2FHlDY1GTpOM5FnfIwTBFCaADeikk2EznUnCF62K5At?=
 =?us-ascii?Q?+5oXuSQ4DVtiSdSnMoLH6na8CTTZG7ZujWIBErHBkEXRLgB+V0inDHUNQJVi?=
 =?us-ascii?Q?8GBEsgtqiwgswBmPfB1eM6YjKnWI9Os+1f5tUCu2LpCrHsNkEX3UMbpe2odp?=
 =?us-ascii?Q?T5hvH4Xd8LVr9K0rBlZbr26qFRVMlQzqU0+p6bDRHuACNDc1WovVKbz/sIqn?=
 =?us-ascii?Q?e85FvyRTiYia+Lpxx9hnCWBk+0CxX+P4lUv+AI0DJirlCCpTIQvG+PdtdKA8?=
 =?us-ascii?Q?Eq7MuYgxKI86OcKHlsNyhXOkZGSFJLjAbUXvhJHjSXGdOXQ3aPw1dJv8Hr6H?=
 =?us-ascii?Q?b9+UOMS7236M73vTDFPP71sHUtWQWKR9twJDWBfIm0VBUcmFxptO1xI+H4NT?=
 =?us-ascii?Q?L3vf4fmAyU/b4c92hkipsHOUJyu63jgVRb3XGyyG8rFQiiAbh7YewTOZ46Xo?=
 =?us-ascii?Q?1zeFeo8HOXZTVFx65toJte8+kbyUJawveQQLON+SCJUkpyUAg/0D+DDPzHVk?=
 =?us-ascii?Q?r3ek2UQrgEKSW/irSaUqevRl3q0adO+BSCX7hGgAATnM2wv4HSCwWA7HT0kw?=
 =?us-ascii?Q?EelLskLDIJLWhZ+mZgs7iRzH25a4lwftBC+JcHUP854EkMWLDA2ozNLNJxku?=
 =?us-ascii?Q?ilDaTtKUQlUXakDkT8nP/ljRHaYJtglkkWwQDIl0u97jWG8VLglBQNRgE3TL?=
 =?us-ascii?Q?u58IOu8vj1afUCPfcB/X6y9xsnMDw5/H4lTnnvtMYBqp8Gzq1S8rmIIRie/i?=
 =?us-ascii?Q?VdCOpBEKAlHccSRAgIRddwEov7zsxRuSO+5qFODs7Vtf67WhxhHq3Bg1HN/X?=
 =?us-ascii?Q?v83XZDriD0nObit/Rd2bkR8G6eRDaYyaMjELd+MjqnkauwfHitpwF3KjjE8D?=
 =?us-ascii?Q?YgyrtJ6kjeOuVUfnq/r1FUcwRxeV8Pp4JdktesxFMNOD7qfykD0iCeUOwvZJ?=
 =?us-ascii?Q?1kcHIcwq3qSW47EZ8Z+Pp6J+99fgzjrSVfT83yGp2zv4K9buJlwKq7IZ0Pts?=
 =?us-ascii?Q?jfM/9xDrQETwlivtSR5In2K8PwCZYXQEUsNApK/mnLaezCdOvkHH0YY+gxMA?=
 =?us-ascii?Q?qUDvYnwsh9z3ydX29COtjGsdXOJnvnr6exXBqW/sjpd1Y18vNQGWFjikWRI+?=
 =?us-ascii?Q?eXIPiWjBOMmnWLqhE74DF0RDoidAJRwTWimklEzrZZsXJppg7tw02J/cuJCo?=
 =?us-ascii?Q?+sqlHODiZkzNSMnLl1w4l0Puic3D0TEpEwby0vbttxBpfUKe4sNPg6aZlG9a?=
 =?us-ascii?Q?+PqbIgPmMtqmC3GdZC8774vVBQ1BoOK9+1KDNZMT+L6KCpr81RZsYFABo1cc?=
 =?us-ascii?Q?6DwvtKE4SBjeMuWC2jtP7wcqQF9Tz1IPwkrPe1EhylcC8elYTFPBnR7Kv/7r?=
 =?us-ascii?Q?K0gWnTZbR94W3AG9Y+Y06pPvKNyjuS5vKF5pHXzr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1Jsdf3KZFq+wtfVlnwh0JjcJZ2D6A4WBeWFS0+MFd1MIze979X6qLzfAWyTiACrQBBbBWLxyeD7q1aRYoHcoE1CaGvZqIxIF1PT1E+OXTFz2k2yLo3K5oz9qQ56SBvhPnoMi2d/GJwpGAd5ZyNLjiIsl4oDnkJiwhl2uzkP4dV1eBE8pzeVfJBqbk/6lg5lFKPosa4mgwcPoy0Oyp63rt31hRpmfG+tEABceIATXDG2kwI8ZDOBTrdl9V0xF4SJIrnaD/S+K5A4Z8sPzlnEPTeQjdOEKYeqwCBE/hAnijYV5ZOy03K8NzCnzD8/zgC3Epj8+rjRHbFyoiO+tOpdYVMgwz+G7Np2AxlBkNtbj8opUKnmQEZyFwB+vxSYo/fDkD11fHK+1Ws3paOoyCpwkHIsGMMpU9HAVOFV9trrDsg3LcRio++DXo4Pa5e/gMEqE1QWu8RdS1SNrUS3MzR+IT/m2eqRyB9tgyU1+SijXKe2QRbb5++OFm3dgzTmZG6wr2HxQtMNoavRX00CX25iFvjC26UJiHoJG+t8gQI2II7t7UqbwMu5xWHPQKeCTDe/lzYavt+lRy7PdnSaRvJ7/11LoC6q7bT1pBesxE4u8K7U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3182d2-1ee8-46bd-0680-08de1378d8a8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:44:48.7708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiC++Kastp6zuv6T5uLHHqzZucYizffhrboUzr2DA7F49OtaEDQhlmxzqc+PA5qnI6RAMaEzr2yUGytxOH1WSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5951
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510250030
X-Proofpoint-ORIG-GUID: 2MS4j0MmMozE9qxld-3BdEE77eO9cH5b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxNCBTYWx0ZWRfXxa99SfIrZt2h
 +TfXQKB+EIf/StLJBXZF3LmU1vsusBQN32o27pVgGWJrjY9MwGT72vw15NVP4N21DfYbKu0/Fre
 VPjTICKYsK2Gson02ozB7VMjTIdfmbU0jWeQT6J1vcgrJRSxRc672mrwJzbcMR0fs11fqmyMEus
 0qslVgZVLQKi6HS5eVXO6qToj5Cubo1ehv/y4w3DwqRfxbCUGKlkJIjV+8thMWgSqmu/VYCeUsJ
 emLQZN7ZPAhIA105byN8LWSbl04am5NI32HLKeeoyBg/ZUVUg1b1QAUjO+7W7dPyb9oiz9lys1N
 bLbkVPjawIc9WbetU6W2RJMyW8Kb6d7GYNw7FgllkmPl1zs6La2Bh6xXAUKFdRSoj/Z1OkbiT0s
 IWLyYdE1lQYCrp51/OUb+gNOjnp6dw==
X-Proofpoint-GUID: 2MS4j0MmMozE9qxld-3BdEE77eO9cH5b
X-Authority-Analysis: v=2.4 cv=TNdIilla c=1 sm=1 tr=0 ts=68fc47b5 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=HbDaBVMlfWAihGPYW_AA:9

From: Eugene Loh <eugene.loh@oracle.com>

Note that test/unittest/preprocessor/tst.predefined.sh checks that the
__SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
message, and both of them simply use the last entry of versions.list and
therefore will be consistent for in-tree builds.

When RPM packages are built from the .spec file, however, _DT_VERSION,
used for the "dtrace -vV" "This is" message, comes from the .spec file.

Append a 2.0.4 entry to versions.list.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/versions.list | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libdtrace/versions.list b/libdtrace/versions.list
index 8986d2007..8d858f0bd 100644
--- a/libdtrace/versions.list
+++ b/libdtrace/versions.list
@@ -65,3 +65,4 @@
 2.0.1	D API 2.0.1 Linux (BPF)
 2.0.2	D API 2.0.2 Linux (BPF)
 2.0.3	D API 2.0.3 Linux (BPF)
+2.0.4	D API 2.0.4 Linux (BPF)
-- 
2.47.3

