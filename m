Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD01E519
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452752; cv=fail; b=WG/U2RTw95G0wA8ENCLfbHRak4kblypCY0zg2igMQDgkA9BPEf6poC8gjQuTiWs6FZXHu6wb5iOuWzqp6pX/Td2mF9eBxfRPy7RUgOK2B621jrj+yneeydrxFEU+iRIeac8TEfMSxuhzKeDi+13LzForlRWdGBtDgQ+Kqj+h/H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452752; c=relaxed/simple;
	bh=I3U9uuMqu8+I0zc49zDjtaUez/1caqeEhZ0H58WyM6c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h6b7TFaaar1npsTUglKDPBTLVepid5t8ZefWbhe1p52R/sroCJwApixOV5LUbIjhxcG4cNahPuQA477shsxXhsH14TlJXMWLoqQrpbBd1c9IfepIJQHdsjzu1V4wS+8bziQe75yTAssGjeZSV/oJoFI4xHyVPxCx2RYg8vC0gIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Er8izKXO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YVOJ3Ttl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Er8izKXO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YVOJ3Ttl"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4991ucRg025517
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 05:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CZCEPApweQirgqV6i8
	QIG+CBBySNvpWIo8QHZO3fPUY=; b=Er8izKXOX2VFnw9uy+BDtlJ6uN1J3jtH5p
	f3jzKidJCVEMZq+OZSC7/r+4KuJF3seJTLzlDsvB+KAro49PO2//cxTOxa9PGErN
	VPcAffndP2yQeBdepeSMcqne4SQvd55BJTRewxNVZlUeuVNFdk/44CbiuAp3zFqs
	kIuhSTuZnGyTPnwkGucAEIi5W1IAYbwAXftj+7kpIdvKxUYlr42Wu4EzQ3QfbyIJ
	1LKdW7L+ddabnu4DpNrTMwD3XJsapS+dA65vRwW6GLkhQ1HlZ7bNwjlSOmT3+Joj
	d5qZCqN7vermc2u4x6wNJd4ZtRlmn1SLb6WYQ/7EgAD+wA9hrL+w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42300dye2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 05:45:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4995elx2015258
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 05:45:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw83urc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 05:45:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLXnIKlZCWHmz9D3GsX+1lL/tUQUwigen7OAZZThPdV+kVmzPB/F3owAt4AoYIE0TDSYnaYkWjUC71z9sspdIcBbG0Zkdy6OSFN29k3Ny4cJrEfgd+UoDK3HrPLBWMsZuwbDz3pIvMF4Oi2AxKaVJ6VKSbU+YGLfErAS3YKilAaaFMEuHtLx/fTBs1H/eFE7+JYaKoQLS8UAhZLRNH8KDr+NVwdcXGoSHFYQi0MD/m7OPC2L62eorEMRNpNAaNf1paPrLVZXzSUidM+ZgoPMEZSnLS4QyvwqIQh4MubdHXr+zcMJvtLaNS2SSqwCq8zs+NtKreNnhFpB23Hy55eE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZCEPApweQirgqV6i8QIG+CBBySNvpWIo8QHZO3fPUY=;
 b=Fiz+huSHA4khP35fGOq3f7x8YWgBxrvg3PuuqPcEGqe1A1OK68doeM84N/2M+Gr+4Du29mR6SFP456NwHIPSuWCLiY7rrJ/9v/u7Fz4yt+aqCqaqiUrfjr20qzs0ICcMIFC+S0k7+YNQ2aN0DEagtsxVzG6UKv0vYTsnLPhS8tz9Z6FOKCOyISSZUl9ZmjU/7OgN8SzZDiKlNYgvHnwQhdH0U0ujX1VTeMRXVSFROMp+6M49NhlJbskoYwY4NGVFLpmjS7d3luDR2wa7iunYO7/LcEjU5ZcmN1W93w3toI7rMjx7OyNatojP3rjoMNhZVvWjE8XzrBMf4L5yQg0wHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZCEPApweQirgqV6i8QIG+CBBySNvpWIo8QHZO3fPUY=;
 b=YVOJ3TtlflqNZj1UJmmyWYRA0M0doqzqgIvK8VnM0N/Sjj2dTYR2YMtCh3AUtBIpG4X1OfPdHydP/W6gbU3ekZPMXzWLdG2JJg1d6DF7HwMVFiNa8jRUfaN6DAMP4bZ266mJHhUUgOcfHYuirp7QMKuFXTIgqM0Ofmo/VdJfTqw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7136.namprd10.prod.outlook.com (2603:10b6:208:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 05:45:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 05:45:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/6] Deferred attach of underlying USDT probes
