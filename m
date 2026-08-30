Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7613AC0F0
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086629; cv=fail; b=OSrZsh++qfhDNLjqN8N8g43hhKUGbkbCl9BMi4uKTzk/AoIpOgXkibkRJPQG574FDN5AolMp74NPV9ZFxhrEicjduiupdk02vxG2GmRI93eQIjo78Qo1Qa97DBDL7MlZZpXPa97fciTs5OXXFnjRnaWuxTsYvI2EaxBQtxO6xiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086629; c=relaxed/simple;
	bh=VY/+COLEOlIA6+sfV4OY7lkPQVTzZiSXfNll5SWJniE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MvenyxA/x03u2+vbPgdpAYGH/WuEHGRiQzUVLEHfFJtabVI+Y29MByEIcMYZKfM0RRetWtJqYXEx+4Ym9cLZVrkjucQXvPUhnM7UL/wj0cRzl0k8mmx4qlDCZCAwOZd4+Xw5oiPAX0xEoqqrn5mL+6kc3+mgPcsaDzZvvx8ESYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XiJ1LQih; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z/uZu10w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XiJ1LQih";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z/uZu10w"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U8fI3V2775137
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WMLFCUj33fvsAL4VYLk7FS3QLN3n8i+VcnkJKgVdmpk=; b=
	XiJ1LQihFHtqevna9zW3e4bJUCoBcjMAlL6Suo4oiEZFYPEauDHO0W/LP4zOTXDd
	nz4ta3YpuNN/VqOt15B+gqMwrAV1gf1v+FOcKBtmjJ/RGVOOyJa/kCX+IQZSaue2
	WJbVUBEmPlL1nWJ+fq79j4dWrv0hAnviAx2KtB7rtA8kPLadjT/6q/mag3q5TpuO
	7CJKg90ReU+wjgstbE0+9IIGsWJsiT3RVC5xouWuSWgwWIti3UzMkGMYV8C13egP
	ghSsSUTZTxHLIzMNBpXz3rlOoKPcNDAdH2QWiouSJgICxcAsGHHT2pGM3Wl7fKEc
	RsOTpX3Nt4t+qWJjJBVCnA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbnub986d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:43:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67UAeWQK010401
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:43:45 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvnkrxs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:43:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5mwlANCMH7YGddBruR02+o1ErDYKLjExq76qe+g1ac8PWigmHyskAJApMVPtN5d5biOmxwnyZhoH1EfSpcAWf9i05rhuGKI2IDnWUQV4TVWsPhqS33xTSNgwnrhAbRBN+koFGZ8a+BJxCL0bYlG73lkIlIS/3QAJTcb1oVwRRJ6blTwb8VydEo38ZsFyH+4GtJIefGCYwp0wWjziX1BCGmopW/CKbl3hHnLNNaKGSta1xrQoc4UpT6l3SN8XrVD0U9Thwe85hpvtrejSo90ANitwPiAZQSFmS30ENJrIipfZEChd8mNWc2OcgITJj94MItpx3PZNT94fEMlDt5iRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMLFCUj33fvsAL4VYLk7FS3QLN3n8i+VcnkJKgVdmpk=;
 b=UQ3obzjcsfVzLB0MLLpWU4Qbsf0pnXoA7x6Ja5MmtXN1zHiwd1gEQUKKhFrtey8axKZHwuQy1jHvTqwqrEdgRn63Ea9yJ7t4a/YxdX10eT34HOwRAdJqKegKB5o4oWnRxuoRhabTlhSdRPMSsFK9BkxdoeSGKdiWQj5+ZaMEt8cAiy6HvGlKNmIO+l5Kq9zRSqMZbA+itMM58dRaHs2aQr1nNvhz4R+jlq81TsUPWDmjVTj43eL2IBz4ATheQr4hN/HQYTgEWCo1OpQPfpauiNUXVS3pv+MHvYzEvny5vuWmkcLs/D+D+aQaWhS9BAvEUqw78m0kxzdMlu/sXF1XDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMLFCUj33fvsAL4VYLk7FS3QLN3n8i+VcnkJKgVdmpk=;
 b=z/uZu10wRuQqnkEjjZ+ptAvSrt/g1/xR6Nt7ZYhqD57E0hjkwJ6C0btEc68CUak9rgEAgTcaaPjWuDGsZo0Qvnw4IuMWvk9CYG9UpIJW801FkoreZ9baQbjzAaFDsjz/PnQiP1Yu46tTJt/18jVuPC8lF3PoybmIfhWrpZ78Ls8=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by DS0PR10MB6872.namprd10.prod.outlook.com (2603:10b6:8:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 30 Aug
 2026 10:43:39 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0382.007; Sun, 30 Aug 2026
 10:43:39 +0000
Message-ID: <93cf10b3-1662-4c32-8194-7d4ace25ae1f@oracle.com>
Date: Sun, 30 Aug 2026 11:43:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 4/6] dtprobed: harden helper ioctl
 validation
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <a163ae2bfa0847a0ca0ceb8dcc89de4f@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <a163ae2bfa0847a0ca0ceb8dcc89de4f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::18) To DS7PR10MB4909.namprd10.prod.outlook.com
 (2603:10b6:5:3b0::11)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|DS0PR10MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: eb49231c-c97c-4bdd-9545-08df06838cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+7onF7CRW60Uo63f//jucPZpCuE/ucL9e+Kxl7db3Y0p3EfFSeDmSypOPGUrXVXLLJ1TG5YRZFHLuoqzQY5fmlSaQjE/IZWA46QZsNfIdp6K5TaKHqdFz2Oa4V25kbviDMmr3E6RoIqsi93JzmCm4ld0Urk4gy+aW0413UZTNfIcSzdardd4j3rMBpr+m4l3KRvDTrl8zPe2TxDEJUmpKSu8yfOmooNaaNnP1PxD6Ta85jknJApqfTWnSqIqBxffTgoTegZqQlY7CyuCghHl+HWyfYL9rwrWp8iOaa8xG1RAXpq/B6+wTLI/B4Bg67TfvXP70f4Qlutu4/Wm+yNIwQVp8Ub8uC4o42QagVun8KsKYsLQL8eKyliJMDQqtq0qUfmp3+SWPORpB8E+YQtw/yriCneOrzEaOgyZGb2I7mjebAV6mnIpShwitQfjyaGTOrToSTvA8HK984QFxVEGYOiIaxOzh7xI8OmON3fVbQASzrhqfGK1eaMXK0peZI99zajVvWLvOLNnpRVCLwp9M+eK39tNIxVKuV3kFUCBllyvGnETK8gr5IUEDnR8iuviesggVmT89IdbglgztxKlrkEk8/0lGDj6Vr3ZhmsXEoImZ93V0EWpliGa3NhdLacLAr7sUgY0sUQ8YRobVjQOuQxaUm+4/JXAkkYpSN3LIl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pKeGRxZEwwaTFmTUYxU1p6RkgvY3ZldDh0MkdKWUMvTk9KQjlTMkJpOEZs?=
 =?utf-8?B?Y1FMYlAwNzV0VzN3SjVxZHhSWHplaHByQnF3MlB5Q1V4RUNBT3BRbHVJSnFh?=
 =?utf-8?B?NjJadjAxNnMvUXgyZkNkMnpaRkdaZHZxN09KRUNiSnFUU3hRd2cvTUo4V1FM?=
 =?utf-8?B?OC8vMXI1Y0tDTEMzYU9kb29EZ2VLOWFRd3p6bllDckg3Qm9DYjdibkhhbnpX?=
 =?utf-8?B?QlI1bFhBM2s0RVhKeGVHVlU4d2pQTXJtbEdiMGlwYU5MNkxNQk9CTTlRS2xn?=
 =?utf-8?B?T1FEZmJUTmdiZUI5cjZRVFVCSjluL2JEOXcvYkVLc1lMdjZWTGtoWmN5YlMv?=
 =?utf-8?B?VzN5TnFpUVN3dFVCT0tjTWxEUHp1NW1tQThpVUhkeGV1NXF4YVpHU2J4VERS?=
 =?utf-8?B?TVJ1cDQ5MThwVkZkaUIrT1prQWo1b2xoM2xqUzFnQUpHc2NHRlBsc3REMitO?=
 =?utf-8?B?Z3ZZcGYyd2R5WjBGcXFFKzJkT3U4L0QwWEQ1TEYxd296dEY5ckF6QXVRbUd5?=
 =?utf-8?B?c2M2UlA0clhFcHkvNXk2ZXNZdXZFNEhSczVVRDgrV011NDVMTFpYZXpDcW1u?=
 =?utf-8?B?MFpJM2YxN1RkbGh1N2xwdW42c1ZKeitXaHc0VDBiL3NjZTlCOXVHRFc0cE13?=
 =?utf-8?B?MkRQd2dxbWkzR0tVQnRwcHZaSFpQQ2toNmdreGtValdxNzJjZVB2YTZSdTA4?=
 =?utf-8?B?Unl5bFdUeDRucVcyem9zbml6VVFwY0NLNWRLZENXOXM3Y2FKaGtLb0ZEOVpz?=
 =?utf-8?B?MGpUOEVoVU1US2kwRU9JMTJyazZBQnoybyswVkJFK1E3aEExN3VmYUtBbUhl?=
 =?utf-8?B?U3pxUHdiYUpxaFYwWWZjUVF2N3htcGp3UWxpSWNiVEpTZUlSNjJYSFArOVlz?=
 =?utf-8?B?bWo1clloK1hHeTFTbXA5K1hiOTdjdDlmOU9wR2tETGNxZU9Ya0NNZ3hTNEFS?=
 =?utf-8?B?dGZ5d1V2ZkVsRXFCZkh1RU4ycWlCck9HM2FBU3JlbjUyVmY2RDJReEhtenJ1?=
 =?utf-8?B?azVNMiszZkJ1TG1zaDZxMHg5MDJCUjN4bmREUjNYRXhWSkQ4V1ZlZUpzSEEz?=
 =?utf-8?B?bEpZbjdWNk9IemNQS2labVRyVlhOOG5oaU41NE1qbWdTaUVBdVZ0RjhvOTdm?=
 =?utf-8?B?VXVDWWcxTUcvQ0lNT0tzQ0hnamtNMTh5UmphTHFPb3RJN3JWamZPZ1UvdmVv?=
 =?utf-8?B?Z0hXL3lQY0wwNXJWM3FlZjZoSUQxeU9FV3ZlVU4yWHFKNStQSzMrTHFWcmNj?=
 =?utf-8?B?Yll0enJyak96ZGdJNUVSWWhLNEhGM1doZWxiVE9sbE8yQjA0V3FySDc1VTRz?=
 =?utf-8?B?TEpjYTE4bGk2R3FMUC9zWVdRZFY3Rm1taEF4a1JyV1RYcCtPSXI4OHB5WGky?=
 =?utf-8?B?NFlpTkd1UndUQisxdmg0MU4yQWdHWllDMm1hOFNtQ1FqNy9SS3ZVYjNrU1c4?=
 =?utf-8?B?VW41OVY3S1I2OWpCaDFZV2JncHpFN3Y2dGNtSXN6ZmtOZkdrc1RpS2N5WWVB?=
 =?utf-8?B?bU9nMW1IcFBwVmN0ZmJwbVZEMVl3ODdtcmRWbWJYWTUvZnBpN2lDblNEMjVw?=
 =?utf-8?B?bFIwenVBVnlhZDQzaDBLdU1GRm0rSTJTOWNVeUFKQ3JHdE5QREk3eEFDcVdx?=
 =?utf-8?B?MVNvaER0UzNXWTEreWFBcEJlYlAvV1h1UU5ZaVhVdGpYUzFibmtuR3llOHJO?=
 =?utf-8?B?dGhudUFHQmIvbEVIeDNZaXgzcy9JVzBWNTNCTGI2azdHMm9DMzhXOG5OS2dh?=
 =?utf-8?B?bDluMjhaOEZOZ0pjbEJla0EvS21RNWc0cG5vZEhYay9adE55cUExaXYwVlZj?=
 =?utf-8?B?RjE2eGdtTGI0WUM2RSt6Y0lCZjRwL1RvYXo2WEtBZVFJV2MwUDl5d1YxS0g3?=
 =?utf-8?B?ZkxoUG9PWU8wUXBTa3F5YUFGME4zbFJwSDBnd1YwVjNXTTYrSHZ3cnQyYzUx?=
 =?utf-8?B?V3BOaW5CcGY5TnVuVkI2VTFlTXlaZ0hiRDIrMUdwWW1IVDVDM3l0d2NxcDF0?=
 =?utf-8?B?OWhwWVB5Y1IwbFFxaDZhTzJST2dTNkZraURReDVwOU9GcnRWL3VHbE9QWDZi?=
 =?utf-8?B?WlJmVStxNnRYbGc5Q1lwaVBIWmtId0E2emhTY2IzSUFnUGFpUG1sNCtQeU8x?=
 =?utf-8?B?c2J1M3g5TWl4ZTk4WWlNZXA2VUhCekNPS0RTYkdPNUtzQXBrdGxaQlp3MC8x?=
 =?utf-8?B?WXI5ckZ1YVRtVjdSakgrc2I5OFdjZU9WU1p1ZEdrRzkwa29SdDBrLzdoT0x6?=
 =?utf-8?B?L1gvRlNtQVg3Z0tzRGxZa3BIVWZBckgrT0dDTWhHZEpOczJRNGRWSU9FUklk?=
 =?utf-8?B?YkJGRXdmM3dlcDUxazhFWENXUVhkRVdTNVZGVGdvSWhqa0RadG5EQT09?=
