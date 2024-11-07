Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76821A6F0
	for <dtrace@lists.linux.dev>; Thu,  7 Nov 2024 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022132; cv=fail; b=spTuHZAewBKPvBpi0RDFUAu0DCfnAdQUuyEp1Wz3YuqJ/Q2wTwDbhK92zBy8ID2i5E9qSjGWhPzG8Rctc0ckLrffOI/iKPzJoc2Mj9ZqzTfjCFHQgDNEBwfjBkMLqgB0d+PuMSd5/cvgNTvPBlWpoGnd048z97bYvW1ufUBMU+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022132; c=relaxed/simple;
	bh=LMbrMT+psJpBa37WfzSNuM/5anQZqG82pe1oukNyJFw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aVGUhVIpWo9dJv65djKEtChRiIpvWTk9iOOZ4UW+O4qmDrz0+CeALrVdyqNVhkLmAaZrEU3zP0ODi6876OGdX0i12uMyVCb+isHpYLdrQcPhEH8S7zPzltW56FcjXw9rD2h+Bnu100omc5EE4PYxOsXYYQMvUrdU4qkReWEn7zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fULjkcow; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WEtQtXXF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fULjkcow";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WEtQtXXF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mtp6n012073
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 23:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=jeyc/TiuvewabfcHlvzkkojfN42IeS0QVygwgpniQCA=; b=
	fULjkcow1UaIIte6v7R6ttZ++YpdA3HNrR5QyspbuwCPgTDIHbZ273r2phAujdjQ
	yv4q/aemkusBfL+HlRX5ZV8Da+ZBRLq4dxHDt4XyBGYOUhT3E8T8gggHQoUbQZi/
	DWA/5a9SLPZfsWHy1IH4pIirwW7YedRVgaBDfJTQaiRnwexRgY6uQeYITTc9gToq
	HvkuQglnWWdigotVkj+xj4rnW1hWB8kyp5G21qUS2V1/hm7VH16wZiG/WfL/5ofE
	zbS1Wo6aWrIp7KEAvADFSiaUoI/gzrDW6D3e7JklRCm3WpJ5nAwLE3A8Aah4VTde
	kfuI2xQB+f943UqGU9ukYQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6gkg1x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 23:28:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7NHuCW031416
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 23:28:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nahaf1ba-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 23:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL+S5LG1j+hWsMGWRqHda+L/IbyuOhG4V7Tt4o/5c1OP1f0T2JZnYRzkcg6DKZVKN1QKWzVMM7mHJB6qjEygwRZHkMfBLLqDZM2l3mkuYx/JU8DHSEEbLDCnTKZBZfIzuG7IxUtprnbOM0w5nyKhvKb/FN5wsf/MuYb0QNqWHnZrr5JLFgfBFZKvUjf9Wm8mhKQzATPLiW2SrbyA09bMWPmJIeFvbxZD2nWFHUxgDXNk8NPxk/on3Am2hvuZTHAGXQeXQNM/gSbWW2RJs3FK7FDfQ5w50y9+NNksBQvXA5sN1p2fPWxmKnGjQSPF1L7Dxuy7OCOauqfqniVXmHpgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeyc/TiuvewabfcHlvzkkojfN42IeS0QVygwgpniQCA=;
 b=sKMQIKn8JYKKf/IUV13E0+VE0C4E2tnSrAUjJL1h0GnETGSAExAe1raXUGQrSvl/I6i/1zuRyit1KHIduFSKRiMk9l6NLSjuuLsHGtuE9he7E5qDMA9clICgGs5tDK0cY9+9IIqndWjchbyBU0qISmpl4G6K96NrgJ5KpZ8s9DfCaQBVpx6vBODoiADlmyqnas0LoI72o7JOO3fS8dF8/flLzS8hMzlHPINtoUadgbMaDzNKPTe6qEy7WtVW/iRkSfbYj3O7cFZU4BRG5b8vpximqJRBXDSk+rf8M80A07xRMieg96bLc7VJphaJMnNAHj8P77eTF3JbEHdbAaNnww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeyc/TiuvewabfcHlvzkkojfN42IeS0QVygwgpniQCA=;
 b=WEtQtXXFzfK06frfOCoCd3We0twsHYw0nldeKYfyx8aTuApdBfSrwqUhjNCfSeIFvtsd4+zCNlIGa6x3C4OxJ+7zgXgCUzPya/7Xa6kjdDu1QhdilC8o+L62uOCwdcamLGQGcyCVWZbMis0xsD9ccF7PV/mj3Y4yOf57+p5shDg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB4905.namprd10.prod.outlook.com (2603:10b6:610:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 23:28:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 23:28:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: stack_fbt
Date: Thu,  7 Nov 2024 18:28:41 -0500
Message-Id: <20241107232841.28752-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:208:52f::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: dcba13bc-c0af-407b-1f2c-08dcff83ebf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZJoAyYyn9vKag4OgwzJrG7uC3a+Gkd9mVUH2jx8cGtRck9TwaxHIptQw0s72?=
 =?us-ascii?Q?A9ALTHfmR+gM65o9VSx+6njK/WmbBwkZ5JlqpjVpC6EeAd+jAwXAwefBlfPF?=
 =?us-ascii?Q?x6o+/rAfxKiSwomQ9u/fHCOvq7fnNKy91QzA9dMBRm8XvQIjSwlB5ctW5FDm?=
 =?us-ascii?Q?kRYLCDv0/hABDoe/d5yZfrYfbD40fOghq3mH5TCMg6FutTZXMsBP6IEOy8Wz?=
 =?us-ascii?Q?xmNNgq7OzIYwVDlAzSH14lmq3zjySlWgE6QBFa+5W2Lmgb8bc3L/VIO0JC6h?=
 =?us-ascii?Q?AQSaon/OdPuuWlQOrEuk1Iac34CdPfGFiBUMeIsSHU6QpTFJW2rDRxmvX3Di?=
 =?us-ascii?Q?ydpBr8pfXyjKluTwNpgDx0llthlKl2YzjLmIJT0nfe5JsLDhbkFoJc19CP65?=
 =?us-ascii?Q?EDdFzDsBC642LbaURaFs1IR8Z8QJT/ff5cq7RIIsyUPARbV6zpqTSsZvitjZ?=
 =?us-ascii?Q?erKxwt/Ke+v+gjqe+FVjorMU6aXXhAUnDcbCO+Yqu0PBJ5d47BoTQg9SdoEv?=
 =?us-ascii?Q?Z5Y7+HwvM26UnKLPQ67frXQGseUTJ1UkrVfeD9ufxl8YdFcURza5YS3ZE8Q9?=
 =?us-ascii?Q?YOrDhydgfNYk01mgh/irMkf0FjOn0p24jHCbX2Q9LIlzR9CZyx0bg+FH46br?=
 =?us-ascii?Q?10U28XEXuf0JanNhFX67ptttzLOS+mnwRM+fZeSxtlHirLiqTaIrsKJl6dJc?=
 =?us-ascii?Q?dJPVSilHdXjbqhnbaKQ/S8N8K+3O5dvxdgy2/Y4DZIRJxd3fZh2THWOLx2gC?=
 =?us-ascii?Q?mQU+GGJzJMdjQu/hw1Y5OBxmrhIrlAJvzZm1MFLS5y16ZKYWN9BsHsA4Ju0S?=
 =?us-ascii?Q?XZYLkdv1qKE0CIIPk3czMgw5gslK32JN1oyPMASnNRSAXZGVzNP32qzzX5Pp?=
 =?us-ascii?Q?GWlWhF3CyrKkCpk85+ciSJL/r4vbX7cUrYzIOsqlitSvVG9/oEKFVXKxj/CG?=
 =?us-ascii?Q?qruzRpmiywFDZ+b14roPpBd8Uf3LiWI3X/p66F9BpDxyMzUfhDOvEI4bD1hC?=
 =?us-ascii?Q?T/BEewVS4qH2WyVSvaeVgC5NYaz11/c6JETJ0Px/wGVyG6O/xAm6dlTCur88?=
 =?us-ascii?Q?oFKh/XT2uLzytqaZvjXNO+imAw06sbhrv16zT+jSddf1K4ukmJZWV0YfABBr?=
 =?us-ascii?Q?TQUaBi1YnyGKgxiHc9hRZIdAmhc8Obu8dkV037CGnFhXFtCFxb43E1/lsp0s?=
 =?us-ascii?Q?Z4+zkHRQUBgcm9OR7VHurDS6dNn64eX1gSxYDW5wr3LjQkN3+o2kwj96peax?=
 =?us-ascii?Q?qMw3yT943L165graavcVjJzZVG62ACc9kA/Ins2qrkdxwgxlI4oXvfzWHhva?=
 =?us-ascii?Q?f8GkkjTzur9CnNrpkMN84T3r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NgKyRJEH+YGlMAbYp5LEIP6N+U0563xw72qSZdoTonrw43NCCeGKM/6R1DGD?=
 =?us-ascii?Q?AIqvLzZEhXFnXcCZ/M1Vs2YKgHhTGyzqHigPhuAeH29TNm53JdJSzy1pivPR?=
 =?us-ascii?Q?2vpHrb8g85RucrCQRlHq5cj86uG4rm70oMozG2OhjzuKFlhXUE96dRDYMOZE?=
 =?us-ascii?Q?BDE7Xd6c9aEzur+8RRiwx1lFjZTk/eaRrWPQ0nb7EMoB6grir3BsLvPY3HTF?=
 =?us-ascii?Q?iCWo9OlUoI9WmYtLAGxLKNRd0VvTY+Fpv5oKQUd6IM4OWP4ztj3nZEXIkhmw?=
 =?us-ascii?Q?N3fgEVqBsuekafveMGBAVG2trQgxojkKfozNSG6ebenmzBp+3MFtX1eO600E?=
 =?us-ascii?Q?0zLQ9ANOC66PgDXHX0JKLAZc7VuBNS2/qO4MX/Xl1I1dJzeQ2Nbf6XDpmq57?=
 =?us-ascii?Q?Do5I72bJgIgsmaJAbMu6nWdigznvQo/W3NvZHFrKizB1y+aCS3fV6MBwxp7P?=
 =?us-ascii?Q?TM+fXpExD3Wk0RUDHRTmrQnoQoSUaiIOsqjwmmA3YXpb8DO5IJ+HRGHnFXgw?=
 =?us-ascii?Q?A1PnbnPms7Cu/zcy9NoVQi3tdqDyTUmAwHf8kC1NC7GwnpSrVNuIrTIdYVMR?=
 =?us-ascii?Q?Lp4VMZ+s99Mu2iIMEhvmekqiLWCxjqAGZFrZJlbWTnevv7fbvSMrh/jh5YrS?=
 =?us-ascii?Q?Bw+h0Q6C9zjiGlFSc0NrqwLrXjpgQgrDTudEvSfpROVkSlIBhnMJw3ThTatu?=
 =?us-ascii?Q?Vy728V9F9JeRyh4EOgFxGrRHLVk/tns91itQX+e9EVFsNoggVV1nSKgE7dmW?=
 =?us-ascii?Q?VDXKtNQIPPfnJHN3fQMWDlPC94dbu+kv8pxcmFvYKxQNuA30Hd3oosa/TLVQ?=
 =?us-ascii?Q?yIrS7xLqzj4ep36Z/qprq5sOvlslRHvXWHmMLwAzo9L9uvlriFEhx014ni0h?=
 =?us-ascii?Q?EuU+hEa6aF+/K2LIeDX3aR6dO8TgMRXKrEoun6LU0nL//MMKPJ0KYAxRRkH4?=
 =?us-ascii?Q?AOSO6shkrYFRrrG6UZKAPgthAa1PUeaodvR/iAe5vdlFMdqv3dXS4lFHXZ42?=
 =?us-ascii?Q?6J7iKoKNozkhGZPAutZHbTsjfLWF0mRhlu0N/z8OF8OsGCGvkDlIF+YVFT6l?=
 =?us-ascii?Q?7bohn16jcheY9PZknO8bEZvzDeY1Z2nb4D6Ie+SdG17lW2iH9BF8hzAKZ7T7?=
 =?us-ascii?Q?6yx9exZGlchD3NqVMrBtDw0X7BANAqSvnDbfN9euM7nRL2TaLA4b5/GVD3JW?=
 =?us-ascii?Q?AIy3wzTATcGbw+XXxH7LFzFlIG1urmdGuh9mtq0Jg9MyiA2E3fe5CFN5guAK?=
 =?us-ascii?Q?K7++BBlAkUbXoIjrdpdsVvOevd4gayw/QqbQoUp+odxMxejbhnUYnqUA2qRl?=
 =?us-ascii?Q?GX/YJYDfuocG2o49Zlc3m70eXdOMFWRWcJ6EtvmtL4cHIFDnaGN712k1WwOK?=
 =?us-ascii?Q?fKO3p9EpGT2wW1jCSnuvJfyXEXhRyAKUJCg61FsD+WkoN5A7SSRAC1BMOCCk?=
 =?us-ascii?Q?EKNlQVpxhUSyDLPb+/UVxjm1ZJKQKJZ0IsCJs3hnmcHyKvkxn0DEj0MmO6rW?=
 =?us-ascii?Q?nlMb5ZA235g+5Oo9jiJffRSEo9QyXBPQ3LNFCkgGrucn0NbmR74I9/P2bJAW?=
 =?us-ascii?Q?cJ0R8/sVMvOtY1MEBtMBKA2yrWSCyEAha+P2Pza8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	izxbn3EswO58IUop30ZitdNwwlmMtJHiy6jmGWuA8gAJOYNegaww1NuTDmJ9KTbUiJv3aCrBCryblKYUY1jUHHobNtjqFSD2YDG3n6+NYqKha4D+wqikizP8wVcw32cHwHLM9oB8j67ddj52t6rHpQtm7cwWaRua7TIA97vGpM8JG7V0YhvA79iIsHpcTT0wOlNbl9Zes4gzMRubwsjLTD4c6zQNf8Nc2CZn9X3jSwMDzZiAksgjdD4mpc/XnCxFQgNwVQJJR2KAcHQRyba4iOcXgaq/CmnWKlWMt1rrBT9tk1WCJbATk0lK1a5G2pnVO36cmmC7a9d6ucnwQSk+twEHNxV8NwKB5YkU5GTyewQs32DY8hXWIQxn92ZWdwoScdABREoQm/MHFxxk8fudowDBUcGSxfsFMoAx7oOjdSTh/rS9mixK3zFks0a1H1+QZkNq3vqiL1C5VV0YvRuArnciMLWExolHd5wy4RPHZJMQk2UizYR0sXQWaYC5NHwFoJMxfeZKtZ7sI+yNiupDRxu0nhw0RtFlDSkld5samioUKF2TaC7Z+I8PfMI8OWE3SUZzAGusuI1LhiCmMKfOMpL3DKxv1cNSU9gufbApQpY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcba13bc-c0af-407b-1f2c-08dcff83ebf1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 23:28:44.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw2hD4WxYNERHKjSCyNG/bCAZ9H8/cYM4MWXfw6swgR8C0CVklaVI2uMMpD2xBolu/EM3qhk3GjvDynAZ+nP9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4905
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_10,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411070183
X-Proofpoint-GUID: bQ8I0_wsTi2GkypP0S8kdfEQII90Hofs
X-Proofpoint-ORIG-GUID: bQ8I0_wsTi2GkypP0S8kdfEQII90Hofs

From: Eugene Loh <eugene.loh@oracle.com>

The test was being skipped on UEKR7 systems because __vfs_write
was no longer traceable.  The expected stack on UEKR6 x86_64 was
out of date.

Switch to fbt::vfs_write:entry.  Convert to a .sh test, so that
different stacks can be expected depending both on machine type
and release number.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/stack/tst.stack3_fbt.aarch64.r |  11 --
 test/unittest/stack/tst.stack3_fbt.d         |  25 ----
 test/unittest/stack/tst.stack3_fbt.x         |   1 -
 test/unittest/stack/tst.stack3_fbt.x86_64.r  |  11 --
 test/unittest/stack/tst.stack_fbt.aarch64.r  |  14 ---
 test/unittest/stack/tst.stack_fbt.d          |  25 ----
 test/unittest/stack/tst.stack_fbt.sh         | 122 +++++++++++++++++++
 test/unittest/stack/tst.stack_fbt.x          |  10 --
 test/unittest/stack/tst.stack_fbt.x86_64.r   |  13 --
 9 files changed, 122 insertions(+), 110 deletions(-)
 delete mode 100644 test/unittest/stack/tst.stack3_fbt.aarch64.r
 delete mode 100644 test/unittest/stack/tst.stack3_fbt.d
 delete mode 120000 test/unittest/stack/tst.stack3_fbt.x
 delete mode 100644 test/unittest/stack/tst.stack3_fbt.x86_64.r
 delete mode 100644 test/unittest/stack/tst.stack_fbt.aarch64.r
 delete mode 100644 test/unittest/stack/tst.stack_fbt.d
 create mode 100755 test/unittest/stack/tst.stack_fbt.sh
 delete mode 100755 test/unittest/stack/tst.stack_fbt.x
 delete mode 100644 test/unittest/stack/tst.stack_fbt.x86_64.r

diff --git a/test/unittest/stack/tst.stack3_fbt.aarch64.r b/test/unittest/stack/tst.stack3_fbt.aarch64.r
deleted file mode 100644
index 5c8bfaed2..000000000
--- a/test/unittest/stack/tst.stack3_fbt.aarch64.r
+++ /dev/null
@@ -1,11 +0,0 @@
-                   FUNCTION:NAME
-                          :BEGIN 
-               __vfs_write:entry 
-              vmlinux`__vfs_write
-              vmlinux`ksys_write+{ptr}
-              vmlinux`__arm64_sys_write+{ptr}
-
-
--- @@stderr --
-dtrace: script 'test/unittest/stack/tst.stack3_fbt.d' matched 2 probes
-dtrace: allowing destructive actions
diff --git a/test/unittest/stack/tst.stack3_fbt.d b/test/unittest/stack/tst.stack3_fbt.d
deleted file mode 100644
index 1a2eaf582..000000000
--- a/test/unittest/stack/tst.stack3_fbt.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: Test the stack action with depth 3.
- *
- * SECTION: Output Formatting/printf()
- */
-
-#pragma D option destructive
-
-BEGIN
-{
-	system("echo write something > /dev/null");
-}
-
-fbt::__vfs_write:entry
-{
-	stack(3);
-	exit(0);
-}
diff --git a/test/unittest/stack/tst.stack3_fbt.x b/test/unittest/stack/tst.stack3_fbt.x
deleted file mode 120000
index fe0d493c5..000000000
--- a/test/unittest/stack/tst.stack3_fbt.x
+++ /dev/null
@@ -1 +0,0 @@
-tst.stack_fbt.x
\ No newline at end of file
diff --git a/test/unittest/stack/tst.stack3_fbt.x86_64.r b/test/unittest/stack/tst.stack3_fbt.x86_64.r
deleted file mode 100644
index f24c8cba5..000000000
--- a/test/unittest/stack/tst.stack3_fbt.x86_64.r
+++ /dev/null
@@ -1,11 +0,0 @@
-                   FUNCTION:NAME
-                          :BEGIN 
-               __vfs_write:entry 
-              vmlinux`__vfs_write+{ptr}
-              vmlinux`ksys_write+{ptr}
-              vmlinux`__x64_sys_write+{ptr}
-
-
--- @@stderr --
-dtrace: script 'test/unittest/stack/tst.stack3_fbt.d' matched 2 probes
-dtrace: allowing destructive actions
diff --git a/test/unittest/stack/tst.stack_fbt.aarch64.r b/test/unittest/stack/tst.stack_fbt.aarch64.r
deleted file mode 100644
index 3a2896c48..000000000
--- a/test/unittest/stack/tst.stack_fbt.aarch64.r
+++ /dev/null
@@ -1,14 +0,0 @@
-                   FUNCTION:NAME
-                          :BEGIN 
-               __vfs_write:entry 
-              vmlinux`__vfs_write
-              vmlinux`ksys_write+{ptr}
-              vmlinux`__arm64_sys_write+{ptr}
-              vmlinux`el0_svc_common+{ptr}
-              vmlinux`el0_svc_handler+{ptr}
-              vmlinux`el0_svc+{ptr}
-
-
--- @@stderr --
-dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
-dtrace: allowing destructive actions
diff --git a/test/unittest/stack/tst.stack_fbt.d b/test/unittest/stack/tst.stack_fbt.d
deleted file mode 100644
index 27db21164..000000000
--- a/test/unittest/stack/tst.stack_fbt.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: Test the stack action with the default stack depth.
- *
- * SECTION: Output Formatting/printf()
- */
-
-#pragma D option destructive
-
-BEGIN
-{
-	system("echo write something > /dev/null");
-}
-
-fbt::__vfs_write:entry
-{
-	stack();
-	exit(0);
-}
diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
new file mode 100755
index 000000000..e60c519c8
--- /dev/null
+++ b/test/unittest/stack/tst.stack_fbt.sh
@@ -0,0 +1,122 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies the nusdtprobes option.
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/stack_fbt.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Use DTrace to capture stack() at vfs_write:entry.
+
+$dtrace $dt_flags $nusdt -wqn '
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::vfs_write:entry
+{
+	stack();
+	printf("first 3 frames\n");
+	stack(3);
+	exit(0);
+}' >& dtrace.out
+
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace failed
+	cat dtrace.out
+	exit 1
+fi
+
+# Strip out blank lines and pointer values.
+
+awk 'NF != 0 { sub(/+0x[0-9a-f]*$/, "+{ptr}"); print }' dtrace.out > dtrace.post
+if [ $? -ne 0 ]; then
+	echo ERROR: awk failed
+	cat dtrace.out
+	exit 1
+fi
+
+# Figure out what stack to expect.
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
+	# up to 5.8
+	KERVER="A"
+else
+	# starting at 5.8
+	KERVER="B"
+fi
+
+if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
+cat << EOF > dtrace.cmp
+              vmlinux\`vfs_write+{ptr}
+              vmlinux\`__x64_sys_write+{ptr}
+              vmlinux\`x64_sys_call+{ptr}
+              vmlinux\`do_syscall_64+{ptr}
+              vmlinux\`entry_SYSCALL_64+{ptr}
+EOF
+elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
+cat << EOF > dtrace.cmp
+              vmlinux\`vfs_write
+              vmlinux\`__arm64_sys_write+{ptr}
+              vmlinux\`el0_svc_common+{ptr}
+              vmlinux\`el0_svc_handler+{ptr}
+              vmlinux\`el0_svc+{ptr}
+EOF
+elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
+cat << EOF > dtrace.cmp
+              vmlinux\`vfs_write+{ptr}
+              vmlinux\`ksys_write+{ptr}
+              vmlinux\`do_syscall_64+{ptr}
+              vmlinux\`entry_SYSCALL_64+{ptr}
+EOF
+elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
+cat << EOF > dtrace.cmp
+              vmlinux\`vfs_write
+              vmlinux\`__arm64_sys_write+{ptr}
+              vmlinux\`invoke_syscall+{ptr}
+              vmlinux\`el0_svc_common+{ptr}
+              vmlinux\`do_el0_svc+{ptr}
+              vmlinux\`el0_svc+{ptr}
+              vmlinux\`el0t_64_sync_handler+{ptr}
+              vmlinux\`el0t_64_sync+{ptr}
+EOF
+else
+	echo ERROR: unrecognized platform
+	uname -r
+	uname -m
+	exit 1
+fi
+
+# Add the first 3 frames a second time.
+
+head -3 dtrace.cmp > dtrace.tmp
+echo first 3 frames >> dtrace.cmp
+cat dtrace.tmp >> dtrace.cmp
+
+# Compare results.
+
+if ! diff -q dtrace.cmp dtrace.post; then
+	echo ERROR: results do not match
+	diff dtrace.cmp dtrace.post
+	echo "==== expect"
+	cat dtrace.cmp
+	echo "==== actual"
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+
+exit 0
diff --git a/test/unittest/stack/tst.stack_fbt.x b/test/unittest/stack/tst.stack_fbt.x
deleted file mode 100755
index 4561df8bb..000000000
--- a/test/unittest/stack/tst.stack_fbt.x
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/bash
-
-read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
-
-if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
-	exit 0
-else
-	echo "Function __vfs_write no longer exists starting in 5.8"
-	exit 2
-fi
diff --git a/test/unittest/stack/tst.stack_fbt.x86_64.r b/test/unittest/stack/tst.stack_fbt.x86_64.r
deleted file mode 100644
index 792ce80ad..000000000
--- a/test/unittest/stack/tst.stack_fbt.x86_64.r
+++ /dev/null
@@ -1,13 +0,0 @@
-                   FUNCTION:NAME
-                          :BEGIN 
-               __vfs_write:entry 
-              vmlinux`__vfs_write+{ptr}
-              vmlinux`ksys_write+{ptr}
-              vmlinux`__x64_sys_write+{ptr}
-              vmlinux`do_syscall_64+{ptr}
-              vmlinux`entry_SYSCALL_64+{ptr}
-
-
--- @@stderr --
-dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
-dtrace: allowing destructive actions
-- 
2.43.5

