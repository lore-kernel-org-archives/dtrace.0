Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10091D88C4
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119936; cv=fail; b=SW/vMleRAMtGU1cbyWXeeT4Ft9Te68rkBrfePsdGhD5DGBqAfVlREP2ggIa0pyH/CAoGeJZ/U+28da6GNIiwyM+bPwnz53nzV2r10jfslBcEn5SVV30zQpXhn2q2zFhdUpngA7fO9woJW93x3DGxMSVojflNWHam4B8NBCxEV/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119936; c=relaxed/simple;
	bh=9e8OHyZXnp2NseLCvES2JaDGpLPggA0S7L+MqEWg4G4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=JX1ueV8h3AFNM9864Iz4K63jTtkh+A3vI0djQYu6XyukqVggVMsAAoyLi24CejFywF7v4qnDA6B2FNLftMOjAz4OoR2z3KHREq0Ui6nzN2yi3BP86s1dyjijrAT1lxH3nh2BXiYkJWrZl8C0oIS4QySjLHBq0OLadeTbwHDWHas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KcYv2tzX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nrH2xLjM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KcYv2tzX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nrH2xLjM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBSdnh008857
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 12:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=s1zYlcdjafZ7CxgNXB
	qko3uKBcF81hoWnBWVRzlFBV0=; b=KcYv2tzXPp2DlJkZoJFSBuCEIndDVB5jly
	foKBRoGQpei9B3yNlZp7nfP4lVeDC+x86tjDKo4xrkPZqNF282TS0P6ULYSmzm8o
	AxkhoAhHNTx7clPBF9MQLg+XznLJbeB8pwewkV4CAzWCG8NcJSpm1BfZpgqnIBts
	9VOvqEc0ejB4P4Vl0fljx3GdNpsmIhLwJJjIDWBzAzgY1KRXD1BiGBlFpjgDVIQS
	iWcXLaZvGnsrJ7rE9yxc050eKWH1OfySj68/4ekZrRYzxsLkiM3vxxXGS0dphTMd
	749Bobp0dimHjBnqvjgSgt12O4tXdV/Mhn1Ni3TxYHItdKiNGPaA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp2qb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 12:52:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBsorh040263
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 12:52:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnambed1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 12:52:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qR48UF8dkh9Gxk1Fvoa+a2kZR6LLFPdLitKpskLTBYcnbQ42/XSoIxvoImnM0K1Xae6iRFjmMmIIOQW8uaZj6isSSSLRYHFYLWXxyrzgEHBJxGi7PveRIjAdwPZIkXloet+FT7WZAkWaPcZPdzh9PmKTBlbNLyXeBQjaLiNX1nVZT6Qmhms5i2jzALTvKrsE17Je4ZlIs/e66eTpLbiyXSzKZYfn0Ss2IGOH1dFq9BTpVvlsVR1+h0PWY6/EbmdLlmFj8MDvu0f6bCi0MIvS8Mt3u/nJ5YFpYJDnPwYLmKhdVxdPDb2Z6VcjGfFA8W4mrMgjxsRPU5wIjPP74SDwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1zYlcdjafZ7CxgNXBqko3uKBcF81hoWnBWVRzlFBV0=;
 b=yThO4Dcj7lbtSIEBkpH6IDoi6czU0LOd1Uez9fPWqQLrXoldFqvJkf4pRwVO/Csen6Io9e34iPPXn4u/C+r9itky2MUS8syYuAcUn68oLdQY5l5KTJ4d7H/exepRUVDMXIyo6eONP//s1huW+3LAtLPRMx+Pf/OLjmJQakqrOlWhpQ/wkIGDcaT2DN0xcZ4u1QFEvDcRHf+5Ir23M2pDKcrSuZ4FwiXFbWS+hceRNfVPgsbue0I0jFmMVjgLGPH4vqrlF5ZhJy10XhFYZXd5qFEeaFt7dJSZIScgA/AKmWCu9JnonDDwdoBR28PiQsx+JNw9iHqfGMONtdhkvlt6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1zYlcdjafZ7CxgNXBqko3uKBcF81hoWnBWVRzlFBV0=;
 b=nrH2xLjM7ObWu8ETRlWPscHPHNeyhAAWAYZWkY0v0QVHKTtctaaNYByhuNZi3A/m3gSeqveLf8TPrDcDr/hxyV/OhrkLJAgcg63bHQ4CmfnBR2N6j5S7htDQfUH4Sk9ZMmYE4jTExE6Htnz/Le6g82j5RmkX8LuCBQuIfTlWJvk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by BY5PR10MB4161.namprd10.prod.outlook.com (2603:10b6:a03:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 12:52:07 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 12:52:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 5/6] usdt: typed args and arg remapping