X-Exchange-RoutingPolicyChecked:
	FTzqbC3Y/b064PQLafP+abmznjUCfDmp0F+y23eHb71oAl6prXJ0mg1q94MfEJCFBZJ5vcuHc9cPv5RRiwzwuYdT3z5tA5MzuMuHj+bGlgbKwAWb6ZoIyW7BnVeioJsvs27SyXZablAS7C/e426oLcw0h04+qZ3fgsEe8L8d2wtRZYAfhzCNP8ABL0T5RjnUPnyL8T5mDJ9bZJeoq4b260w4hfs83S39D0sFgPgw9uk53KsIn7jsW3Mb1NqcV8qvWN7W2TfQXkYxiwr9RwNuI/CjA9FfL3S/fHFk8BV4GWcWlsaTioQp/GClTkBX4Jk938ETk5V+bbLRUPkV9T/gmA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	koh3T+wRBFoyicNDC0xijIhYRRQ6tV4rx0L1YVYiI7rhxjy+UThXhWtch2cV8denT8TK6Yl1EJ2Ym8CWGb12i5e3LEa0dj8rwL3UrmJbFputisJRLC8GKiDroE8UwR9W4PIYSdS2mKf7wSDecZobhNlX4r4CttoqnPYrDiarImvQSIsxv9H98k6FxDTB5/I+bbGFRSleU6mJcpEY4MA4Tw+Yh6Xg7is+tBgTgFdBfE9foWc0trMInlVgkOib6MoCNMOSLxfJjgO9hWDd8o2Mnvavi40PvXezBahM3PbUmsOqC+9K9WFZLI4MNGPCA1KUxnuZJIWhBTQ/MTp436IqPc4KSQAxeNLganG2BYlOtKaC3Q1+pMaLniW6UpFQ+z3Hmyh6lqnutS+YeTNaQtPvFpmfYh39217IoTlZx3CQDkTUuLuxEBaMsikiOa3n3mBh4+0r0gfL4GQskNF7hIndo2vJAMEnFYHy4tKSO+zYF8bjCC+bYloPjafriuaZzZbWSy4ItreKwcShzlqx40DFeNEZVZBjjofWFRIW7sDq1e8qH1sgn9kOWCCVZpTGjLDT44dDE2nEuZfqSXkdj3BaRr6L+AEemVwelrdelLMcZWY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb49231c-c97c-4bdd-9545-08df06838cf5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4909.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 10:43:39.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLctIMsXRuTrb4Umbs/3W9I15R0nAX0HGkpY74PiM01sru08tyv04tUqP4p3pI2OCWuMrp2+z4Mw3tv8jodcuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608300090
