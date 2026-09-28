Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC354706C
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618611; cv=fail; b=J8HJSNq0wN/sb9PWlO4fVsiSqTxj2rO6ETQlVvmfTQxFfwT0akeMdIi05DETgi04IkkDVVcnzCbJV/FwgQ4Kbci/jNyuQZNqos1av9dk5uKW7Ns6g/8peVo18YD+OnzLnfNT/xyLmFJPfdgcDhTUiZrAoLtFd+OelWtfjE/T9bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618611; c=relaxed/simple;
	bh=I2856GmIqS+rnXiE68dcd/7OvrcYI3FIajJRKgxc1so=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=QR5HVR6p7tnIjVbc/vO57tcQ/YghcNKn8liKeaY9IR/Fdq7Pmb7NqaldlS6by2lYbPYbsDwR/yVgcAEgkmzMzGH4ZD3jxTym2A20Q7g6gmlt1FqXHmRddqd4LyvKjHqpoO1AsjR7x6lkr8ezvHi8Lb0APLVgjZCM5n6UzDG23eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F5VErR5Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QVdhGArS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F5VErR5Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QVdhGArS"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDjANx1909216
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sYCKRkupj6cIGt/ejKlgyHc1nI+C6svxWAV+ib8gWhM=; b=
	F5VErR5Z8uNYKwy8PriOlzr9B9lxo+IukDUJuZLcMrrIvDV/2AYXfQskNuNjMWDg
	e98csJGROIk8RIdl47+fMTA1pCZiiPK/oBBuUyVULqcEOPZUuA9MGQzZc2OJWXhq
	x6UKEiFww9DeFa0gCAoaUEeJxU18JuHlCNvvc+oYN2SzJrJtLVzpho8Kc5w+R/M3
	xwq2RLB3r2b2iOCJQaUjTXT5CXMpYIeJIY/vcgNAay3R53TjPHFyWdH7UkJrtSWL
	bAGZtW7phIkEnMbS9tqy5F4gOuLr/Ye5wmn2G4rPkHwgujJYi6jSXHoxmyKB6jh5
	afOBEae+NlV+1IqP99cmGA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx5x739dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHZOtf020716
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:27 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gnpjus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PavsqVzXujkQbSlcUQIfvLWcKpYQRGyPvKrOYuSpfLpmMYM39Pt1yPt+2EvHJ1hYX+HsrRyOeUhHPzh3Hq9u3Yw8RdhB9Lc205iqPgGi0dqthBZyH0gJsFVyqoY7sQrEzLfp+ET9ETiQVby2DE7hwXfTFiGGTEMJun3qsMeZVWheWagH8Lbq/YOp5acCWOAGgHcAafX5JmOjByQu6ow0EMxgWkEUZk6UM4B3bvBmU3k100bZAQwyRz0u/MIhyD0fjk4nZ1SZmenOxbkzI4QgWSPBXxrfxWZw3mVgLrh0/0VFgU1a/WrdCUhAp5EKwJTyeTu9qzZ6X4VSpJiGqA93Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYCKRkupj6cIGt/ejKlgyHc1nI+C6svxWAV+ib8gWhM=;
 b=QNwC5jRu9Hp0CcowV76AmhEwTI/incOzkfEp/GwmaI00oRsVhHvJ5uiMUeqD07RHn1k1Q+HXatP0tQ26KN//cGa9hlUD7AIG9YQztfIGZJUSXPSivG5PV5cjMbpIc9C93KhbQHlnaNjlZDFzkt5Uoi+WJ1Ecmz7BKFgqMkAICcva+jD7MjIVgP4+TMYIztNgx2C0jfPSD3w3XxKDOI058LdPCY6WVvvakNoHvdGA6xPtJABXGsXmwR3dRc4j7j72SNpiJkl1cDiV9cEkF28rnZZZ0iTEywW6InhxkbY1b6iIfL2Av0ilAxXPz6brVpwLSnZ3tcaHFLmWN1vx4nFwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYCKRkupj6cIGt/ejKlgyHc1nI+C6svxWAV+ib8gWhM=;
 b=QVdhGArSSiPKZ+hJ4rQ8KJ9JcChD6WO9IrN/cbMUKLDQgxabTyzuoGKYZLpYuvVFWqm8LsyYyaJyCHdxcXXNaEam4tK8ddLVZWgT1crcciO3Tu018953ASS9dMel7CdpWh/d1vx/1CzXVWk4X82u4bHzZzmuevikYthLT/SMiFs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB5760.namprd10.prod.outlook.com (2603:10b6:806:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 18:03:19 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:17 +0000
Date: Mon, 28 Sep 2026 18:02:02 +0000
Message-ID: <37fee739c845dcd5d178eaef977d98c2@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/8] parser: resolve explicitly scoped user objects
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf888bc-1d5b-4de0-58c1-08df1d8ac604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|18002099003|10067099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	M4/7sg5llw37ITcJaowNCftnb36c180XuX73rZ7/WqwDGIbqvpphUMqo5lwL2UPLGXv27Ew5LTO1HSi+mkaexSUTkYoffdkMUx4SlWT3biysAqReKU0xF6v9xfYoSE0l1l6LU9Gim3z7SM53deiY9PR6a9wUbKSWq/xs0ecAMp1cL0YbMg2OwTJpKBRiHTn5hkJ+IfvcpW/xxYKvn+wjU5dMbYGDNr/D9CNuai7bqm0li1AWkIevTTWDGK4qvUvrqC0lsh9a9qZK+b0BVtWNpEgejcCAe0zKDX4vUB1qHSj+KA54ArAzu7wn3gxPSxEXRyQzq9iRzJNIt/frnfvLY8bu4ZqPo2halmfxAQzQFpyk+/6F4vTndl7x6k2FYVRU/eHMIr6mwCER+XtGj+57SR+fHQR+w4ETPxPDW0biBV3wrI85LzdfSPc8e65mvIk3/O3rIM37kYSjIPv+hjQyJGPJ4ceK5Nk0qAPdDKjVeNU/9BCa2rxsAmf6SJ1TYCQhz1hkXesaMGfO41Qg7fmbpZk/VizIuuavH0N09fpJI8zj2ZeAKbmHr/AdEqhaNN94G5KyWJzvuqUdF+AXcCAR4ttwbOmhmv7AeFv39GHkTCoWaXlFCXkyHKIfr4yXVpRMap5Q7+eG7Dx1reirk+ZIH3Slj0fmzGulTrs7140eUG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(18002099003)(10067099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5bG5x5d5CmXardVbl3qYozG/HIGfUaJhzTnoJ6mBNKAmRJphQmO5QTvP/O3k?=
 =?us-ascii?Q?LAcnJiCwq2cdNkvBaCsoxgtIf4Cx6xrdq/+ICpl6aQAR/sapHH+XQ+Ipa1+g?=
 =?us-ascii?Q?tp+7nbNtzLKULWARdo7Oeycglg+QTjGDSK+WsoVE2RxJ5mJVcEvQ9BJZmzZK?=
 =?us-ascii?Q?j+CjN5oyMXN2tYL2YHnO/9TZKH5BTJVflRyBxr+hB59hLE4h3tYEpatCnpGz?=
 =?us-ascii?Q?YqJIRGpTBEQYQHkhPT9DzZvBq0eviQ3zf1J6DF7cLgtLKOHbQTLtGFT5ENct?=
 =?us-ascii?Q?5f4SCnciXIgm5C7B1iogonDsNGp8CmL7K6ULEGG2PVE0kIO0wAb+UaI3abdP?=
 =?us-ascii?Q?qAFh5gx/KzlFyA4/wnsCgBT8GSPBvYhH2W2uHDHUbKjAQp/fAAl6TTX845xI?=
 =?us-ascii?Q?5NBRbKK7HvkbYZ5Ee4AZr8aOvzw9Kv415srut4AOFaWMjfxtPPAaINqaGEpq?=
 =?us-ascii?Q?OPVilV3ou70bCSmjR+GXXfn4dJ8/x4sHyXq9te0LYNBaFmQpqpmZie8QLeYX?=
 =?us-ascii?Q?vmbH8wF+bu3M6oJMyG5A9WamBL/z/pD5eJjpvmq9dbMdIO9voCl4mc/MEWrA?=
 =?us-ascii?Q?CnOR6YsJhdx+ZC65BfDQKfUAJ/OmDqKgvYZUljcE17mvgEWk0lI75urm5jum?=
 =?us-ascii?Q?R7omB1ddW19YRlsJPCTzjWvtyZ50WsuTJ7XaW2IGuyDuCSWlUgSI70hS8DyN?=
 =?us-ascii?Q?ygLRlr9mVuRVKLm3mz+Tjnb75a0EiMx8i5+r6p+YQ9d0c/XT182AHcTEqIdq?=
 =?us-ascii?Q?KenHYz0VBEVMIiB0tDxEa9HH0Eebo3hFwhWO/SIhFcc+aNp1oFZ/4cj2udlP?=
 =?us-ascii?Q?wZ1Ep/cUfFAup0KrDGqlhQqRdFpeqAdJAndROhhWr3/BuhA1QYN+YtIA6FqD?=
 =?us-ascii?Q?nlAIfHsBDXBoE7BGu96I42pdUBFoScVc3Ih18x5eu2EkKjOd7PxHZQL4N1PP?=
 =?us-ascii?Q?jZ427UnaAoq8pAG+1ChqYHbfZ3CxlfvsdU2dbQFYjaU62B8hkxh6Nirto0O0?=
 =?us-ascii?Q?FqrWknLFPlp8yyOd997R7pnIxwJ4ZsdMTcCL0tx3c7YvMwoTEy3rQRNyi998?=
 =?us-ascii?Q?3kjtWsoKrl9ZP23TZH14I6Y5htsISBsNKCwXJMxgKgppeU2p3DoYAKLCYyvk?=
 =?us-ascii?Q?HEowk9wH0EgAiTgW4KtQLINolsf90BKCW/ieoZ+MR1JCBhJKedszQcVUfI5o?=
 =?us-ascii?Q?21tAkid2lb40FM3UwWERAh0SXVFpnD4gPI+gnBndYtwDdPlRaZXtu8JcV/E/?=
 =?us-ascii?Q?E5E2tQoI8Rtjn804vsIDdHuWS33lWOBiK3KuKJOboiABY+wOFX1FmF9dm7yd?=
 =?us-ascii?Q?CmnvKpuPKB5rh+/MBPCsMVdJpAIvBkaIpFKiVX0CPaIaujLpIUBDvie9uxuI?=
 =?us-ascii?Q?2G0hoOSw3CqbUjmyGXXxbWo/0KQgjWQCPxFOVYilmuhpUWQLzowlo/nSmZJD?=
 =?us-ascii?Q?SrZX0xlXTR4DO1BHZkXCP1j9EK1a1VxBWEd018eWbInwa0OCtxK++4LkIjDW?=
 =?us-ascii?Q?PsTMJkKtqdoFsyzxRL9goCFLDkx20ST9IwQUDTPNlNM0IqeNnUqLg4TeeJXd?=
 =?us-ascii?Q?ibLWBBQ/ljOqjs0oxuUfYnbNl7olnuA6Sg7bBrHi9sCO92UKGQeT2AENZMOH?=
 =?us-ascii?Q?CsUacxxmBE0WPsGzCiLG0EEa2uvXIDvpSCRC3VvfVLfK23opO2DsIY4h/CO8?=
 =?us-ascii?Q?hClgWbbBZxyfY/R43WOGcSGRaej/E4DaRlT/SJtTS+RivvNAT913cEcXt4sa?=
 =?us-ascii?Q?q7mCC+M5d455+e+4Av4DJZVj2Ot5xEE=3D?=
X-Exchange-RoutingPolicyChecked:
	xRMdHxAJZkCeEAOHUWA34NhHldjXt+w8txzq5WqEbaih5hqblIPJETE4/70xTsLdAhjSx2Cy21Tom1FQR1jk3QbmSCO75tLopaW4TBI4oTqfUVTa4f2eBoYYQcC2AguiGA6WbCeBOp9oQjmPJLaKmd4eY2uf9j9iMsJmM75uVW/QbvPMAM8bF/LNdZlRAn59iV6+DszOQl43jXJv38nNrCMhaZA3U3T2aVm2oTqSkH4F2wgl5UaoOtX5WEJV61z+Aqf3rn6V+cModNsRLysOQxYDljg5FKPKGiIjlCrpXoZH05i/TvMdywe75paUTS8e3FreBgya/RhOBtKHnOzBGQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OXF16ivO29g2ZkdYrbVOBXvGx/AfYoqEryjQXWnZO6lNtRf5NEcDzr4FqE4DXYUUGeXeIeb+hpBlGW/955Yn0S2zjJhZEjPSVKb2lzl35BtuFd+3jtQBwRKsmbdN0MrZEaawB1TLlgshMIqLrsQmBFluX54UjkydRpJfSFW5RJpdEestjHgOCe2dqzmQd5jWvI3+UaVM+f9YhRHvduUb1KldhyM47+kI0NeWjrMmmrWC6+B7JWFEkC9nqbjrr3XcDFvrYAdHHwH2zjTtkpvyZQ57QRJF+Fb6JKz74H1ifp/nImKuvbiMGyTDGbXJ02U17Rw7D6s27Le/z1u53Hz3fDo7XT0b8M+O7BuOq1N3CVUFCNRL9k+0EREusDpI8LKVzI6wR5C0WjzBdmUbuiiMuMKUb5q7H78znRUziubrvRoCPR8rvU5wZvr3VNlnetEUz4/aY0F3OlnnN9/FT5RjUHZqQVVBnP1gZS1oM0kBhP9nnsbv7BEJNyBsn/4DAvBjIopoE6xVjyDMXtp7KCZHK6byTilIWhqWZMGKC4bm6+u7aqU2D9dxhQnCE+I80Lo36joQB8zgyovQSf7EnNuX1K2fT2ruk3jxBtFEO1XdE1U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf888bc-1d5b-4de0-58c1-08df1d8ac604
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:17.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBBp0DZtn1ZRWWDtCrO2wwbtSaKS8NzPfWQtVIjgfkHdjH5Ia2NHq6MLxtvblljZ6jhI1J09Ap7b77/xb2HrHovAR7nF6WiPlsWAjqKHzk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5760
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609280070
X-Proofpoint-ORIG-GUID: JxRqeI_jZ8ZBY1Pz9En_H8rRKTu4ns2j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfXwSdNc61kbVK5
 ZwNee2RXlZyplys202R5YPbpfi2ZOnxnNz6VfkPV3g2Egu0XzkOGURcElkivvpzlzY1HMsu6K9a
 dyYk5FAxlb0BeU17xetjFgfkXgjB6QbzvOIBZQdin5loS490cS10
X-Authority-Analysis: v=2.4 cv=CP+/zhrD c=1 sm=1 tr=0 ts=6abaabf0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=SU-MZ0n27Ju5JWPI9wcA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532
X-Proofpoint-GUID: JxRqeI_jZ8ZBY1Pz9En_H8rRKTu4ns2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX/JQkW2zi6T8x
 +Uzg7sYLtYqxBwIPQ+gOC+vQjug6LMaOPYqoREMywNQHwSbDnpf3P6sUDoURvOy+zvGPsGfuXcq
 FB/YwzUjENScegnSnvQGtmtem5v8QgPLNCj5i1zvGpF/JJ7Ar+6cgCkdOCtGNl2nNQEFis5LWoT
 gueHc2SK1DtFUv5jiiH/e9qiHi7rVFPLzSyWRr9ChOB1OY0K5ViFaG4MOBgBF2rqEcDvLNlWels
 qdk9d29Jv7r+qQi9iSaf9BZUuNFw5wdebaRLF5xkXjr8ZRMqlF/0pikTFiyZiX2+3c3Cq9jYaql
 LdEL+hmxoDnY1HcufwY2iiC8nkYQl+KIoSDXqP8wJDPUu9OA5lUy21L94QxNF0tigpCJPNpBTMl
 rZpuz52XA7fKVRJCOimrQcl1MUfPVQAcYa+VNnd0du0uospH06wNZqIgyObqTDlKhhD7Vqyg+hj
 nlOi0/VPl2i0k4sIKbAI+rXCDU8MQc/AN3I9ATvY=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c                         | 50 ++++++++++++++-----
 libdtrace/dt_parser.c                         | 34 ++++++++-----
 test/triggers/Build                           |  3 ++
 test/triggers/testprobe.c                     | 12 ++++-
 .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |  2 +-
 .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |  2 +-
 ... err.D_IDENT_UNDEF.scope-kernel-as-user.d} |  0
 .../err.D_IDENT_UNDEF.scope-kernel-as-user.r  |  2 +
 ... err.D_IDENT_UNDEF.scope-user-as-kernel.d} |  0
 .../err.D_IDENT_UNDEF.scope-user-as-kernel.r  |  2 +
 .../err.D_IDENT_UNDEF.scope-user-missing.d    | 19 +++++++
 .../err.D_IDENT_UNDEF.scope-user-missing.r    |  2 +
 .../err.D_SYM_BADREF.scope-kernel-as-user.r   |  2 -
 .../err.D_SYM_BADREF.scope-user-as-kernel.r   |  2 -
 test/unittest/lexer/tst.scope-user-explicit.d |  2 +-
 test/unittest/lexer/tst.scope-user-explicit.r |  0
 .../lexer/tst.scope-user-path-empty.sh        | 27 ++++++++++
 .../err.D_DECL_SCOPE.scopeop-enumerator.r     |  2 +-
 test/unittest/types/tst.scope-user-dotted.r   |  0
 test/unittest/types/tst.scope-user-dotted.sh  | 28 +++++++++++
 test/unittest/types/tst.scope-user-types.d    | 24 +++++++++
 test/unittest/types/tst.scope-user-types.r    |  0
 22 files changed, 181 insertions(+), 34 deletions(-)
 rename test/unittest/lexer/{err.D_SYM_BADREF.scope-kernel-as-user.d => err.D_IDENT_UNDEF.scope-kernel-as-user.d} (100%)
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
 rename test/unittest/lexer/{err.D_SYM_BADREF.scope-user-as-kernel.d => err.D_IDENT_UNDEF.scope-user-as-kernel.d} (100%)
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
 delete mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
 delete mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
 create mode 100644 test/unittest/lexer/tst.scope-user-explicit.r
 create mode 100755 test/unittest/lexer/tst.scope-user-path-empty.sh
 create mode 100644 test/unittest/types/tst.scope-user-dotted.r
 create mode 100755 test/unittest/types/tst.scope-user-dotted.sh
 create mode 100644 test/unittest/types/tst.scope-user-types.d
 create mode 100644 test/unittest/types/tst.scope-user-types.r

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index acf4baa7..08dc0937 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -71,6 +71,9 @@ dt_user_path_add(dtrace_hdl_t *dtp, dt_htab_t *h, char *s)
 {
 	dt_path_t	tmpl, *path;
 
+	if (s == NULL)
+		return -1;
+
 	tmpl.str = s;
 	if (dt_htab_lookup(h, &tmpl) != NULL) {
 		free(s);
@@ -88,6 +91,7 @@ dt_user_path_add(dtrace_hdl_t *dtp, dt_htab_t *h, char *s)
 		goto fail;
 	}
 
+	dt_dprintf("Adding user module path %s\n", path->str);
 	dt_list_append(&dtp->dt_user_path, path);
 
 	return 0;
@@ -109,14 +113,14 @@ dt_user_path_add_env(dtrace_hdl_t *dtp, dt_htab_t *h, const char *env)
 	for (;;) {
 		end = strchr(str, ':');
 		if (end == NULL) {
+			/*
+			 * A trailing empty path component denotes the current
+			 * directory.
+			 */
 			if (*str == '\0')
-				if (dt_user_path_add(dtp, h, strdup(".")) == -1)
-					return -1;
-
-			if (dt_user_path_add(dtp, h, strdup(str)) == -1)
-				return -1;
+				return dt_user_path_add(dtp, h, strdup("."));
 
-			break;
+			return dt_user_path_add(dtp, h, strdup(str));
 		}
 
 		if (end == str) {
@@ -142,14 +146,19 @@ dt_user_path_init(dtrace_hdl_t *dtp)
 	char		*str, *end;
 	int		rc = 0;
 
+	if (h == NULL)
+		goto fail;
+
 	/* Add paths from $LD_LIBRARY_PATH. */
 	if (dt_user_path_add_env(dtp, h, "LD_LIBRARY_PATH") != 0)
 		goto fail;
 
 	/* Add paths from ld.so.cache (using ldconfig -p output). */
 	fp = popen("/sbin/ldconfig -p", "r");
-	if (fp == NULL)
-		goto fail;
+	if (fp == NULL) {
+		dt_dprintf("Failed to get paths from ldconfig\n");
+		goto path;
+	}
 
 	while (getline(&buf, &len, fp) != -1) {
 		/* We are interested in lines like: <something> => /path */
@@ -182,6 +191,7 @@ dt_user_path_init(dtrace_hdl_t *dtp)
 	if (rc == -1)
 		goto fail;
 
+path:
 	/* Add paths from $PATH. */
 	if (dt_user_path_add_env(dtp, h, "PATH") != 0)
 		goto fail;
@@ -195,6 +205,8 @@ dt_user_path_init(dtrace_hdl_t *dtp)
 
 fail:
 	dt_htab_destroy(h);
+	dt_user_path_destroy(dtp);
+	dt_set_errno(dtp, ENOMEM);
 	return -1;
 }
 
@@ -328,6 +340,8 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
 		dmp->dm_ops = &dt_modops_32;
 	dmp->dm_dtp = dtp;
 
+	dt_dprintf("created module %s\n", dmp->dm_name);
+
 	return dmp;
 }
 
@@ -341,14 +355,16 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
 {
 	dt_module_t	*dmp;
 	char		*file = NULL;
+	char		*p;
 
 	if (name == NULL || name[0] == '\0') {
 		dt_set_errno(dtp, EINVAL);
 		return NULL;
 	}
 
-	if (dt_list_empty(&dtp->dt_user_path))
-		dt_user_path_init(dtp);
+	if (dt_list_empty(&dtp->dt_user_path) && dt_user_path_init(dtp) == -1)
+		return NULL;
+
 	if (!dt_list_empty(&dtp->dt_user_path)) {
 		dt_path_t	*path;
 
@@ -366,11 +382,19 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
 		}
 
 		if (file == NULL) {
-			dt_set_errno(dtp, ENOENT);
+			dt_set_errno(dtp, EDT_NOMOD);
 			return NULL;
 		}
 	}
 
+	/*
+	 * Use the resolved pathname as the object location, but name it based
+	 * on just the filename.
+	 */
+	p = strrchr(name, '/');
+	if (p != NULL)
+		name = p + 1;
+
 	if (strlen(name) >= DTRACE_MODNAMELEN ||
 	    strlen(file) >= sizeof(dmp->dm_file)) {
 		dt_set_errno(dtp, ENAMETOOLONG);
@@ -437,7 +461,7 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	if (dmp->dm_file[0] == '\0') {
 		dt_dprintf("failed to open ELF file for module %s: "
 		    "no file name known\n", dmp->dm_name);
-		return dt_set_errno(dtp, EDT_NOTLOADED);
+		return dt_set_errno(dtp, EDT_NOMOD);
 	}
 
 	if ((fd = open(dmp->dm_file, O_RDONLY)) == -1) {
@@ -496,7 +520,7 @@ dt_module_load_sect(dtrace_hdl_t *dtp, dt_module_t *dmp, ctf_sect_t *ctsp)
 	Elf_Scn *sp;
 
 	if (elf_getshdrstrndx(dmp->dm_elf, &shstrs) == -1)
-		return dt_set_errno(dtp, EDT_NOTLOADED);
+		return dt_set_errno(dtp, EDT_NOMOD);
 
 	for (sp = NULL; (sp = elf_nextscn(dmp->dm_elf, sp)) != NULL; ) {
 		if (gelf_getshdr(sp, &sh) == NULL || sh.sh_type == SHT_NULL ||
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index 1fd0f5b4..1eccc0fd 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -257,6 +257,14 @@ dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
 		memcpy(type, s, (size_t)(start - s));
 		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
 
+		if (scopekind == 2 && obj != DTRACE_OBJ_UMODS) {
+			dt_module_t *dmp = dt_module_create_user(dtp, obj);
+
+			if (dmp == NULL)
+				return -1;
+			obj = dmp->dm_name;
+		}
+
 		return dtrace_lookup_by_type(dtp, obj, type, tip);
 	}
 
@@ -2832,17 +2840,14 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * scope is desired and we should search the specified idhash.
 	 */
 	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
-	if (scopekind < 0) {
-		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
-		    dnp->dn_string);
-	}
+	if (scopekind < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", dnp->dn_string);
 
 	if (scopekind > 0) {
 		uref = scopekind == 2;
 		name = (char *)ident;
 		*(char *)(ident - scopekind) = '\0';
 		dnkind = DT_NODE_VAR;
-
 	} else if (idkind == DT_IDENT_AGG) {
 		scope = DTRACE_OBJ_EXEC;
 		name = dnp->dn_string + 1;
@@ -2862,6 +2867,17 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	dt_set_errno(dtp, EDT_NOVAR);
 	markstr = uref ? "``" : "`";
 
+	if (uref && scope != DTRACE_OBJ_UMODS) {
+		dt_module_t *dmp = dt_module_create_user(dtp, scope);
+
+		if (dmp == NULL) {
+			xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
+			    dnp->dn_string, markstr, name,
+			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
+		}
+		scope = dmp->dm_name;
+	}
+
 	if (scope == DTRACE_OBJ_EXEC && (
 	    (dhp != dtp->dt_globals &&
 	    (idp = dt_idhash_lookup(dhp, name)) != NULL) ||
@@ -2925,14 +2941,11 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 			dt_cook_taint_alloca(dnp, idp, NULL);
 
 		dt_node_attr_assign(dnp, attr);
-
 	} else if (dhp == dtp->dt_globals && scope != DTRACE_OBJ_EXEC &&
 	    dtrace_lookup_by_name(dtp, scope, name, &sym, &dts) == 0) {
-
 		dt_module_t *mp = dt_module_lookup_by_name(dtp, dts.object);
 		int umod = (mp->dm_flags & DT_DM_KERNEL) == 0;
 		static const char *const kunames[] = { "kernel", "user" };
-
 		dtrace_typeinfo_t dtt;
 		dtrace_syminfo_t *sip;
 
@@ -2992,7 +3005,6 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 			idp->di_flags |= DT_IDFLG_USER;
 			dnp->dn_flags |= DT_NF_USERLAND;
 		}
-
 	} else if (scope == DTRACE_OBJ_EXEC && create == B_TRUE) {
 		uint_t flags = DT_IDFLG_WRITE;
 		uint_t id;
@@ -3061,15 +3073,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 			dt_cook_taint_alloca(dnp, idp, NULL);
 
 		dt_node_attr_assign(dnp, attr);
-
 	} else if (scope != DTRACE_OBJ_EXEC) {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
 		    dnp->dn_string, markstr, name,
 		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-	} else {
+	} else
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
 		    dnp->dn_string, dtrace_errmsg(dtp, dtrace_errno(dtp)));
-	}
 }
 
 static dt_node_t *
diff --git a/test/triggers/Build b/test/triggers/Build
index 4ff5002a..98556586 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -106,6 +106,9 @@ proc-tst-omp_LDFLAGS := -fopenmp
 proc-tst-pthread-exec_CFLAGS := -pthread
 proc-tst-pthread-exec_LIBS := -pthread
 
+# Userspace scoped-type tests need type information in this executable.
+testprobe_CFLAGS := -gctf
+
 # readwholedir is used for ustack() tests, so needs a symbol table and needs
 # all its functions in it, even if they would be sibcalled out of existence.
 readwholedir_CFLAGS := -fno-inline -fno-optimize-sibling-calls
diff --git a/test/triggers/testprobe.c b/test/triggers/testprobe.c
index 4bef92fe..22546ddf 100644
--- a/test/triggers/testprobe.c
+++ b/test/triggers/testprobe.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2012, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2012, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -17,10 +17,20 @@
 #include <stdio.h>
 #include <unistd.h>
 
+/* Keep a named type in the executable's CTF for userspace type-lookup tests. */
+struct dtrace_scope_test_type {
+    int value;
+};
+
+static struct dtrace_scope_test_type dtrace_scope_test_instance;
+
 int main(int argc, char *argv[])
 {
     int fd, i;
 
+    /* Prevent optimization from discarding the test type. */
+    dtrace_scope_test_instance.value = argc;
+
     if ((fd = open("/dev/dtrace/provider/dt_test", O_RDONLY)) == -1) {
         perror("open");
         exit(1);
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
index 89a9f9c5..926e5a91 100644
--- a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Unknown module name
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
index 7734e29f..42a6ea95 100644
--- a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Unknown module name
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d
similarity index 100%
rename from test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
rename to test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
new file mode 100644
index 00000000..3299b3c3
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-kernel-as-user.d: [D_IDENT_UNDEF] line 16: failed to resolve vmlinux``major_names: Unknown module name
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d
similarity index 100%
rename from test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
rename to test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
new file mode 100644
index 00000000..b952b509
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-as-kernel.d: [D_IDENT_UNDEF] line 18: failed to resolve testprobe`main: Unknown module name
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
new file mode 100644
index 00000000..7304da72
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: An explicitly-scoped userspace symbol reports a lookup error
+ * when its module cannot be found.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(no_such_module``main);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
new file mode 100644
index 00000000..3e752fc9
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-user-missing.d: [D_IDENT_UNDEF] line 17: failed to resolve no_such_module``main: Unknown module name
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
deleted file mode 100644
index 718b2b31..00000000
--- a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
deleted file mode 100644
index 87169597..00000000
--- a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
index 2d649f6f..daead7b3 100644
--- a/test/unittest/lexer/tst.scope-user-explicit.d
+++ b/test/unittest/lexer/tst.scope-user-explicit.d
@@ -6,7 +6,7 @@
  */
 
 /* @@trigger: testprobe */
-/* @@runtest-opts: -e */
+/* @@runtest-opts: -e -xlinkmode=static */
 
 /*
  * ASSERTION: Explicit userspace module scoping resolves as a userspace
diff --git a/test/unittest/lexer/tst.scope-user-explicit.r b/test/unittest/lexer/tst.scope-user-explicit.r
new file mode 100644
index 00000000..e69de29b
diff --git a/test/unittest/lexer/tst.scope-user-path-empty.sh b/test/unittest/lexer/tst.scope-user-path-empty.sh
new file mode 100755
index 00000000..00502578
--- /dev/null
+++ b/test/unittest/lexer/tst.scope-user-path-empty.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# ASSERTION: An empty trailing entry in PATH or LD_LIBRARY_PATH denotes the
+# current directory when resolving a userspace module.
+#
+
+dtrace=$1
+dir=$tmpdir/scope-user-path-empty.$$
+
+mkdir -p "$dir" || exit 1
+trap 'rm -rf "$dir"' EXIT
+cp test/triggers/testprobe "$dir/testprobe" || exit 1
+cd "$dir" || exit 1
+
+PATH=.: LD_LIBRARY_PATH=.: "$dtrace" $dt_flags -e -c testprobe -n '
+BEGIN
+{
+	trace(&testprobe``main);
+	exit(0);
+}'
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
index 06ef912b..48ee9b20 100644
--- a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 16: D scoping operator may not be used in an enumerator name (foo`bar)
diff --git a/test/unittest/types/tst.scope-user-dotted.r b/test/unittest/types/tst.scope-user-dotted.r
new file mode 100644
index 00000000..e69de29b
diff --git a/test/unittest/types/tst.scope-user-dotted.sh b/test/unittest/types/tst.scope-user-dotted.sh
new file mode 100755
index 00000000..3d0348b7
--- /dev/null
+++ b/test/unittest/types/tst.scope-user-dotted.sh
@@ -0,0 +1,28 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# ASSERTION: A dotted userspace module name resolves both external symbols
+# and types.
+#
+
+dtrace=$1
+dir=$tmpdir/scope-user-dotted.$$
+
+mkdir -p "$dir" || exit 1
+trap 'rm -rf "$dir"' EXIT
+cp test/triggers/testprobe "$dir/scope.user" || exit 1
+cd "$dir" || exit 1
+
+PATH=.: "$dtrace" $dt_flags -e -xlinkmode=static -c scope.user -n '
+BEGIN
+{
+	symbol = &scope.user``main;
+	type = (struct scope.user``dtrace_scope_test_type *)NULL;
+	exit(0);
+}'
diff --git a/test/unittest/types/tst.scope-user-types.d b/test/unittest/types/tst.scope-user-types.d
new file mode 100644
index 00000000..380af340
--- /dev/null
+++ b/test/unittest/types/tst.scope-user-types.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+/* @@runtest-opts: -e -xlinkmode=static */
+
+/*
+ * ASSERTION: Explicit and implicit userspace type scopes, and the implicit
+ * kernel type scope, resolve external types.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	scope_explicit = (struct testprobe``dtrace_scope_test_type *)NULL;
+	scope_implicit = (struct ``dtrace_scope_test_type *)NULL;
+	scope_kernel = (struct `task_struct *)NULL;
+	exit(0);
+}
diff --git a/test/unittest/types/tst.scope-user-types.r b/test/unittest/types/tst.scope-user-types.r
new file mode 100644
index 00000000..e69de29b
-- 
2.52.0

