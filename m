Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF573D97A
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824583; cv=fail; b=j0WXvUY01gnwLorD9ik78W3AXS51V0XPH/Fk/LldWrTo8xWeZG1SSlfnPAWFZUHwahuPPfKDDB9cdeT5nltbyzFGQLYBrmONFLJeSbv3+YWxwRDvgYy04SFhTFTEmm5HRie7FFkoGO8Bh48oQ3XdXKMsM6UYozAg+YVpVQs4Z1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824583; c=relaxed/simple;
	bh=d7NvFg2Rf9OEDU219rcZSpmigJzGeLim0eo5vqR262I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qynx075z2HJIn0aiG3F3y8CQCkQzpyX6w3U3Mr8lIwMJ1Ng6By1S05VhVi5P1sjgLEAAadBqAl7GRzTjc2/ZNAX+mThH3EqK5ZEEnuBrEhrQLrof/1wF+t4x+rvUc7nYdJAlMLX9zXjaiGGsblZtIVuCRN2dXRRhh5C005+H+kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=axXSRI7c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cmMzF0YG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="axXSRI7c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cmMzF0YG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fhfG005427;
	Fri, 25 Oct 2024 02:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=68UnRZnGMoDNs6NHnX
	pLEDyLCDjoFtatMqHgM2JjCcs=; b=axXSRI7cAX/wmg+JqlQZGu+l7Rg3Uih5Xf
	j+SojoRi+b0QLCpokC8n7Cr5oGV20ARsB4KH3m1mn2H9jjRa9h7XmHppf0kSOniV
	S1+a74KTRJ/ODzElAEqQwsZfvjBBNs7HDcswPEztt9doH0THLKdxATmD+EXSyn1Z
	qmnm8xu7ZW+d3sfkuKDP72o0M6cX/iyUumKu/AbKnLjFnxSGdDBVyzFfs2VWrs/S
	6LFDuRI6TDPTi9ni24+Psw/EuXW0yRAACI8RgP2wj7Eah+kzAkQk/p2xrGbfogAx
	1VyMIgy1ZZTr7lrndYPLpLGNACxhjTqaGyUmrV2yFJumiOt75Pdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v41fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:49:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1FDeM018370;
	Fri, 25 Oct 2024 02:49:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhmu3x8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3bmUl+cNo3q7FCwbsMzakefLmdIc93HVib45W1981xCpRUg3ZclEZQFbcySIuDqtgD3/pnYFI/Chmy3G9VpTOV64aMuB/Ccav+wCFFloguPHz6qg91soFSgwIPK1E9dQxcpfc8uhitq5DtsUrC2JkYviHC03K16NylgjByv0JTh8JvTla+SD4auGcMIWWTGF+h2jxt3h1TtITIB+AEiEQUd+GsNPzNLU7YTQ2+2rvkatTbS4l5Z8oPKhPZZk8O3IXxx7aeGkupcIc9xrSPurJM7a4MXjb448pUVaFfk4fv/DI5HPw5QRel2Y75RdAlFMYcwDqOzbL9dGudCVjChRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68UnRZnGMoDNs6NHnXpLEDyLCDjoFtatMqHgM2JjCcs=;
 b=OIyQPW5uloOOAUt04fSLNq42kyxJ4bmmSRoLOGVydNDJVCxOMiRgNh1WoWX8lCEZZOYeuS/fdY5rRcrBq1Afjyz+H2mplB9+/OdMwoyHZyoMZN2gJVgkaN9EOEvXRUmY1wa8EkYnGreUIGW0LeTBZfyzIJL1LEK5GWXsapxHRJakicZfwUKy1DMDd/zgTwgeubeRlw3X2b3FsqZ4QZ/CAfKdWcb84JSvbI1cxpJRUd2m/jzKJZRxkpMkOMC8yLW47UXKhjrHB/txLO4wwE4yunPhfcKGHvxHrNscqejAypagf/X3Rb3db0Kt1lfEpGs4rPx0BsCDYtAXSXFwxGKmlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68UnRZnGMoDNs6NHnXpLEDyLCDjoFtatMqHgM2JjCcs=;
 b=cmMzF0YG8FiqgXalyhAzjoZUctAeYrakkzdJQIelKKgJtVngRWCs8LnHoZs9AchL9b7BUyacvi6tY4Fk+DkmH7fODbHbCd9UUnf+Y5YqIzHMcZROx7YNux4JAxSo5uO5QkLB5zuW7oK5AIDudBg7mjyh6W2ajdV7FyaP690Dd68=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB7135.namprd10.prod.outlook.com (2603:10b6:208:401::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 02:49:36 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:49:35 +0000
Date: Thu, 24 Oct 2024 22:49:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 07/14] man: the synopsis is ended with .YS, not .SY
Message-ID: <ZxsHPYHzrb9FFsSL@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-8-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-8-nick.alcock@oracle.com>
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7a0cca-7416-493a-e248-08dcf49fa95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XjbRsZ2/t0XiYrLLNLm1yIwPYZs1uVynm3/dlEm2HHLa3AvU0O86+B8UpYGZ?=
 =?us-ascii?Q?8XNV9q61zCoxUEFRkEKJ438cFwIw1kA7UP7xlEz8xnLL5Vmjd6la6xCGf5Xq?=
 =?us-ascii?Q?6kUmS04osZeVA19vPbdl5c2XHZLDPgGFC/STlwFzj1WKHnZRRjUFIK1v1OgP?=
 =?us-ascii?Q?idEs9qzRt0YyJ1DBqk6aEu90oftR6v9MzzD6Pdm62HI382GcRcPTOH6KlBqn?=
 =?us-ascii?Q?4mg2ewPNyxPQ+nDV1/Sj7xFHhvLxC2oRs9x6pgSteNGoD+5zAfjGywmkT7tY?=
 =?us-ascii?Q?W6Kcu8L5b37RP1S5h2KpQP1ImYwCjiRZG8ArWddtg6ZB6L/dhI5tb8pTp3XF?=
 =?us-ascii?Q?se+M5aPm7+nNXn3EPt3eWX/b7LMWShwSNtGv2Zba6dlf6kdvikxLk02RWbjI?=
 =?us-ascii?Q?YO9TctIpZunc35lNw8dSg/GbpNlC+fKIGGB3chOYzBS2uKE2s475kT4XjULw?=
 =?us-ascii?Q?kQmzBUTEb2+BSMI3zvbojsdoJRMZzpfcP+6TwXEvcn3Ahjn/nYMkG5qh1RJ2?=
 =?us-ascii?Q?lJ6uFjgNxY6krjM/uoUPRjr/WTrUPjLBuTzMATef74ZeHXabEsgkGSW6r/Bv?=
 =?us-ascii?Q?zY/OibV2KUnkqM1T24BLirufyv3aTUCu/zY0zBREM+A80GHNj19lUN1VdtFD?=
 =?us-ascii?Q?7LVAnXZiFZciXlIB8aoaAfTBlPClmsjFe5JC106wHUHPlXrs9vwbrxvUNuy7?=
 =?us-ascii?Q?XGp2minyd/VkGAJnPl5HSP0xPGSTfBdpoBmJcuqOdvZeM2fZzT6zQNnLBvhq?=
 =?us-ascii?Q?d3FRrM1mA/2lw/sg87jXngYFPBUSFY8lz6dhyZ9uAMrdMzKHI9MGAmkbbvXH?=
 =?us-ascii?Q?M+Gb4xn1mvIPcaQnCK1gwI8P11tLgWVZIbG4F+ZqS7TiEwEGtgY0F8/E9pbQ?=
 =?us-ascii?Q?GE70+NE3qZW5ktytKk0N5GVxh4AJqpTse+/QDnJtcMS/rz84IRropOL04hNT?=
 =?us-ascii?Q?no4a9r8wtZ5dyC4X2DUBy10HlHO9/7F7SpknmbJIfzGbrVfFrBn4LMWXYkCF?=
 =?us-ascii?Q?/oG5exTxK9bm9Y2nJQzILiPqTjX8beNisKdNpUAEf86qvZgYQm+xbkyWodLr?=
 =?us-ascii?Q?pnKBB+P7i2cr33tvAz4mUdlqwnbKMtc/JMnHlz84F6sHuEe3ZhnA1uUNc8rc?=
 =?us-ascii?Q?0bv77UGYTLnvFIGHrx4zrHQHYp8aCrnZjA2aGGKFM/0wM75Iac/6fPW/jBap?=
 =?us-ascii?Q?ysE3f9WuQ6hCgwL1AiSiapkAgS49r0/QfRsDdg/mUxlcYux3kTAO82K2pOV0?=
 =?us-ascii?Q?8FVA3m7nBZGNkVLzgkDj6zQ1lrWUfuv+GWPMTslinMv+BqXc4QoYM7dG8mDl?=
 =?us-ascii?Q?vvDyVoVgKuiNCDZyPTcr1Bnm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?12fMJhD3tlDSKAeYWfSm7K1UVzLDqjY/JGhHOhuRymjEXD/EiXfvlwKBRakX?=
 =?us-ascii?Q?7qQFQHMGLMNBEjShzI4Fl4uidb25xqPMLEaC7vzH3KLMyyWn5NWPz7qv8dOQ?=
 =?us-ascii?Q?PgAakGFx9Qkd01aM1Nt0BryANS8c6cQM2lprcEzRAuIMQfdab8kA9GUzHn8F?=
 =?us-ascii?Q?X8bzdI2joobhNhgld/hOO1k8d6plS5vEZspynwiRC2zKeOlWu91CGP5nFnJd?=
 =?us-ascii?Q?n7PIxZeSGz3JBA0GuHdZwjdG8zG4+GQnpjwK0KlUGDM+aHISveGh/dag/p38?=
 =?us-ascii?Q?igmsfD544sp/K3kAZC2MtgDTG1cW7xbyZ/ZWUUMWztp9QkXCqOj2hE44jPoM?=
 =?us-ascii?Q?G+Kx0WCAw5sICee8u+X0LBDMke3A4Z5gZe39oaEC5D9rm/kj3psO6vd/sQGX?=
 =?us-ascii?Q?rIEKTvit7vnX3yQ1wbJV/liHl8v68sLrtN1IXompQs4bQik7GpSVmO7uYg+w?=
 =?us-ascii?Q?ryQy98tGfTT3gjoHczS9cjuk/LPNVtS8UkrdxhiLiFsj5yoUEPC/IUxLNaC7?=
 =?us-ascii?Q?6aNsGznK8BxSXB3t0CAS5tkBL5bBS0NiiW+pezl2SDtWW0igtkQB0Xsvfuqs?=
 =?us-ascii?Q?UZ6mfiF+BSKxddWwWhDaUYxCNXtrIvY21TNnUyMH3ODZRNXQJ060q11GdZm9?=
 =?us-ascii?Q?p/LLaZ/DfBDbLmU/vKr5clj2dlCl0awKKU8lqXEo6cO4b22eCxr8RxLCy5dB?=
 =?us-ascii?Q?8U5Dx2yaIpLjm2kmtuOj2SlwBWxk/muqjIIrSsnFSXikGpcuoZtB7LWaUnqW?=
 =?us-ascii?Q?VQo7MTYKyEqn2f7YvhHf6TyHtv8AqD0I9NPKx3K2P8MvvtNYRysxgTKQWdVa?=
 =?us-ascii?Q?aM4cJXUQE9CsoXaz1g1RA2J1QNeFh5VqTjDZjkFcuiDv4010MUIkqKgLjy2W?=
 =?us-ascii?Q?gM0D1AuTk8IyU69yqYrD0MPr0UJMtrw1vgTtXWFAlczfCdhsIj50uskprnfz?=
 =?us-ascii?Q?0u7BqwsN09naM51uGgiGJ5HjZjo4Z8Ed4tJf+SbyB7NXQ32785CIIS0i0LHt?=
 =?us-ascii?Q?jGk7SrO0/mfTydfz+i77gsrAWf0asOtITTPySzV8YZtb+KGIrgJkIzOslMg6?=
 =?us-ascii?Q?x2E870F59Njw8VQZzEQtaukuswtHxTA8bLXgvzuEjWk3HP1tINF5XVhZsQtv?=
 =?us-ascii?Q?2KVplGR5DTIvFADTjFplQ8sPJL/1oELnBiE78PWL45qkcYwCN5SHbgVhHDNM?=
 =?us-ascii?Q?OK9OBrIIwhfeM5etG+pJJEzwW6AUWeCxvYrpOk5OEpXkLIpD/4ZHxDrOnonK?=
 =?us-ascii?Q?LOwKyd+Tl9ckUluD99gk1BJR/cek+Sm/rHMlvb+NenIsPskMZT/tguFx3qK0?=
 =?us-ascii?Q?99szqWkowSCyFWKwdbPijHgsRas8/yq6dD2WzomOk4WkrH2q3UWyZ68yz80K?=
 =?us-ascii?Q?M+TMB+9DM4pzRRzt8iDcnvrq9qjkdlsK9BK7TR9isMXdIll1slpvT/3rG4Fe?=
 =?us-ascii?Q?eaG9Ik7Pr/VeXK1v1AocTTqvDdHrfvmtOwI07v2HhObgO5S0EPu/8bxlAzEv?=
 =?us-ascii?Q?pGXIgIRaNX36Sz4sD7X0NfgZn67xVBE0UcE0lFgazQ0aAZeMk0ChiO/pS+pL?=
 =?us-ascii?Q?jYfZ/OunP+esHMOxmkBm3o3nL3G+jY9b+sUavP51y+Vc9l6QDfKBnwSbI+qm?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oDO6sTBQlMTTP4VxvZYfuHDbv/Cr6WTwzVoNtXu23mkOOmEZvZjxvty/IxHM7GlHoQBT6G0BRwff/I1SM7Uo79bcbKwu2Z50hgMt+1lLEIZn94FQIqxQCJCptsK8dDRKgeyxI3yBUXCZqWI+ixVZAUimpa7xWzD/fe2MI5eXRb7+rWSQoIx1qU3sPiN3Td1EbPV3WugBY/y54NOUsAYOe6C8+wi2bFuYZpo2cfoGpNULos0QbkaphhpKo/qk5lRmmgQfS+OeyjrWgeNDnVKeCEdccsnoK4eKG6kPZSXXQQ+nX0nzO1ZffSoLMg3VC/7qsPj6vxZg1OKaFbQyQV+FR5iDPeA6ddigxaCvp9ejSxIID9P3nzbu4lQy66BjD0HCiLr5HPV55qKLYjI9RGxO4Zg9GRf+Fik7PhHxI5JknBmaAxFw43/uoTqLVXhi75DrmVeUwiNNKoRm54aEvV7ktRfTL+8ekaFL2pmmZw2pr1A49IoaM6Xv0XRBF9oIWJfeQkYqJhNQBFRM4cisHTA7Un6SKA116ZIWSAPHbk+288Io6iQb8vKZUvoeuwn6byDdpW6IY74jaQU7EE88b0/HL1JSmRC0xtK5/Q+B6v2I+x8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7a0cca-7416-493a-e248-08dcf49fa95d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:49:35.9098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QAQp00JxoHxY74ZwDLoYDGHQbqv6Jme4VH+rTKekQbAK3XiHAHxU2DpCU+IgBdowbUEHX8qexjNqu/vdBA+/mU1qI0O2h3RiCJSTyoq1nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250019
X-Proofpoint-GUID: UJdxuHTLklvfQ1wasVu6gSjbgxzu5mxn
X-Proofpoint-ORIG-GUID: UJdxuHTLklvfQ1wasVu6gSjbgxzu5mxn

On Thu, Oct 24, 2024 at 12:37:51PM +0100, Nick Alcock wrote:
> .SY *starts* the synopsis.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index 0a1a15304aa1..940ddfc65d1a 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -33,8 +33,8 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
>  .OP \-n [[[provider:]\ module:]\ function:]name\ [[predicate]\ action]
>  .br
>  .OP \-i probe-id\ [[predicate]\ action]
> -.SY
> -
> +.YS
> +.
>  .SH DESCRIPTION
>  .LP
>  DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
> -- 
> 2.46.0.278.g36e3a12567
> 