X-Authority-Analysis: v=2.4 cv=QoJuG1yd c=1 sm=1 tr=0 ts=6a940962 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=2SbdfHqCX6TggmVPlgoA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-GUID: 4qEiTdIRTHQ0wnRkdIKNu43F1mWQivQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA5MCBTYWx0ZWRfX+Xe95ZywF6IV
 1dDp0lmZ5a/IeTkJwQuiTryVjTI7J4Ad9cyrem2sRgjLrgCPwzpybtailqeOvFlu/ILJaNPATd0
 6qNt0ZPYnGZNhyevfXDyuHfIEp/NfZkykAUpj7V5uoTucGXgEDhypTDxlQRkE0+Z3rtuudWGfMc
 E2BYr/UtY7ImGo5963cQclZI0ETRYEQ3RiVC0SxpdknBKJC6HxJUDrxLS2fNQD93k9VkWaPsLZY
 gZkluVs4UcIwqJTTDlnhjKhtU8i+Z+0UUwFW6RMuQfJ6aRFsGGav8KNwgcVxWnlcSjsgoxu30PT
 miQMU8sJyzC7uXn5nYwU14xPMrAaBK8Q/g9S6CfAcOuGCPPn9+gPJs1bYKbAiMRLOjyFONNpNcK
 CUvX2AVtrdgoZKSLdxg3VG5yUNaYnXpzRwRj+FbqyXuFuEQfK6AmzQ5dif3OCLJhXui47qNqQcZ
 Z6xabtogqKBDMjWSgOE0WT00bkbYp0pxPGEyPJHg=
