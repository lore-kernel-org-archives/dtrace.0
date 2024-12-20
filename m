Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424E226554
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733650; cv=fail; b=HYn1yg5IzVQcnuKc3JacNvMAhnSb3w9C5Mqc0T/RvJrundWOkvTpXYvGwtCyh2qLrT1dMtH5Cb1zAlM6NLkfKaIsCfGg6eohbBaAcXnVNyxNuo/p+gf1W39tdIB6QPzvWqR8mWmz4490ewu23VdrsDxMCJatJwjEcA0mYZ/JfyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733650; c=relaxed/simple;
	bh=2g9CK/ismha1IH2r167jAi4HfXutXuiOiSvnK+YFYWU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bszkRljOc52GJ9E79bgna9TqNn5FSuQ83Sa1orfdOaoiEr5psQ2QC9qs8QjALSmfFWZO51eTuV25FEDPxae7jUiFzLVn3Ts8VE1d6ABTp7EpVeMnbU8h0Aetvj/UTMYK5kwcqHuvFvT3cVJHTme2lN+y8rr2cOHKS9A8yGGQQMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CkGORs8p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jPqxiCHF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CkGORs8p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jPqxiCHF"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNVjf019102
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=YGHDqdqsRH0REbIjLniTMY0SSHMG1CnqFfZiE4o2v1I=; b=
	CkGORs8prvQ1vU/G0LnNSGWr7BeiPUOD30IPd2nohlSMe5N40t3k6pmO+0D92E/O
	NmB0IPhsTLtY9M+m2No8qENcJwfTkxwyAPSAdM1DoEeW4kvyvJ9Gt0HpWgKVaLzE
	19HdBeyllKB97iczr791rfJvr/EF/tgOZxY0S2OFZJGwr6raXvuoAUTiycBF3Hj6
	tzp5qFS0eg05zXJoXgMtDk5nErKygdlPim5QZ9uqBEpTStlnaBxslCU/G8/HAuCm
	zEb1qRdVPuJT5buv8H5kDsiyv+MXX+ihLODau6ZcGPmGW51sBgvIVG9wpUVbppgw
	Z7OvV+61GBIs44oDJflbew==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5ktwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKKFngk035673
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcymhr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u69kFULLTVW5LXSmR1k2H0OFsCqgmBZHBqEyXr+psBTqwLQJ8J3fWHkEGnO3k5WqJTWucsHhwkmgALWSmVicHug6bqN60eaxa2em93aBx0zVRpiurIb7/73k7DQE/El1+df5ftZCJaLEpIe9wuCqknF+w+/L2OmjZ4W1ZHzvs+Q5jQn6E1+UYZKAzCdLnFaQlO6Ldl8yukjwME3P9nDyyX6AGepog+zVd0KIVU9A96PmuRt2ZWDnGa6pn6hsKK4HVMOIFktYgo55on7nFHkTzHoF6yBcd0GY9AX5NLWphRBayO5Uh22u6awo2Dcn38eFSnCIik94psB+AxLwiG/UyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGHDqdqsRH0REbIjLniTMY0SSHMG1CnqFfZiE4o2v1I=;
 b=iUwjlTDEYCkLQVM/jaFm2pfc2fHjOV98qz7YaZcw684LrDfcHgR35jTgodOS7jDOwQBeq2EIqN9Izk3NHck7c+Y3M4zj+MnIQ+zy496P+0GWpzfpGRBw3mHz2q2XdswhvKsLVE5ky6bcabDwxXqhhqc1Sf1JestLhrKNPNZWfin2Kuiy5ABeiGSLRm1pRJ6LI3uhlb7ZKLauPesXCF7EK/m+Ew+esKKI9OM/cEj4vXVXOKeTMRBnFp/r7qfN6lEZHfj5MGPzb5VbtqIUQcV0fjNZiBaQnNzWh3r/eO2yPOsZfp13UvRDnXowxveXhGu92PvCpOFBuLc9LRAIN6D73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGHDqdqsRH0REbIjLniTMY0SSHMG1CnqFfZiE4o2v1I=;
 b=jPqxiCHFNEweKCPi2Nlz4gJI2c9WaE5WT6Eu6n9apCGwb3HvXV+eloFV8hUhQax6xHdJjhIHqH2l8cjbPa2ebT8WbWF608/r8BkdnNcP4xBPvL4xZJtZiCS2dywAIhcQldPNs4ijhezNc0eEvmvEwsSgaLLBh6xtQKaztnlkMaw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 22:27:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:27:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] Remove unused dpp_pc and dpp_size
