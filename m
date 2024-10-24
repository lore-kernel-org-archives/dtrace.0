Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E51CBA14
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790519; cv=fail; b=q5t84JPivutbux4lPgATiOAnDWECLNXeoTYHnv5rnEXDI54DUC6zPjW1T3n/gFhrUSERPMie811U85mAYNRsfuM25W3znfeq+q9aUMGuojrJctt68BqsHP0yv/rkorgcpNfeCfFu8pYOv/ux2LMF7rn1iDHXgw417KcKfjYSU9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790519; c=relaxed/simple;
	bh=NA1cwJgYiqsAUfiB8ivcMYu6Yp20S65JbHpJRDcNg10=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dVSPZr3kL5pzXl19p+IgNTQHWk2VIuhZNAzN7yIITJf88EqTs8NvYUHa25d7Guqj5lzVDosaN8Pjv089AUs715LLn7CBxfI84g8EOln8yv+Sxu7+IOKtUy68FFhjrfpBwgYdc4sfKlb19JuUrS+zdnnEpOtjshbzG2yOlUiqNio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X+i2mXtg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aLa24DN9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X+i2mXtg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aLa24DN9"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGtZxf022283
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=dYws+77MBKHHw/fVWlbpT4EiQ9Z089Hu6giafCarmyA=; b=
	X+i2mXtgzbpzrjKqpSKAHc+rueS/MCGuLNojSP173g222mEs3kqXRf0Py1fxRAXH
	7YakuljhgBFCZG0hWZVvpjxRgkP5hS1GUQTQNDtinK7HGDLUH5VmjabzismbAR6J
	kcUhGmvNKXAC6NqNqKFWf3iPOQzT/tzDEqOKoiYmLwv/loOL1R6Lbx5unbZGQo65
	j4M/dAe7efaeuzBTjKIVYUOnLiaPqAvzoWB3rUxuKydgE7Ndrq3KUUBpDOfLMkMU
	7CmYskAwXvz6PLNuO3mCmeohU7WWBjuDTjSL3z5dZiXcgoFY/XBR+lDYILyd0Lhn
	HUA+x2q6IOwsbuWMNxkRpw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545bbb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:21:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGIb7f036236
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:21:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh4928f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRnP6R27/oieKDHb1SX9i1bNlJ1RAUVFXhctPokwk0kJgdDcByq03+Fc0uHV5klW63HUKnK/AxUO9JfRXn/rsU/nqB940oKnNJk2FcR1qiFXVbC9YDLBmnptSlDYli9Zj1fy9KUsi8uAa3v2Oj/A9kawAzCLPlNIGkGHCLHDYhZbVmelSsObYpM786cUgkACSgMKBUDKreoyP40GAkpBC4EAqOU7WR9mdubocdCZrBlBFwkklkTU4XiYLS70sVSUmFAWUfoaf2FIyhCGDolyCQcNhlxMCRUWBMushG6O5CTLdhik3o3b8XgH4gAHcxx3AaUrNsyPVMcS3ACiYnxLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYws+77MBKHHw/fVWlbpT4EiQ9Z089Hu6giafCarmyA=;
 b=u/Pv7EE9s/v9AYgnRFrzB37EKXeWqlqjM55ZjprT090Q2NMr38VyY8sRnVwIoNBh+TVDy9sCgXSUWb2xZ8PenAPmyDz7j3f8Sx2W1YGN8j4s4NHr91RlTWCHce+L4NFnSnpzOQn+mSVsKojPDYhCBhzPoM/votyJC9qhSjwEDpuHeyXVos9RdZa8p2cVMyPR5uCEHcLJ9quacnkX5xGSXpzybkX1TaySUguQaBmalCy8mdHdKs4mS5KifGP8r+pCeJNoctmiSfcRldmNFsXi66hBupqQIO4XrfNv3DARUZRIuoBpVGhRw0N6b1MgCbems8vaN6scYmhvsQbzTRMUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYws+77MBKHHw/fVWlbpT4EiQ9Z089Hu6giafCarmyA=;
 b=aLa24DN9XNv193vrY68k0yg1R542fILEcXvkuqS/H9sjjfUF74qqEAcSmMTd/S4l6rxGQInxxSFHlp6pfjprw9efmw4V+NaGbHzNdzYv83ri5SSZ+HOJ2xV3ZmdVtNxfGYzjEcZI64I5eD/Rz1zirhcXPyvaPSm2hb0oHiVAa1k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6487.namprd10.prod.outlook.com (2603:10b6:303:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 17:21:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 17:21:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 19/19] test: Add another USDT open/close test