Date: Wed,  9 Oct 2024 01:45:35 -0400
Message-Id: <20241009054535.28199-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241009054535.28199-1-eugene.loh@oracle.com>
References: <20241009054535.28199-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0343.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc4f932-0ec4-4e9e-df73-08dce8259de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eh+RUfzH+7LAZnwAsEcu9b1FFdFgCPkXUYe2zezZ0c2SI8iZvS94bIfFd5GM?=
 =?us-ascii?Q?+fTQXSGDqfURxrrCQHNHmFGKY7W83eNXCL4nj2YuH2sfDWILAX3F92no100+?=
 =?us-ascii?Q?KKihY3l1G9Yp0nTYXRUG1vaDUgOA0KcMIZ5smzJfsM6TFKCOSniAAMSBuVVc?=
 =?us-ascii?Q?PrSQ057q4bADRXL3HMJdVjhcAl3Tay0ZebmxL2eEUMnzsP/xmPnF6VaGZHC3?=
 =?us-ascii?Q?ojmsX2eLoFymjoHhocuG91qlN03lAPORA8zBkUa+2dKgdR0ac0YO4oevKUDi?=
 =?us-ascii?Q?Wgt92bZa4zYUho73UlfROdBcTOmpUKHgMqg/ZtLtptKgYiON1p7xsLF7xysU?=
 =?us-ascii?Q?Epl56lXKkuVLPxKWSFMRbxunyer4OQ+1I3M0OrJDGhRz3z1AL5VB3OdA770i?=
 =?us-ascii?Q?/8L1o/5Pf/M+hCK5MZXlqIRg76/X7vww/b8Bykr1luK/MQKx1V8XoYOHDjew?=
 =?us-ascii?Q?nCQCGM0/BeGSkW+tJ7EDpcEJ/oOkFdP9glvC0P1FvONzk4+X7r0UK/jdcV/d?=
 =?us-ascii?Q?YWkF6YQnT7fKJamG4HAao6CdltdRQv80cJTfZytO8ysBHU3Fm+4xDv2puHHI?=
 =?us-ascii?Q?WSPGmYTHG7SiV4A+url+ORWcuyuS1SbWKkjyQZe6znaoPH2Vae7AR1lMsJZw?=
 =?us-ascii?Q?poHQTxCaSbj3qJvFulLhjJRIoHv5+dZibYA9R5VIpt/sIffpTiqiECfvkHx5?=
 =?us-ascii?Q?yMgfnyBiNltut0KCm1/bnsrrm9sxsO9yVp2rjEGKcYMWbIoWuujfczfPuPiW?=
 =?us-ascii?Q?CBkhetTkT/9TuqewRJywd2ab6dR/QzpFhZVUclAPowxKO1f9BG5WSeKAfXM7?=
 =?us-ascii?Q?WdPux5WQPLgRPH+R8obEfLV9zWYU4diZrsnIkNWCLZvZNurxUsz4NdvMZpqg?=
 =?us-ascii?Q?Zyi/vaLxmJCtEgOP+SPMh4EtZep5iL15b3XY5vTO2jrcypZlhliH12NIJ5kN?=
 =?us-ascii?Q?lLMRGF9c+8aybxP15rzlF0uWvSj1aqZai9HcVcRVejCJLScazNj/kZzrwCld?=
 =?us-ascii?Q?WO4JTglQye8bvPfsO+xIqRbkZYCOYowr7w5VlXeUXTXN3lK5APwIkQ+xJggP?=
 =?us-ascii?Q?BYo2FS9p2Dma5JWP8ZMmLlnD2W6ZcPuYWXVGQy+I3uUA0oVgmGzX2oQpDCI0?=
 =?us-ascii?Q?NFPHPIAuLC6vpTcoUar7s9mzFYTN0egx8pRDJSg52WpX+05DzvMfyx0L2yG4?=
 =?us-ascii?Q?OWAn+9sVSFLRaePsBalbc42g4rRDMtSUjMhgCQ1wMi05/RqVf97CkE00ehmj?=
 =?us-ascii?Q?LTOPTAqgPTDOfzOU4whPwbJ0rAxZldtTxq5JQXEmwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VS9o05PzxrrLDEs2RkGq0XsAdjA9LzJfC8Tgm3i08YB//lgs+iONgGPouBKe?=
 =?us-ascii?Q?NrcwCjzQHk9WgWdwuaUOKeAZ7C6fAHhAbPh0GGWeq0enaEd7GvivgYkI6yU9?=
 =?us-ascii?Q?o6B6HNqV0NjIOLripOE8q3busBsuuQUzTly5KP+GMnJWcO5ZHKSpUdz/9eOT?=
 =?us-ascii?Q?WKaNmq5Z1L50ZHlfqnZ7NBup60OXxxla9vXlwhJ5r+pKSeNUCxSggfW/O72Y?=
 =?us-ascii?Q?HxOCim6Onwz9W2njJPmaj5FTSyHpCzj5vEL3WWO78ABVLo2w65DohHRN0htn?=
 =?us-ascii?Q?2r26flJWcJQqGQVMHZtXC9ewlfTSs3S9CXGlahLnlvZlxKmbNYLW+M/GRro8?=
 =?us-ascii?Q?w0HA8pM2wAH1aP29JETvM1NHlp2ZDoqMXCHeDJQbsuSD6t35KAzzNMP0TUdj?=
 =?us-ascii?Q?d3tjsPU/XCc9whYbI1yYsB5kWUgrXRAL239wiNos/g2bSkGB6J+4NHqn8x32?=
 =?us-ascii?Q?d+eVjJluok9yYRJ9VB0VZYBCkd4BxlioBB3A9BD43gFBDHXXYH/Y9WPz1cUN?=
 =?us-ascii?Q?e/OC5pRdSBUujyPwQudUBZowELG9i0CmvdbIqDjjsCKyFosQMYzB0G37Sxm7?=
 =?us-ascii?Q?CObhb+UEFkCXM8NVAYeKz+UqLZsLPxsinZ9x3BXtusKnKAnt/2wSScMMPr3w?=
 =?us-ascii?Q?nm0rV3hcvgLtt2MJGPzAsRw6UzNQhpDMxooet71ei+8uBuCZeTP1reqWJW2V?=
 =?us-ascii?Q?b/WBKp3aKjJdUEwR1ia0Vv2liuTdma8gMsNT3gkglc0kwt+pRJPWPXheP2rg?=
 =?us-ascii?Q?scincimkmGm4wp7F5lYpr9lhTmuSweZf+8fQ/M+kOCpgw4ymoKS+AtCReE7U?=
 =?us-ascii?Q?ZlTN80kgNOSPRVE/pxSK6sgTpskbean2wPwzAOHzZm7wto9XtvUQ6Dvw4R5z?=
 =?us-ascii?Q?Rpk1LCBYutGNpeVSG+e6beRA8IYbFMTsODExIQi98UnRYdhDV/ra+K+hyeiJ?=
 =?us-ascii?Q?bsVuX8HtNsOAOggVhXxWSjAMwrHMBsrjFbLRvKOaU72TeQN4c62HggeGHTSa?=
 =?us-ascii?Q?eCdlJCFgmEBrFBPnCRA7fktq4xQGgoIltNTk4YHixF5F7uyjadxnghyfAZGW?=
 =?us-ascii?Q?WY29TQTbj6XHXN8Wl8bzcW6W61cZDr9Nwbm1dOYaINhr7VLruR6A9zjIy1bo?=
 =?us-ascii?Q?BVmjB9Sx0/V3P34Fyz4aY5OKzJHlk5Ruzphf0tJJjF9KjETa6egS3VZGbE+I?=
 =?us-ascii?Q?FG8VccDIksgt9qE/fZueAQRusjsHYekftWJc7XSiE2Af5vTLYom4ESz8o/EH?=
 =?us-ascii?Q?VDGegZDJd21wiUdJj4LnOhK2GwO3IgOaqnPnrj3uRtu5M2iJpbOE9leqeUtv?=
 =?us-ascii?Q?qWDKz4IUm69YxNHk/QPnf3dhY08ohXqTXhKn63NRKUbxlXE0lokqG972Xicj?=
 =?us-ascii?Q?HDzlrPpH4BcpWOJPfD+S/6hRnTRDzKtSmXRIb/Ia+5C82t99pE3UEFHM4BjS?=
 =?us-ascii?Q?j+03Cjkbl75uScJH7hZWW19mrqSs0KzNrVTFnkyh2VYDKgRRFHOrW1YtZ+Ox?=
 =?us-ascii?Q?8MFIUMLwfUOuljUSP5PcRI2gXVtUwfWtNoh3Ify1Ehpr875wiDHnH+5GIgcq?=
 =?us-ascii?Q?EhevuLQiFgdgrRkv3uzNB+cI3V0PLB98GCxmWfxR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2GFu8q9NM7FHoXd3D+5MEKOcOI/FzR7PquNDNrqVh7ORcTHRqyS25VMJJLVLSwIV6h3vIWIZL7acK3qYIQEGG1iKKmwMgzh/TMmJYG1dfE0AWYlq/0PgYHORd20HY6JYB1sj6oZhGAr/F3hGl3B4Gkp6JC0V1+dwNhntHQvpFsJHrjhtfuzqcHQBWSlLbyIMXSHLSKLhn2spOG6Jgfz33FRq2zAIXUN37bqQd0nSpXad6Q2K9OPat0+2u8X4BcpsxfGi5Ap03xP0kNpANGxytz6278BylqsXsMBHIq0NwCtmWi3FIgjDQEDqfCsm2q6Axxr1KP32YsvFokSaQRWI52j9+dK1jlaX6/xlQ2D/hft1XYKCUlXykisXop6zhGG4kfwCPrbil0XGWkQ9Q4cxSV35UhX6+d8+x3nLxMLhdIboEHqc4TPm4Zg10utdAikDzJriquJ3IAuf3UBaJ4+ysjsALIhapqE/POyaFvQIPsty0dRKmahIEaFX9XCQ7lhb86jBR/riKXbAg2yOapFYC+r0ruaVi1xZ5fg+1ZHjOjU4Kz/2HlCeTlYLarSCrVzwF+Ok4NFYLRolhMX3sh4DVZZUPwcMdzu7z6usAE0fdaQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc4f932-0ec4-4e9e-df73-08dce8259de0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 05:45:44.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty+fSBpp5Z4yerP1eI5PKPkjbT4JTZLRsFnavntlPkBHNlP9OSk844ZEozMnhEHZjLIr+a1v71FvdBxOgE5+7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7136
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_04,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090036
X-Proofpoint-GUID: db1t6ejrqAm-Ye1h2hqUH0-79_zib0Ea
X-Proofpoint-ORIG-GUID: db1t6ejrqAm-Ye1h2hqUH0-79_zib0Ea

