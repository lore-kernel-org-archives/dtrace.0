Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C0D28DA5
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466513; cv=fail; b=rjvV4sTa8trXU3EP3Gm/kPGaXzSawNCyeZ6p3fIitYkhFC4fx15NM+1Upngmeih81mKDPvga7LmOA9hr4LdqH7EV1SxdyA3/VGHQzDzL1a6kCo1l1jvnWhew2GsZbfbOZKaCaxhwrbH3H8ikYOS2xqjs7lnlTeNMQVr3pcTG8sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466513; c=relaxed/simple;
	bh=uUsCvJ8POltQ4VK8BB99rb51eLpN+x5rJltbDca1p/U=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IZPmlkkFXTWZBoJ+SHdIOuk0QsoUW77x5FXwUsV3A5/JY9FGJoF7RDzLqwoLi5b7/lbYDARucRxHrk8eL8SHQtcXuUYOD6qAA4uDCT88JzrPztctUPNRrRWcvbdJBRCgjdB0S2+WF5QaZYiOiz8RRg0hgSWN7yQNFkmKk7AVLtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JUzfSB1B; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VA/aV47r; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JUzfSB1B";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VA/aV47r"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMb5F011107
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=XLIWSo3HSqafA8bQACWt3Ap2Qsn9z9M8V0N+nnk1eJ4=; b=
	JUzfSB1BM4ZV5HK5P1rxH25lcAlU1Tckj8zHNI+m2RU8cu9TJ5+aG+Q7cESqzSXY
	RcIJHoPhQsr51wz1Gz61vphq29Q+0JHDwxUdtL8qjgv9cIrKH1AwEUz57V98XBCU
	e/quFn+gfwbdcC4NZksKaUCb9V1kxpPYGc3rUNcu8oFyXsRUannYi1VeIH8pWPd5
	+Oqi6uo/d2mpsFeErwbE5u2EruCwdPEmxUQXH/4wEnK6gvsxKdwtV53CYcrETFJu
	s7sUrxv3CbM6W46cPYTgnFD7wgmUJrG4RpcGI7c/+/yNl2P+2cADwGdoQVsGsTy0
	O9jQSkFSecKb/xiG/lxyfw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywq5t52qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3ADbo001294
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amwtq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haPKBNXYC6XCL47rHyrvAaZ6I79xXxI76GShyg5XJggaKXrIVnDphIqknsqgOp9J+RnQxMYmfzvIaa7H/DXOpe00e2tvtKtzIrQE15vzF77UxbTpM5FD+LZwGOni6vi4Kpeu8L7PTsp2eFmxbPitplb7kOHnCqTW0QjTIWgSwZ/liPoJ1KfmS8HesjeB1BV3QPt5KydF7/xnLe279ThBZTV9Yh+cTev2HUde+VUN/QPdwjuJXUFDn8Vyx28epGDy2SslX7KZSiw8g0TpKKp7NrPe3UC+C8oHX0NbeoTDX92W/vNq4QNcOb6MK0/cIWD46Zb0XKROnFbk97psWLn1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLIWSo3HSqafA8bQACWt3Ap2Qsn9z9M8V0N+nnk1eJ4=;
 b=UvuhDOdIZ7uRvCKfw2UAElSu1rPBdgAIaN5wJ/NKi2nKv778aq0Xb62XxHc5WZb3yEB68VFmFdO27GPLFVyGmlNVLakYWW7NfC/u1d3/sO7D5scpAM9LY8umVBCq59y192DpRjg5PpUGGtjc3wJ7P2GKdh9KLriSpPJjSuR9lEtvGIOXJSViBpOmx4vnkm8dPn7LoYaSwVOq3+ZGrE7YArfMpUouU3/9O140FlhJZ9J3nEPj9NBKbljC0Yp+P/JD4u90P9kCx0yyyYwaTSge2VJbTE9tiO2UZsoyZdRjb3XYbu+rZ2w8Sy/SFpQ/kH699FVJNnWJKcle7mRwTNjJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLIWSo3HSqafA8bQACWt3Ap2Qsn9z9M8V0N+nnk1eJ4=;
 b=VA/aV47rC4IKxzXdRSr2Eh2tPJ0d9YpAiiN4Rskd8klRrSvhi9gysfPKCAZMnMzBoc/dkf1niXf2hKw3TMPMKHttqX6GRL6sCp5hBcrs5JVLW10ISo8zb9mh/yYzzfOHrceMdNWefF91Se59WoySn/AZrElQXdERpB7dIbls30E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:06 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: 