Date: Fri, 20 Dec 2024 17:27:11 -0500
Message-Id: <20241220222716.18511-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0011.namprd12.prod.outlook.com
 (2603:10b6:208:a8::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: e731496d-664b-47e9-ae5f-08dd21457759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6nQINUhG8/RSBuQ8SXYYdG227S/fzpNtXuqu9VAM0NUf595B2FZ/fgWVXll1?=
 =?us-ascii?Q?G+R0adLkAEYO7NNLxiCowf/PMVOZUs7CAqfCnmuna+v485WwhvmAdp3gHEtn?=
 =?us-ascii?Q?FVjrL+FgyCUbcsNO6t9NDEdAE+gIVtV95q4Ihp7NOXJZLeEtRM0sVEvEmp9z?=
 =?us-ascii?Q?9mPCrQUjGwsOFpdmxtl+CxVhGNGdPBj1tfk++RxiJO090XIHQkAQwOkItLoB?=
 =?us-ascii?Q?kXxLAvLzUHBk+eGOkdAEQ6JbTVFTJNo7BpabZkbVaYoJRI1+oy1uOTrQ23p6?=
 =?us-ascii?Q?7/LU4oJ7TjPW7egDJ1v3gQ5GfB3yDS/yQPUn02ixaLVIClKFK9fbhsFnkwUT?=
 =?us-ascii?Q?8K+5Q27oxIkvhXNdzSXMisyVqorauSAhZDYHS8kPE3QYG8z4IsEMnNyob+23?=
 =?us-ascii?Q?EdZ12gMTUne6O6kFIlEoF0EB8/yt8wuocvHSQgemQEbcMjZK8q6We+pdM1Ie?=
 =?us-ascii?Q?bpmogxAs0kxyBa98y2XlEZLzIsibSGUV2+TCKWUhShQB22yIeiXSjEapiuWn?=
 =?us-ascii?Q?7UXi61erXi6R3CiHCHlS+fnYCAUe2IHSrgK1Rp5378y58/afDASVjAdmtjFG?=
 =?us-ascii?Q?y2VuIBMNMBdSc3K2SOS4Ojc3eu37QDnhsixLaL9J5RoErngrLD/CVL2TW2+5?=
 =?us-ascii?Q?Z7aELn8ZUXvUZ0Z+/G7zo89vCl8bglb4k7QZQJvxtZoW957+Biilnc6tdn9h?=
 =?us-ascii?Q?t8Og278jnPY0/T+xxgtSaKVsTeV5gUYyt9X3f5jsb9+8neoJUwDFvvcnZ3XV?=
 =?us-ascii?Q?J9hvs4p6nNr9C/pNDiPM4t3wquqE6+vX7nQW6QhCY3+3X/NNzbpsn6SiNtUC?=
 =?us-ascii?Q?Pzpopv1wJwswNB6aaQRRgIZNWCF62vsi/jaVkcMwjTYjSJGYPtrsvibiqllv?=
 =?us-ascii?Q?jYQuW4lGSUQjlGlyB8ovXe2lSiu8oBvPn4II6Hp1+MXX7gyZf+ph0AqbNjc6?=
 =?us-ascii?Q?y8nmNBoHUdFfJV665ciBeZnoKRSZN8qokPu3JOgntYKn5Y4YfEsxw857ThW8?=
 =?us-ascii?Q?eGbPWemI6jTkJr/+wc8ekuDF7DdctUGGPHyXM1u228T9lTQRt4dJTf/8KovH?=
 =?us-ascii?Q?dQ7soyDHuv+07YsbNprlCvfEjEEh+UcFuMU5Q88hudH3R0Zp6AGOH1MgbKH0?=
 =?us-ascii?Q?sKXZLQCiQqhNjuOzAn5gMOtg4Nvy9RRaNV0eijGd5zXm0uJIaVNYgEUG3QMi?=
 =?us-ascii?Q?mupT9evFBTpaKu2SdinsFTRpGFywZBu3oCTvlKdKTW/TkuYI4zoRBwuz+P7s?=
 =?us-ascii?Q?SewZ9JQg6F+lGWjXsSrSrL5u0mRp4bz4FA3mKm94r9D55VW9zcMgOKfYIPBp?=
 =?us-ascii?Q?YIa8nYdFUeCOJiV5isbc5i3HJ0cXJ5dU0IHIyLDUs5uqlQmJZHfl53feINDb?=
 =?us-ascii?Q?QpZcITovAlvDBrV7t03QMe+2D3md?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a2+SpA+iIBcPEGRo7kyHukzKh6wrAhdDQvZ0JtExEbutfhRFwQ9iurvi5QVq?=
 =?us-ascii?Q?/vzRPOtUf6RiLdQKu78XUnDubcnLpmIItwmcLoYJLvjodmfzUH5xhCS09Pgr?=
 =?us-ascii?Q?88tvLFjXqXgOLNgl0eopD+DpKfpmJB6JoJ8TghWgJvMLmOftbnqwTPPrYnUp?=
 =?us-ascii?Q?c8Mlm22/7HyQvLuE3PpH8+oXJbz1BIMiaSzEpmpCD/UHcSB06DxXV9dEkTp7?=
 =?us-ascii?Q?7kamAjoMls5wmUPi1TuPNHPxRoR7bCLTzsD3Yj9f3K616E1BH6AE9MM3GP6R?=
 =?us-ascii?Q?YWQLNxOZiScjUcj4agqPn40J0uBMVUHWfdHULPSW4mOWsxXYkQ/ssA4uJHd1?=
 =?us-ascii?Q?/3RCC6fuN5g9+KNm1hcs7bo8DJagP7bNMsSCb2sBGhcP5UjFlhGZ8m/MlMQ7?=
 =?us-ascii?Q?IVjQUZ1qtW2yGzcqreEDvkSbFgvj5/SvDwmkRb37alEu962xLzL2jUeBmgpt?=
 =?us-ascii?Q?cl12hPzl62sBzN1SYhBEVae3wU0bk141fOmDQnGiSzcRqeckAckHdXeceWvj?=
 =?us-ascii?Q?PzjrzfRzcFzGCeGIc8dR8pLQ3EUiLsw3sVGjhSwMMR5f9opl72589w2rMPGO?=
 =?us-ascii?Q?exmzt8hjknyoWRjfMma5KR/Bj7ewo6fEoOu5/BhX+8xRGmhEo4HcdkJixuG0?=
 =?us-ascii?Q?vNFhiNZUnTVkksBF779Lm2qlMWSQ8hxNZjN9y/cQOGqVzjWaaJY8WB6bKQ61?=
 =?us-ascii?Q?nmuBjsdisBDjVPcWSfkjaiH8T2vRvO9+KBz9oR8YgQ5wsdCl1/ckUaQ2+Xyc?=
 =?us-ascii?Q?Qv4vS2dFR/AtkVTCGv3vY6zPY9NDA06t6YGiEpn92eIiKaHlvLs4+z7mMbWs?=
 =?us-ascii?Q?mEV/gKUHpfG77JqqYaBzQeipvpH8Bmwz0fkxWYL+rJojqNSDfOEKK4OgJxiT?=
 =?us-ascii?Q?jKMabZGFTezaVyX8mM1ZDatoZJ3+OGbiDZbpd1T10hHy+SMuJk7ESScAN9bD?=
 =?us-ascii?Q?Ukxm1PThAU5V0dJ+j5/T1vRndbCSpb9N9db2xQgJyyo7Rllm5OyONKKO5k2r?=
 =?us-ascii?Q?2V88vqcgn8FE73TPuSePlBM85dw7gkUn0OiL4OdpSTBzu+yhN52okiDVsFRQ?=
 =?us-ascii?Q?zwa0vN4XtzSJIwpRdGGLqw1gzF+ROP4OhxsvfevffkyD1q4CnozOLPyohtp1?=
 =?us-ascii?Q?LNiW7UXG7LuOghqUu+PbxKKsUHWauzK0bLvzLlhDGMF1puAANolf2LI3CMYY?=
 =?us-ascii?Q?VAr7n+1zdWgnReCb++ZKR7lxDb/3kBpNLeop0ny3IyPtJvxLpuYLk5CObLcD?=
 =?us-ascii?Q?tVJ2PMWTViMZpyq4OQkZVI2BsaPnYYYdNQVd264JMlEyqs1j2lqSon33VdT9?=
 =?us-ascii?Q?rFNUdMdr9fakh9hoE9MkvQihrSOPjG9j5AvR4JbMCDLh8C47raRyRYHQe1Pd?=
 =?us-ascii?Q?khwq4ZaP8Iyi8eXRUasIRSZTVQfK1c6ULaqjOmqI8ELMqGeiuhFh7rg/xkQH?=
 =?us-ascii?Q?rMhY2g2wk8i91S2KX648ZC6OWzau+WwjPsnAuIKQ3Va5IVGh/BifhzM7Tqj/?=
 =?us-ascii?Q?oqpzQqyTIPRveDDRXqJsgPmcmScsfqM3aXIjY3tOOto7jVTM+HZUyNVIVG90?=
 =?us-ascii?Q?J7rP/REVAsRvwe7F+w3NPON/7CAKyzLaEeGnjNo2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4TPpHUrceSfWsoQu9ITH8Je49CQKrBJ54vJ9Cf11+hPIbq8ahxYtLU7OKUFJTT+1n3FZ4zsZEBC6207W2xm1mKsRGaXtVEwRQ7VmNtEVX8KaRe2/anaVCj9E2u40m7cOHielGP64mTau5gMhFAgTyYntQR6kk9f13DZeVkFuYr5XdY+Xc2BIlSfNctbt4PO6DvnV0NXgezLHNFsyZMqIaxpvYpEJsi4X25d9SUzkmwd0WWW8qvW6d3BFC9ou6Q798VVpakh+48+LKnvP0mhM8EOGlsXd5H5cjQkLOqep5BUbdmdntlrfPnc5Zcumq3/4jxiu+lW2KkkwiGz3e+CLa20dDPLR39ff3Xlb02HnHnec838MZy1FSk4/VUez34+8fb7Y9JYxwFffYoDqyED9RMGDb+jRVPPbwIgO70FZ0NMep9C9NUxzE1bao3GSUjeNd1DmAxZ59wWTIoqxBvsuwE3Ax3x3gxn5kFJfRrhUtgcBWnG2jCjAo2E33tp6ZJdnLg/2LSgmraSHZ3E2Hicy956A8paNW25Rh+2LsraSGO96FlYuCDxuOBC48Y+v1lvBd0kvL1qtgKjzZFEGDp96SkHu3UEd0LT5Xan9pp5NjdY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e731496d-664b-47e9-ae5f-08dd21457759
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:27:19.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkigjC/YVXdiqjzCj5XyE5oNrx7xSE6CErWRHjoruimLC8bHJofHZbkmAKW7NI2I2bBJcaQE8jHmWo2AYiPvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: ly4RQfJsCkJoyubcV-mkqiiZBBJEAP-V
X-Proofpoint-ORIG-GUID: ly4RQfJsCkJoyubcV-mkqiiZBBJEAP-V

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index fd94a0706..2331d1aa7 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -53,9 +53,7 @@ typedef struct dt_pid_probe {
 	dev_t dpp_dev;
 	ino_t dpp_inum;
 	const char *dpp_fname;
-	uintptr_t dpp_pc;
 	uintptr_t dpp_vaddr;
-	size_t dpp_size;
 	Lmid_t dpp_lmid;
 	uint_t dpp_nmatches;
 	GElf_Sym dpp_last;
-- 
2.43.5

