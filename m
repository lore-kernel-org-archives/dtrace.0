Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3C1F9433
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736897912; cv=fail; b=Kl8lGThtemPcGMq1X8nuIluCw81fEOAVOtertf0bcOAnezy9nEGfLEjmhKFfE2m4k31X3Xrzf9P/DS5EvNz/EgChI32i4U/3qecaagA6oKzdke7eAz6ILmGbqO81Z3gco27WOZ/6ylOsNJMogtGgcDlwGl5u4EySZtdH2ySYKx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736897912; c=relaxed/simple;
	bh=PyTbUiVoGnJJopSZqp9FNuOFFjoWNM/mZvq0OocuM5k=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ly8zVZqTdQlM5cA/4zsQBT3VeCkqo9NabPzTVDYeYuXuWayMYOs/Metl969NGqyAhOj+aXY5L3WLL2+B34/Bjr0nj2mBqhecf9FvC23wLFw5KwfY06knMakpkonAyWxmGl3px/fk59q92P/pfhr6oOfXauJmPjObhiLLicxf6f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SBDjCbAS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bSTXT4ov; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SBDjCbAS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bSTXT4ov"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EN3L6S017286
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=3f+OILHW0iosGzJ/kS2jq5nkGq05/i4o8RgqtrebDpM=; b=
	SBDjCbASehMrH7SWo3JTO7HG4ihS2C+CmvMF5c2U/IDG3mEFKkXWhYCMKdYh4ixm
	9GbZjU/y9uY/pLnvjCt/LHiWVxdVMnFWcstN4RUkaLoK+vIUh5lmBABc2ddG+AHs
	uofcqsSsczZWp/sWGAZSNxPaYg2trtH6QgNyI+OZoDy0OK8GHNBmZtBr3nfIIy/I
	fKaQ29yk2rBy5wfTt0lrl2jDdhiC4qS0FSkGRmBOKxlY1TTv4yQheXFpLQSNmw9h
	2UQS0y2lTA/LUIRHBg+UYGbZkkVuYeK7hyOGdzPVF/nuhVZdVqwu/ktOMPlI+te+
	pM5hFZFkuqoOHZJl73OFZw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443g8sev8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50ENM8Lm036418
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f399uux-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuM3A76NGs2JGC8DmSQVnI4F/qv/i7B3jSmN8c5QdP1chMSYWPlJfEod/JSmDpmDzfa3gNUyXIWx/D5BmQTQ0on7FKOsRFiRDs35pEw2+yej1pFzflwLh49ECjbazxic1rEknC2c/4XbVXmbVDN7SvQhfLiKt+a81P1jRiQW377glWGpCQiCJg1oPEs7nZ1THO/YQECrOXA/MelJJulHh1wSg7tdV4v8zlJZd/ONnJyET+Jeb20Dg/5jpLHevTQv1HYe35nrBJwkTXsBa9rjH2AoLX9TrTCzxbqYhkyPxvtQ6lbVxhTohvaiVUwM1r0RYrFHTdZgra5j4ffN2Qf7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f+OILHW0iosGzJ/kS2jq5nkGq05/i4o8RgqtrebDpM=;
 b=AcyOZF+XTrCercEOUv+4avVTBKaeix99ATjh+qKDDxVAMHCn+aT2a5X2EsgYDtvLZIeuGPURDPBFzG7JQ1tJP9Te8p7lMs7XAGcbONrR51MqryxHuKDmqYSRN3Ct0lgNsbxCWVQOstzStbushbJWgBWDLo5WqhAgMuluVSjIG1kqyuNUPqSmMfBvpmQLA+BO1U153tH0NZhbpOlzFpJG7QL11tqY8NsQyy7H/2sIf6CBDO6SCBiE+X7c0X3Sn5Gcn+JRUP+xc9m/++DTV8+3UVHJYhS5ZF8wShMADmDEqarT79md5tvhJV4ZTSpKG1d8CBoIRDDwEjADP00Xx6fn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f+OILHW0iosGzJ/kS2jq5nkGq05/i4o8RgqtrebDpM=;
 b=bSTXT4ovPIQsjW5VaQ+UEIDOgGXFjYWXj3GI+3iXrwkdhCqA9Eki2GSM7Nq02M6AJ5YVNvuPmbzpPAfEGpXCVNPy726U8YkdNC1KDtNHz9XJYPd/EbGajuJ4uUQJ0EJN8Euy316k0ACJkg0qZ2k9z0B8L2zG9TTy5EpalT16boQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6477.namprd10.prod.outlook.com (2603:10b6:510:22f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 23:38:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 23:38:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Convert some indenting spaces into tabs
Date: Tue, 14 Jan 2025 18:38:20 -0500
Message-Id: <20250114233820.5501-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f1bd06-ed3f-46dd-adac-08dd34f48aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FG8lN46vVVO1An0ZM58X0irm7SyYilrpN7IwKLSqYn/KlM5KoxgQSsj3K0af?=
 =?us-ascii?Q?k2m4zEsZ2+vw91fybqsZCsJjiq6NNgzKfpN+/2wLZsMldQrcLdZ2hApvItjN?=
 =?us-ascii?Q?u76PXhGeLTBs28RkoCRcrgZnu/S1ZfIcPRCya6kiyMXmewyEhPekKuTSebIE?=
 =?us-ascii?Q?49Ldg9zFPuphEovRuJoEljEkQBfNxkmtQWxsozi3ftkuP96B1D/x2CL4Mmxz?=
 =?us-ascii?Q?CyF1RWxuPOUY2u8FX6KV2bfJUixBn6SedhJgDsoL8ISquFPXrvhfjKeCzSB7?=
 =?us-ascii?Q?POTj2SqiuXVpvM7sh9HeesivYQm6+axfIyt4ATy4LHEVP5RjBG2vz9gloa5V?=
 =?us-ascii?Q?RjkKoUHSQoSS9sc+wPtDQr0mXrq4MwMg6MT6CTPVwSq+YzmDi8OTkd1Hk9Cd?=
 =?us-ascii?Q?AZD4pGbux0FK6OdVmpDslcfW9eGXR/bp2wz7h3/ToukX6rkzTyEn6EGFd2DU?=
 =?us-ascii?Q?WpmFowLj5gnvdwVRHGpBS7zQ7U4JDk8aSwiHhYuaskaAwDkVeA1c9l5+rxSI?=
 =?us-ascii?Q?TLiRw4BDBMTp+kRFl1VESwhDZfJKiQR0gHS52D69K52osB8MX8sUowW2b9V6?=
 =?us-ascii?Q?kigdEnTJ/O2jkpV7uT1f2Oy+iEFDuDzIX9riDcqMNbQ2wdNHbc52xGWw00um?=
 =?us-ascii?Q?xXcedhj/S0SzK26yP7pc7xWbLYlNFcQFxNjapZpKRUZWWfvW5KMYUVlRsILZ?=
 =?us-ascii?Q?kMVH2uW5whFz3ig49TlqpWpZSejXMfSheLhb5CsWwJKivuS8v+l/uOijHBjo?=
 =?us-ascii?Q?CbLryywW+43feziHExxpGkCJGyB6oFmeUMtDvPvoe3C4xX4U79BIKHuf8f/k?=
 =?us-ascii?Q?WNU6AhXrb9LIrD8mppZ52AlnMCn3CPtPD+lVix0d2uTXkPqm2a/G3F/FHlhT?=
 =?us-ascii?Q?ljFNv+npT5yKV6kWpNapBT+dTzF0F8LfpUfHeQfLlIDUvjUdVBPpLYNNKe/F?=
 =?us-ascii?Q?ZfJf/0cnns6g2nspT4EUqhIhQUeiKxhBBZhtqTCQTNRV5Vtu3vT3dDNNOvpe?=
 =?us-ascii?Q?VIKNSMcoqCCIo/JpAesWgJsHdIjDTlnLfji4+7MgpUB1vBZCQB9K4BjNcqJr?=
 =?us-ascii?Q?lSx7YeNtcG592/hagBKGFfuOkggT/Z2iT25FQuf1H/PDjwalvbD3VVD1NUy6?=
 =?us-ascii?Q?QxA/LGNOLtC9GXpQz/rZTs8VU3SWZgZyHfk+uu4Lo1+l0ANj0xUrV1yR7wIo?=
 =?us-ascii?Q?T2K+8r6VzH2zTEMRXnEyZ2UFzO4obx0m/f5hpRtzDZGEM6iMb3a+PGhCGLw7?=
 =?us-ascii?Q?lL3ToVUDpryhwNBPRtcfOkRlJfUrg3PhrCb+FrShfBqwcwiReOcwThqHBtGc?=
 =?us-ascii?Q?bPSjRp1xLMabLSC0fQJgjZoKXU351PUpQ1zDHBEk0lGPoidMoB3USUCnKkwH?=
 =?us-ascii?Q?9XtRW/0Zoo16hwkttJpB3wWKwGWR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zUAToaLBg4SNo1TLK70cJ4tnJs/El0D8BnDl04fSxiPSSAAxtQ9xyIDk2ieu?=
 =?us-ascii?Q?OcmIeF+qTBIsFkr3BtsiU9piLk/nKJgXsNBuJ/Q86QsPyx+BDHzADNjtsvT+?=
 =?us-ascii?Q?QKCghG8Eo3TdtPbROFusFsSSaDYoicNLC4fi8CHVt7dxe6Il5cOQHOV7id31?=
 =?us-ascii?Q?cSo7Z6hunTisi+4YUh3iuptBgtoC63qp4gw/fVJpkTith9ZQlKSETmqVMzEu?=
 =?us-ascii?Q?plCDcYPSD39OFj4sBXvLn22ZW9Ieye7i2uCQD46uUNCECMclqGYMH18hn3VP?=
 =?us-ascii?Q?aJoZA4Y2cQwX76TYaZPaZcRlt68AIWMxPxBBze4pr6ydYGg9z16Lnoi7QVTd?=
 =?us-ascii?Q?BvSpxPnyUxrtAhVcmfbo1oWthQTMDGLp+e0qzfZ+nFz4+vp0dlUn6jECsJ3h?=
 =?us-ascii?Q?ba1prfyt1frAxvNGG2sfzZ4KvEp6JTQfeTndjoyl/OhbS5lxpMClloWLzSRS?=
 =?us-ascii?Q?6J1U8cdJM4MwMtCnpSiFcG+ry3ZTP1z2sxo3Z1tMLsy0KhU3mUw+NLomlYXm?=
 =?us-ascii?Q?ifIlOfqdN8wcw5tv3RUSPYxNsBLXYIhFnHNIgUXjEYN6sN0o3LMGgMZFALSJ?=
 =?us-ascii?Q?+q/O/1s9kAUBIBx41w/wdveWSOCHVMVsXPD5GVl2E2tiRzpupRT67pSUod8A?=
 =?us-ascii?Q?roCBB/72fNrsop58f82oUo7dhFnLNtR2MzXFvoLEvyvT1Dlwt3ZMCW6yE35j?=
 =?us-ascii?Q?L78Ov9HPyCKTwjuow0TXoKh45OQqUekQatbqsQa+2QAeezD1E4COz3xlm2Pb?=
 =?us-ascii?Q?e5WaQNc5QpnrgvoVJmL3T1tzSGiKlEIEZIso12WbjOkviFwwshZY4E9fTWSk?=
 =?us-ascii?Q?IfS7wwH4DJt3HeKn2c3USd4WWxYOwlUa6U1yqn35ZR9zbFkNiiGwSdolTlSU?=
 =?us-ascii?Q?tWBCSdxF2T8p60kBWpSsOSkAy02ckBr9g3lUwQBryjNuBYPZi+xNJswEOeBk?=
 =?us-ascii?Q?5haIjExsgtAQaUXWLuj6IDH2tl9AWBrhPPuSsQMsLybTnPqDmU2ty7fYTvbA?=
 =?us-ascii?Q?6XYIpFRFhQ6FIh9z112Tl2BxtYENQLNRxGffZEsVWDDWf6pX/IZkfNxZt+Rm?=
 =?us-ascii?Q?YnTxeTurJFX++2B3NdkXyEeCzyyCEq5lO1Sf3aXzHAAeLjlngoxX0uvCpbtP?=
 =?us-ascii?Q?zRd49R4AsB3RUr/PiGx9aN7XyIndeKUUCUQ4wxi4rEswL2iP5Ea5bC3M5Zwu?=
 =?us-ascii?Q?T91aeraV0+RcMZjROtN5nOUoKSZbU65OFqlL63Yn+fQdPWnMxscX06yQ4hHE?=
 =?us-ascii?Q?ZcqScM9TARaexHdzuOrZColfohLALunlrmePbweIsXvPbgTTjPoqhJQBnMeo?=
 =?us-ascii?Q?hr1+9meO0Z/7mWehXPWFpEHZ0HegYUgN+LuHrfeiFZMNnlqPAH8Cy2ghXcTT?=
 =?us-ascii?Q?Qg4MRfVamj6Rq/LtHbV7PL9jF67qdznYG+kyzKd71OIM3ak9uMqOVEC58gCy?=
 =?us-ascii?Q?XbB6mLxPmBXT0CA67e9IxYdTddRdt+W5OIPgLUdpokpMsVeRR9/IwnX9ogcD?=
 =?us-ascii?Q?mSbvso7U/orMxXlfEZn852FdmlYV5s2GfbyaKssZBx0hVyAFr6xZomskXduo?=
 =?us-ascii?Q?BDBcpkIkm2N+EILBdkTKvxAQ9VjBsYd76Oviw1WQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eFz7Z4nwaKRGI9XrhBiPDdvjWVAQ/Xj5bnUUgBUUmnbPh4jw+pV17h6X/vs9fqduKZIbcL/1OKYJchmbBmOUoOl8FEyy5DOS9ch1P+QKKObxl7UE/wIULVGRGiODlCVxZjnm28o5oYN1mWE0sPTG3p0wH7dcHGkiuhwTMy3E5mjxoFjETAgFoIqb9vuHa7PoPHbrag+3KJg02nXgSTxpPU1pXfvdHjWqzbpSuO6uIerwfIKycf89qSjkDU5GXKPibcyJbaeC63of4H7eitBIw/32sv6KdPMj6pKlgPssKwHnBBdmsyrdoNuEKqDPZgJNxW0IwtpOvDNeOc4r3427d5dK0E2+hX+xwPFvRQs/k0/x5Y85G75kOJGpsPkRiQE6C3eDbHzj0fDN23/Xy157go0UK4rV3G1ZbelsbFoqMYyePauSuLdAW+2hT6Dw5CBMmy77Z5xLArxnPXN0Aa+ARu786bFg60Nmx6Qu5+DghCaDi3av79ppFdcF4oDLOdgaOBHooaoPnO0/nbp3jBieL8hbeF3+D8BUXpJW8wGtgsadd4pIaX+RXl7yGYfxRPJyE7wpd1jxNPvbO1Xs7XtMCAJxaUVCOIG0DAVzEcSUDNI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f1bd06-ed3f-46dd-adac-08dd34f48aa7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:38:26.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki/YE09FkogNpBDe4V6QxWSET+C0/ZVR6LGO/mYs/E6+/XC3vEyaneuTG3BojLScXDR+eALqSVNkFi+KwzqoRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6477
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_08,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140178
X-Proofpoint-GUID: 4uFf_2pftwq1qScHeb1SAaaTAhnSYYwP
X-Proofpoint-ORIG-GUID: 4uFf_2pftwq1qScHeb1SAaaTAhnSYYwP

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e96479963..5d9f74244 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -593,7 +593,7 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		upp->args[i].mapping = map_arg;
 		upp->args[i].flags = 0;
 
-                if (i != map_arg)
+		if (i != map_arg)
 			upp->flags |= PP_IS_MAPPED;
 	}
 
@@ -716,21 +716,21 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
-	    upp->flags |= PP_IS_RETURN;
-	    break;
+		upp->flags |= PP_IS_RETURN;
+		break;
 	case DTPPT_IS_ENABLED:
-	    upp->flags |= PP_IS_ENABLED;
-	    break;
+		upp->flags |= PP_IS_ENABLED;
+		break;
 	case DTPPT_USDT:
-	    upp->flags |= PP_IS_USDT;
-	    break;
+		upp->flags |= PP_IS_USDT;
+		break;
 	default: ;
-	    /*
-	     * No flags needed for other types.
-	     */
+		/*
+		 * No flags needed for other types.
+		 */
 	}
 
-        return uprp;
+	return uprp;
 
 fail:
 	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
-- 
2.43.5