From: Eugene Loh <eugene.loh@oracle.com>

We would like dtrace to trace USDT processes that start
even after the dtrace session has been launched.  In that
case, the underlying probe cannot be attached when dtrace
starts up;  rather, the BPF program must be attached once
the USDT process has been detected.

Therefore:

*)  Make dt_bpf_load_prog() callable outside of dt_bpf.c.

*)  Have update_uprobe() call dt_construct(), dt_link(),
    dt_bpf_load_prog(), and attach() for any new underlying
    probes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c                    |   2 +-
 libdtrace/dt_bpf.h                    |   3 +
 libdtrace/dt_prov_uprobe.c            |  65 +++++++++-
 test/unittest/usdt/tst.nusdtprobes.r  |   5 +
 test/unittest/usdt/tst.nusdtprobes.sh | 172 ++++++++++++++++++++++++++
 5 files changed, 244 insertions(+), 3 deletions(-)
 create mode 100644 test/unittest/usdt/tst.nusdtprobes.r
 create mode 100755 test/unittest/usdt/tst.nusdtprobes.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 7e4a4461a..7cdd73552 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1132,7 +1132,7 @@ dt_bpf_reloc_prog(dtrace_hdl_t *dtp, const dtrace_difo_t *dp)
  *
  * Note that DTrace generates BPF programs that are licensed under the GPL.
  */
