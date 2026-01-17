Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628033595B
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768667491; cv=fail; b=HgzUuzJ63ZEf6nVwXqu16ju+jfZ8D8AXXO/fwzTI5V7fd8N3wwK2vd6d2cDkVCRXpg1g139kcmrLdtN/TXXEroHyDx80mOMNrWn43YZnozF2IaPS/XumPzBA0n2toy5vg/HHQ4d3M5j1jlzG/uYfaEmSRHCmjQXDD6pOi43h8aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768667491; c=relaxed/simple;
	bh=Mx9VEkOR5Cy4QfpNm3XIMraJpFd8ReeO6OZLP49SYvM=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nzz1qecGuPwEZ+EqwM1M2WTpJrFcjJZzoY/iw/VKniQdKkqXqX/XhF/2XhE4iBZAIJZRjHMZQ2wnOcbGAdmCUOunUcORqyGAwER9CMyIn+Q+L/0qkas4aQrgyijk544fG/3ce2Cvqdz/KzZ1ImoO0xhdW5MxgMjuV08SvkDGY10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=crPKqS41; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FMCJq/0s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="crPKqS41";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FMCJq/0s"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60HG4XvN1554250
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 16:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4wm3WOSAY9pkrMjiJb
	wbcuSpL0BmFSXkC3OdTs392C0=; b=crPKqS41VtJr9j4YUWkIUmgbW+/qy806J7
	Kg5m+KM+TfQMbYChXDw28o68G8qoIRYM6vQRcW6daPgSLMKnJmO+sUGhUknslTUz
	voIJS/lRYfiRJN7pg+pSGbQS0ZEJDIQgkV/SV295d9Oa9AQYS1M5TBS7SIPQbuMP
	nGhVgLqTUJx9Ib4r0KbvkVnJFjVCN9lLLJsGe+ANYJoJbODf5sX++DpfT+PFsEm/
	Uy5Lx7zdl/TKayzj7nTmhetQvky10MLHBS+9M1p85pUC6TRheirBant6deU6hXJ+
	RoSRM10hWYD7JdZ7YuQHnn188cxgo3SykrqxL26BkqAkgBhvZ05g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9ge0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 16:31:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60HEU9kI032183
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 16:31:25 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vafkth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 16:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b38tuYvTs7XdA/dBGXI+Run2jMGmTDbDdLCEQEwSRmyUi9jz1UkVyfAlH/y4+lkvZr3atMoEMZ25hGeocIsl14Ks0GPd3p9CXtK4DkUJ+d4Ikcro4pz21kvd+jxms55s4mhveDqMuNeUtTYBXRrK7I8p+nOuWEeeTGjqiVR0Hr9gdqFgTMlrIcPnoewRsrq9YGZZ2/ydP/sCmKgNVstNweKyLWhz1SObnvOwbz4+qlAKd3UMOrtrmJ7uAEmIEhPlT3yDJtRSZ5L2t+1BDdjBAkXVO+RrsCa8XlnNxTYxvOokku7sfrqhwEHRkoi4Gk47b500bzb07SwtVvNLtYCZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wm3WOSAY9pkrMjiJbwbcuSpL0BmFSXkC3OdTs392C0=;
 b=FZIGT5CZf3ZMn2HNIhve2L0FcX8dhZmS8uQYrRy6r12JRvlxSOYVl5MErW5QS67PVDQ2eEA78HnW55RjERwbXxt3V3vE4cOjMZvHKedtnicEJZIAvSAPB8WHYp11Nby1/SNni2CKxanBUyNvvUT8/vs855bUjK62BZH07UPp/scTVHvFVLoUEoADri0JHUCJ8n1Jc7D/SYR04Uojhh6em5q6zC05zvksmMyNUYYWA8QDq47UmFATLCsTSCxiI40GJjVqgGkXKJrVduVQGE/rON3oXIh6eItRWYFII+P6/QcL/QPXbDBd62xd0lanDPOlW1Fzv8tK5yeJbH0lz90zgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wm3WOSAY9pkrMjiJbwbcuSpL0BmFSXkC3OdTs392C0=;
 b=FMCJq/0s0yp1PJai5zCiJ0Qk1QsW2wPgESHBG1aiwzXdD47stNYo4bwJZoIglllyp8FsAjp3krvS+GVA+ZHurI7517JO+0/xPc9yXoDPFeaNBOXscwCoIS7p6T4aITH72tNDWm2pMq+v95c5R6OB37Hle1o83+cR0ZiMyLexGbM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY8PR10MB6907.namprd10.prod.outlook.com (2603:10b6:930:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sat, 17 Jan
 2026 16:31:20 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.009; Sat, 17 Jan 2026
 16:31:20 +0000
Date: Sat, 17 Jan 2026 11:31:17 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: Re: [PATCH 4/4] Add packaging configuration for Debian
Message-ID: <aWu5Vc1mHLLU3YBK@kvh-deb-bpf.us.oracle.com>
References: <31ee7fa5fb7dbfe4ed660ec8bd5c9bfb@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31ee7fa5fb7dbfe4ed660ec8bd5c9bfb@oracle.com>
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY8PR10MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 942da862-7df5-498a-c881-08de55e5d838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2m/+BXeF3b8gDFuoqAM5G+KbjpKLXXy8KQgas41osHSntFD29XX4Y9PJndUg?=
 =?us-ascii?Q?xi531Zbcq2vzEtt3s2UAn7ZHl5Qc5uVILpb333wcKoEiRRKcXdTYFKh5DZtI?=
 =?us-ascii?Q?q02iaPdATnMHTg20KBZANuNXzG4KnFC/0S+VADTZwNQueuoLaQ2Y4CoM4MVa?=
 =?us-ascii?Q?J0f0+4w9uqGFFnVcJ2HssE1y7rTUIb8lUDNftQJf7Q3JleUDi0fM0gIjcsOh?=
 =?us-ascii?Q?QApvAe+N/JbGh+R4tABsRNv1iHPZCUIG3wGcdq+gJXnhU5mC5jHi5/6q3hya?=
 =?us-ascii?Q?65FNI6Uu5pM2YYEyZGDhh8y9sctzrvcq6LnQ3wtLWApJllF1iW15ISYXUG/e?=
 =?us-ascii?Q?gs2eeFi9B7AjscpFBrblyrssL0cU7ltFfZ7oHW8DVGZKoP2cyRM5e701MjYn?=
 =?us-ascii?Q?NEIblbDlA1NkU+Q9yF8lDUz8da81HIdpk0hHeVxE63mjGWl13r0aPW+3wfn7?=
 =?us-ascii?Q?CXDaRIbijcjVoNO98ZiNKRjzw69qk1LqqnoUje6J3SMRvjLv/WQuiDLsftr5?=
 =?us-ascii?Q?X5VephosR33Z3cEd6Vo1P6AmyKl2MWtC4c2oryHx5yVK8htWWbqWMoE9IKrY?=
 =?us-ascii?Q?ZkNZFBr0y3Jio87ywlw5wAyX1et8hMfu6uu3PRoxXlKQo4d+tNYE31ezGmCe?=
 =?us-ascii?Q?e2X6jQz/PcQn4Il3a56Oau+3OoKQBnQRMfRyI3T+i7bKtv88qHnkemQrFXNX?=
 =?us-ascii?Q?btIcyqhsNa1NBJYrZp1KYChlZkaLgaWgkvhxmP/ourTZjQw64atkY00ipzwx?=
 =?us-ascii?Q?5G/TQTIQa2Ll1Qe5I3xV/nsKEDRvgNTXVkCoIJzpxm+XH+4CxeVE7yMyIQP1?=
 =?us-ascii?Q?1gvcp64o7Df8iClgA6iSAslU9LivQczpBBCmebHk8m87lk1OqvlRrKnXUJJj?=
 =?us-ascii?Q?WL1uKC/GJMRLhcdd/y9kDXUGx9lBJky1WCEkVNspn2S/TQDyra/0fTzu2lSp?=
 =?us-ascii?Q?Tj3dqqmUdBM9eFKnjbQrz8gIZuAbJyOaiUboSPckMWX8ppQFHomTGh1Ynor+?=
 =?us-ascii?Q?xBOZwuto3gGLC1lBJyIlXCwio1nD2IpsGBscVygMeq4o2Kn0ciglLVsesZfs?=
 =?us-ascii?Q?xLPDXFF1G3XKrrvgQid3FkZCd3iqdj7rBvXXybB6vJiENAH2k+UqGaHpdn3u?=
 =?us-ascii?Q?v5clpmLkaiINu+BxUcgmnLGu8pisWd+5ctBTTFn9HuQxAiGMD90bMXLCm+cp?=
 =?us-ascii?Q?JvRv/BQNA2/+maKNawPkD8ZzHwWQu9H5yW3MSBaYH6O7ix7eEq0WWWoPTLK4?=
 =?us-ascii?Q?XCCqbDQ9GgWtAbKwPjmPm3JIIGxwjCVVpMoK+C2w5NVXUsG6Icdnc3zkf296?=
 =?us-ascii?Q?bLlb7+ttQKPGjo5/BLrbtYkGZWRDBNpNTvg43K81hIzqYPX5tyi4B2vRH5wR?=
 =?us-ascii?Q?j5gJ2TO7BaPwZBgRefhcBro18v4QnM+YTeZEDMfNt/Ry7PFugncKhbVPDyaA?=
 =?us-ascii?Q?8H/g8z8dRmo1zDKSdBeGTVLerkooCQ76vGpeSW4wgwyz4Fo/RY45YraOG6hN?=
 =?us-ascii?Q?2MkU8hTjC86W7WFn+vMYuIGFiYyMx1vtuf6J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lzVTiHUDdqPHpyj9IVskUXSgovFE920mqi4xF9sSjlUgDwwKeaMRrHKcwDJp?=
 =?us-ascii?Q?jni27cq7ceTOPJ3VxOovDhp0uiMcgIqzf50iinCldcg3fByGV5oU1iLuU5bw?=
 =?us-ascii?Q?/S/TMLwcUVKk9u99iWGZ6VG7l8KelYK6Zv0qk571MZ9Zqn10tqqCQmGmboKO?=
 =?us-ascii?Q?5clcYbqcGhhc5XlD1uUJTfmcvH87z+R5pyWnUX7oH91Ev/hC5V6olONuBK5Q?=
 =?us-ascii?Q?2S+7B3kpS0o+5h046L+pY6uV2GeQ2R55LZrLzsBUq47qUJiZ3kZ7HLSmYgUS?=
 =?us-ascii?Q?pX/9fJULlDu9Dtr0n6U2W4Q+Rgcz6qF+68AGF3eBJh79okIZu2NeWnx3uNQo?=
 =?us-ascii?Q?lztuE4RKK6cflpfNLVU1jRlqELT6Nn/iGgfCkrUPA+de5i4ehDqqFvSpOSDX?=
 =?us-ascii?Q?moeHpLsdsslohqCoE+8iyjjMaQgqOj0wpZHIrRWAULQxIRcax3Kwv7Vdtsfa?=
 =?us-ascii?Q?/gkOpEXvov9Kd7t1pLZ9sjVlfjjvOl4GqDbf3TFLZQMOufXN7Cx5OyfReEQN?=
 =?us-ascii?Q?+I7GAfyXBnFYngxJ29IY4SrNWunwNHV/QCjfAI7/tT5Hbv+fxjJ4v/Fq36wg?=
 =?us-ascii?Q?GT2HRYvvYp/0vRhllOp0nFkm+11B1eeBrg/+mNjn6HrEkbBFMllvtMB+TdKx?=
 =?us-ascii?Q?5G0Ep9jOVwMvJ2syz9JQaSxT96gQClqlS5D6uuIqxQnh9zGBuOJJQN0P1h0J?=
 =?us-ascii?Q?/L+Y8BiudnXgIYLCUU2sP7msOiBaJvDIb113MAhMdyeeTncHqpXwOC38Gmst?=
 =?us-ascii?Q?moOqBuLNbLIVk0uG3v1oxtnGsnY7q2zIKk2gSzIaGKcGomGHkQS8VeYqrz2L?=
 =?us-ascii?Q?zDcQGARleASFM0KmspNN0W3UW82goLgZOpXydkNZAI/zrpCgpkvs2dhy3pXP?=
 =?us-ascii?Q?sqSi1UVkPUxa9ovT3JyS5lWPi9mseFwV7aHHfJ/GEVTni164cJCcGLfO8GFx?=
 =?us-ascii?Q?a94k2Kq1VCZ/zl5eBuWTk9E+En0W3SOeQufgFBRvYK2sFRVrD49I8BBGVJeN?=
 =?us-ascii?Q?lZnL/Da0+MFZuNfLg/o81F3sb+HM+WnyXGhWCXKGIwXtzYbAZu2SMpprPOu2?=
 =?us-ascii?Q?7vXxb6hixTdwXtHopXCXTFFzhODUGbunxH+hfYbL4UTT/Cbyhwi9SnOlmv0x?=
 =?us-ascii?Q?DVC4lu61/W8xGMWQoVVECyQzQIVzUxN56Pe4fgxhjJoZcIqAKhrnO0/IE2fJ?=
 =?us-ascii?Q?eCqmLKSFGkau3gCvA/HPRIIsLinTjIrYYR3Wx0CQSGQO2k3UEp9SFMokTO8W?=
 =?us-ascii?Q?wpKEdQo6CDbv37hrbYrPzwDtPa5tqzY4yPaVJ9YUF6iGnXyl674gNtcR55hO?=
 =?us-ascii?Q?bCZTcbAg1W8D+tpvD+BcorTruvOTVPbwy1Zdb8IEnhb+Woef5Y2KkMRAFX6J?=
 =?us-ascii?Q?wY1bKQIx+v5oiwByAiLwnTNEPuWTENErqSXn7kJExS+tURRMv0m/u9rIJNPf?=
 =?us-ascii?Q?zz/5BaVV6U+H77rv7wQrWwRNroE2yeL4sDUJattOU7NqWr0Op7a6CVXCGWyz?=
 =?us-ascii?Q?NmtHy9rAKH5TOyKls1O7Z8GyZ3G3Lf8+VIvJq8nA/kevH+OFC3U2Xt91eL8q?=
 =?us-ascii?Q?pYdB7NnxErXm9ruGPRkDyE5GlY26+Sobz2FJgMIcY4PEp4xRhVj14M8aEqs1?=
 =?us-ascii?Q?cQ7XFqLEnQmJD/7KInOk/6sKeNoSIXQNiiriSFZabBBrmCyO4nVK1qqNP5YA?=
 =?us-ascii?Q?hsQUpi1+paoqWuh5ZQEE5ajJsaYB5Dq3x4pDRoirRQHwdkmNQN76K8L1CYaB?=
 =?us-ascii?Q?kIHbYpT2VVXJc9CKLUTz2/qVLqciCCs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aoAmG3Lji/lcTTPg6hjJEtw/yiIc2pTQqCukH0p0OV3zC2sFStxIMXCC8vT6/Ho7cPc+4agy0Om3wAiDPqCjXwlbjVqYBPdMnInrYdml67hwLPu7C5v8yJTb4YsHVcpzJ8C/xi35MCQaOn6026l/UfEm1+yzMhn5W8kKpmu1MTTpZKOGok1XM0GaMAL/yFLbZIcojfnsmGAnpmh0/l4pujkZrOgLWOrahz0qoAYL3yF9eJCnoes+xH48ZHCKa2iOXGWNtkgkPe1B+CHQO3YJdXLpZU844awYs+Pa4/7e8UeJfX1pXA61q8OlaqIPcSIqw/cTr5uq6E7SP4SreKOjqPvg9fKEfH1U0NODgfGRueDHqZzGfM7WE10JDgIDXlGnC64mnMzF63FNPA7M0oeMi9DaENa5UE23WX2f2CWaJkmPfdl1jpBJIEYY90gV7URuiJ3ZjFioKZ9eM0PMQ6ugUCQep+1aan5MAQlxRTeO/MmN6XeSzgwzlBqBesmMimoJqMg1Ek+mHiFD5mvUU52eGTnfMo30GOzozWUXU9eIR1CZ5sqdhRdvyiBUwjAnOlvxgyQfz/qv5QYk9MRfYEQ1akiXf3FWZxuwCVdkN+H5KbI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942da862-7df5-498a-c881-08de55e5d838
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 16:31:19.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7o3a0QmGhChtLNOmipzaiKNDGW8W+ZKXVRRp/IemdWPP0k6NT2giygKYVwRlh/plSL30NpFIEvkgvrnBjAhIgI1pr4nCSWSEXF9MAmaEV3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6907
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601170137
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696bb95e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=Ixkok3qfAAAA:8 a=yPCof4ZbAAAA:8
 a=mDV3o1hIAAAA:8 a=-uRnw9v1FqryEd_sny0A:9 a=ksCkWQosLJNZWoZx:21
 a=CjuIK1q_8ugA:10 a=_4Lj5ymMnAn2NA9aJKr1:22 cc=ntf awl=host:13654
X-Proofpoint-GUID: efKbBz3wJgJOUR5nyV5_H7I7TtqlfuuJ
X-Proofpoint-ORIG-GUID: efKbBz3wJgJOUR5nyV5_H7I7TtqlfuuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDEzOCBTYWx0ZWRfX3nTQ30kF3F9B
 uAlSlvbdSGAaV5yZf/lm9WlDgNzCdgpDsmpJX9K+wl2/27K/oE+0UjOSsE+lCj+5j641uX4KJ76
 CQwYLLH8UQtDQbn719uq/sg9DCXpuzQgi5agdK9po2V99vaTjNZ4UB5CATzFBWR1mJCiu2lkWQF
 Qxngw1gkrh0MDxKz7mLFvcjpilOjEdrSy/GdwId3/steCwuePjSgUyaQSks8vCNAiG/oM0D6bZ9
 nGBVF+SId7G9LHcXr5OtxjyBRoQOOrzej9uWK/Mnl96JP64B3SkSAG9zckhaBIdg74DVbstbmTi
 sgb/qbRowOL+aPMDcHvRq+CzQLDRDWEMGNQ80xL/2cAjJZuC8cuwYcky4ZA5OWAMW6kdsk0H8W7
 jzI6AnYmR3//bou5cIjKT+VXprprUnSKwrwiGxvfNF8rFkv3Ir+mOwQ8MoZ1T9YrOEVm5Y8XqRN
 Lki5/19zyPwscx0xGbbOcW/bbPWrNbUX0e0ozu4E=

Please disregard - v3 coming soon

On Tue, Dec 02, 2025 at 03:54:39PM -0500, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dists/debian/changelog                        | 1186 +++++++++++++++++
>  dists/debian/control                          |   74 +
>  dists/debian/copyright                        |  103 ++
>  dists/debian/dtrace-tests.install             |    1 +
>  dists/debian/dtrace-tests.lintian-overrides   |    8 +
>  dists/debian/dtrace.docs                      |    1 +
>  dists/debian/dtrace.install                   |    1 +
>  dists/debian/dtrace.lintian-overrides         |    1 +
>  dists/debian/dtrace.manpages                  |    1 +
>  dists/debian/libdtrace2-dev.install           |    5 +
>  dists/debian/libdtrace2.install               |   12 +
>  dists/debian/libdtrace2.lintian-overrides     |    4 +
>  dists/debian/libdtrace2.manpages              |    1 +
>  dists/debian/mkChangelog                      |  152 +++
>  dists/debian/patches/debian-configure.patch   |   17 +
>  .../patches/debian-interpreter-paths.patch    |  107 ++
>  dists/debian/patches/series                   |    3 +
>  dists/debian/rules                            |   22 +
>  dists/debian/source/format                    |    1 +
>  19 files changed, 1700 insertions(+)
>  create mode 100644 dists/debian/changelog
>  create mode 100644 dists/debian/control
>  create mode 100644 dists/debian/copyright
>  create mode 100644 dists/debian/dtrace-tests.install
>  create mode 100644 dists/debian/dtrace-tests.lintian-overrides
>  create mode 100644 dists/debian/dtrace.docs
>  create mode 100644 dists/debian/dtrace.install
>  create mode 100644 dists/debian/dtrace.lintian-overrides
>  create mode 100644 dists/debian/dtrace.manpages
>  create mode 100644 dists/debian/libdtrace2-dev.install
>  create mode 100644 dists/debian/libdtrace2.install
>  create mode 100644 dists/debian/libdtrace2.lintian-overrides
>  create mode 100644 dists/debian/libdtrace2.manpages
>  create mode 100755 dists/debian/mkChangelog
>  create mode 100644 dists/debian/patches/debian-configure.patch
>  create mode 100644 dists/debian/patches/debian-interpreter-paths.patch
>  create mode 100644 dists/debian/patches/series
>  create mode 100755 dists/debian/rules
>  create mode 100644 dists/debian/source/format
> 
> diff --git a/dists/debian/changelog b/dists/debian/changelog
> new file mode 100644
> index 00000000..82e4dcce
> --- /dev/null
> +++ b/dists/debian/changelog
> @@ -0,0 +1,1186 @@
> +dtrace (2.0.4-1) UNRELEASED; urgency=medium
> +
> +  [ Nick Alcock ]
> +  * Various testsuite fixes and improvements.
> +
> +  [ Kris Van Hees ]
> +  * Allow [u]stack() to be used as a variable value.
> +  * Comments using // are now supported.
> +  * Scalability improvements.
> +  * Error injection via return() action.
> +  * Improved string handling.
> +  * Various bug fixes.
> +
> +  [ Alan Maguire ]
> +  * TCP, UDP, and stapsdt providers implemented.
> +
> +  [ Eugene Loh ]
> +  * New learning materials: the User's Guide in Markdown format, example
> +    scripts, and a context file for LLMs. (Eugene Loh, Bruce McCulloch, Ruud
> +    van der Pas, Elena Zannoni).
> +  * Fix dyn vars overwriting one another.
> +  * Fix regression: list fbt probes by default.
> +  * Add test for preprocessor definitions.
> +  * Fix some stack tests.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 24 Oct 2025 00:00:00 +0000
> +
> +dtrace (2.0.3-1) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Offset probes in pid provider.
> +
> +  [ Nick Alcock ]
> +  * Various bug fixes.
> +  * Various testsuite fixes and improvements.
> +
> +  [ Kris Van Hees ]
> +  * This is only released on OL10.
> +  * Redesigned USDT support to work for LTO compilations.
> +  * New builtin variable: execargs.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Tue, 10 Jun 2025 00:00:00 +0000
> +
> +dtrace (2.0.2-1) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Support to discover and trace USDT probes after a tracing session has
> +    started.
> +
> +  [ Nick Alcock ]
> +  * USDT probe argument support (translated types, mapping).
> +  * Installation locations are now configurable.
> +  * Valgrind is no longer a required build dependency.
> +  * Self-grabs have been improved.
> +  * Various bug fixes.
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> +  [ Alan Maguire ]
> +  * The print() action is augmented with type information.
> +
> +  [ Kris Van Hees ]
> +  * Translators to support kernels 6.10 and later.
> +  * FBT return probe argument support.
> +  * New provider: rawfbt.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Mon, 11 Nov 2024 00:00:00 +0000
> +
> +dtrace (2.0.1-1) UNRELEASED; urgency=medium
> +
> +  * Implement FBT probes with fentry/fexit tracepoints
> +  * Provide argument info for FBT probes.
> +  * Provide pre-generated translator files sets.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Mon, 6 May 2024 00:00:00 +0000
> +
> +dtrace (2.0.0-1.14) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement provider: io.
> +  * Implement subroutines: link_ntop(), cleanpath().
> +  * Implement options: -xcpu, -xaggpercpu.
> +  * Improve options: -xlockmem (improve default).
> +  * Add support for aggregations of stacks.
> +
> +  [ Nick Alcock ]
> +  * Ensure USDT probes can survive dtprobed restarts.
> +  * Improve USDT probe creation/deletion.
> +  * Improve support for DTrace with upstream kernels.
> +  * Improve lexer parsing (top-level wildcard ambiguities and `numerals).
> +  * Fix END probe execution with multiple tracers.
> +  * Buffer overrun fix for systems with non-sequential online CPU ids.
> +  * Various bug fixes.
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> +  [ Alan Maguire ]
> +  * Implement actions: print().
> +
> +  [ Kris Van Hees ]
> +  * Improve providers: pid (offset-based probes) and rawtp (arg info).
> +  * Improve support for compiling DTrace in older environments.
> +  * Preemptive BPF program execution for DTrace probes is not allowed.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Tue, 5 Mar 2024 00:00:00 +0000
> +
> +dtrace (2.0.0-1.13.2) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement subroutines: inet_ntop().
> +
> +  [ Nick Alcock ]
> +  * Remove dependency on waitfd().
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> +  [ Kris Van Hees ]
> +  * Support using DTrace with upstream kernels.
> +  * Implement provider: ip.
> +  * Implement actions: trunc(), pcap().
> +  * Implement subroutines: inet_ntoa6().
> +  * Support modules.builtin.ranges for builtin module-symbol association.
> +  * Provide a BTF-to-CTF convertor to provide (limited) kernel type information
> +    when CTF is not available.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Thu, 9 Nov 2023 00:00:00 +0000
> +
> +dtrace (2.0.0-1.13.1) UNRELEASED; urgency=medium
> +
> +  * Restart dtprobed when upgrading DTrace.
> +  * Report and clean up orphaned tracing events after each test.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Wed, 7 Jun 2023 00:00:00 +0000
> +
> +dtrace (2.0.0-1.13) UNRELEASED; urgency=medium
> +
> +  [ Steven Sistare ]
> +  * Do not modify input files with dtrace -G if unchanged.
> +
> +  [ Eugene Loh ]
> +  * Support NULL strings.
> +  * Support uregs[] on older kernels.
> +
> +  [ Nick Alcock ]
> +  * Full support for is-enabled USDT probes.
> +  * New option: lonknommap.
> +  * Support for USDT probes in programs in different fs namespaces.
> +  * Support for USDT probes in non-PIE executables.
> +  * Fix dtprobed to support DOF that exceeds 64KiB.
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> +  [ Kris Van Hees ]
> +  * Report error on programs that exceed aggsize or dynvarsize.
> +  * Support for drop counters for principal, speculation, and aggregation
> +    buffers and for dynamic variables.
> +  * Implement probe: proc:::signal-clear.
> +  * Implement provider: sched (partial implementation).
> +  * Implement provider: lockstat (for kernels >= 5.10.0 and UEK6 with fix).
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 26 May 2023 00:00:00 +0000
> +
> +dtrace (2.0.0-1.12) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Fix evaluation order of bcopy() arguments and lift non-alloca restriction
> +    on the source address.
> +  * Implement actions: clear(), tracemem().
> +  * Implement subroutines: copyout(), copyinstr().
> +  * Implement provider: cpc.
> +  * Implement built-in variable: uregs.
> +  * Support using indirect load instructions for pointers to alloca()'d and
> +    DTrace managed memory.
> +  * Fix arg0 and arg1 for profile-* and tick-* probes.
> +  * Implement runtime bounds checking for scalar array access.
> +  * Support arbitrary address pointers for basename(), dirname(), strchr(),
> +    strrchr(), and inet_ntoa().
> +  * Add runtime bounds checking for scalar array access.
> +
> +  [ Kris Van Hees ]
> +  * Implement options: switchrate, aggrate.
> +  * Implement provider: proc.
> +  * Increase strtab maximum size.
> +  * Updated manpage and moved to dtrace.8.
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Mon, 27 Feb 2023 00:00:00 +0000
> +
> +dtrace (2.0.0-1.11.1) UNRELEASED; urgency=medium
> +
> +  * Support both libfuse 2 and libfuse 3.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Tue, 08 Nov 2022 00:00:00 +0000
> +
> +dtrace (2.0.0-1.11) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Add support for aggregation keys.
> +  * Fix arg handling for various probes.
> +  * Add -xlockmem, with useful error message.
> +  * Fix various bugs with typecasting and internal integer storage.
> +  * Unused dual aggregation copies (DT_AGG_NUM_COPIES) have been removed.
> +
> +  [ Nick Alcock ]
> +  * Add initial support for USDT.
> +  * Fix handling of multiple args after --.
> +  * Fix libproc search of rtld_global due to glibc changes.
> +
> +  [ Kris Van Hees ]
> +  * Add support for copyin(), copyinto(), and copyinstr().
> +  * Add support for built-in variable args[] and sdt probe arg types.
> +  * Add basic support for setopt().
> +  * Fix -xverbose, -xcpp, and -xctfpath
> +  * Have the pid provider ignore compiler-generated internal function names.
> +  * Fix access to scalars in kernel space.
> +  * Truly decouple per-CPU BPF agg maps with a "map of maps."
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 28 Oct 2022 00:00:00 +0000
> +
> +dtrace (2.0.0-1.10) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Add support for inet_ntoa(), progenyof(), getmajor(), getminor(),
> +    mutex_owned(), mutex_owner(), mutex_type_adaptive(), mutex_type_spin(),
> +    rw_read_held(), rw_write_held(), and rw_iswriter().
> +
> +  [ Nick Alcock ]
> +  * Add support for allcoa() and bcopy().
> +  * Improved fault handling.
> +
> +  [ Kris Van Hees ]
> +  * Add support for associative arrays.
> +  * Various disassembler improvements, esp. annotations.
> +  * Strings are no longer stored using a length prefix.
> +  * The trace() action now supports arrays, structs, and unions.
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Tue, 26 Apr 2022 00:00:00 +0000
> +
> +dtrace (2.0.0-1.9.1) UNRELEASED; urgency=medium
> +
> +  * Add support for UEK7.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Mon, 31 Jan 2022 00:00:00 +0000
> +
> +dtrace (2.0.0-1.9) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Add support for strtok().
> +  * Add support for basename(), dirname().
> +  * Add support for ftruncate().
> +  * Add support for rand().
> +  * Various string handling fixes and improvements.
> +
> +  [ Nick Alcock ]
> +  * Generic hash table improvements and consistent use of htabs.
> +  * CTF improvements in view of better kernel support.
> +
> +  [ Kris Van Hees ]
> +  * Implement TLS (thread-local storage) variables.
> +  * Fix string constant handling for strings longer than strsize.
> +  * Optimization of substr(), strjoin(), and storing strings in the trace
> +    buffer.
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Wed, 08 Dec 2021 00:00:00 +0000
> +
> +dtrace (2.0.0-1.8) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Add support for string comparison.
> +  * Add support for strchr(), strrchr(), index(), rindex(), strstr(),
> +    lltostr().
> +  * Add support for htonl, htonll, htons, ntohl, ntohll, ntohs.
> +
> +  [ Nick Alcock ]
> +  * Support running dtrace under valgrind.
> +  * Implementation of speculative tracing.
> +  * Add support for symbols in compressed kernel modules.
> +
> +  [ Kris Van Hees ]
> +  * Various testsuite fixes and improvements.
> +  * Various code improvements.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 15 Oct 2021 00:00:00 +0000
> +
> +dtrace (2.0.0-1.7) UNRELEASED; urgency=medium
> +
> +  * Implement argument retrieval for SDT probes.
> +  * Introduce 'bpflog' runtime option to request BPF verifier log.
> +  * Implementation improvements for memry copy operations.
> +  * Fix type alignment handling for enums.
> +  * Fix ERROR-in-BEGIN probe handling.
> +  * Transition from variable-length string size to 2-byte string size.
> +  * Fix size of string data in the trace output buffer.
> +  * Fix data size for value copy.
> +  * Add support for strjoin() subroutine.
> +  * Add support for substr() subroutine.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Thu, 9 Sep 2021 00:00:00 +0000
> +
> +dtrace (2.0.0-1.6) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement built-in variables: caller, stackdepth, ucaller, ustackdepth,
> +    errno, walltimestamp.
> +  * Implement actions: stack(), ustack().
> +  * Implement option: -Z (partial).
> +  * Mark aggregation actions as non-data recording actions.
> +  * Testsuite improvements.
> +
> +  [ Kris Van Hees ]
> +  * Consolidated development of newly ported features.
> +  * Implement built-in variables: probeprov, probemod, probefunc, probename.
> +  * Implement subroutine: strlen().
> +  * Added support for string constants and string values.
> +  * Added support for strings to trace().
> +  * Fixed storage size determination for global and local variables.
> +  * Improved storage layout for global and local variables.
> +  * Load string constant table into the 'strtab' BPF map.
> +  * Load probe description data into the 'probes' BPF map.
> +  * Consolidate all string hash functions into a single hash function.
> +  * Implement variable length integer support.
> +  * Store the length of each string as a variable length integer inline with
> +    its character stream.
> +  * Improve memcpy() internal BPF function.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 18 Jun 2021 00:00:00 +0000
> +
> +dtrace (2.0.0-1.5.1) UNRELEASED; urgency=medium
> +
> +  * Memory corruption fix in pid probe discovery.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Mon, 12 Apr 2021 00:00:00 +0000
> +
> +dtrace (2.0.0-1.5) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Reworking of global and local variable storage to allow for values sizes
> +    beyond 8 bytes.
> +  * Implement -xbpflogsize option.
> +  * Improvements to -xdisasm support.
> +  * Fix bitfield operations.
> +  * Coding style updates.
> +
> +  [ David McLean ]
> +  * Sample scripts for building DTrace on Ubuntu.
> +
> +  [ Nick Alcock ]
> +  * Add support in translators for more than two kernel variants.
> +
> +  [ Kris Van Hees ]
> +  * Implement the ERROR probe.
> +  * Add checks in BPF programs for division by zero and NULL pointer
> +    dereference.
> +  * Implement the pid provider for userspace function boundary tracing.
> +  * Implement the -w option to explicitly allow destructive actions.
> +  * Switch from condition variable to eventfd for process death notifications.
> +  * Implement normalize() and denormalize() actions.
> +  * Reworking of kernel tracepoint based providers.
> +  * Testsuite updates.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 9 Apr 2021 00:00:00 +0000
> +
> +dtrace (2.0.0-1.4) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement aggregation functions: avg(), llquantize(), quantize().
> +  * Fix bitwise negation.
> +  * Fix reporting when all quantize() data is in the last bin.
> +  * Load pre-compiled BPF functions even if they do not have relocations.
> +
> +  [ David McLean ]
> +  * Implement aggregation functions: max(), min(), stddev(), sum().
> +
> +  [ Kris Van Hees ]
> +  * Implement aggregation support code for both producer and consumer.
> +  * Implement aggregation functions: count(), lquantize().
> +  * Implement the printa() action.
> +  * Rework BPF code generation to use emit*() macros.
> +  * Testsuite updates.
> +  * Fix END probe execution when consumer stops the producer.
> +  * Force use of bash as shell.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Wed, 9 Dec 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-1.3) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement the freopen() action.
> +  * Implement the system() action.
> +  * Implement the ppid built-in variable.
> +  * Correct signed divide and modulo operations.
> +  * Correct code generation for post-decrement expressions.
> +
> +  [ David McLean ]
> +  * Implement the id built-in variable.
> +
> +  [ Kris Van Hees ]
> +  * Improve annotations in the disassembler.
> +  * Implement proper BEGIN and END probe semantics.
> +  * Correct exit() action semantics.
> +  * Various compilation fixes.
> +  * Better support for different distributions and compiler versions.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Thu, 1 Oct 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-1.2) UNRELEASED; urgency=medium
> +
> +  * Ensure a minimum locked-memory limit for BPF.
> +  * int8_t is now always signed, even on platforms where char is unsigned.
> +
> + -- Eugene Loh <eugene.loh@oracle.com>  Thu, 6 Aug 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-1.1) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement profile-n and tick-n probes.
> +
> +  [ Kris Van Hees ]
> +  * Implement the printf() action.
> +  * Implement the raise() action.
> +  * Support probe specifications with wildcards.
> +  * Support multiple clauses for each probe.
> +  * Support built-in variables: arg0 through arg9 (for probes that provide
> +    arguments), curcpu curthread, epid, gid, pid, tid, uid, and timestamp.
> +  * Various memory management fixes.
> +  * Register leak fixes.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Fri, 24 Jul 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-1.0) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Implement BEGIN and END probes.
> +  * Implement a probe cleanup mechanism for providers.
> +
> +  [ Kris Van Hees ]
> +  * Implement the exit() action.
> +  * Implement the flowindent option.
> +  * Implement the -xdisasm=n option.
> +  * Implement linking of precompiled BPF functions.
> +  * Fix memory leaks and minor uninitialized-data bugs.
> +  * Fix load-before-store BPF verifier errors for local variables.
> +  * Fix post-increment code generation.
> +  * Fix register clobbering and implement register spilling.
> +  * Add error and drop tag verification for tests.
> +  * Various code cleanup and errata release preparation.
> +  * Ensure that bpf_dlib.o is installed.
> +  * Fix the creation of FBT return probes.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Thu, 30 Apr 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-0.8) UNRELEASED; urgency=medium
> +
> +  * Sync with latest development code.
> +  * Implement perf event output buffer management and processing.
> +  * Introduce dt_calloc() to use in all array allocations.
> +  * Provide support for building against libdtrace-ctf and libctf, with
> +    preference given to libctf (if available).
> +  * Implement association of BPF programs with probe events.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Tue, 10 Mar 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-0.7) UNRELEASED; urgency=medium
> +
> +  * Update spec file for build requirements.
> +  * Sync with latest development code.
> +  * Ensure that pre-release banner does not interfere with test result
> +    comparison.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Sun, 26 Jan 2020 00:00:00 +0000
> +
> +dtrace (2.0.0-0.6) UNRELEASED; urgency=medium
> +
> +  * Update spec file for build requirements.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Thu, 5 Dec 2019 00:00:00 +0000
> +
> +dtrace (2.0.0-0.5) UNRELEASED; urgency=medium
> +
> +  * Support building on aarch64.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Thu, 5 Dec 2019 00:00:00 +0000
> +
> +dtrace (2.0.0-0.4) UNRELEASED; urgency=medium
> +
> +  * Support building on systems with older kernels and/or glibc.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Wed, 4 Dec 2019 00:00:00 +0000
> +
> +dtrace (2.0.0-0.3) UNRELEASED; urgency=medium
> +
> +  * Change the kernel build version to 5.4.0-1948.2.
> +
> + -- Kris Van Hees <kris.van.hees@oracle.com>  Tue, 26 Nov 2019 00:00:00 +0000
> +
> +dtrace (2.0.0-0.2) UNRELEASED; urgency=medium
> +
> +  * Change the kernel build version to 5.2.8-1933.
> +
> + -- Kris van Hees <kris.van.hees@oracle.com>  Wed, 14 Aug 2019 00:00:00 +0000
> +
> +dtrace (2.0.0-0.1) UNRELEASED; urgency=medium
> +
> +  * DTrace implementation based on BPF (initial portions).
> +
> + -- Kris van Hees <kris.van.hees@oracle.com>  Tue, 30 Jul 2019 00:00:00 +0000
> +
> +dtrace (1.1.0-0.1) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Speed up aggmod tests
> +  * Improve testsuite temporary file creation
> +  * Clean up compiler warnings
> +
> +  [ Kris Van Hees ]
> +  * Add test for SDT argument retrieval from stack, in UEK4QU7
> +
> +  [ Tomas Jedlicka ]
> +  * Add more DTRACE_PROBE definitions to sdt.h, for SystemTap compatibility,
> +    and test them
> +  * Fix disassembler coredump
> +  * Fix process-termination-related crash and deadlock bugs
> +  * New ctfpath option, allowing explicit specification of ctf archives to use
> +    for the running kernel
> +  * Remove preallocation from the buffering testsuite
> +
> +  [ Nick Alcock ]
> +  * Fix deadlock on creation of new threads in -c/-p processes
> +  * Properly handle breakpoints tripped while DTrace is exiting
> +  * Do not crash on self-grabs and on races with dtrace termination
> +  * Fix memory leaks and minor uninitialized-data bugs
> +  * Include the smoketests in make check
> +  * Test fixes (boost timeouts, kernel 4.17 compatibility, unskip a forgotten
> +    test).
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 10 Aug 2018 00:00:00 +0000
> +
> +dtrace (1.0.2-1) UNRELEASED; urgency=medium
> +
> +  * Testsuite fixes
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 10 May 2018 00:00:00 +0000
> +
> +dtrace (1.0.1-1) UNRELEASED; urgency=medium
> +
> +  [ Kris Van Hees ]
> +  * ARM64 USDT and pid probe support
> +  * Fix -c option on ARM64
> +
> +  [ Nick Alcock ]
> +  * Disable pid provider tests on UEK4.
> +  * Testsuite fixes
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 27 Apr 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-10) UNRELEASED; urgency=medium
> +
> +  * Enabled tst.default.d in smoketests.
> +
> + -- Tomas Jedlicka <tomas.jedlicka@oracle.com>  Thu, 29 Mar 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-9) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Adjusted the interpretation of /proc/kallmodsyms for aarch64
> +
> +  [ Kris Van Hees ]
> +  * Added pid provider support
> +
> +  [ Tomas Jedlicka ]
> +  * Updated translators to match new kernel redesign of per-task and
> +    per-process data.
> +  * Enhanced build system to support multiple kernels
> +
> + -- Tomas Jedlicka <tomas.jedlicka@oracle.com>  Tue, 27 Mar 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-8) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Improve handling of symbol name->address and address->name lookup
> +
> +  [ Tomas Jedlicka ]
> +  * Fix dtrace -S not printing actions other than the first
> +
> +  [ Nick Alcock ]
> +  * Change dtrace_proc_*() public interfaces to take a struct dtrace_proc,
> +    avoiding lifecycle issues that can cause access to freed memory when
> +    victims are exec()ing rapidly
> +  * Bump library soname to libdtrace.so.1
> +  * Check array bounds at compile time
> +  * Drop expensive, unnecessary bad page state checking from testsuite
> +  * Handle interruptions in the testsuite runner better
> +  * Consider erratically failing tests in some directories to be passes
> +  * Test fixes
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 8 Mar 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-7) UNRELEASED; urgency=medium
> +
> +  [ Kris Van Hees ]
> +  * Several latent porting bugs fixed
> +  * Make tests used in smoke testsuite rely on sdt less
> +
> +  [ Nick Alcock ]
> +  * Internal development release.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 16 Feb 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-6) UNRELEASED; urgency=medium
> +
> +  [ Tomas Jedlicka ]
> +  * Include correct procfs.h
> +
> +  [ Nick Alcock ]
> +  * Internal development release.
> +  * ARM64 support
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 30 Jan 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-5) UNRELEASED; urgency=medium
> +
> +  * Internal development release.
> +  * Bring back translators for 4.14.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 18 Jan 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-4) UNRELEASED; urgency=medium
> +
> +  * Internal development release.
> +  * Eliminate new symbol at address 0 on KPTI-enabled kernels
> +  * Boost some test timeouts
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 12 Jan 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-3) UNRELEASED; urgency=medium
> +
> +  [ Kris Van Hees ]
> +  * New tests and test fixes
> +
> +  [ Nick Alcock ]
> +  * Internal development release.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 5 Jan 2018 00:00:00 +0000
> +
> +dtrace (1.0.0-2) UNRELEASED; urgency=medium
> +
> +  * Internal development release.
> +  * Fix rare assertion failures at exit
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 15 Dec 2017 00:00:00 +0000
> +
> +dtrace (1.0.0-1) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Fix kills of hanging dtraces in the testsuite
> +  * New tests for the lockstat provider and fixes to jstack and 3-arg tracemem
> +    tests
> +
> +  [ Vincent Lim ]
> +  * Add tagging capability to the testsuite
> +
> +  [ Nicolas Droux ]
> +  * ip provider ipv6_tclass and ipv6_flow are not set correctly
> +  * Translator changes for kernels 4.12 -- 4.14
> +
> +  [ Tomas Jedlicka ]
> +  * Fix mod() normalization: add test for it
> +  * Fix faulty logic in dtrace_modsym_update() adding symbols to wrong modules
> +
> +  [ Nick Alcock ]
> +  * Release for smoketesters, not GA
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 30 Nov 2017 00:00:00 +0000
> +
> +dtrace (0.6.2-3) UNRELEASED; urgency=medium
> +
> +  * Apply correct version of lockstat patch
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Mon, 16 Oct 2017 00:00:00 +0000
> +
> +dtrace (0.6.2-2) UNRELEASED; urgency=medium
> +
> +  [ Alan Maguire ]
> +  * Add lockstat provider
> +
> +  [ Tomas Jedlicka ]
> +  * Add missing obsolete of dtrace-modules-provider-headers
> +  * Add missing testsuite NFS dependency
> +
> +  [ Nick Alcock ]
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Mon, 16 Oct 2017 00:00:00 +0000
> +
> +dtrace (0.6.2-1) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * New llquantize() aggregation, providing log/linear results
> +  * New optional third arg for tracemem(): dynamically-variable size limit
> +  * Fix wrong wrong-number-of-args error messages
> +  * Fix module address range merging
> +  * Testsuite fixes and new tests for inet_*() and lquantize
> +
> +  [ Nick Alcock ]
> +  * Internal development release.
> +  * Fix segfault at shutdown time if grabbed processes die at precisely the
> +    wrong time
> +  * Allow referencing of structure and union members named with the same name
> +    as D keywords, e.g. 'self'
> +  * Changes for the move of UAPI headers into dtrace-utils-devel. (Tomas
> +    Jedlicka, Nick Alcock).
> +  * Support CTF in /lib/modules/$(uname -r)/kernel/vmlinux.ctfa archive
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 21 Sep 2017 00:00:00 +0000
> +
> +dtrace (0.6.1-3) UNRELEASED; urgency=medium
> +
> +  [ Tomas Jedlicka ]
> +  * Test fixes
> +
> +  [ Nick Alcock ]
> +  * Relicense all of userspace, including the testsuite, to UPL.
> +  * Merge NEWS from the modules into NEWS for userspace: there is only one NEWS
> +    now.
> +  * make check-quick support, skipping long-running tests
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 13 Sep 2017 00:00:00 +0000
> +
> +dtrace (0.6.1-2) UNRELEASED; urgency=medium
> +
> +  [ Eugene Loh ]
> +  * Fix name of lowest bucket in dtrace_print_lquantize()
> +  * Fix wrong depth in dtrace_print_ustack() leading to garbage output from
> +    jstack()
> +
> +  [ Nick Alcock ]
> +  * Search for cpp and ld along the PATH, fixing use of dtrace -C with
> +    devtoolset-6 and other non-default GCCs
> +  * dtrace-utils-devel now depends on elfutils-libelf-devel.
> +  * dtrace-utils-testsuite now depends on dtrace-devel.
> +
> +  [ Nicolas Droux ]
> +  * Fix spurious errors and misreading of unaligned data on SPARC, breaking
> +    ustack() etc with upgraded glibc (Nick Alcock) - Translator changes for the
> +    IO provider for NFS
> +
> +  [ Tomas Jedlicka ]
> +  * Internal development release
> +  * Do not build DTrace with debug info by default
> +  * Test fixes, test harness extensions (consumer tests) and new tests.
> +
> + -- Tomas Jedlicka <tomas.jedlicka@oracle.com>  Fri, 14 Jul 2017 00:00:00 +0000
> +
> +dtrace (0.6.1-1) UNRELEASED; urgency=medium
> +
> +  [ Girish Moodalbail ]
> +  * Add link_ntop() and tests for it
> +
> +  [ Kris Van Hees ]
> +  * Repeated dtrace -G no longer corrupts the object file
> +
> +  [ Alan Maguire ]
> +  * Add translators and tests for TCP and UDP
> +
> +  [ Nicolas Droux ]
> +  * Add translators for the IO provider
> +  * Ship a default /etc/dtrace-modules
> +
> +  [ Nick Alcock ]
> +  * sched.d no longer depends on the sched provider
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 25 May 2017 00:00:00 +0000
> +
> +dtrace (0.6.0-3) UNRELEASED; urgency=medium
> +
> +  * Test fixes
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 21 Mar 2017 00:00:00 +0000
> +
> +dtrace (0.6.0-2) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * Add translator for ip provider
> +  * Test fixes and new tests.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 3 Mar 2017 00:00:00 +0000
> +
> +dtrace (0.6.0-1) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * Allow self-grabs
> +  * Use /proc/pid/map_files if available
> +  * Fix fd leaks on big-endian systems and during heavy exec()
> +  * Add improved multi-argument DTRACE_PROBE macro
> +  * Fix infloops in SPARC breakpoint handling
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 17 Jan 2017 00:00:00 +0000
> +
> +dtrace (0.5.4-1) UNRELEASED; urgency=medium
> +
> +  * Work around elfutils bug causing object file corruption
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 8 Nov 2016 00:00:00 +0000
> +
> +dtrace (0.5.3-2) UNRELEASED; urgency=medium
> +
> +  * New tests
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 20 Jul 2016 00:00:00 +0000
> +
> +dtrace (0.5.3-1) UNRELEASED; urgency=medium
> +
> +  * Prevent intermittent assertion failures crashes and hangs when shutdown
> +    races with termination of a grabbed process
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 28 Apr 2016 00:00:00 +0000
> +
> +dtrace (0.5.2-2) UNRELEASED; urgency=medium
> +
> +  * Fix uregs array on SPARC
> +  * Testsuite fixes
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 5 Feb 2016 00:00:00 +0000
> +
> +dtrace (0.5.2-1) UNRELEASED; urgency=medium
> +
> +  * Do not crash USDT probe users when shared libraries are in the upper half
> +    of the address space
> +  * Do not waste CPU time busywaiting in a do-nothing ioctl()-heavy loop
> +  * Testsuite triggers are synchronized with dtrace by default
> +  * Fix dtrace -c and -p on SPARC and improve error-handling paths
> +  * Fix smoketests on SPARC
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 12 Jan 2016 00:00:00 +0000
> +
> +dtrace (0.5.1-4) UNRELEASED; urgency=medium
> +
> +  * Internal development release.
> +  * Prevent testsuite hangs when per-arch options are in use
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 8 Dec 2015 00:00:00 +0000
> +
> +dtrace (0.5.1-3) UNRELEASED; urgency=medium
> +
> +  * Fix buggy performance improvements to correctly detect out-of-tree modules
> +    (like dtrace.ko) and speed them up some more
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 19 Nov 2015 00:00:00 +0000
> +
> +dtrace (0.5.1-2) UNRELEASED; urgency=medium
> +
> +  * Internal development release.
> +  * Remove typoed non-bug from rpm changelog.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 18 Nov 2015 00:00:00 +0000
> +
> +dtrace (0.5.1-1) UNRELEASED; urgency=medium
> +
> +  * Internal development release.
> +  * Improve startup performance when disk cache is cold
> +  * Fix various problems in the testsuite and in DTRACE_DEBUG output
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 18 Nov 2015 00:00:00 +0000
> +
> +dtrace (0.5.0-4) UNRELEASED; urgency=medium
> +
> +  * Improve identification of system daemons that must not be ptraced unless
> +    explicitly specified
> +  * Improve symbol resolution in the absence of ptrace()
> +  * Fix dtrace -p with an invalid PID
> +  * Close any inherited fds before running testsuite
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 4 Nov 2015 00:00:00 +0000
> +
> +dtrace (0.5.0-3) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * No longer reference UEK3 kernels on SPARC.
> +  * Do not require 32-bit glibc on SPARC.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 23 Sep 2015 00:00:00 +0000
> +
> +dtrace (0.5.0-2) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * No longer Provide: an unversioned dtrace-utils
> +  * Add missing testsuite package deps
> +  * Fix check-module-loading testsuite target
> +  * Test logfiles should not be affected by the verbosity of the test run
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 9 Sep 2015 00:00:00 +0000
> +
> +dtrace (0.5.0-1) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * SPARC64 support.
> +  * Translator support for 4.1 kernel.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 12 Aug 2015 00:00:00 +0000
> +
> +dtrace (0.4.6-4) UNRELEASED; urgency=medium
> +
> +  [ not distributed ]
> +  * Add source-tree-independent testsuite RPM
> +
> +  [ Nick Alcock ]
> +  * Add DTrace release and SCM version info via dtrace -Vv
> +  * Fix the testsuite module-loading pre-checks to actually work
> +  * Various build system fixes
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 30 Jun 2015 00:00:00 +0000
> +
> +dtrace (0.4.6-3) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * Fix deadlocks and failures to latch processes for symbol lookup caused by
> +    failure to correctly track their state over time, in 0.4.6-1+ only.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 23 Jun 2015 00:00:00 +0000
> +
> +dtrace (0.4.6-2) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * Fix a rare race causing stalls of fork()ed children of traced processes
> +    under load, in 0.4.6-1 only
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Mon, 22 Jun 2015 00:00:00 +0000
> +
> +dtrace (0.4.6-1) UNRELEASED; urgency=medium
> +
> +  * Internal development release
> +  * Support multiple kernels with a single userspace tree, loading system D
> +    libraries from directories named like /usr/lib64/dtrace/3.8.
> +  * Processes being userspace-traced can now receive SIGTRAP.
> +  * dtrace-utils-devel now depends on the same version of dtrace-utils.
> +  * No longer lose track of processes that exec() while their dynamic linker
> +    state is being inspected.
> +  * No longer assume that the symbol table of processes that are no longer
> +    being monitored is unchanged since it was last inspected.
> +  * Properly remove breakpoints from fork()ed children.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 18 Jun 2015 00:00:00 +0000
> +
> +dtrace (0.4.5-3) UNRELEASED; urgency=medium
> +
> +  * The dependencies are adjusted to pick up the renamed dtrace headers
> +    package.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Mon, 16 Feb 2015 00:00:00 +0000
> +
> +dtrace (0.4.5-2) UNRELEASED; urgency=medium
> +
> +  * A number of crashes when out of memory are fixed.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 18 Nov 2014 00:00:00 +0000
> +
> +dtrace (0.4.5-1) UNRELEASED; urgency=medium
> +
> +  [ Kris Van Hees ]
> +  * Fix some broken tests
> +
> +  [ Nick Alcock ]
> +  * Automatically load provider modules from /etc/dtrace-modules, if present
> +  * Fix intermittent crash on failure of initial grabs or creations of
> +    processes via dtrace -c, -p, or u*() functions
> +  * Reliably track and compensate for processes undergoing execve()s
> +  * Handle processes hit by stopping signals correctly
> +  * Fix a sign-extension bug in breakpoint instruction poking
> +  * Robustify DTrace against changes to glibc's internal data structures
> +  * Fix DIF subr names in dtrace -S output
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 23 Oct 2014 00:00:00 +0000
> +
> +dtrace (0.4.4-2) UNRELEASED; urgency=medium
> +
> +  [ Kris Van Hees ]
> +  * Ensure that the DOF ELF object does not require execstack
> +
> +  [ Nick Alcock ]
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 22 Jul 2014 00:00:00 +0000
> +
> +dtrace (0.4.4-1) UNRELEASED; urgency=medium
> +
> +  * New -xcppargs option as part of fixes for the testsuite on OL7
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 8 Jul 2014 00:00:00 +0000
> +
> +dtrace (0.4.3-1) UNRELEASED; urgency=medium
> +
> +  * Fix array underrun when no textual mapping for the executable can be found
> +  * Fix unlikely buffer overrun at process-map-read time
> +  * Fix traversal of realloc()ed pointer which could lead to textual mappings
> +    being spuriously missed
> +  * Fix error-path dereference of uninitialized variable in error message
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 13 May 2014 00:00:00 +0000
> +
> +dtrace (0.4.2-2) UNRELEASED; urgency=medium
> +
> +  * Interrupting dtrace with a SIGINT while monitored processes are dying no
> +    longer hangs dtrace on a condition variable
> +  * Symbol lookups on processes that died at the same instant now always fail
> +    and no longer access freed memory
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 1 May 2014 00:00:00 +0000
> +
> +dtrace (0.4.2-1) UNRELEASED; urgency=medium
> +
> +  * killing dtrace while a ustack() is in progress no longer risks killing
> +    crucial system daemons
> +  * Fix a leak of filehandles to executables
> +  * Fix ustack() of multithreaded processes
> +  * Get the pid and ppid right for multithreaded processes
> +  * Fix an uninitialized memory read looking up certain kernel symbols
> +  * Fixes for newer versions of make, ld, and bison
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 16 Apr 2014 00:00:00 +0000
> +
> +dtrace (0.4.1-1) UNRELEASED; urgency=medium
> +
> +  [ Kris van Hees ]
> +  * Install showUSDT in docdir.
> +  * Fix devinfo_t's dev_statname and dev_pathanme for cases where the device
> +    does not have partitions.
> +
> +  [ Nick Alcock ]
> +  * Install ctf_module_dump.
> +  * A lexer bug was fixed causing spurious errors if D scripts contained a
> +    pragma or comment at intervals of 8192 characters, and preventing the use
> +    of scripts >16KiB entirely.
> +  * A variety of memory leaks and uninitialized memory reads are fixed.
> +  * Improve drti.o to minimize overhead when DTrace is not running.
> +  * Emit errors from drti.o on stderr, not stdout.
> +  * Use O_CLOEXEC when opening files in drti.o.
> +  * Fix RPM dependencies; automatically install and modprobe the dtrace modules
> +    as needed.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 7 Jan 2014 00:00:00 +0000
> +
> +dtrace (0.4.0-8) UNRELEASED; urgency=medium
> +
> +  * Fix format of RPM changelog
> +  * Add missing RPM changelog entries
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 16 Oct 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-7) UNRELEASED; urgency=medium
> +
> +  * never released, necessary for release management
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 16 Oct 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-6) UNRELEASED; urgency=medium
> +
> +  [ Kris van Hees ]
> +  * Fix visibility of .SUNW_dof sections in dtrace -G object files.
> +
> +  [ Nick Alcock ]
> +  * Fix typos in changelog and specfile copyright date
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Wed, 16 Oct 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-5) UNRELEASED; urgency=medium
> +
> +  * avoid deadlocking when doing process operations during dtrace -l.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 17 Sep 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-4) UNRELEASED; urgency=medium
> +
> +  * Support for USDT in shared libraries.
> +
> + -- Kris van Hees <kris.van.hees@oracle.com>  Fri, 16 Aug 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-3) UNRELEASED; urgency=medium
> +
> +  * never released, necessary for release management
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 16 Aug 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-2) UNRELEASED; urgency=medium
> +
> +  * never released, necessary for release management
> +
> + -- Kris van Hees <kris.van.hees@oracle.com>  Fri, 16 Aug 2013 00:00:00 +0000
> +
> +dtrace (0.4.0-1) UNRELEASED; urgency=medium
> +
> +  * ustack() support and symbol lookups.
> +  * USDT support. dtrace -G works.
> +  * evaltime option now works.
> +  * DTrace headers largely moved to dtrace-modules-headers.
> +  * DTRACE_OPT_* environment variables now set options. DTRACE_DEBUG=signal
> +    emits debugging output on SIGUSR1 receipt.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 23 Jul 2013 00:00:00 +0000
> +
> +dtrace (0.3.0-1) UNRELEASED; urgency=medium
> +
> +  * CTF support.
> +  * Fixed install path for dtrace libraries.
> +  * Fixed -c and -p options.
> +  * Faster startup.
> +  * Split out a -devel package.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Fri, 31 Aug 2012 00:00:00 +0000
> +
> +dtrace (0.2.5-2) UNRELEASED; urgency=medium
> +
> +  * Call ldconfig at appropriate times.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Mon, 19 Mar 2012 00:00:00 +0000
> +
> +dtrace (0.2.5) UNRELEASED; urgency=medium
> +
> +  * libdtrace is now a shared library, with non-stable API/ABI.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 13 Mar 2012 00:00:00 +0000
> +
> +dtrace (0.2.4) UNRELEASED; urgency=medium
> +
> +  * Updated README; new NEWS and PROBLEMS; synch with module version
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 16 Feb 2012 00:00:00 +0000
> +
> +dtrace (0.2.3) UNRELEASED; urgency=medium
> +
> +  * Fixes for reproducibility of test results under load
> +  * Fix -G when setting the syslibdir
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 9 Feb 2012 00:00:00 +0000
> +
> +dtrace (0.2.2) UNRELEASED; urgency=medium
> +
> +  * Fix spurious failures of tst.resize*.d.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Mon, 6 Feb 2012 00:00:00 +0000
> +
> +dtrace (0.2.1) UNRELEASED; urgency=medium
> +
> +  * Fix 'make check-installed' with an unbuilt source tree.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 31 Jan 2012 00:00:00 +0000
> +
> +dtrace (0.2.0) UNRELEASED; urgency=medium
> +
> +  * Branch for 0.2.0 release.
> +
> + -- Kris van Hees <kris.van.hees@oracle.com>  Thu, 26 Jan 2012 00:00:00 +0000
> +
> +dtrace (0.1-0.3) UNRELEASED; urgency=medium
> +
> +  * The systemtap package in the 'wild' creates a dtrace.1 manpage which is
> +    bizarre since it doesn't have an associated dtrace binary. This will cause
> +    a conflict and the rpm will not install Since that man page is superfluous
> +    I've had to add a %post section here to move our manpage into position in
> +    such a way as to keep the rpm database happy. Technically this is a bit
> +    evil.
> +
> + -- Philip Copeland <philip.copeland@oracle.com>  Fri, 7 Oct 2011 00:00:00 +0000
> +
> +dtrace (0.2) UNRELEASED; urgency=medium
> +
> +  * Fix copyright.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Thu, 06 Oct 2011 00:00:00 +0000
> +
> +dtrace (0.1) UNRELEASED; urgency=medium
> +
> +  * Branch for initial release.
> +
> + -- Nick Alcock <nick.alcock@oracle.com>  Tue, 27 Sep 2011 00:00:00 +0000
> +
> +dtrace (0.0.1) UNRELEASED; urgency=medium
> +
> +  * Initial build for dtrace.
> +
> + -- Pearly Zhao <pearly.zhao@oracle.com>  Mon, 27 Jun 2011 00:00:00 +0000
> +
> diff --git a/dists/debian/control b/dists/debian/control
> new file mode 100644
> index 00000000..42f699cc
> --- /dev/null
> +++ b/dists/debian/control
> @@ -0,0 +1,74 @@
> +Source: dtrace
> +Section: utils
> +Priority: optional
> +Maintainer: Kris Van Hees <kris.van.hees@oracle.com>
> +Build-Depends: debhelper-compat (= 13),
> + bison, flex, gawk, gcc-bpf, binutils-bpf, valgrind, binutils-dev, login.defs,
> + libbpf-dev, libc-dev (>= 2.34), libelf-dev, libfuse3-dev, libpcap-dev,
> + libpfm4-dev, libsystemd-dev, libz-dev
> +Standards-Version: 4.5.1
> +Homepage: https://github.com/oracle/dtrace-utils/
> +Rules-Requires-Root: no
> +
> +Package: dtrace
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends}
> +Description: Dynamic tracing for Linux (DTrace)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> +
> +Package: libdtrace2
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends},
> + fuse3, libctf0, libelf1t64, libfuse3-4, libpcap0.8t64, libpfm4, libz1
> +Description: Dynamic tracing for Linux (DTrace) (library)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> + .
> + This package contains the shared library.
> +
> +Package: libdtrace2-dev
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends},
> + libdtrace2 (= ${binary:Version})
> +Description: Dynamic tracing for Linux (DTrace) (development)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> + .
> + This package contains the development files necessary to develop
> + alternative implementations of the user interface for libdtrace, i.e.
> + replacements for dtrace(1) itself.
> +
> +Package: dtrace-tests
> +Architecture: any
> +Depends: ${misc:Depends}, ${shlibs:Depends},
> + binutils, cpp, gawk, gcc, make, pkgconf, tshark
> +Description: Dynamic tracing for Linux (DTrace) (testsuite)
> + This is the official Linux port of the advanced tracing tool DTrace.
> + .
> + DTrace is a high-level dynamic tracing tool for Linux, built on kernel
> + tracing features (tracepoints, function probes (fentry/fexit), dynamic
> + kernel probes (kprobes), dynamic userspace probes (uprobes), ... and
> + leveraging BPF as execution engine.  It features an integrated compiler
> + for its high-level tracing language and native support for interacting
> + with the BPF engine, significantly reducing runtime dependencies
> + .
> + This package contains the testsuite.
> diff --git a/dists/debian/copyright b/dists/debian/copyright
> new file mode 100644
> index 00000000..eae735c1
> --- /dev/null
> +++ b/dists/debian/copyright
> @@ -0,0 +1,103 @@
> +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> +Upstream-Name: dtrace
> +Upstream-Contact: Kris Van Hees <kris.van.hees@oracle.com>
> +Source: https://github.com/oracle/dtrace-utils/
> +
> +Files: *
> +Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +Files: include/linux/bpf.h
> +Copyright: Copyright (c) 2011-2014 PLUMgrid, http://plumgrid.com
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/linux/btf.h
> +Copyright: Copyright (c) 2018 Facebook
> +License: GPL-2 with Linux-syscall-note exception
> +
> +Files: include/sys/auxv.h include/sys/bitmap.h
> +Copyright: copyright (c) 1984, 1986, 1987, 1988, 1989 at&t
> +License: UPL-1.0
> +
> +Files: include/sys/glibc_internal_link.h
> +Copyright: Copyright disclaimed (all content required for interoperability)
> +License: LGPL-2.1+
> +
> +Files: libproc/libproc.h libproc/Pcontrol.c
> +Copyright: Copyright (c) 2003, 2025, Oracle and/or its affiliates. All rights reserved.
> +License: UPL-1.0
> +
> +License: UPL-1.0
> + The Universal Permissive License (UPL), Version 1.0
> + .
> + Subject to the condition set forth below, permission is hereby granted
> + to any person obtaining a copy of this software, associated
> + documentation and/or data (collectively the "Software"), free of charge
> + and under any and all copyright rights in the Software, and any and all
> + patent rights owned or freely licensable by each licensor hereunder
> + covering either (i) the unmodified Software as contributed to or
> + provided by such licensor, or (ii) the Larger Works (as defined below),
> + to deal in both
> + .
> + (a) the Software, and
> + (b) any piece of software and/or hardware listed in the lrgrwrks.txt
> + file if one is included with the Software (each a ???Larger Work??? to which
> + the Software is contributed by such licensors),
> + .
> + without restriction, including without limitation the rights to copy,
> + create derivative works of, display, perform, and distribute the
> + Software and make, use, sell, offer for sale, import, export, have made,
> + and have sold the Software and the Larger Work(s), and to sublicense the
> + foregoing rights on either these or other terms.
> + .
> + This license is subject to the following condition:
> + The above copyright notice and either this complete permission notice or
> + at a minimum a reference to the UPL must be included in all copies or
> + substantial portions of the Software.
> + .
> + THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> + OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> + LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> + OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> + WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + Licensed under the Universal Permissive License v 1.0 as shown at
> + http://oss.oracle.com/licenses/upl.
> +
> +License: GPL-2 with Linux-syscall-note exception
> + This program is free software; you can redistribute it
> + and/or modify it under the terms of the GNU General Public
> + License version 2 as published by the Free Software Foundation.
> + .
> + On Debian systems, the full text of the GNU General Public
> + License version 2 can be found in the file
> + `/usr/share/common-licenses/GPL-2'.
> + .
> + NOTE! This copyright does *not* cover user programs that use kernel
> + services by normal system calls - this is merely considered normal use
> + of the kernel, and does *not* fall under the heading of "derived work".
> + Also note that the GPL below is copyrighted by the Free Software
> + Foundation, but the instance of code that it refers to (the Linux
> + kernel) is copyrighted by me and others who actually wrote it.
> + .
> + Also note that the only valid version of the GPL as far as the kernel
> + is concerned is _this_ particular version of the license (ie v2, not
> + v2.2 or v3.x or whatever), unless explicitly otherwise stated.
> +
> +License: LGPL-2.1+
> + This file is part of the GNU C Library.
> + .
> + The GNU C Library is free software; you can redistribute it and/or
> + modify it under the terms of the GNU Lesser General Public
> + License as published by the Free Software Foundation; either
> + version 2.1 of the License, or (at your option) any later version.
> + .
> + The GNU C Library is distributed in the hope that it will be useful,
> + but WITHOUT ANY WARRANTY; without even the implied warranty of
> + MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + Lesser General Public License for more details.
> + .
> + You should have received a copy of the GNU Lesser General Public
> + License along with the GNU C Library; if not, see
> + <https://www.gnu.org/licenses/>.
> diff --git a/dists/debian/dtrace-tests.install b/dists/debian/dtrace-tests.install
> new file mode 100644
> index 00000000..a04ebfb9
> --- /dev/null
> +++ b/dists/debian/dtrace-tests.install
> @@ -0,0 +1 @@
> +usr//lib/${DEB_HOST_MULTIARCH}/dtrace/testsuite/
> diff --git a/dists/debian/dtrace-tests.lintian-overrides b/dists/debian/dtrace-tests.lintian-overrides
> new file mode 100644
> index 00000000..22cbd6eb
> --- /dev/null
> +++ b/dists/debian/dtrace-tests.lintian-overrides
> @@ -0,0 +1,8 @@
> +dtrace-tests binary: unstripped-binary-or-object [*]
> +dtrace-tests binary: unusual-interpreter dtrace [*.d]
> +dtrace-tests binary: interpreter-not-absolute dtrace [*.d]
> +dtrace-tests binary: executable-not-elf-or-script [*.d]
> +dtrace-tests binary: relative-library-search-path RUNPATH test/triggers [*]
> +dtrace-tests binary: statically-linked-binary [*]
> +dtrace-tests binary: package-has-unnecessary-activation-of-ldconfig-trigger
> +dtrace-tests binary: shared-library-lacks-prerequisites [*/dtrace/testsuite/test/triggers/libproc-dlmlib.so.0.0.0]
> diff --git a/dists/debian/dtrace.docs b/dists/debian/dtrace.docs
> new file mode 100644
> index 00000000..7696583d
> --- /dev/null
> +++ b/dists/debian/dtrace.docs
> @@ -0,0 +1 @@
> +usr/share/doc/dtrace-${env:DEB_VERSION_UPSTREAM}/
> diff --git a/dists/debian/dtrace.install b/dists/debian/dtrace.install
> new file mode 100644
> index 00000000..6be68ccb
> --- /dev/null
> +++ b/dists/debian/dtrace.install
> @@ -0,0 +1 @@
> +usr/sbin/dtrace
> diff --git a/dists/debian/dtrace.lintian-overrides b/dists/debian/dtrace.lintian-overrides
> new file mode 100644
> index 00000000..11005f4a
> --- /dev/null
> +++ b/dists/debian/dtrace.lintian-overrides
> @@ -0,0 +1 @@
> +dtrace binary: unstripped-binary-or-object [*]
> diff --git a/dists/debian/dtrace.manpages b/dists/debian/dtrace.manpages
> new file mode 100644
> index 00000000..e54b52b3
> --- /dev/null
> +++ b/dists/debian/dtrace.manpages
> @@ -0,0 +1 @@
> +usr/share/man/man8/dtrace.8
> diff --git a/dists/debian/libdtrace2-dev.install b/dists/debian/libdtrace2-dev.install
> new file mode 100644
> index 00000000..b5e66db5
> --- /dev/null
> +++ b/dists/debian/libdtrace2-dev.install
> @@ -0,0 +1,5 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so
> +usr/include/dtrace
> +usr/include/dtrace.h
> +usr/include/sys/dtrace.h
> +usr/include/sys/dtrace_types.h
> diff --git a/dists/debian/libdtrace2.install b/dists/debian/libdtrace2.install
> new file mode 100644
> index 00000000..36294de3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.install
> @@ -0,0 +1,12 @@
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/[0-9]*/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/bpf_dlib.o
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/drti/
> +usr/lib/${DEB_HOST_MULTIARCH}/dtrace/include/
> +usr/lib/${DEB_HOST_MULTIARCH}/libdtrace.so.*
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace.pc
> +usr/lib/${DEB_HOST_MULTIARCH}/pkgconfig/dtrace_sdt.pc
> +usr/lib/systemd/system/dtprobed.service
> +usr/lib/systemd/system/dtrace-usdt.target
> +usr/lib/systemd/system-preset/50-dtprobed.preset
> +usr/lib/udev/rules.d/60-dtprobed.rules
> +usr/sbin/dtprobed
> diff --git a/dists/debian/libdtrace2.lintian-overrides b/dists/debian/libdtrace2.lintian-overrides
> new file mode 100644
> index 00000000..34b4011d
> --- /dev/null
> +++ b/dists/debian/libdtrace2.lintian-overrides
> @@ -0,0 +1,4 @@
> +libdtrace2 binary: binary-from-other-architecture [*/dtrace/bpf_dlib.o]
> +libdtrace2 binary: unstripped-binary-or-object [*]
> +libdtrace2 binary: appstream-metadata-missing-modalias-provide usr/lib/udev/rules.d/60-dtprobed.rules
> +libdtrace2 binary: systemd-service-file-refers-to-unusual-wantedby-target basic.target [usr/lib/systemd/system/dtprobed.service]
> diff --git a/dists/debian/libdtrace2.manpages b/dists/debian/libdtrace2.manpages
> new file mode 100644
> index 00000000..fef53dc3
> --- /dev/null
> +++ b/dists/debian/libdtrace2.manpages
> @@ -0,0 +1 @@
> +usr/share/man/man8/dtprobed.8
> diff --git a/dists/debian/mkChangelog b/dists/debian/mkChangelog
> new file mode 100755
> index 00000000..fa6095f9
> --- /dev/null
> +++ b/dists/debian/mkChangelog
> @@ -0,0 +1,152 @@
> +#!/usr/bin/awk -f
> +
> +function error(msg) {
> +	print "E:"msg >"/dev/stderr";
> +	err = 1;
> +	exit(1);
> +}
> +
> +BEGIN {
> +	if (!dist)
> +		dist = "UNRELEASED";
> +	else if (dist != "unstable" && dist != "experimental")
> +		error("Bad dist ("dist")");
> +}
> +
> +/^Name:/ {
> +	pkg = $2;
> +	next;
> +}
> +
> +/^%changelog/ {
> +	in_changelog = 1;
> +	next;
> +}
> +
> +!in_changelog {
> +	next;
> +}
> +
> +function lineWrap(p, s, line, len, l, n, m, i) {
> +	n = length(p);
> +	line = p;
> +	len = n;
> +
> +	m = split(s, arr, / +/);
> +	for (i = 1; i <= m; i++) {
> +		l = length(arr[i]);
> +		if (len + 1 + l >= 80) {
> +			print line;
> +			line = sprintf("%*s %s", n, "", arr[i]);
> +			len = n + 1 + l;
> +		} else {
> +			line = line " " arr[i];
> +			len += 1 + l;
> +		}
> +	}
> +	delete arr;
> +
> +	print line;
> +}
> +
> +function emitEntry(i, j, n) {
> +	# Loop through the contributions, determining who each contribution
> +	# should be credited to.  If there are multiple contributors, we pick
> +	# the first one who is not the commit author (if any).
> +	# If all contributions are from the commit author, we do not emit an
> +	# explicit credit line.
> +	for (i = 1; i <= lc; i++) {
> +		gsub(/ \[Orabug[:;] [1-9][0-9]*(, [1-9][0-9]*)*\]/, "", lv[i]);
> +		sub(/[ \t]+$/, "", lv[i]);
> +		gsub(/  +/, " ", lv[i]);
> +
> +		cont = name;
> +		if (match(lv[i], /\([^)]+\)$/) > 0) {
> +			auth = substr(lv[i], RSTART + 1, RLENGTH - 2);
> +			lv[i] = substr(lv[i], 1, RSTART - 1);
> +			sub(/[ \t]+$/, "", lv[i]);
> +			n = split(auth, arr, /, */);
> +
> +			# Find the first contributor not the commit author.
> +			for (j = 1; j <= n; j++) {
> +				if (arr[j] == name)
> +					continue;
> +				cont = arr[j];
> +				break;
> +			}
> +			delete arr;
> +		}
> +
> +		# Add to the list of contributions for this contributor.
> +		if (cont in map)
> +			map[cont] = map[cont] " " i;
> +		else
> +			map[cont] = i;
> +	}
> +
> +	print pkg" ("vers") "dist"; urgency=medium";
> +
> +	# First emit contributions by people other than the commit author.
> +	n = 0;
> +	for (cont in map) {
> +		if (cont == name)
> +			continue;
> +
> +		n++;
> +		print "\n  [ "cont" ]";
> +		$0 = map[cont];
> +		for (i = 1; i <= NF; i++)
> +			lineWrap("  *", lv[int($i)]);
> +	}
> +	if (n > 0)
> +		print "\n  [ "name" ]";
> +	else
> +		print "";
> +
> +	$0 = map[name];
> +	for (i = 1; i <= NF; i++)
> +		lineWrap("  *", lv[int($i)]);
> +
> +	delete map;
> +
> +	print "\n -- "name" "mail"  "date" 00:00:00 +0000\n";
> +}
> +
> +/^\* (Sun|Mon|Tue|Wed|Thu|Fri|Sat) [A-Z][a-z][a-z] [ 0-3][0-9] / {
> +	date = $2", "$4" "$3" "$5;
> +	i = index($0, " - ");
> +	vers = substr($0, i + 3);
> +	name = substr($0, 19, i - 19);
> +	i = index(name, " <");
> +	mail = substr(name, i + 1);
> +	name = substr(name, 1, i - 1);
> +	if (name == "")
> +		error("No name in: "$0);
> +
> +	lc = 0;
> +	delete lv;
> +
> +	next;
> +}
> +
> +/^- / {
> +	sub(/^- +/, "");
> +	lv[++lc] = $0;
> +	next;
> +}
> +
> +NF == 0 {
> +	emitEntry();
> +	date = "";
> +	next;
> +}
> +
> +{
> +	lv[lc] = lv[lc] $0;
> +	next;
> +}
> +
> +END {
> +	if (date && !err)
> +		emitEntry();
> +}
> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> new file mode 100644
> index 00000000..d4a89bb9
> --- /dev/null
> +++ b/dists/debian/patches/debian-configure.patch
> @@ -0,0 +1,17 @@
> +Description: issue a warning for unknown configure options
> + The Debian build system specifies configure options that are not known to
> + the DTrace configure script.  They should not cause the configure script
> + to abort.
> +
> +--- dtrace-2.0.4.orig/configure
> ++++ dtrace-2.0.4/configure
> +@@ -172,8 +172,7 @@ for option in "$@"; do
> +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> +-        *) echo "Unknown option $option" >&2
> +-           exit 1;;
> ++        *) echo "Unknown option $option" >&2;;
> +     esac
> + done
> + 
> diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
> new file mode 100644
> index 00000000..58bea538
> --- /dev/null
> +++ b/dists/debian/patches/debian-interpreter-paths.patch
> @@ -0,0 +1,107 @@
> +Description: fix interpreter paths in tests
> + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
> +
> +--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> ++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/bash
> ++#!/bin/bash
> + 
> + [ `uname -m` = "aarch64" ] && exit 0
> + exit 2
> +--- dtrace-2.0.4.orig/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> ++++ dtrace-2.0.4/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/bash
> ++#!/bin/bash
> + 
> + [ `uname -m` = "x86_64" ] && exit 0
> + exit 2
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_0.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_0.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_1.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_1.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i0.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i0.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_i1.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_i1.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-assoc.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-assoc.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-gvar.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-gvar.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-lvar.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-lvar.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/codegen/err.deref_string-tvar.r.p
> ++++ dtrace-2.0.4/test/unittest/codegen/err.deref_string-tvar.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + 
> + # runtest.sh looks for "0x" to filter out pointer values.
> + # Strip the 0x so that the illegal address will not be filtered out;
> +--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.ifdefincomp.r.p
> ++++ dtrace-2.0.4/test/unittest/preprocessor/err.ifdefincomp.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
> + # supported, we have to sed it back again.
> + s,[??????],",g
> +--- dtrace-2.0.4.orig/test/unittest/preprocessor/err.incompelse.r.p
> ++++ dtrace-2.0.4/test/unittest/preprocessor/err.incompelse.r.p
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/sed -f
> ++#!/bin/sed -f
> + # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
> + # supported, we have to sed it back again.
> + s,[??????],,g
> +--- dtrace-2.0.4.orig/test/utils/clean_probes.sh
> ++++ dtrace-2.0.4/test/utils/clean_probes.sh
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/bash
> ++#!/bin/bash
> + 
> + TRACEFS=/sys/kernel/debug/tracing
> + EVENTS=${TRACEFS}/available_events
> diff --git a/dists/debian/patches/series b/dists/debian/patches/series
> new file mode 100644
> index 00000000..6d3b5413
> --- /dev/null
> +++ b/dists/debian/patches/series
> @@ -0,0 +1,3 @@
> +# You must remove unused comment lines for the released package.
> +debian-configure.patch
> +debian-interpreter-paths.patch
> diff --git a/dists/debian/rules b/dists/debian/rules
> new file mode 100755
> index 00000000..3aff9b38
> --- /dev/null
> +++ b/dists/debian/rules
> @@ -0,0 +1,22 @@
> +#!/usr/bin/make -f
> +# You must remove unused comment lines for the released package.
> +export DH_VERBOSE = 1
> +export DEB_BUILD_OPTIONS = nostrip
> +export DEB_BUILD_MAINT_OPTIONS = hardening=+all
> +export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
> +export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
> +
> +include /usr/share/dpkg/pkg-info.mk
> +
> +export DEB_VERSION_UPSTREAM
> +
> +%:
> +	dh $@
> +
> +override_dh_auto_configure:
> +	dh_auto_configure -- --pkg-config-dir=\$${LIBDIR}/pkgconfig BPFC=bpf-gcc BPFLD=bpf-ld
> +
> +override_dh_auto_test:
> +
> +override_dh_auto_install:
> +	dh_auto_install -- install-test
> diff --git a/dists/debian/source/format b/dists/debian/source/format
> new file mode 100644
> index 00000000..163aaf8d
> --- /dev/null
> +++ b/dists/debian/source/format
> @@ -0,0 +1 @@
> +3.0 (quilt)
> -- 
> 2.51.0
> 
