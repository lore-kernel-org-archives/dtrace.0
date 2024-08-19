Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA715AAB8
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109188; cv=fail; b=k2MN6aSMqVlRBJ/8DyYm0RcUmEGWAcn8OszUE8ULPboelqGhLW+vi1r+BNyHHXLcKHDpBEoWol20ZL2Gnp3EseSUqerXdwot5o6qu64I01QrnvKeCBoZhFC6Pb2VfA5DkVRrklLrhbapldikr6IHi10/M3BqjVSG8H7WoMX4nrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109188; c=relaxed/simple;
	bh=dPzGNevqiNTzvD1jgPksjMQvAeZ0pzgn1eyjD3L7VfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YFutua53EQiOrrUQmUpdiMCaiikQJBnCq74GlcDYhEuGIkXxSDQ2Qc6dT1w3TL2JfOZ+KgSG9PHUXuzlKStZ972MnsPlcsb+CuIXb0P11mS5w24FFR/DfMnZ0E5A28LrYEk9fKMS2iDvZ4cnLc6RSb9rul6iJ7/0VQJapOMcyyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iDuQngHl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fafzlvgs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iDuQngHl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fafzlvgs"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKIit015297
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Q2Pu/VM2ZzFFa2R
	1k+n59/gux4xD8mtdoebm7ez40Rw=; b=iDuQngHle5FQRf06foNWXG8EAcCqY/l
	uPyS0wy74sYng/kb4HYdChGOYdbZKB34DAVbnD122tXxP2CMj2yo5dELph4O6EhF
	3bORxDg+GEirjcgzhPGf2nZkhkDEtAEkujoRKBjporiOGdiZr/qXwYheyrLKyik+
	uWTK/13fhsqg/OLqq9LFPyEQsOIRbB3SyM3WcMGtTJc34vwo7ObO8aXfW9AeTv1d
	ouJOTmUf/Efqo+nPZaxyUdanIzW8jprm5ZtJ8MZ6SZWhRMDiAN86A12vvs7aDrIr
	EGE+cAIvnsD8l/bZcW4zLoUgn3Iy/ZgbU4lsAD7r/q3hkBNlMGQWOlA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3hkrj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMJ27i015799
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414er419yc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owGAScyh+2PM/lPt2MudPWGKLqB2wNxoiWnhoHoWGd+GgUDp8RUUmix/71ti+n4oY6Lmq8vFXchLHAC7iXeMaCi3XU/lwzMCpwItckLc7ZTQ6lEyYgo61s0++psMOU1hJ2bnlFY18puZRRzPKJvZBqn2Z7NfaJt7won/W6PtB9V3l07WtprdjttBG0VoN/265t/M9LlAkS547XiYXdLVFlWghAKe+P0be38W4/N/gZ68VTxZ/3XszuhLt7d43D8vLCwE7mNKNDQVsWdpji1EuWCj0uKoCFNcMrzITp6++ygxnkCWygWVc6s9OVhv1Ifa8Wld8QrjIOgqbWWUHHSx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2Pu/VM2ZzFFa2R1k+n59/gux4xD8mtdoebm7ez40Rw=;
 b=J7uSz+dZH+0FgBqWb7Vr+d2qZ06UcvP6soWdPD1AZP2lI6FJhRdCXKajM2Mk4oZStOE+pfSpUfpXLYbS+kqn+yKh8xbFg2Gh7t3v6EoTetug0n8JKSBqFaLPbCmeZJHVSJbjfI04v4fq7nXEpOuvcfsq+oqbl/iIFgIuYvwJuHFmqLfb4RT1FuLq8oakCLe3nBbwhW2AbyI4w5+Rx6hpskXzFDugvAJqVwb3sVWfGJASf8ZSvbKeIRp+GJWmfZO+addFd7XAJT/puOLyAwdhlqIs/zxz7RwMqPIP56KtkahoS26peA1Kw2fZ5Alf/xRySri1oGk999aNg41XS1CcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2Pu/VM2ZzFFa2R1k+n59/gux4xD8mtdoebm7ez40Rw=;
 b=fafzlvgsMB1FficZ7S3CbBTfzYd92dfAerQyygAp25hPI2NfVUzi40cpRn05Qjx99BKkvEXlSrJnUVfXWMUoL+bxUEhPmDyGaYCjGqJnj3bWf3hwvS885OvpDQ3dWPCwCRxJ1CI84BqpAzC8ajm6KkARXWlqjED5LvSlWOQednw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 23:13:01 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:13:01 +0000