-static int
+int
 dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		 const dtrace_difo_t *dp, uint_t cflags)
 {
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 64f6c00a2..6757d4964 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -14,6 +14,7 @@
 #include <dtrace/difo.h>
 #include <dt_btf.h>
 #include <dt_impl.h>
+#include <dt_probe.h>
 
 struct dtrace_hdl;
 
@@ -89,6 +90,8 @@ extern int dt_bpf_prog_load(struct dtrace_hdl *, const struct dt_probe *prp,
 			    size_t sz);
 extern int dt_bpf_raw_tracepoint_open(const void *tp, int fd);
 extern int dt_bpf_make_progs(struct dtrace_hdl *, uint_t);
+extern int dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
+			    const dtrace_difo_t *dp, uint_t cflags);
 extern int dt_bpf_load_progs(struct dtrace_hdl *, uint_t);
 extern void dt_bpf_init(struct dtrace_hdl *dtp);
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 582fca6d1..f2ebf6cab 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -254,9 +254,13 @@ static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
 	dt_probe_t	*prp_next;
 	int		i, prid = dtp->dt_probe_id;
 	dt_pcb_t	pcb;
+	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
 	int		fd = dtp->dt_usdt_namesmap_fd;
 	char		probnam[DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN];
 
+	/* Determine whether destructive actions are okay. */
+	dtrace_getopt(dtp, "destructive", &dest_ok);
+
 	/* Clear stale pids. */
 	purge_BPFmap(dtp);
 