References: <20241018195808.270688-1-nick.alcock@oracle.com>
	<20241018195808.270688-6-nick.alcock@oracle.com>
	<ZxfxrhUANHKZZgqn@oracle.com>
Emacs: why choose between a word processor and a Lisp interpreter when you
 could have neither instead?
Date: Mon, 28 Oct 2024 12:52:01 +0000
In-Reply-To: <ZxfxrhUANHKZZgqn@oracle.com> (Kris Van Hees's message of "Tue,
	22 Oct 2024 14:40:46 -0400")
Message-ID: <87h68ws83y.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|BY5PR10MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbc2316-ba18-4f45-76f3-08dcf74f5413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KH0I0OhaLbvSTm4FsFPBrlkaqsthQl+56fOWbEZh09tCL5rGykx+lh65UT6g?=
 =?us-ascii?Q?6vyUwYEvPE9lKbrijYzE8nvAvTxK0fgKfhnHY8KcAUbCbiGQkOpWvwFaLH8x?=
 =?us-ascii?Q?CmYlSejEPJ3OZhkQetlFOw8L202zwypzfWzDpZlkMYtUi0/z5gorUxgafmxF?=
 =?us-ascii?Q?kzMXtH4hMPeERpPz+YNltanNqKYrpU1xMBQcZEUH/16YO71S8uc+9vOiB+gt?=
 =?us-ascii?Q?qdHhEuut4m1AZqmQz+zmj2FVe5RSZOR+xp6gttBKCt4wy0HbXQBUIuqCdCUm?=
 =?us-ascii?Q?JxiTtJYmJc4Y+ZWhtKloOwvLO+xgu7Z6KCOlAgtZwFvI3tVVQU2QMEYSToZH?=
 =?us-ascii?Q?Ffs01fUqf5goAbHx2ka6THUawk+h3SzGyZr7C3bRikXhvshhPRIl6LDHhdjv?=
 =?us-ascii?Q?8X7/oYldW07oBnG3KnZx+F2KJ0VLipwxeZ67s176NmKSidn0axrmeo8W+YAh?=
 =?us-ascii?Q?ayO4RhfPmGASfUKcd/iZrCMa3zNj9FkvfEa16oegpspb7/1z1Tt/sWr8uGJF?=
 =?us-ascii?Q?lJYwZCW0m2+UpWLIzI11PClQXYUJ4PSGOn3tWHbie92Z3VpNnW6GqdHHnISr?=
 =?us-ascii?Q?mHtSBgW6dhPF1/YUjRwFRFki+aU9RFHluH8p9wjW4oc7T0DF16Momwnsa1WW?=
 =?us-ascii?Q?UbYK/jECAKdWVqU1MLwjQEvb9oD2oioeTLfBQH91sr2FYch0jRKWh7JPoZt6?=
 =?us-ascii?Q?x0I9GSQm7ebjV79qNKEGd/1YZtwTXtAIcVi7ibh6tZPnQCrQj/1idQaGge5H?=
 =?us-ascii?Q?fOvGkg3RO95go7F3UohLBx5763D+vG1/MRncChraHdzVhoYLfGqRlU9EHIIi?=
 =?us-ascii?Q?NpH0OfaW1JJghqn752ZMwlPYNV21SzJm3UiIVM0Fi0RBIak0Pn6CGqiDayst?=
 =?us-ascii?Q?ABePS2KYWRaYfGC4h4wFzV4SPQBtvN82isp1dNuJA3uScl3Fm/Ye2d6p1/jc?=
 =?us-ascii?Q?7O8anhnNt/PD/EXn7Q54GeDcm9HRSFMH2MKDrlDoMp82zFqry32dZkdXdcTO?=
 =?us-ascii?Q?vTL95AQbQ+EPg9Shnt/PRsIYrBLuo2l1q1IMzk5RCze0vo6Q0R5GujeBelAH?=
 =?us-ascii?Q?xf1/JHupnUrV0dwzTR2wjqdFLMHLQHw4ubt+7FvrZjpMmWazYt7zx0bsVxIU?=
 =?us-ascii?Q?Vzb8dejLB+SDa0ApWiobE29EC177iOMP02Cbmc76itsA9QFlAhI8emekJDOH?=
 =?us-ascii?Q?gdHNjMXK3rm2O2Z8Dn+RAUtIzVPkBUwsAMo/ce95VUODMyYqkVXrs7rM/cw2?=
 =?us-ascii?Q?thpE4mZ1o7NGSUYHhoGknCUBzn063dfaOnErOkHX5+n+2uPOzDScqt6DQzlK?=
 =?us-ascii?Q?ea1nlAG42Vy7l9zG0goGglq9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DVx1EF1q/V7K7Pisno3XRJv91HoEuBMOfjYKhPOlgQHoUdmc6zRG8Iv6RR5t?=
 =?us-ascii?Q?Go6hlzfVuDUbC5bD/pAMFX8f5Qa/+UmwnCWPB+gIXpmMAnNTdp4rErJt6TbE?=
 =?us-ascii?Q?vgcr6+a2ha37dwds0OTN/53n2Ix91Wmxh4t/qsHlklYSQmtAGr7OCrsJIcSi?=
 =?us-ascii?Q?7XfI1+hV2IyJpuxw8wChRxEbYrQnypxEZ/W1+CFLM0GmPXAuyC3nksIGL6Tk?=
 =?us-ascii?Q?1J1y1h9f92zqipdbcEsA87fvv5dzwPM/t9dk3jN8rMlX2WbRCcHsQRUF0UFX?=
 =?us-ascii?Q?cK9cc3zP4njTa005NGWPzIBnVQ914saIzF/EFzl304O6pTCWNwTX6xvDwwOe?=
 =?us-ascii?Q?0slkXJWcYZaDPfcOTSbcTOlLwuuOPcvbHh/FBBtF49M75uD3FOtR4lR6BZSG?=
 =?us-ascii?Q?fHd4WHnrFSs7nk94s8XXyLRP7+ENcRNOrUKG/e3LQ/rWmTRd4fEWUu0LM+kD?=
 =?us-ascii?Q?Kav6+Ixat6jAazSG4GKR0N0XGfb+OhmVlht2SXdeTxpye4Ij+xe7gcm1X3Aq?=
 =?us-ascii?Q?zaj0A0bp4ZrOTJKZTCponlCknf52j5n+4Zp+LHNz+h9PK5fImt4DX1ntrQob?=
 =?us-ascii?Q?hfo+941yRy0H9VkH454yzP9+3i16PkPFxRYtTMc0uu25EyINP77lJt5Zt5TS?=
 =?us-ascii?Q?YG9NyepverycmumLZr4s6Fij7SV2MbbEh3ZZ/u2OL7yCZJ8AqgWFx0DKeXeC?=
 =?us-ascii?Q?bgSV+5bS5Vquq/sIoepA1xpoleK8bXsmhh9LUUhnTRmoNR04Z8gW6F7QGFpI?=
 =?us-ascii?Q?4pzqpcdulkRqKPxeg+3sRT/e446oa59RLWHOSJwgQ6o48lnG+mDu5zCfT44S?=
 =?us-ascii?Q?GA3GPWxwmXXMV6b/osA46pHNihyfbikpCIiiyiybJclE4isIxki7XOTs/zT9?=
 =?us-ascii?Q?tE8JJEPqLZF08FfYMhOlvD+mgvX7oZjVXlxH0UyLNCIn4i3jgs/0ncB5ttLU?=
 =?us-ascii?Q?djklW3iv6kc2FU1rhxP+KLc99Wfav6xsNt8iLf9XlPG97hkDRMhSIETeca0K?=
 =?us-ascii?Q?FYlEoBSYSp69fje+BE3LXg8KL4hj2+YcrDJyv7mAOEU+wxqcOBmxEUgoeLym?=
 =?us-ascii?Q?QmQaeXeNV1txF2jCDxDSbSfd3OxIVt2sSj7Y6moAKZM85I2AIHKLMrZZvmT/?=
 =?us-ascii?Q?o6XQKKrVrr0rnawlCJFladEyPgLeQI9Bqqhshp6/fibeYD2o3Kpv8oKYd+lp?=
 =?us-ascii?Q?CLEfF88ZgdsEGeZIkrvt5IiAX7TrF+Kwmvr2DlCcO+YOc6I9xL/nxEAX6Upg?=
 =?us-ascii?Q?Jdgc/47uFyzohsVCZzDLbhmk213P5ZvPbdcLanvV+QEv5o9KjztvDFnYUYQA?=
 =?us-ascii?Q?/gvM77Vv7MlZw0VZNupy1lO54FNHFo0L2IxJHexJmp9XAYFpHY0m9H5IYjLY?=
 =?us-ascii?Q?MNnzyxAa3HKk7DS/ByYz+b4yVrSYqfR79qnWQUWE8XocVXfKI94UY5O8xJW6?=
 =?us-ascii?Q?EDM/XO4ISJeevZA3BNZIWNQgGevKQyMOa96o746IqJahlxWSG9nHjNC4Kz0x?=
 =?us-ascii?Q?oyIu8ZTZcgvr8x8LxnstFkaDb06PqnsQQAN3knfKxiJtyVQyErIuuQ6xMKu8?=
 =?us-ascii?Q?76X2XKR+/upBc4MzjAuIskkRh8tF2u7S9RL/U3gy2oe/anFuhS0Z6edKR0BK?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z9DvHApIZL7tPb4oZd7WDEBWnVrjsUveFjpYXxAHyju6PbBEwvMVYLzm0AoiXh37IccVmXWrpLwapwL9VN7HThQYGyzRgtBIFhB/Vv8ZeER+wOzqFXzr4nfzdZaXNs/h8HSMeX+JIEGgYcV0QsfCgwlV/tbrnkSWcAtAYEE/lQHJxkX3y7o4D3Xkj+TDC1BgtzRRQSbhekqwcg507XsjSsULL53C3Ixhk8jIRu54n8HJ8ixiDz/Q5sb6lTreOcDtfF1mmQD04x3qEkddbH8syJw62fiSTq4JZJ4tPF7T85izBJ0Vy1Fkz+drE3ybGWEOoDFqUv6ANxeCtuzhZn/FOdh0XlkL48T5XK3I/51GF2YCO1tTn6hVbTU3t2v92yNYVnzaxGsx3WlIKa/CbvPD0xm/yXg581/8y2ksTKoCQjY7QJ1B+FsyrkweqUJ2y3+LUjZsNkiZ0Z7s4haAswyNnHsnqzlpdGWayr+bZ2DI9ruwWGPhBEHMJ6MnGPEDAOtDRG4/9WqC5RXwwnfKNrF9/Z+DNlKCkmfyl86IvMsLV8OPzs/Rm5vvVXTGLmkFTDHdkSq4zGQ9ScJUioTyc+/SU8B+VqohT14IRpW9FSPb4qU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbc2316-ba18-4f45-76f3-08dcf74f5413
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:52:06.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1f8EsZikuFt2Gyfg405yPXZ/mNBXOow6enHyk14zBxsbhCzkTka6XqtYuH0xdtniIMv77XxEeMjV3979orerYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_04,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280103
X-Proofpoint-ORIG-GUID: wSzasYQBVGLI7-Mnf1rdOt32Pmj1d3ps
X-Proofpoint-GUID: wSzasYQBVGLI7-Mnf1rdOt32Pmj1d3ps

On 22 Oct 2024, Kris Van Hees told this:

> On Fri, Oct 18, 2024 at 08:58:07PM +0100, Nick Alcock wrote:
>> This change propagates the arg type and mapping info we just got into the
>> pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
>> types before handing off a 1:1 mapping to the dt_probe_t, and calls
>> dt_cg_tramp_remap_args() to apply the requested remappings.  With this, USDT
>> probes should now have visible types which obey the :-notation translators
>> specified in their .d fils (this is now tested).
>> 
>> The probe info has been moved from the underlying probe to the overlying one
>> as part of this: underlying probes don't have any user-visible args to
>> get info for, and their probe_info functions are never called.
>> 
>> We make several assumptions for simplicity, all noted by TODOs in the
>> source:
>> 
>>  - overlying probes all have the same native types and remappings, so we
>>    don't need to look at more than one underlying probe to figure out what
>>    they are.  Given the structure of DOF it seems to me this must always be
>>    true, and even a malicious attacker could not produce DOF which said
>>    otherwise.
>
> You cannot place more than one USDT at a particular tracepoint (underlying
> probe) so it is guaranteed that all overlying probes can only differ in terms
> of their provider name.

I'm fairly sure I'm wrong above -- this is not validated, so malicious
DOF can perfectly well do that, simply by emitting multiple distinct
probes citing the same (or overlapping) sets of addresses! We could, of
course, add validation...

Just because DTrace is the only legitimate generator of DOF embedded
into programs, it is not true that it is the only *possible* such
program. If DTrace gets popular and attackers realise that a program
running as root is consuming DOF provided by arbitrary programs owned by
anyone, this will surely not long remain the case. Non-structural
properties of DOF not validated by dof_parser.c cannot be relied upon by
code consuming DOF contributed by USDT programs. (So this is a genuine
problem, though it might just be missing validation -- which will be
*fun* to implement in an environment with very limited malloc.)

>                         The USDT design in DTrace encapsulates the USDT probes
> (and providers) as instances of a meta-provider that acts as a template for its
> instances.  So, all instances contain the same probes, together with all their
> data (arg data, tracepoints, etc).  So, this is a guarantee and need not be
> mentioned as an assumption or TODO.

I wish :(

>>  - any given underlying probe locus is either a PID or a USDT probe, never
>>    both, so we can just remap the args at the start of the trampoline and
>>    then never touch them again.  This is obviously wrong, but the both-at
>>    the-same-locus case is not yet implemented, and significant changes need
>>    to be made to create_underlying() to fix this.  Right now we can't easily
>>    even tell if a given locus has both types of probe on it... fixing this
>>    is literally a matter of shuffling the pid probes after the usdt probes
>>    and then doing a single dt_cg_tramp_restore_args before all the pid
>>    probes fire.
>
> I would rewrite this to point out that PID and USDT probes being at the same
> locus is not implemented yet, and that this implementation assumes that either
> all probes at a particular locus are PID or that they are all USDT.

Rephrased a bit.

> I would avoid speculative statements about how this might be fixed in the
> future (however near that may be) because there may still be design decisions
> to be made about that and there is no need to bring it up here.

Oh, I thought we'd already decided that! I'll drop the last couple of
sentences.

>>    PID args are already broken before this commit (something to do with the
>>    wildcard USDT work?) so I cannot test if this commit broke them further,
>>    but it shouldn't have.
>
> This does not belong here but rather in a bug report.

Errr... a bug report about a not-yet-released DTrace with a the USDT
patch series half-applied? I don't think we've ever had bug reports
about non-released half-applied patch series before and I'd have assumed
that a bug report was exactly what you *wouldn't* want about something
in that sort of state of flux.

Obviously I wasn't planning to leave this here in the long term, but at
least this way if you tested the series it is obvious that a few tests
are expected to fail and some things have not yet been verified. I have
no idea where you'd expect me to say that if not in the commit message
for the change in question.

> In addition, I think it would be good to add a few more test cases to cover
> edge cases:
>
>  - A probe that has native arguments, but no translated arguments.
>    E.g.
> 	probe place3(int i, char *j) : ();
>
>  - A probe that has native arguments that do not get used.
>    E.g.
> 	probe place4(int i, char *j) : (char *j);

Good point, implemented! (The first one was fun.)

>> +	int		nargc;		   /* number of native args */
>> +	int		xargc;		   /* number of xlated args */
>> +        int		remapargc;	   /* number of remapped args */
>> +	char		*nargv;		   /* array of native args */
>> +	char		*xargv;		   /* array of xlated args */
>> +	int8_t		*remapargs;	   /* remapped arg indexes */
>
> Since all overlying USDT probes associated with a given underlying probe
> (uprobe) have the sane argument type data (native, translated, and mapping),
> and PID probes do not have arguments by definition, you can certainly store
> the data here.  But why in this raw format rather than a dt_argdesc_t array
> (and an argc member to indicate the number of array elements - xargc).

I started out doing that, but it meant infiltrating knowledge about
dt_argdesc_t into dt_pid_create_usdt_probes_proc(), and it proved
outright confusion-inducing when it turned out that dt_prov_uprobe.c had
to pass down a *different mapping* with reshuffled elements, because of
the need to move native args around in the translator. So the
dt_argdesc_t approach gained us nothing and made things noticeably
harder to understand :(

> Calls to the probe_info() callback will want an array of dt_argdesc_t elements
> to be provided, and nothing else needs the rarw format.  So, you might as well
> store that array here rather than the raw data, and implement the probe_info()
> callback for USDT as a pass-through that simply takes the data from here (from
> the underlying probe), copies it (using strdup on the strings because the
> caller will free them), and assigned it to *argv.

Yes, if it wasn't that the uprobe probe_info needs to reshuffle it, and
the only reason it needs to do that is the nature of the uprobe
trampoline (so knowledge about that shuffling should not be propagated
into dt_pid.c: as you note, in the future it would be nice to not need
the trampoline arg remapper at all, so we don't want to spread things
that imply its existence too far if we can avoid it).

So... maybe later once we're not shuffling native args anywhere, if
we're sure that nobody is likely to want to do that?

>> +test_prov$1:::place2
>> +/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
>> +{
>> +	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
>> +	    stringof(args[0]), args[1], args[2], stringof(args[3]));
>> +	exit(1);
>> +}
>
> This test should also test that argN (N = 0 .. 3) has the correct value as
> well.  Later we may change that which would require the test to be updated,
> but the current immplementation you provide is aimed at ensuring that argN and
> args[N] are identical, so you should test that in this case also (because the
> other test does not involve different types, which could make a difference).

Good point! Hmm we may need to copyin() there too.

(Adjusted all tests in this family.)

-- 
NULL && (void)
