Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D5450FA
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726163998; cv=fail; b=SKojvBCsXOc/BZLzmCBXCggBtWGZbouxNuQV6SOHEyVK6WhFFEOoQSMazw8OMuluKOpp1p6tmn+kTaBphSMQEH3uVLpNartrCWi+ofkVL+dS5N2OaRXe+DwI4UoKz5L800rLA1l5bb7eUPoEeznWn/9EGpN8ERi7fIKUaoG2sho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726163998; c=relaxed/simple;
	bh=VtWuGQGCeNtImYrHGHGNjcEezan8jY8na1W+pjzbCzk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Y2uPmUS6dhQsHmaJSvQGNmez6rV9I5kEnjqELiRp+DR7Z6x7Qn8H8TVvISEHY1jQyZfTA/svZhjXrG+yhlZH96FB4X5zw1N1CJv2fTgY3HlnziVhDYHQ6CeDGhWPsnZ80yGeWlFn2auitKwetDjgaVr9p/YdXrPOtGO0eTBPsL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mu19jV4x; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BiG3OJcr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mu19jV4x";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BiG3OJcr"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CDtXTr014184
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 17:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=Qoydc+p/SDZwJQo9Dl9+6QoNRaNlh1zMMXywrCTaLXk=; b=
	Mu19jV4xMGt2vFvtCjD0eDn2TXmTQ6njFJCp+qXe0ShaR+8nHAzwjp3xIbbCoCLu
	TsYDP/tyk8qdXPLdXovKhhVs2r2ZqeIf3QPME55cE4f85BgF0PpaMlvSd7JcifhB
	X2chDWsKZpXsij/IK70jdge/Unytlkc9NOMYNvQhstEnQPOtPKYFkw8zZPRHo2a2
	p42J/kSx216CKBqWHhBwFeXWBdl60ZyvUR33gVd6igrn0vELPoZTfOEwJykvPlSy
	wjF3mVieb3b5/d5piesiTR46U4+HAIoV1ytBj76zIHwHlLNY6JbytzdelHH9kTvN
	M0spbRFbfD1tEpiE8mMgKQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gevcung6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 17:59:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48CGxmfs036161
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 17:59:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9bmq6a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 17:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXWoyRf22Cgx+K1KeCHm9uBkEFfPgtVy7Y2zlFgBmNzLkAUpohB6cWPezw7Wy9ASWJSic8qkM7Ykuy25hazRfBZAOzPUbMqzoYI6pxYRMQ2BRpXJkf56xfZXwYcEaIcBYm4dtX3d5wjFq197hD6mfws/WiypZH4Wh11vinUMYoRKWGkWLthu9wLAsHmfHjwCNfMC4BS9gENMby+4oj1HoYCRlYg88oypOLFJzfywkSkEuwciXhmNHzA3eRVGtXctK0XlOm6WdpwYrn+6mcqhONCDJ+yM07tzTPJeu8rCmubZOB5TXTqDRDBlzRQ21iI1UkyFoNVweNfmDsAWWiRd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qoydc+p/SDZwJQo9Dl9+6QoNRaNlh1zMMXywrCTaLXk=;
 b=ICarkVvNvy7ZClds+briC+U+TggT2e3nrmwEscNpxk2p5U5s7kirLBDvnVf9Lti6/nrV8kxOS5GFtl5a55jG3P09csTGr7m5/NPdECVGlFpSrNr7Br50r/wervJqU+q1qwnaiQJvcTdVPz0bGMgwp+V4Rprm1478NIpClQQ8JnMKsSoMztY8yMyNGfYPNcqA0PJeArp6nCKJzNLpSEiJ66LjfzmhlayqN4oBsvcL+lmrPaUkpN4Q1cG5UwLx2KxjVigfvwh0d7YKzzPHW9vjucWdGCyhb/21hJIgIeW1nfyKUIOWOFfw0EL5fd8A9+kRCwDRm1/OKW6lQStGr1VbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qoydc+p/SDZwJQo9Dl9+6QoNRaNlh1zMMXywrCTaLXk=;
 b=BiG3OJcrKPrJ7jChFVx1mSyaZiDsr++f7+WwV4ZsoPOVg3F8afpMFnC/q72mZXxrE0vH+6iXyDezEHll2ZtOg3etBsdTJ4XcqMR88R/UR75TdRAv2UNMsPTrgkqav/OJMY91TaTEGN3k3RjcgZxPnnhzfsu+sMj7mKBoPXOh8Ok=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB8180.namprd10.prod.outlook.com (2603:10b6:408:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Thu, 12 Sep
 2024 17:59:51 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Thu, 12 Sep 2024
 17:59:51 +0000
Date: Thu, 12 Sep 2024 13:59:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:208:530::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB62876065F551A5ADC0AE998EC2642@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: cd471ce0-5abb-4142-3ba4-08dcd354b2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IfvvaBJFgzqTsMqeKcV4uMdnvjHZJGLYi3H5k3Pq50PLPD7YWi6LpVpIxWFX?=
 =?us-ascii?Q?5zlnJuJ5aNgYiJIG2bsNoDU0RQQunpWpDmvTM0tuCdV7vmCTNoKdmDiGzswc?=
 =?us-ascii?Q?uKVEGFnl4dpMEKnjwUmgmfvkm70JTehcfB5ZRnz69mGCvUkfTOrcLNBJCGq1?=
 =?us-ascii?Q?xGRfH2zNZXgn3l5pWJW5WOiQuQhwow+fpGVpeMwSzJAtJ0VZ/F9IHfadI0TR?=
 =?us-ascii?Q?PsnYZQ0zd4m+YI1aNjNypC/gbuQ/DlDzP4Dk7LC+88g1q7XaaeNuO4783KMQ?=
 =?us-ascii?Q?vgqwx+VupIe+Who0uuqmao2EUkdh44Fc0kQwRMl4WdvITKl6zM8L9viUekpQ?=
 =?us-ascii?Q?yinkWwE4YGPa1Ib097N36wFTY/tGLsK3Qg+VCm0LlHGqCEv2PoBighLIQK+0?=
 =?us-ascii?Q?yccfmIaAXgRjcntg16YRsF2L9gvnhW6BCXi4kp5lMiHy0xzd/u+jW5yWGTdG?=
 =?us-ascii?Q?T20jTOUxsl/0ojKwd7OES1dlerJu3zB+fY+K9Lg1B0fqhL19uDndUWN89Nfy?=
 =?us-ascii?Q?7vlil1UPQHYRHeFXDgmmtrHWzA8m8Q56TymMgMvZBeeuiTs5K2gctC5BMFZ6?=
 =?us-ascii?Q?8mlef4cDVJrC4ZUmZa1e7Og+SBpj+L2CE5H+xmzMfU6zX8j0T7SZBB89pXWw?=
 =?us-ascii?Q?7y+yerWDg6F81OWcmr2sxNa/6qacYAlGXuufErRVJ12ynkip6iUXqWhTG+8F?=
 =?us-ascii?Q?QvmIxkFvasnRwANeJ1AvMsdihZ1juK5rK91aXOxMkm3+NJfK7bspf8YjPWf4?=
 =?us-ascii?Q?KNO03Ao7uS0roZD8l4FY48m/Bpxg6Suf1zzutpd7SlJjkvcEmynWMTP9BxCN?=
 =?us-ascii?Q?JTM9fOGBzWlp31NoHiiKWMpkTee//Hd9p1NHQOP5NBjTFaFehgZuIpe42Vbt?=
 =?us-ascii?Q?3uaIRB3vxMzqyFkVU6bmBhi7cQgT5bXK/Vz4eNOJc7TyaTRs5+xKWfyUC82m?=
 =?us-ascii?Q?0szBUujwZxP2iUDt/VZ1AM40loGcnExMwC/Deno5JdsbZiLHcuizBldSLpNO?=
 =?us-ascii?Q?vbtvbhfx3EM9oedRV6cSCIVcCXc4VlNsyO/NAiOZzDl0wCNsYIxpzCXjlrcB?=
 =?us-ascii?Q?MwVB0h/D9KLz/nUHMndO1bPZNJeDZp2E0gv7KjJS6GFOewP4O/FeiDra0Tk2?=
 =?us-ascii?Q?U1e/x6f2g80vEkA2D4oeFPEtfrdmLalsOIqkAKBrIkldgXOaKrV1yM2uqrrq?=
 =?us-ascii?Q?wtLlxYkTDxS/OX0gcNVvw5p1+CBL4rVwZOI6qh9lI48+El+mejfVvH+a9SgF?=
 =?us-ascii?Q?jiSDgCEqyBAMGttEmWCzuZ6vUusgUkGDEy/taDi83Ji+KHB9Nwuh5khpFGGw?=
 =?us-ascii?Q?CfTGOabFiy4/sXtZ8M9iHBP9tn2vvm1ujiBO9pi4bFpk6S78u7bFqlURX9VE?=
 =?us-ascii?Q?N3DzrcU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D0/p2/W9PNzuS6XzN0VQk+rycDI4UROolOEgaLLpwvarxLmllyMbcaYMzf93?=
 =?us-ascii?Q?1EtO+LALQE3TfH/MyRbeWU47QZN4PBVjC/XpvuycmouSwJxq9gHKVTZ4eS81?=
 =?us-ascii?Q?FTnyNAGHP69G2a6rwViePy8XQuKdNZFcLfY2qN/eCAt5ialXeSNkCMVVWWvF?=
 =?us-ascii?Q?wrX0lo1v40yjwGvSMV13KggGPGx9fj1uLfUo36hq/dcAG8gDFh2DEkFZJ5ud?=
 =?us-ascii?Q?7rA2xxiNgnd18/vy9aOUD/2u58LpDcR+zTUIMye3ydKPnoNxtm9mJvpb2Y1O?=
 =?us-ascii?Q?gEpz7h71lkBd6hQE8WlxA1s/KqBo/2bVM7nMZ1yKlndz1PZexFrR2YsSOI3+?=
 =?us-ascii?Q?xMqpZutRS4AG9jXz0hl7GH6hPWGx0bag0K/YLOMVZ8qtO34RBKofg06uFSTF?=
 =?us-ascii?Q?2k/TjUHZKO9OVVgMC7IxIXlzFGdz7dWVUBg++kXlqcQ8coOmPro5U50RBLXG?=
 =?us-ascii?Q?zhv4clqYpR2eEjfCgy8r5dWj2QksHXl6iRhM+O9Ivu5tt4WgX8dz5+NXgxvM?=
 =?us-ascii?Q?QLlUWXV1pOWORFmvRYBXY3Z1XZTrnJaOrGCigfODErggg2l0I/PIwAkXnf+Z?=
 =?us-ascii?Q?fYRYLKN910AtGf5jd7A9HZbf6MXOnHOou0jYqLYImNzCfWojAHOcBMqVGYZO?=
 =?us-ascii?Q?yArb/VL93BmIJrYp4OdQKy8sRyT63Hk5UYF9r35zFWL3GkBohyVK2q5wp5O2?=
 =?us-ascii?Q?JDfhnch2Gj5c8YsbVEu4VEgVbr9qkddRawBcCMrNahjafHya1YJi5UZHH0PS?=
 =?us-ascii?Q?qfKVAqCnHb6R7KrX33DVXdB07vPxa8ozrD0zgmOZgAO9/GGy2g1wtFAdv7p5?=
 =?us-ascii?Q?+3FdlwEw7JEvCTi8CYLMdB/CpXwzEt348cEV3LNocw2PCyxm6sVIYeAv74Ss?=
 =?us-ascii?Q?tly4Poh1+dAGL0Uir37bKwC9aOUeMOUS7utSBan6g96WxpHcjTIX8kdEhJBN?=
 =?us-ascii?Q?IY3t8QFzJKZxd3udrQpsIg52OGKftRLLZV7J+ExXlY964CcBWlkeg/Q92unz?=
 =?us-ascii?Q?D4MPifauNPMQxjiOOk8HIYXAnidl5cRycvYcwoF/wXwGQwrLIMPhhfyMRaWc?=
 =?us-ascii?Q?bNLfLgHIh0W3ZQaUWW/12d5/BOFpJB1tK/qn8n8fwyxW69HrFObePAsi77G2?=
 =?us-ascii?Q?E/2xvc8oLoVb/n0C8/YE9F7R2+oAAR4HlH/zncULePcRJxFtXbqUYTTfQJcg?=
 =?us-ascii?Q?8kzXMM74srVoE/Tn/tJN7Tld2QTz2wQRsyLAZCGdfQSGplvKI5NtMh0u+YH1?=
 =?us-ascii?Q?1SCXyjRbecFsHoY9f+dutNmjNsIXFxXOYvJ3yV3Jtg4s6cRHVwdXhP0SD0mh?=
 =?us-ascii?Q?LdiA1ex8jFmJVkNvYrNnCG4zoWAB60mBiRuhhCst2vq+TMdsCuNLulD0J/gj?=
 =?us-ascii?Q?Reraf/TKqa4PtqveacG168YYtcnP/8y++zvrdWJi2WOiISONzrP/ySG/QN4Z?=
 =?us-ascii?Q?+LiRxDJ60WETBrh+WXY07NlqsnZLihIXOes4WDIGXuehUQgxEuoLsingwqV4?=
 =?us-ascii?Q?jMLtIaScbYsBTy+5w9uiyzJ0ooSeo9XjkbrnoGNDHSkN/Ur4KYbBL3pMJ0CY?=
 =?us-ascii?Q?dbzTrJaYF0+wkB46lz/V0OiCqNrUZ9IW3WtkaBhlM8noWLgyO4qc8uWE4oXK?=
 =?us-ascii?Q?Ih2DNv4CwPPY/csHfRWXORc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dnLAqHBuFG7U9zMzEWShz4CUCuze4lRBv++Nq/XmOcmhqZX0NDe/VM3FGo9cZ5KNBGe0U76K3ik8PW5MYEZXN7v+EJSbrLff8LF3kDSPfvCFxt63DKtKE5KySugy36tog/QvuTs3onepVc4J35KXIhGyWrQVRmY1AJXzh04Pk/QttNBUeFT86PQcPMlapQIHPQ7F5VsYk3O/8zTF07SZXTLOgep3ayhqD5FzfIO1PN8BYwu8t/YnEa21tTSfnqbEEeQzk7k+IeD3efKUtpOXBqCiDAHR1La2GU53Qo+inYh8/Qibc5LYYYZ8vsxZ/p6C6eR/FVWTDp/xEaLh6VdyWiLlZUlmVgYxnCbTFxXOvVVwKDiMK729ByfgADSdhkoZfH9K7pcii50gtWiYUeTOI7Uiu/I5hdsrKrDAs4TlNmq2xfoTmkv9fZN/G3MDw32yGj9au+Yucybf+36fU0M8JS6nf3sg2Clr11xH/SjFyLRD5YX86oRfxF3dB/Sb/ltUg9C7MyX7WR3tVL65oxjR4z4mhU9DSXrCLsbfMxikxiCAByYQKdO0J3DxCnJNZpEkEYKnQQXfh/R3khT5xSoe3U/9sBRYSJFYC/SbcRO4hMM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd471ce0-5abb-4142-3ba4-08dcd354b2bd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 17:59:50.9996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUgvP8DUgEVcXUtF/lH2PRJcjiBIlW9eP0+fR1wBZvNhd98mOlk7yw1P9weQB0fHugtwR6Y8HJxzk879nkwclgwhwYq970lEX3zF5jk0p8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8180
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_06,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409120134
X-Proofpoint-ORIG-GUID: kYj64B7XtN5-YgL5hOOvpZNS87GGuMaD
X-Proofpoint-GUID: kYj64B7XtN5-YgL5hOOvpZNS87GGuMaD

When an ERROR probe fires, it overwrites the first 6 probe arguments.
If other clauses are then executed for the original probe, the probe
arguments will have been corrupted.

Save arg0 through arg5 prior to calling the ERROR probe, and restore
them after the ERROR probe finishes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/probe_error.c                             |  2 +
 libdtrace/dt_cg.c                             |  4 +-
 libdtrace/dt_dctx.h                           |  5 +-
 .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
 4 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..cad161fd 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -27,6 +27,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 {
 	dt_mstate_t	*mst = dctx->mst;
 
+	__builtin_memcpy(mst->saved_argv, mst->argv, sizeof(mst->saved_argv));
 	mst->argv[0] = 0;
 	mst->argv[1] = mst->epid;
 	mst->argv[2] = mst->clid;
@@ -36,5 +37,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 
 	dt_error(dctx);
 
+	__builtin_memcpy(mst->argv, mst->saved_argv, sizeof(mst->saved_argv));
 	mst->fault = fault;
 }
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 4fab8eed..166627fb 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -818,7 +818,7 @@ dt_cg_tramp_save_args(dt_pcb_t *pcb)
 
 	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++) {
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(i)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_SAVED_ARG(i), BPF_REG_0));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ORIG_ARG(i), BPF_REG_0));
 	}
 }
 