@@ -311,6 +315,61 @@ static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
 
 		prp_next = dt_list_next(prp);
 
+		/* Handle underlying probe. */
+		if (prp->prov->impl == &dt_uprobe) {
+			dtrace_difo_t   *dp;
+			int		cflags, fd, rc = -1;
+
+			/*
+			 * Strictly speaking, we want the value passed in to
+			 * dtrace_go().  In practice, its flags pertain to
+			 * compilation and disassembly, which at this stage
+			 * no longer interest us.
+			 */
+			cflags = 0;
+
+			/* Check if the probe is already set up. */
+			if (prp->difo)
+				continue;
+
+			/* Make program. */
+			dp = dt_construct(dtp, prp, cflags, NULL);
+			if (dp == NULL)
+				continue;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
+			prp->difo = dp;
+
+			/* Load program. */
+			if (dt_link(dtp, prp, dp, NULL) == -1)
+				continue;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+			if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
+			    dest_ok == DTRACEOPT_UNSET)
+				return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+
+			fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
+			if (fd == -1)
+				continue;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+
+			if (prp->prov->impl->attach)
+				rc = prp->prov->impl->attach(dtp, prp, fd);
+
+			if (rc == -ENOTSUPP) {
+				char    *s;
+
+				close(fd);
+				if (asprintf(&s, "Failed to enable %s:%s:%s:%s",
+					      prp->desc->prv, prp->desc->mod,
+					      prp->desc->fun, prp->desc->prb) == -1)
+					return dt_set_errno(dtp, EDT_ENABLING_ERR);
+				dt_handle_rawerr(dtp, s);
+				free(s);
+			} else if (rc < 0) {
+				close(fd);
+				return dt_set_errno(dtp, EDT_ENABLING_ERR);
+			}
+
+			continue;
+		}
+
 		/* Make sure it is an overlying USDT probe. */
 		if (prp->prov->impl != &dt_usdt)
 			continue;