Date: Thu, 27 Jun 2024 01:34:17 -0400
Message-Id: <20240627053455.21567-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 54844c89-fed7-41cf-7816-08dc966ae6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kv+oKWnkeAhBJAqrdqkNQXXrtz0jwA3ihefJw5NeRgKHLBFyAabRsK1GBHH1?=
 =?us-ascii?Q?HgXqmlNrWi8O5HC1J8JA3byUNHJnOSzE5l5zlR85aKltu2/FvefPQdcyTIM2?=
 =?us-ascii?Q?X6grZ5KlLSsFSQg//CU5NXgfEAMs3llEPxzx3W0sUL16zrDxnkB9fLFjEnFa?=
 =?us-ascii?Q?BofmJccJfKRVPJtOUp4WsOuBVvTEt8aEHIyCRjpXVCuGw8WAUGmiURW278Mf?=
 =?us-ascii?Q?5kr+c9Ozg34fB+oeck9hw8yFsswm9glQL/9/+hrDP8iMw+piM+91sHFmm+yq?=
 =?us-ascii?Q?SAx0be99KIy0iXp9xuMxz4SGTUvN+vg0vbw7F4Lr2Bl9JNZgv9SIe4oK6lRf?=
 =?us-ascii?Q?8qAeD3SwWtq5P7C1USDHM0SWBEh6/aV/BgG99dLTeyA3BbkEYDrF8iXIEPE6?=
 =?us-ascii?Q?4mgWsUKLj+nUZtfr+5P5U7wwx17XMQzt9kVCoqam8BbdUbVFbEpoLOOfSVPT?=
 =?us-ascii?Q?GVolAgBgDqs/CQEdh5tC2mOZjpTbqSCvCRldYjRqCneIGv2I7BPTG9byn8B+?=
 =?us-ascii?Q?D9tv3aE6ST5HdWbfjq8iTmBpu2ZfjPDaG7KhAWkJJ1/gObpAk2jWJjhrMI0I?=
 =?us-ascii?Q?SbnJcAawke++mUmQb07iu/6Lo9QTzX5KgALIIsjai9g+HJW2peDWnCOk2j4q?=
 =?us-ascii?Q?5yppjCIVhOIjSiSdn1IGzAEsk4xhBYqn4GSR5fyPkf/jYiLCMNyCNMaPUPxK?=
 =?us-ascii?Q?6pYxifQHDmguF9DBgy67EA0S/jqj5Qt+0dD9jIRu3CwltgKUtyUIvGYfVOSH?=
 =?us-ascii?Q?TP0bj0s9V4lRMcGSY2isrA1QUHu++M9TqZCbcC3ZkxxkRISlSKXwoa9xHipF?=
 =?us-ascii?Q?FmQSxEejDOs21uwrjZThbrZDIXcdXuYzGAwanxEOfW4NZ4TXPnCZFOyL6bsb?=
 =?us-ascii?Q?FWycEGaN6qMSAYcEiaawIHfGyM/KLAbNuQppdDWjAdofqLspjxo7ZnYyGmui?=
 =?us-ascii?Q?5dIVzy4mdtygUnspGbVZ3MzkL4S/8bBkJm+ZBPxvQroTMjq1QG908tgJxElA?=
 =?us-ascii?Q?xjniayVpQsx1DHBDzh99n4/EwH4jX4jnhmtzoWrwNPO+3L7KeNKohmbyAn14?=
 =?us-ascii?Q?HL9IBKJfBX5Ev9hYFtykCRcae56rYPJLEqKj3OojkZqqnxicFgmPE5Lf/1z4?=
 =?us-ascii?Q?cNquQLtUyoUZ+ttJLxDWX/XhFTNBGDh97aof7Id/ogkt7k6tUJmb06W5N7S3?=
 =?us-ascii?Q?aFcj4T60d6r7S8ZxflAmHmIRFsKVrsaTz5r635UmAr95PJgIiKpyCcKRgPcj?=
 =?us-ascii?Q?sZEuKe9HpZtfTXkGJDVtFRM69wMnqHHaZMrq0kINdQwju42ykJvtKLw0pj24?=
 =?us-ascii?Q?erLp/8f1Z8zQIGS47Cu4FjpX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?56zcf834FzDXksSrLu755YDphoFviI0TbFucg8xoink8N6BgVfL4qVQi8BJt?=
 =?us-ascii?Q?R4tfSORASbtBCC7k24t/TVXGrxC4N6a22tv14UbWHMRj8RDLa1kJgZ0qIVIT?=
 =?us-ascii?Q?TET7XgJDMFPs7W6RgF2iBrQYXiHPmNsKz1W2A00l+UuedYqqv4VI+OoEO9LK?=
 =?us-ascii?Q?YACTfXUjnnQrsjOiXcr+vApdrD9QadGhm9GHpABbcBFkwfPviDrmcyuzl+gt?=
 =?us-ascii?Q?1KO4W9gMclvFN9rIg0BvlEW4gzeyYfLxmrSqpBt/zKGmDkKSj9fM/ggGKk/8?=
 =?us-ascii?Q?RtMp2ecQyo9PF3dDM5lcPpbBiehN8z9a6i67KSClVILJC9nwmaC4DC8kMzA7?=
 =?us-ascii?Q?oiwOcbCzY4PwEQcpAErmXQzfyHgblPouPv19K5RDZTn87paeEhXMaZ+10En3?=
 =?us-ascii?Q?z3eiFnIzrlRykFeMpWgqEAldQJsekmaoxOYoA0YxVegiF5TyLuqyX/arx71/?=
 =?us-ascii?Q?77HceeqUSYrsII8uxm/gUim0nYI8sDgikGQOUxh7CITSoeJ/J0QXuED3d0Eu?=
 =?us-ascii?Q?a+A09wEcjfOdFStvpSRX6N6aTzrz55EV9exSZcwJ31AkWUV5RX8qW4xRnj/0?=
 =?us-ascii?Q?JMNQSLtcAlnJzgZTLa/mM9AQbkLkMB33wVkd99A6XWL0dHYRd9ZXoQatvmij?=
 =?us-ascii?Q?Epqf2NTfE/V8TcFQqC3JodMhXd4DB6vHaHR56YGhei6o9LldJVmTa1r+m1JB?=
 =?us-ascii?Q?H0Z4d1U9cU2Msn4Dv4zDfY/Fhql5pBBrzcLstpYmNU55sQ6aOIJxTk6d0XtI?=
 =?us-ascii?Q?MRAu0twLeqYrw9sjE7NR5eyBXn7lvbfCQP3lJn2JmDIhQ/1roLR4p3dJiKOU?=
 =?us-ascii?Q?1WyTfVFc4aPTyuNaltpBPCgFeiWWSYAdp+nRBuPq+2100nNkRGZo9UwUF9Xd?=
 =?us-ascii?Q?9thQ3DpRnHxGP3Iah3Pg2oq1RSFWRB/uxgB0++mi1Skb/vcs6qCbHOQU5O4e?=
 =?us-ascii?Q?IVIMUyi5j8O08SG/L+WiYINfwfq+rHEa2Giv51TkTOjdu63pCDv3dc5cJWL0?=
 =?us-ascii?Q?0zXk4b9w82RM2Xnzrwx5hD0q2/q6H4bH0GZsYcgcw95Oay/E18XrQj9RRUtJ?=
 =?us-ascii?Q?nmcitVKAxiMY6np5CuO4511QoF3NLGKqkIt72M2BX5cZsyoCxyMEB1ilYVlG?=
 =?us-ascii?Q?JC+nB41PprdA3njcOnTfYwF5+0kFdOUlpW8O1QkpAkOJZ4k7OwCuPEmZzYF2?=
 =?us-ascii?Q?aiXefHCE8+eP0Cenbah2NvUL3Fb0ayElj/v8AUn/VL1RaUOmPSO7d8Z+yT7y?=
 =?us-ascii?Q?+vCNa3UNkTn+XYdtqMfMNbL0+KmsgRW1XQ9Pu4jgX+DflDbXWvCJprcYec/N?=
 =?us-ascii?Q?nbqaoEUHHbDF+3RZ92YCCopLvoYdTaYcMOKOwlhkkZ+yd/tTuq5e7ha+Pp8C?=
 =?us-ascii?Q?tdhzISOah5RyZtJpWM9SyAGhboi7+ygweiZ0+adm58JKeI4TmQCWt3yP7rTh?=
 =?us-ascii?Q?1LqQ4zfzR6PuCzaV3pGNyresOHJzHB1Kf2FxLtBZA86yGoENSPpFIQ1U0J9/?=
 =?us-ascii?Q?EAdfjBqHGYJ7N12I42AMQsS4zGi3otKikMBEahiyl2YPDnmZLbdIhTmisTHS?=
 =?us-ascii?Q?SQ0rSPthdkIPhocuY+QyPfURF2eS4nKL19OiVlLz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aBrPUvkmP+9aD/Byey0KUDbCxAiujK1uf59K59b8jSgkDckeh6X5AAHAqCqzzYMgKqMRPCBtm6SZvJnBVUdHa1y0cWLo8ec56XMprh/17S9x4CwdpTnkCZ52njtG1dwUnihQmAPWrxUcbH9s3u2t4BnglCe6qw125Jl+h8uWdsMV9ACBI1RAY2g3gqGxzGDbA2mz6vVcrbM1L8tjjAfxb5+wf0CjRD6pn89/JcpD9BqFLf+I234Jka/+p2xVlgWRUvohNq27+6Vakr+ZHIez4FwgA6A+9I7QHvVbcbuh/xrrQsJPh4OR0L8KJGhWiJ+jGuovUQGQiL3yGrHgoAqJUSXCz4PC2Pfi6Ju21ytaaeCqLxYE7rgBpocm/RpWX/unbxoF/UAkvAvjdL6XWwLVr1qcr5kN0xEuF1rCvxYhR/F1W08gdpm2GpyA898ME0Nthg3SBq8xfYFOBWoB3XGQyn5aPfajuS/DoH/Mk1IpobZ93yaP52bLc9V4o776kLac4DNt/iWdPsq57bZPofOGUnND46DCXzQQdMGFJds/QXVXCOmsOF2V4GLkb5v9Cvl/O37MS5j6LJ9KdWvLTUCX3A06k+y0VxpoKaFv3HI7Puw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54844c89-fed7-41cf-7816-08dc966ae6b9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:06.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOxPGSCOi+B4H+7xFOIyRFwvV6vGn4fNYB0nYYZDN91A2+HOUISIIHuOLrXQ1idDnJ1V5qODFbrJp0Zwaj0g2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=458
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-GUID: BMpPhW_bfU--_lIG-oeLX-elTE4g0SGC
X-Proofpoint-ORIG-GUID: BMpPhW_bfU--_lIG-oeLX-elTE4g0SGC

On June 4, I sent out a 14-patch series for systemwide USDT.  Thanks
for the feedback.  Here is a 38-patch series that incorporates some
of the feedback.  I'm not labeling the patches "v2" since there is no
longer a one-to-one correspondence between patches.

Big changes include tracking retained probe descriptions and widening
the EPID from 32 to 64 bits (and thereby including the PRID).  There
is no great change in how the BPF map (storing PRIDs) is populated,
but further discussion is welcome and hopefully ensuing changes will
be easy to integrate into this patch series.

There are still a few FIXMEs, but at this point I welcome some feedback.


