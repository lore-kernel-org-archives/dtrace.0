Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910669D31
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721332956; cv=fail; b=BmsBzfDEgR11HR5yfVCOwOfqAxPYhtW/sf7YVrtEL+KL3pG8F3aaETuKo4QAIkkZZhK70GHfwgRJiixTGR1XACTnAqRkDYtbsnsvkvgvzEdX0qm8XgOdvogbC/4bLII18K6ibFwrABBHjV+AOW/twBiZgZf/EX+4wDeZnBmKqxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721332956; c=relaxed/simple;
	bh=pJeWgdhyrDM1I2GRJJJ053Yr3qccJbZxvVWE5RSDN/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gtz+2zeguDv5dEBWWDBCayNuVUv67Tccd+KkBhOs/n2Dj1unbLyUO27MBx3eP82L1xhQaUywJCKGX/dkl19KG3LYgVs7ga3KX5jsr1XHCe7QLPGqzf+70wko7hT9OUkYsp7maokbYNnz1wqM5EgaJpf2XuPjaxcvypO81RzMaD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NetofkCH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vh79lGcT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NetofkCH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vh79lGcT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IK0k3D026189
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=/t3QVaFeLC3XXwY
	TgohXeYNeIEqJe8rJ4aqYqAoH8aw=; b=NetofkCHVBw9YpoH6utBxxSpa0whR/N
	0QSnzgfRVAxTveGbRWsPF6DaeCbKQZSzrHjtxI8xW4aJJtsQPMfpw6A9WpYXO/cY
	E0seNvbKRg+RjDkvlPzZaVZFSLlGbcYlyeZ2MTvGfFgnLL8XWNJyhOdav4brxRnC
	6a/vMBVMKMvOdCW8Hjvx1FMlpMqVVwQmg4Lg50hlLEitMqURdD9C4Q6DbI8iSGIZ
	dE7Ql0CGexesOjdThQE50101cg9+11QCzFHtTYum4LSfP6Ltqr6epU0idLVoxyX4
	a3UUB9bxdfJC/FJ50vYdo+Aphm93k32uDeS4e1OVNFnMk7dzeGuFffA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f9q280ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:02:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJtlNx032000
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:02:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf08rcr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2Q1EC0MCkEKwuHuOO1t88G5xCjiAvN9auqGe/DbN0My7u5v7JHkMrh1ijhbZsN3+Sc1w+rlJSunBrU5c5YmOK0MslQU9Knl9qtZDFrK3N9h4PvjE8xEM5mEtDrFw/h/o156tsUqQZ2KsyVyCcXvuFLoK9sSYhG7YwvdNmjdVbhkfT8EkJ1BhC3BJMSXUdf/rDBRXMhfnVuUrsBYfT73ritShTzMjWQEv6jBZQEdAqdrS0Ms5Bw15ZXVP+eFmvo+2YFFWfhnH3Jc9hmS4Fq035Lk6NE1iii8GOhX88WBFmBLFM6QvoIibhovNKWLGIph3bRt/azp/f2Vk9nAi6e9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t3QVaFeLC3XXwYTgohXeYNeIEqJe8rJ4aqYqAoH8aw=;
 b=hdIBv42cnfPMvTQhlWHuam4OCdyt9iyrvyuhzIHL6dQyB9LXZmQD2TVGk/7EweCdEed8Ox2WW0fIuljlaLcv7Yo/Dgj9ejmlXR15Lri57wtQBNrHwpZFtGmUFR6BOSoPP0gPCpMF6u/6GDr5IG/84VgUXGgcQ24jjaM0qwb4i3HJ/wKENW9azDbEYRkucLWiHxzFpWqVrsWsljAjrf/rvPOKFCN2GdfVJJUaIABJlv4NOgBfJi1rsTQsPRw6FKMK9+7jVh8xGGFkwh5uwHMfN6XR+F3NRiykC59uQZl6WJNxSUr8KVHnha9HSbsZdN64cTozLkVo0u1MAhwbZROatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t3QVaFeLC3XXwYTgohXeYNeIEqJe8rJ4aqYqAoH8aw=;
 b=Vh79lGcTlshNT7Qv0lZyVSkcQHWMnoEB3CuZZ3oYhrixh/yF8ljdQwb8+u3h6F0OjAvaUpHvLmAsU8ohh9Wp/Uz85FgQM50YFBvc/lbFiOtsArboFvHUnPgd2+u0RQuN/5GMc5Lh4Bcj8Ce5ORl8DCu8R/R1qVi1OlRl3P9InzA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA3PR10MB7024.namprd10.prod.outlook.com (2603:10b6:806:318::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 20:02:30 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:02:29 +0000
Date: Thu, 18 Jul 2024 16:02:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 13/38] Hide dtrace_actdesc_t until it is needed
Message-ID: <Zpl00nXBgngkAvHt@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-14-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-14-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:408:fe::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA3PR10MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: d10c0e8c-4ab6-4ad5-7f21-08dca7648dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+CSpthxX03/tjDJTUQyX0LmWMfZ/PF+z69O7Wc8Y1oaI4xk7qVPtaKzipMi8?=
 =?us-ascii?Q?5iWXEc5p0G60T5SPfjTbMfWD1KRKwKvKR/QhwO/fTD1U69ycX0jFHyiHBlAv?=
 =?us-ascii?Q?MzVHAfiwynn21EpA0F2znwlW0Uf1RwUEWVsLa5ijWyFDsKhjXATTT4xaxks5?=
 =?us-ascii?Q?iZp+diL92xHBv24eEWvlElLDuMy4b9Ww/RA+noBkTAYUfjL40aV6PmEaKqSr?=
 =?us-ascii?Q?slYXn7BkKhUwKFMkne9DqUHCL5DPs4etxP7AnuKovFF3erzpVnb7hExQtyKS?=
 =?us-ascii?Q?gp+o9/2xVQKxOUf9Vb/UYuhZZqiUlDqBtMOL7Ol6qyxW8U4aB3niwJZpTZ4G?=
 =?us-ascii?Q?vykpkmMQ+A4E4AiDXHGEfLnmSlbe3ibFM4hZqq7beBQNXNPu0xbZagWWFRTL?=
 =?us-ascii?Q?3SmK3wIE6mvQdLJxx5DWvn9HDSjjNvXnFyGosAPkR02Zm2IKARSi+wFp2hgd?=
 =?us-ascii?Q?PaIVWew38CEl/9o/Fte7N+al6oDC3aYJUQmNdbBOz0lqsK+TB1fRzgctB/j7?=
 =?us-ascii?Q?3cxBMTNC/DW2xWjXc61CI/Uh2EWGr9AWApKKi9m59UVVNs7oD+nF+2Q3rbvu?=
 =?us-ascii?Q?B1xTdGwNjjFwsexVEVUlGVEWjBocBk0adRueOCUC9LpQcJvp55moZHRmu/08?=
 =?us-ascii?Q?0GuXezmpQ8O4U9m/QT3o0ZCkICr0N99oVfQfh9RVePlU9iHMwG/JWoIcHc6w?=
 =?us-ascii?Q?fXHJAO9FYZVnDbCZMIWhON3LRlwW1FcNvV3l5MkO4E7kDAw4cwdsLWTncLdI?=
 =?us-ascii?Q?d0gaoIoVGgGgfdugtDOCccPkXFgyDPrFp/QLXWGtccod/PRxvyaJE2Gn3OE0?=
 =?us-ascii?Q?hsBA/hINrk6RIoTykazGdkXDuX6zFtezJzczNqTpMV9BKwmR+PrNougB4k7M?=
 =?us-ascii?Q?tKV56Krp+GcCH2ymiuzkQ6PpRE+pIOoXTShnpqsp31KWrFpEBWmnQvvNFSEm?=
 =?us-ascii?Q?qaqRiaZbq9Tgz2pMqrXF22Q2zqClaoxn3m03y65c4iaXRtAY4iulbqWYOOBQ?=
 =?us-ascii?Q?L/PFsgErAyKAsETHqstViD7G8bKuqgcTxttjp11nf3j4mOaqCPV1sgEGQQR1?=
 =?us-ascii?Q?vBWI4GIvKXB5LqIFGJlsCVu9Sp4CPgqgtUr7BC5xXkbZshmEvCn2zDT/ofnf?=
 =?us-ascii?Q?Gu14xawR7jUN3WrA/fVzUamOt3tWbj6tAgRZPyPkbL0ls8cJbqbeVmV4JjE9?=
 =?us-ascii?Q?zSDFjU5231IKCoYTvmlgpd0JeKHLBc93Tdea3Gt1XrUNSt4fCCANZu5dxba4?=
 =?us-ascii?Q?hBcAhhH96biWdasezK2vpDb17GuqUbu5TJy+cuG4/17P1lWhLoZX/0r/uyHl?=
 =?us-ascii?Q?WxeeqAMc6de/FtkJyY59llA/m3Etl/7OEaPfDfCxpHvwkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eGB/SlbGnJhOj44cDqk/7Hfxizw8TQFkOOJgQt/KZTr6cb0u0cwqWOnnOY9m?=
 =?us-ascii?Q?JKwypRQM77WTEHJVKX8/vGDygvFHfzXgkEhjMkfjzud+3rCiiNDCvlRXhBLw?=
 =?us-ascii?Q?yxrLidivYwJA6KI6fzO74TZEQf8RtDiDvG0PIWRzVX91WrDBcu0iHcF3Hhuz?=
 =?us-ascii?Q?/hbFErQxCHlQpFPm6SjjiQN+JxnjNwSNvypttfYtluWNxPTy/hibnPp5qm/P?=
 =?us-ascii?Q?jzkDqulQ6nKQ6bJ7v4KqusLD92G4UexeUhrlFcr+tkfwui3OllgRZCA2gnOU?=
 =?us-ascii?Q?Xcd2CST5CH+edtxQBdZo0qtpm/LW4MaB+nOq6M+/3erJYGZzw/Ewa9jbW5xM?=
 =?us-ascii?Q?k5lF4m2cKIOubQiwKwmzRQQg41AbbJIYB97t8v7EbTqMDH4oWcWTFVBbhx0K?=
 =?us-ascii?Q?KQHfcJf1H1jdUbqH96DbxWC050PkXkQhRUeNzvXLDuEDNi+KQNtN1sKMXFZf?=
 =?us-ascii?Q?NZUP2fcgqBP2DOnmfLgGLPHWb6UxMjQ56rpOjvSDsOMtPXJDt5tTz1uQOU4q?=
 =?us-ascii?Q?743V39/TiuImVStdwEmi2SU/7lkgtHulHvjYDs+g5gEzabtveXKy1qvj9NQ/?=
 =?us-ascii?Q?GS+AuqOlRbpWxVkI7KoGNEef8Wud7HnjMM6yFowFYRb9VEPtj5cz2G54kwZE?=
 =?us-ascii?Q?tqGePZl9ILmWveAoHp8zdwXkOZLIEVW5Pw5dTgRyhUTja7Dhyc+kUtEtaBya?=
 =?us-ascii?Q?UJ0eJtVpJ2ZSi+isN22e2McjJetnmB2a2uMu0UcBwZ13rEI6tf+9nU0dyN/q?=
 =?us-ascii?Q?95Hf/HyiieKGKKGp65elYdVPsQGt91WyIKXeI3Gr3U379yNAKqW8pMx72z8o?=
 =?us-ascii?Q?hna00oxCEO63UuKZTHpXM061NA2kSwiTG2mth6elZ22DOTnnhFN6KOhHSTnk?=
 =?us-ascii?Q?245oeqJJ304szXpiBunp6+GMmbUNyswPBh+46iUCkyLkRGH9bOCpyIVNQXlK?=
 =?us-ascii?Q?vCb/5Q6eTeqiE+nruamNZB+RpJ4f6Osd+rupry3xeLLQJDy0hL+OMl9B0cr6?=
 =?us-ascii?Q?UCxo97lczFVAmU3ieYvNm6IC6JZz5FA4BX1egmRWmbabnGO/nXIbHboUd4Kn?=
 =?us-ascii?Q?m5JqVmcgAaZ+ExOZlfRjzoXhuuOwSIDy3+fyrPmhZL+2Mil1u2kGYVd7Td+L?=
 =?us-ascii?Q?jenRu4iGM3yiMENnITLyPA4wiAzyc9e5BdiGebnrNeF4Z4QGiyQlbcWLPymQ?=
 =?us-ascii?Q?1v2rDxDP78N0KoH25lpp5WYcEPAPMEbzLb8OR5lc6Oa5+rx7NgxNy3MaSqkq?=
 =?us-ascii?Q?dKf3sIyV2WDndKUGTNaZUs2p7gdEAh5sN2aXjBv4KAKZe70NC0SPanlKHxPu?=
 =?us-ascii?Q?RhyPUaJw25Ba2yXJFOKAcEKUwBK8O5GTY0RUQ7seOI9w7eLo0GQToNz7dOuR?=
 =?us-ascii?Q?8TYpCEPp5c5VA77Vyp71bnuHJqoi7vDHvQOGyTE8n+P/YinH7xCQ01/XPpFW?=
 =?us-ascii?Q?lk6f81hyKOuKXZUt2nv5XAD41HXD9QdnT7tksvJ3PRCpHopyDSg1CNkAuNHe?=
 =?us-ascii?Q?IlLZE18zWABR8v5RI/g+UtzuwGRLV0oXbRmsHU32j53lRTKqkkVVartS101D?=
 =?us-ascii?Q?w5OxYawXoQjdU02Nz+MZzFltpDwLTrP2vg3V3hiIoxpv66UNkcKm0fRSZ0h5?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Esesmfo+0bYSDBQSMiILL0QIpuq/El5oLbDtFp4A9KICtdSWwJY3rIXrWxQe4+a6MA+Q4dD6RIXph6EzJL6UXdxCU2jR0tiy4Kp0G7WpxuNqoCHdwOSxu6VyWDWz1Db81CPPextxaQ35/LBc9RfXZ8C+iLUCcCflHRiiR/7ozD6odI3J6viV20dv/EVD3dDMEa40Ca9pqaUddPo9CbjchK3E03Z0Emrms0837kZ0jrD8GhidMXgglvavygSjP/Mk4NZtJLfaf2qkMpy5RoUdqUYnlwXGfNICXUatxB2+zfflsq/LDks+jVNarKFHvwalhqS/4Xu24PZSOKj//J8Tkz0NX/EcFuxGDRKtrtb7869wFe1Dkg57WWtwtmykR4GA/4zoFmgpj4c16gO7jFd0+W8jxKlvFy/dQCQ6jka4T95vuGSB0aiDG8WHV80uB9dbF6d0QSR2G9AqDZi5G4G7nTWt4S1NA2szKvp5zSLpgy9ALMyiqRnzvm1vhyPO3UhaZY2ooYGdzXD9by1sQcvBopLGZy6+LsE8u7SWaHEQLaPUCXwVkB1zNqO3waKAXebuMpvMew9R19492FfUcVKcINPgH44HP0ld9eLSfhlR05E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10c0e8c-4ab6-4ad5-7f21-08dca7648dca
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:02:29.9057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9/IfRSHt988Y9hgJjA2honBylQL2t9Kk4Q6RppxAp9ObUFppvtwVU7Z76CChZ6hB5ZN0jH2qFvrC2w+zS8mg8WqEp35DhwaBjWwtbYX8j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7024
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180133
X-Proofpoint-GUID: ar_TDNuWJdJnEZCVGG-M-xqGkImK6EKo
X-Proofpoint-ORIG-GUID: ar_TDNuWJdJnEZCVGG-M-xqGkImK6EKo