@@ -398,9 +457,11 @@ static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
 				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
 			} else if (val.prid != oval.prid || val.mask != oval.mask) {
 				/*
-				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
-				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 * Two different USDT probes should never map to the same
+				 * underlying probe for the same pid.  Nor should the bit
+				 * mask ever change.
 				 */
+				assert(0);
 			} else {
 				/*
 				 * Nothing to do, it already is in the map.
diff --git a/test/unittest/usdt/tst.nusdtprobes.r b/test/unittest/usdt/tst.nusdtprobes.r
new file mode 100644
index 000000000..d894af92e
--- /dev/null
+++ b/test/unittest/usdt/tst.nusdtprobes.r
@@ -0,0 +1,5 @@
+try ""
+try "-xnusdtprobes=40"
+try "-xnusdtprobes=39"
+Files check.txt.sorted and dtrace.out.sorted differ
+success
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
new file mode 100755
index 000000000..50f18a6ca
--- /dev/null
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -0,0 +1,172 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies the nusdtprobes option.
+# @@timeout: 100
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/nusdtprobes.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make the trigger.
+
+cat << EOF > prov.d
+provider testprov {
+	probe foo0();
+	probe foo1();
+	probe foo2();
+	probe foo3();
+	probe foo4();
+	probe foo5();
+	probe foo6();
+	probe foo7();
+	probe foo8();
+	probe foo9();
+};
+EOF
+
+cat << EOF > main.c
+#include <unistd.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	while (1) {
+		usleep(1000);
+
+		TESTPROV_FOO0();
+		TESTPROV_FOO1();
+		TESTPROV_FOO2();
+		TESTPROV_FOO3();
+		TESTPROV_FOO4();
+		TESTPROV_FOO5();
+		TESTPROV_FOO6();
+		TESTPROV_FOO7();
+		TESTPROV_FOO8();
+		TESTPROV_FOO9();
+	}
+
+	return 0;
+}
+EOF
+
+# Build the trigger.
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	exit 1
+fi
+cc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	exit 1
+fi
+$dtrace -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+cc $test_cppflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Test nusdtprobes settings.
+#
+# We will start teams of processes, each with 4 members, each in turn
+# with 10 USDT probes.  So, regardless of how many teams are run in
+# succession, at any one time DTrace needs room for at least 40 USDT
+# probes.  The default and -xnusdtprobes=40 settings should work, but
+# -xnusdtprobes=39 should not.
+nteams=2
+nmmbrs=4
+
+for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
+
+	echo try '"'$nusdt'"'
+
+	# Start DTrace.
+
+	rm -f dtrace.out
+	$dtrace $dt_flags $nusdt -Zq -o dtrace.out -n '
+	testprov*:::
+	{
+		@[probeprov, probemod, probefunc, probename] = count();
+	}' &
+	dtpid=$!
+	sleep 2
+	if [[ ! -d /proc/$dtpid ]]; then
+		echo ERROR dtrace died
+		cat dtrace.out
+		exit 1
+	fi
+
+	# Start teams of processes, only one team at a time.
+
+	rm -f check.txt
+	for (( iteam = 0; iteam < $nteams; iteam++ )); do
+		# Start the team, writing out expected output.
+		sleep 2
+		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
+			./main &
+			pids[$immbr]=$!
+			for j in `seq 0 9`; do
+				echo testprov${pids[$immbr]} main main foo$j >> check.txt
+			done
+		done
+
+		# Kill the team.
+		sleep 3
+		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
+			kill ${pids[$immbr]}
+		done
+	done
+
+	# Kill DTrace.
+
+	kill $dtpid
+	wait
+
+	# Strip the count() value out since we do not know its exact value.
+
+	awk 'NF == 5 { print $1, $2, $3, $4 }' dtrace.out | sort > dtrace.out.sorted
+
+	# Check.
+
+	sort check.txt > check.txt.sorted
+	if [ x$nusdt == x"-xnusdtprobes=39" ]; then
+		# Results should not agree with check.txt.
+		if diff -q check.txt.sorted dtrace.out.sorted; then
+			echo ERROR unexpected agreement
+			cat dtrace.out
+			exit 0
+		fi
+	else
+		# Results should agree with check.txt.
+		if ! diff -q check.txt.sorted dtrace.out.sorted; then
+			echo ERROR output disagrees
+			echo === expected ===
+			cat check.txt.sorted
+			echo === got ===
+			cat dtrace.out.sorted
+			echo === diff ===
+			diff check.txt.sorted dtrace.out.sorted
+			exit 1
+		fi
+	fi
+done
+
+echo success
+
+exit 0
-- 
2.43.5