@@ -832,7 +832,7 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	int		i;
 
 	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++) {
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_SAVED_ARG(i)));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(i)));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 	}
 }
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 1422ad24..633c529f 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -30,7 +30,8 @@ typedef struct dt_mstate {
 	uint64_t	tstamp;		/* cached timestamp value */
 	dt_pt_regs	regs;		/* CPU registers */
 	uint64_t	argv[10];	/* Probe arguments */
-	uint64_t	saved_argv[10];	/* Saved probe arguments */
+	uint64_t	orig_argv[10];	/* Original (underlying) probe args */
+	uint64_t	saved_argv[6];	/* Saved arguments */
 } dt_mstate_t;
 
 #define DMST_EPID		offsetof(dt_mstate_t, epid)
@@ -45,7 +46,7 @@ typedef struct dt_mstate {
 #define DMST_TSTAMP		offsetof(dt_mstate_t, tstamp)
 #define DMST_REGS		offsetof(dt_mstate_t, regs)
 #define DMST_ARG(n)		offsetof(dt_mstate_t, argv[n])
-#define DMST_SAVED_ARG(n)	offsetof(dt_mstate_t, saved_argv[n])
+#define DMST_ORIG_ARG(n)	offsetof(dt_mstate_t, orig_argv[n])
 
 /*
  * The DTrace context.
diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
new file mode 100644
index 00000000..6fd1834e
--- /dev/null
+++ b/test/unittest/error/tst.argv-corruption-by-error.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
+ *            the current clause, while other clauses for the same probe should
+ *            still be executed.  This tests that the ERROR probe invocation
+ *            does not corrupt the arguments of the original probe.
+ *
+ * SECTION: dtrace Provider
+ */
+
+#pragma D option quiet
+
+syscall::write*:entry
+{
+	self->arg0 = arg0;
+	self->arg1 = arg1;
+	self->arg2 = arg2;
+	self->arg3 = arg3;
+	self->arg4 = arg4;
+	self->arg5 = arg5;
+
+	printf("%d / %d / %d / %d / %d / %d\n",
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+syscall::write*:entry
+{
+	trace(*(int *)0);
+}
+
+syscall::write*:entry,
+ERROR {
+	printf("%d / %d / %d / %d / %d / %d\n",
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+syscall::write*:entry
+{
+	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
+	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
+		? 1 : 0);
+}
-- 
2.45.2