Date: Thu, 24 Oct 2024 13:21:43 -0400
Message-Id: <20241024172143.14091-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 163fe00f-2644-42c9-5cac-08dcf4505620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HxreYtwceKHByFzUIWR4KP7GFJoXR45M2GdG1d0oyBvqRoaKke3g5lgTZCBW?=
 =?us-ascii?Q?+UHLjpLmiGEtLQsN0BLwP2pjSKMnNxwMX685/iU+2dpo33xQ1HWVDUgG035z?=
 =?us-ascii?Q?A1cS9+zaSXFQdTRkSCRwHg0vflSrcCTlNfo9POOOSYMPZNMcyyuN+bpfnnSp?=
 =?us-ascii?Q?wE8Giqg150deOl2nhWyrbBHedwMX23xzWoD8IpxnXKzKOqyTVAcMtU45beZq?=
 =?us-ascii?Q?Pmo03Qkuf27vCRB1+qz/XVLyjGD/L8Wi5/35pGxOVEi/wHS7Wy7tQdgvXi59?=
 =?us-ascii?Q?WiQHVIjuKF1cXR3chXp3xTkPVPqTwr5eviP1UhqTfy/VBqKK9OsnhyReqP6+?=
 =?us-ascii?Q?cpM0zkL8aS5Mi/CvImA5yVmWea0Q0LwW971WP91kHzT6YGDGk8305T6ffF16?=
 =?us-ascii?Q?zmevPe9Dc7+eS4OGxwfAQU/sI4i8RZ9SyGneE6Rh0Nq8DT2nXsrldmIFFKPm?=
 =?us-ascii?Q?V9iaY8kGBc32iMHmw7p17DB0w/a8UH0qMJI/x6RUpBlRuY1OO8/QDNrJht/0?=
 =?us-ascii?Q?Ztfx074JhtY/9SFXH1kVFSKileqjgjPREiYxlIiRC6HQijREB0ig9T4ILNql?=
 =?us-ascii?Q?owFTV30Ol8x7gGUU1KIzE+BwvmNrDTEYCgIPayyIUaJ7N2Ti5pfFlUXzDMSF?=
 =?us-ascii?Q?b5Ks0gv3+nRZMizeyMgH2xcN6c6F0HUuCCJQnXpDxXVafc6+ocY1YuO89rPg?=
 =?us-ascii?Q?OyLSfV3T7DyJvsnueMckbfM5lMWo5RRUvEmmxla67QDzqIftaqMWH4o5pwzz?=
 =?us-ascii?Q?OHdyFBih/Ez+8bwfSHHu5tIQNLJigaYGOVLgOkBxqLz4ZLWaP268+6e25Pc9?=
 =?us-ascii?Q?0xNawmIfkhQuueRhGrxhkGqBSDgbmf7bJju8Y2EaYvo7XQRMdlJqTrv73gJj?=
 =?us-ascii?Q?gFU5gWj+EaZYvCnHfFY2EcygfHlMML+ReL+AArRJRL750BSGsVX+2Me4kt2t?=
 =?us-ascii?Q?O0dwoGRQM7len4h07j2ClfseYu0XGVqJJMe36hTcclp/ys0FRZL+D2qmOhCj?=
 =?us-ascii?Q?PvJX5+J2cyJPafxwTu4RNjJEDdTFTxgJO+aT7o7PJ9dXmy8KDIqe9+u56qVQ?=
 =?us-ascii?Q?/cKiOKrExo1E0dE+RFdTLuXdyyazlIkxf0qcxDCxwq7Af9E0njyvxSZkiIfw?=
 =?us-ascii?Q?QAhUocXQ6aGYca1cZgMYfSoBlraQqKjJsRu1YJ5/mZ01cg+jx4g1q5K0ti58?=
 =?us-ascii?Q?EMQCMg/flJGJ1k1xTDm7Bopz5wQgayfFkjhDk9k6Ir4SpjByGDBuuGx6LbG/?=
 =?us-ascii?Q?fdU9gPbXvXzX9FWtFaj/5LSiEObUgqfdmoFLAfCRYPPoIYQUZG29/lPoRm84?=
 =?us-ascii?Q?GWuPdqQ43N07Y7d2CFrUxNNU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hDsG6urftxiZph/gTEEyytwIZ6TDsmSsCtyQed6UtBrc776Y2BTn7slnnnx?=
 =?us-ascii?Q?rz8MOCJ5oVK7ZTQ6lc3Hfkb6cusEm6DBepCjljv9EGIq4XK7DzCIskbvMvxI?=
 =?us-ascii?Q?Vdp8O0GdplG4g5Lk7uGs+gcNvpDZHgch1L3lvet47XeKYPBsKVMzpgFU09eb?=
 =?us-ascii?Q?OR4niVN9Aw8FjqHavOl5TY2UyEEVymY7URTUSagjkxaB1lEwMu7VyF0+tEeM?=
 =?us-ascii?Q?Rc/mKG7uOEVPwXL0cDL4Uzf0vSMFJ6waHH0LvZ2YbD3gHzjOSY58FknDVrsR?=
 =?us-ascii?Q?/dzkJDgboodez6F7CntQqwiAikZpmfZV2SsmTeMByzidlhrxzUwIbdwk8Pys?=
 =?us-ascii?Q?dL1TjkIJKcLttUrKaAyNzlTP4ZzRKnWeUpRK/lep+5jB7gewdlvYMrA2GbvI?=
 =?us-ascii?Q?TlIt6hDDS3Mu+ys1i+W3stqJj/rKZw0cYn/B4kv3icUenvd3ZGnd+JBIf5ik?=
 =?us-ascii?Q?n4uiI/zJvLlDoWKO2+vbd5K7pnCRnt226ZbDYmJdCNgi+c85jWrEKgx0Ca7u?=
 =?us-ascii?Q?3lUVlcZK+vXYMepGpa9sVNn/SBkSLDmzDO9CyQeXMe5P6gYH+qfFR0MTqK+t?=
 =?us-ascii?Q?sUjrN6hVi6426dJCNK3bTvzvnsOoEOrS1L8oWsvT8AA0nj1Bhqwjo7uN/MXE?=
 =?us-ascii?Q?7tuB1/VibFAFPav9GmiAAL/7jIFF8Kk8iGO7EisfMskqoTgu1WBUk2Xg6bP6?=
 =?us-ascii?Q?OVXLjMTd9onGTW7xEa1QMDCY9KCDwavd+/5KY8VBMT0VTSCOBv6CEtweKsZ3?=
 =?us-ascii?Q?0Le1sd3eST/HnerBrwijGuT+JVdruAltkGatT+dV/Fp2mDFVJy9+/829Sm2d?=
 =?us-ascii?Q?xDcaE5Vj++t7OVuE/UdpIU4RLaVsUIZrcT9Pxdqn6A31y0M8ppNG2eAVTN2d?=
 =?us-ascii?Q?YSKBd/fA/SY63qWDzi19K0oKcNFjD3R/u/NvNZZ1pyDGjXPoez87sowyhom5?=
 =?us-ascii?Q?qhe/0bRPWZ3TJLA9HSmF4zrJ7JNgAMyO01gpsZqeYTYL8Z0zCAbb9O+zdz5n?=
 =?us-ascii?Q?NJdB4Eg9TvqmpctwT4NIKdd9IiNzrfgWy8cs/mAaTUfNQyCfIYD9LcJwBcD/?=
 =?us-ascii?Q?xuhj606dCc64xK0k3K6zeqIB9rVQT6uq6a4LgZ4JU56+b9JOW7AJCEljK6/H?=
 =?us-ascii?Q?y1THjnjKpBxzOTOcvfvRL7d9c53NHEUmOODqZiMIQir2+xklaO73f9AgjVz7?=
 =?us-ascii?Q?wChIhlNrvf3A7v/TFjEHwEcbufNzRxMiOBQ19HKp/z+Ms2b56mIsno82KpEt?=
 =?us-ascii?Q?8oL6A/hEXgDnCpb5P+TraM90qpCeZWSTpdDgQC7ersyYymTQUbWwH4hgYiC+?=
 =?us-ascii?Q?1JlXlekiGMOEIx0zzrtHQj0xDJ8kg5vIAofKnNpRXqQ3ExXgiEFWvmbOgYSI?=
 =?us-ascii?Q?OaWj8eVO2Wao1B3yADulte4yDDBFGA3SqcbDSjrwYvjWzXdJjb0jxTiT1VZS?=
 =?us-ascii?Q?chrASDMqlOuuSSeGMJHGFJo8h0Gcf4eZtQs+0Hk7N+75SRFTqUGmcpMxvTJ+?=
 =?us-ascii?Q?BUZ7clzcaBPuslFGelJfHxMPcYx90qroYiKu7jhzJvYf2RtYxu3yM9BukSXp?=
 =?us-ascii?Q?UmBwK8lRSfAeKtLbsjb/Dm5ajqM6K6SYfyVFcHgg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jj8ZvOfL/DhQbrESaK29DExM4DIyIVQ9LidHecsZ0IaxSUm5WF/8huy+9bBQectC+n+/Fuy8pbGyyGf6oH/GfR2Dof50z+lLcg0XiF3nq/FW8UWhvhLFxpwM5lZFBJqIQKPmdtpoohoDywPleSh0Ya+7z3I1PJr35rdwKcrZZbO0mPKFpwofsupLl+fyYjpOKBBlB4Cmv9PssAJXkIRib8rmuoppKS580h0ZZ8nNVe+8o5dXglYQlWvhfYEDkr67UNZ71XlOtvAHzJIEhMSaTeivK6SDz4dsupIaObCdpkMRAqvdZ13plO+mXIAsABS4Lr5VyQeRPg4CxmBDzsUl0k/VpXMHMO2RSZawUcDeTuyffZwX7l7BCBid4ofYg0POSSQ4+ZvPro1xrQG2tFA6CDquXYf7JyoZ2mANWB9IkMh0jruSbhEJYOdaialJq58oHmJayDLyWB/uGrXPx89UCpcjldY9aHcRo4dR74NvrJoa0qQOgxPHvSdTTmUBhzorRKkxxX9Cz8IwLuj4XeL6nkdIK8i9Ne/PdgHk2vpQ7ep5fr/0Ho8qcSoq1ilQIzhvgKxRM2DQ9bA9W6DV7A++vmKwJZ7Fk3iu+zMX2aR/2sc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163fe00f-2644-42c9-5cac-08dcf4505620
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:21:46.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBiY3c5CwjzxhRpzrYnTYGcWiSPe36TBukv2dQNDOK47uUKxTrMePdYCgILXa723XXPZ7NKt8hdqrVuZ7F7bbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6487
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_16,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240143
X-Proofpoint-ORIG-GUID: _mJWmlfqQ7VVQ6hE1tx8kYc4S_urFOWM
X-Proofpoint-GUID: _mJWmlfqQ7VVQ6hE1tx8kYc4S_urFOWM