X-Proofpoint-ORIG-GUID: 4qEiTdIRTHQ0wnRkdIKNu43F1mWQivQj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA5MCBTYWx0ZWRfXyb6ZDf1UNk32
 kBle2txrzEno2yuTeariLhXE8KX7w/TUd4nrhh/lNDiTEJmwysKFN+r6k3NaI0lu+xCv7kYYFuC
 YcCT+ieiTZPUIfl07heDZsXEZiQuUPONorccS76rW9q/esvhyv7m

On 28/08/2026 20:09, Kris Van Hees via DTrace-devel wrote:
> Reject unterminated fixed-size module names and module names that would
> be unsafe as pathname components before using helper data.  Reuse the same
> component-safety predicate used when composing probe specs, and handle
> userdata allocation failure before dereferencing it.
> 
> Orabug: 39374493
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>


We may need to revisit for system-wide tracing for USDT (where module name
specifies a file path containing probes), but for now

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  dtprobed/dof_stash.c | 27 +++++++++++++++------------
>  dtprobed/dof_stash.h |  2 ++
>  dtprobed/dtprobed.c  | 22 ++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 4c7a95cd..891d7a69 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -230,6 +230,17 @@ make_provpid_name(const char *prov, pid_t pid)
>  	return ret;
>  }
>  
> +/*
> + * Ban "." and ".." as probe description components. Components are also not
> + * allowed to contain any '/' character.
> + */
> +int
> +is_component_unsafe(const char *s)
> +{
> +	return strcmp(s, ".") == 0 || strcmp(s, "..") == 0 ||
> +	       strchr(s, '/') != NULL;
> +}
> +
>  /*
>   * Compose a full probespec's name from pieces.
>   */
> @@ -240,19 +251,11 @@ make_probespec_name(const char *prov, const char *mod, const char *fn,
>  	char *ret;
>  
>  	/*
> -	 * Ban "." and ".." as probe description components, as well as any
> -	 * components with a '/' character.  Since the components are used in
> -	 * the creation of paths that will be written to, any of these cases
> -	 * can be unsafe.
> +	 * Since probe description components are used in the creation of paths
> +	 * that will be written to, make sure their content is safe.
>  	 */
> -	if (strcmp(prov, ".") == 0 || strcmp(prov, "..") == 0 ||
> -	    strchr(prov, '/') != NULL ||
> -	    strcmp(mod, ".") == 0 || strcmp(mod, "..") == 0 ||
> -	    strchr(mod, '/') != NULL ||
> -	    strcmp(fn, ".") == 0 || strcmp(fn, "..") == 0 ||
> -	    strchr(fn, '/') != NULL ||
> -	    strcmp(prb, ".") == 0 || strcmp(prb, "..") == 0 ||
> -	    strchr(prb, '/') != NULL)
> +	if (is_component_unsafe(prov) || is_component_unsafe(mod) ||
> +	    is_component_unsafe(fn) || is_component_unsafe(prb))
>  		return NULL;
>  
>  	if (asprintf(&ret, "%s:%s:%s:%s", prov, mod, fn, prb) < 0) {
> diff --git a/dtprobed/dof_stash.h b/dtprobed/dof_stash.h
> index 32b5eb52..e72671af 100644
> --- a/dtprobed/dof_stash.h
> +++ b/dtprobed/dof_stash.h
> @@ -21,6 +21,8 @@ typedef struct dof_parsed_list {
>  
>  int dof_stash_init(const char *statedir);
>  
> +int is_component_unsafe(const char *s);
> +
>  int dof_stash_push_parsed(dt_list_t *accum, dof_parsed_t *parsed);
>  int dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum);
>  void dof_stash_free(dt_list_t *accum);
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 9ce941ee..c85a6617 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -668,6 +668,16 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
>  	int gen;
>  	usdt_data_t data;
>  
> +	/* If userdata == NULL, we were not able to allocate memory for it. */
> +	if (userdata == NULL) {
> +		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: %s\n", pid,
> +				 "out of memory allocating userdata\n");
> +		if (fuse_reply_err(req, ENOMEM) < 0)
> +			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: %s\n", pid,
> +				 "cannot send error to ioctl caller\n");
> +		return;
> +	}
> +
>  	/*
>  	 * We can just ignore FUSE_IOCTL_COMPAT: the 32-bit and 64-bit versions
>  	 * of the DOF structures are intentionally identical.
> @@ -729,7 +739,19 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
>  				 errmsg, sizeof(dof_helper_t), in_bufsz);
>  			goto fuse_err;
>  		}
> +
>  		memcpy(&userdata->dh, in_buf, sizeof(dof_helper_t));
> +		if (memchr(userdata->dh.dofhp_mod, 0, DTRACE_MODNAMELEN) == NULL) {
> +			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: "
> +				 "unterminated module name\n", pid);
> +			goto fuse_err;
> +		}
> +		if (is_component_unsafe(userdata->dh.dofhp_mod)) {
> +			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: "
> +				 "unsafe characters in module name %s\n",
> +				 pid, userdata->dh.dofhp_mod);
> +			goto fuse_err;
> +		}
>  
>  		in.iov_base = (void *) userdata->dh.dofhp_dof;
>  		in.iov_len = sizeof(dof_hdr_t);
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