On Thu, Jun 27, 2024 at 01:34:30AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

I think you should just get rid of it.  Worst case, we can always revert the
patch.  But this type is only used in code that we do not plan to revive since
we no longer do DOF the same way as the older version.  Even if we were to
re-implement the functionality to save compiled probe programs to file, it
would look very different and certainly not be action-based but rather BPF
code based.

> ---
>  include/dtrace/enabling.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
> index f1ec444c..2562c87b 100644
> --- a/include/dtrace/enabling.h
> +++ b/include/dtrace/enabling.h
> @@ -43,6 +43,8 @@ typedef struct dtrace_probedesc {
>  	const char	*prb;			/* probe name */
>  } dtrace_probedesc_t;
>  
> +#ifdef FIXME
> +This type is used only in #ifdef FIXME code.
>  typedef struct dtrace_actdesc {
>  	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
>  	dtrace_actkind_t dtad_kind;		/* kind of action */
> @@ -50,6 +52,7 @@ typedef struct dtrace_actdesc {
>  	uint64_t dtad_arg;			/* action argument */
>  	uint64_t dtad_uarg;			/* user argument */
>  } dtrace_actdesc_t;
> +#endif
>  
>  typedef struct dtrace_ecbdesc {
>  	dtrace_probedesc_t dted_probe;		/* probe description */
> -- 
> 2.18.4
> 