From: Eugene Loh <eugene.loh@oracle.com>

There is already a test to check that "dtrace -l" sees USDT
probes come and go as an executable loads and unloads a shared
library with USDT probes.  (See dlclose1.sh.)  But it could
also fail if DTrace does not immediately notice USDT probes
coming or going.

Introduce a test that allows a grace period before DTrace
notices a USDT probe come or go.

There is a deadlib.so here.  It is not needed for the test.
It simply mimics other, similar tests.  The real thing to do
might be to put these shared libraries, common to multiple
tests, in test/triggers.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.dlclose4.r  |   5 +
 test/unittest/usdt/tst.dlclose4.sh | 210 +++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 test/unittest/usdt/tst.dlclose4.r
 create mode 100755 test/unittest/usdt/tst.dlclose4.sh

diff --git a/test/unittest/usdt/tst.dlclose4.r b/test/unittest/usdt/tst.dlclose4.r
new file mode 100644
index 000000000..07927a4a4
--- /dev/null
+++ b/test/unittest/usdt/tst.dlclose4.r
@@ -0,0 +1,5 @@
+as expected: USDT probe appeared
+as expected: USDT probe disappeared
+as expected: USDT probe appeared
+as expected: USDT probe disappeared
+success
diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
new file mode 100755
index 000000000..eaf4905ce
--- /dev/null
+++ b/test/unittest/usdt/tst.dlclose4.sh
@@ -0,0 +1,210 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+PATH=/usr/bin:/usr/sbin:$PATH
+
+#
+# In this test, we send alternating USR1 and USR2 signals to an executable
+# that responds by opening and closing, respectively, a shared library with
+# USDT probes.  After each signal, we check "dtrace -l" to confirm that the
+# USDT probes are and are not listed, as expected.
+#
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/usdt-dlclose4.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+#
+# Set up the source files.
+#
+
+cat > Makefile <<EOF
+all: main livelib.so
+
+main: main.o prov.o
+	\$(CC) -o main main.o -ldl
+
+main.o: main.c
+	\$(CC) -c main.c
+
+livelib.so: livelib.o prov.o
+	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
+
+livelib.o: livelib.c prov.h
+	\$(CC) -c livelib.c
+
+prov.o: livelib.o prov.d
+	$dtrace -G -s prov.d livelib.o
+
+prov.h: prov.d
+	$dtrace -h -s prov.d
+
+clean:
+	rm -f main.o livelib.o prov.o prov.h
+
+clobber: clean
+	rm -f main livelib.so
+EOF
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go();
+};
+EOF
+
+cat > livelib.c <<EOF
+#include "prov.h"
+
+void
+go(void)
+{
+	TEST_PROV_GO();
+}
+EOF
+
+cat > main.c <<EOF
+#include <dlfcn.h>
+#include <unistd.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+void *live;
+
+/*
+ * Open and close livelib.so, thereby adding or removing USDT probes.
+ */
+
+static void my_open(int sig) {
+	live = dlopen("./livelib.so", RTLD_LAZY | RTLD_LOCAL);
+	if (live == NULL) {
+		printf("dlopen of livelib.so failed: %s\n", dlerror());
+		exit(1);
+	}
+}
+
+static void my_close(int sig) {
+	dlclose(live);
+}
+
+int
+main(int argc, char **argv)
+{
+	struct sigaction act;
+
+	/*
+	 * Set USR1 (USR2) to open (close) the livelib.so.
+	 */
+	act.sa_flags = 0;
+	act.sa_handler = my_open;
+	if (sigaction(SIGUSR1, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+	act.sa_handler = my_close;
+	if (sigaction(SIGUSR2, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+
+	/*
+	 * Listen for signals.
+	 */
+	while (pause() == -1)
+		;
+
+	return 0;
+}
+EOF
+
+#
+# Build.
+#
+
+make > /dev/null
+if [ $? -ne 0 ]; then
+	echo "failed to build" >& 2
+	exit 1
+fi
+
+# Define a function that looks for the USDT probe with "dtrace -l".
+# For debugging, one could also check:
+#     ls /run/dtrace/probes/$pid/test_prov$pid/livelib.so/go/go 
+#     ls /run/dtrace/stash/dof-pid/$pid/*/parsed/test_prov:livelib.so:go:go 
+
+function check_USDT_probes() {
+	$dtrace -lP test_prov$pid |& awk '
+	    /ID *PROVIDER *MODULE *FUNCTION *NAME/ { next }
+	    /test_prov'$pid' *livelib\.so *go *go/ { exit(0) }
+	    /No probe matches description/ { exit(1) }'
+	return $?
+}
+
+# Define a function that checks loading the library:
+# send USR1 and wait up to 6 seconds for the USDT probe to appear.
+
+function load_lib() {
+	kill -s USR1 $pid
+	for iter in `seq 6`; do
+		sleep 1
+		if check_USDT_probes; then
+			iter=0
+			break
+		fi
+	done
+	if [[ $iter -ne 0 ]]; then
+		echo did not see USDT probe
+		kill -s KILL $pid
+		exit 1
+	fi
+	echo as expected: USDT probe appeared
+}
+
+# Define a function that checks unloading the library:
+# send USR2 and wait up to 6 seconds for the USDT probe to disappear.
+
+function unload_lib() {
+	kill -s USR2 $pid  # send USR2 to unload library and USDT probe
+	for iter in `seq 6`; do
+		sleep 1
+		if ! check_USDT_probes; then
+			iter=0
+			break
+		fi
+	done
+	if [[ $iter -ne 0 ]]; then
+		echo still see USDT probe after timeout
+		kill -s KILL $pid
+		exit 1
+	fi
+	echo as expected: USDT probe disappeared
+}
+
+# Start the process.
+
+./main &
+pid=$!
+sleep 2
+
+# Check.
+
+load_lib
+unload_lib
+load_lib
+unload_lib
+
+# Clean up.
+
+kill -s KILL $pid
+wait $pid >& /dev/null
+
+echo success
+exit 0
-- 
2.43.5