Date: Mon, 19 Aug 2024 19:12:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/8] test: Remove unneeded -w option
Message-ID: <ZsPRehBOcqwyDMdB@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 004e0da8-7053-416d-cde4-08dcc0a478cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?daY42gvjP7+BJghKyMxRCWSgwIYaD+P9lCauncOeBkXHCm7VX3vo/jJVYCxN?=
 =?us-ascii?Q?6+sBOlJFGHre14B5DJVZs67J/KzovN8AH6+/aItCV27FnBRy8VA1GF7qhrsA?=
 =?us-ascii?Q?1+cKsGfexMQeH3FS2nN8ASBkIj9xcjkb2tF0puO+uZFIUM941nxOIiOlRDqF?=
 =?us-ascii?Q?vYokuUyP9JTi25dqWmMi+9TJkPW6qF70z6I5qMHpnKeGonBG+vTUXp5FtwLM?=
 =?us-ascii?Q?Yt61jbxMuEbSaKZyv9ztbSvNpGYJ2rZPgFFI9w0awJztgPxInmZJsnzUpNKA?=
 =?us-ascii?Q?8Ev7gZhSDoemAP0gTQsa4VR0cHNyxSL1NF5BTQaoJErGoTwmy0emZnwvWxYD?=
 =?us-ascii?Q?eG8ctdnf9IuOT5gYZhK3p0z6I8kxzq4jNHFr2auQQxBNDap6+IYLC4om6WsK?=
 =?us-ascii?Q?xktWiMF+MP7oG6mATUULfdKvfQLY/CZ1v/nThO9EdAZmPJcHU1peXPDavPt1?=
 =?us-ascii?Q?h1SwatZ2Uph+RvMcIuRcL03j/+nJy6JC7jsLOjUfZzbPGVGTd/oreK2Gbw8l?=
 =?us-ascii?Q?fYKt98NUvlvSXhlwLasfBsN+0vlIQ/kKeRuaFnUbpeD+bnozIZIQUyFaoNXa?=
 =?us-ascii?Q?K3BiNOqVvlKWFHAPPIovidwR3zaroIjOYufrfRLpS1oQMhRzava1OSTQdO95?=
 =?us-ascii?Q?PnGqtoZefUeHLo3lDkM15os3CUTwPkvYB9Dm7Ur3Laed/WOmHqcxAkHCSfsQ?=
 =?us-ascii?Q?okbkhC5z+uOW5SPiftvWyH/ZuWHxHfImHrI3SK/LpvWTUssiEdWB8fY3G4gz?=
 =?us-ascii?Q?TFpoCCr8OudbhZid9WrF99E+og5UY7ilnf63oYgKyv8SwpfhDFfhgVLuKVQI?=
 =?us-ascii?Q?9boA4nhiOgAZwC047+6Pi4hvnY1AJ2h3icLO3cmLVsVqIDlMXBvAIbBnmblT?=
 =?us-ascii?Q?oZoDEaIbkidkVJUAVs80/s+Bh3y8NMR3YHg2USrkR1ksx1/s6qHVKULFWOoH?=
 =?us-ascii?Q?D2xzXhrQUbmglMxikOhbd2ntkFo2soM1a5SX2g4OksUvhov2o8gIkRU9OYMQ?=
 =?us-ascii?Q?msNl3+CdC3rR0KGteN1EM15qnVZRIHR7dLrhecQcYbhv9qUbCpROUmOiGmkb?=
 =?us-ascii?Q?8TrsxaOTYArQZ91YAQDBTovkJq+Aubcx/pyavWUOlDSxnjQSLz0GiGwbCpNU?=
 =?us-ascii?Q?aOYzCKc2cbpwt+9ZspdbrrHLBSO/azWG4Y+UiL4q2KYhneMb3owboJNvjePb?=
 =?us-ascii?Q?zZkB3arKzzfpnsNfjZPBByWBX0Hch9tNANNjlxM1BknYlSGeYK6oxmJ1dqAU?=
 =?us-ascii?Q?ZQ7tZRIU+e1dxMmkK8D5PsgyebCZw0WU6KJJ1mlp9O/AKOuhXocI4Wc+zc6r?=
 =?us-ascii?Q?17A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GUqIxF1AEVEFpnFU2qI39ZJn0UcMQK9YM+jmz+0ON9XxIffD8yCQm5JWKt76?=
 =?us-ascii?Q?r6jcZjjZaQwTBUinVU6W+acbI/Fri6QQ0hFRUBGIcaySRziWDXBDa70cd8P+?=
 =?us-ascii?Q?SlcgsFKjiFexHyRtHhhlXWs6dbwIXOEU2TGrx5uvA9Ahw0NPIUFxqZSDdmb+?=
 =?us-ascii?Q?wHVoiz2CxAepG8UaxLJyDjeYmLOQUGfRumw7tFcsSPUX90olfSiqiWcfDRQ0?=
 =?us-ascii?Q?1Wkn8MKXRmIfUN+9LcpRTA0LP22WeQ4QdsgD8NQwSFlvlcZN8Hm77W9U4gQT?=
 =?us-ascii?Q?jAlMn3QwIuW1obZhP14ii/jJuzzpWCUwVctxvmdAKBDxhhp/DIntRmmKa7sK?=
 =?us-ascii?Q?zS8FMPnXy0/Q4qfmo17qOGuYXNWQ88ory3xGhxdc/bzOgXNF6SZacLkSuJZQ?=
 =?us-ascii?Q?444fN56O0q5CCEgXZq5JCb0ngqfv4uMRWxwet+MCcc8b4aph0CcgdIPkYGOd?=
 =?us-ascii?Q?5h0LVBK5J7fmN8tfA3pYamRUWNH8XW6cTcSSJLaeq1M1BC5wAIh9vux6IZ/6?=
 =?us-ascii?Q?MyWgWT8HR+GqpMculxmZg7g+7JiSr+YmTBxZEcjbb9tLhgRfemLCOSrJkPuQ?=
 =?us-ascii?Q?GhTc0kr5I9jtiVa5LUG5AyXx5V9P7h0zVxv0fcQRId9/hAypgQDavnK42Mq+?=
 =?us-ascii?Q?e3unBoRXyMA+MqxWy5RqSpj0Jib7EWVXGfZX2/OL+ku78SIqvKXHBWjnKc9H?=
 =?us-ascii?Q?OdisMyk7709rSKcGZ5O0f8W9CmJZowGjvmFNbtT9mpJTVXZdWaBK/abjS7zT?=
 =?us-ascii?Q?UnS++r7ZYOYb26HljnOTPMpU5RfrsEoaaSkHi0DaEgPCSJ9Ztzfil2fUYdEh?=
 =?us-ascii?Q?WHoqOuPtuFgwqPm6V6/QAb8wPK2ZwXdWWgn4Vi69N5/+1cwZAr0TP2+86N+h?=
 =?us-ascii?Q?+SfZsCkVMeYX7AtGvRy4bDFvWiVbHFiKQBX+pm77rGB3jeQvtBcoXxQgvH/L?=
 =?us-ascii?Q?i5WPmg0rkpGHTlJRJ1MSA+a5iAhfsvIhqvaWbDuK2rhQ9QfYM/fjsPZtuUIH?=
 =?us-ascii?Q?mnQO/9bSlOKDcgVZEFPgSfDcBmtSJohp3KC3FzfUVmsFUOt1YLWbYg4cZFI2?=
 =?us-ascii?Q?3x6jXHIUEAvdIB9FpSYlaKsluw9xkN3PMnnkda7UvKpPVF2RdVWjto0uM6Hs?=
 =?us-ascii?Q?3Chs2jA7+CZ/hUMrTNBEkw6bx8wLK1T3GqDpvUxje66BAr6VdUPOlTUBCCC4?=
 =?us-ascii?Q?WTrNvodqTBabMcEh16bbtQ8QkDrShWHQSObk73kBpqwkEQ6s2RbjbU83StBo?=
 =?us-ascii?Q?zPjR9mmpB3MfWaB1OlYFWG7U9+/2l7UGc1Zq2aCGaqUMhynh8EMYz7XNPTs8?=
 =?us-ascii?Q?P90TvRa/4rEv8wwO42dw5Dq5L02a93+3t5srscYFeYfhwu0+pUcajpY7LS7b?=
 =?us-ascii?Q?/PGyx5k48GTHIHGS1P1MuT/hEsEnJdzhPlvjx3DgiQ9C52bTJjkjXN4iJbM1?=
 =?us-ascii?Q?MJhr7iTYQ0zhSSyJztjzBJ/xjBQo/PxtFUOefRSJSuGpOB0dyllnLwekeaso?=
 =?us-ascii?Q?c/Y/TbzlLtQcRrK5H5vfwrN+LkSpC6a/ALStWN9l3r0IqpppLF1Tt3DY8d4h?=
 =?us-ascii?Q?mv7/vPQyuCbRcSrrBcbXO9mLMhTt4GbDmRxFNnNF5OHENqEyBcRyk8sarzcj?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cGYwVnibqwWX6Fcl0GDSlzgy2uzkcuFB0b3wsPgeLB1ZzNs6ustM3hb9zJuvXQlKEeUNZJ71iwOwUdkZotezxdDAB7DvZELM9khGXMxO+k25tKQ7hLWIFyYHJuIdycOiLWr/MxyKL7kvOAZvo0QkKWr2fGhi3afAZSUyBjE30w/9h6ic5+EPrshteDs58ut2pdZb8I9Jsyij/EwonnUmHuk8Cm8/9SgSHzqZS2eD4ooPX4mO3kK11uFGoNeqsdajkK2R0ny9pRVk/OSHknMH3IsOT5GZYZA2j5DXQaLJRRB8CEsVjqPxYlkvSXlYo2IK03s8K+2eUJNA4O/mkjbUD4Lde55HaM4UgFPZc2QvGDUUvvEOKj+zbRfnm9qKII5s6909ULuNgniTvadoHy29KYSA4GCL8dFHfDxCpFslUZU1WwkXLc31/5Z0mT9EgRD0kCGXczfaSys1vPpCrdGRiZJSyxx/KZ+bZO9kcbg1Yo7cqzv5gOMniw8H5cHx6f0/gNni0KFUUvLiNA3EtQ8cFwA7RFo/N+jgHtudQlX/ujdD6VANfwHVnKp+vEOA1LkCXb6WUj8yHeeu/U11xutY7brL9dg9ZvnuVvWEeTVRIUA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004e0da8-7053-416d-cde4-08dcc0a478cd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:13:01.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ppzf9m6gmHjUtwnwjROhS5O4hwtOdI88+3LqrfCsKEs8nFhv7OJ0lP6iyb3tR6v1wAL4S4Z/W3sQHyIpwNfUObfdnNHYa8QGSguPUGJjM7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190155
X-Proofpoint-ORIG-GUID: 7HjxD5f69Xyk2einkfXszuCBE76dBlxP
X-Proofpoint-GUID: 7HjxD5f69Xyk2einkfXszuCBE76dBlxP

On Tue, Jun 04, 2024 at 02:00:04PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.dlclose2.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
> index 94be773d..6044cf4b 100755
> --- a/test/unittest/usdt/tst.dlclose2.sh
> +++ b/test/unittest/usdt/tst.dlclose2.sh
> @@ -128,7 +128,7 @@ if [ $? -ne 0 ]; then
>  fi
>  
>  script() {
> -	$dtrace -w -c ./main -Zqs /dev/stdin <<EOF
> +	$dtrace -c ./main -Zqs /dev/stdin <<EOF
>  	test_prov*:::
>  	{
>  		printf("%s:%s:%s\n", probemod, probefunc, probename);
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
