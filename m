Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4F16F0FE
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731711318; cv=fail; b=BxZKUFg9ybt8YMkrNlE1BQx9AWxpa4/KEutKGQ2sAbOob9+GoWsk+eJ4jhdXnTKX3unj3bPXIArx3KCF4RC43KmES3xQy/gnDDAkLoCIVdmHUz81Eoyq8LAZDb5FZZ2ozndvxbnztn2SPRg5bjclZF4E9Pr9+G+D1RH2QDwrZZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731711318; c=relaxed/simple;
	bh=975eJjYc78lRvyiy6UVn49XJ6ah85OGfYumngFle2+w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=r7UskDT/GkOE/L6Nql0vTzQWSJUjX+0+gARB+EToYarc+c7KGpc5LrFlBgnAFDFKtB9asiUJUtUsUV1GuuFKpGllbLbk02Of/dTzXh1x5f9qc+uXMA+ytZ+1e9s5zkKvSjda8h77CyvzKFIW5E+YhZ52i0MZVdXy1r2s53PTEUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LnYY/zYB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XgHRcFgN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LnYY/zYB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XgHRcFgN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFLfdsd004227
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 22:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9sAk4BJjG5Sv8nfMcy
	doPbdWLZfdO7jY2kgcP1fWlq0=; b=LnYY/zYBPqjVCZ1Ybsx8gmYsgumrsEqLKY
	b+foSfs1SMRs52Fz2LHMZ7eHVEfV13lE+EtktFzmW7kmmFw1c3pkirSNLTUd5AL5
	4J3jKQJvg/BszfsaYxzoU0KvxT3LpZMRHKw2tPitnOSpHGQ5PadkXL6QDEZVw+MR
	WgbjRZZ2TauYzoCDDAoI++ClwJsVZmQKJbWFezMmtSBba7FAQTBZifzveH2ysAnR
	L7MVoJF80PurZpeOyR8dE7zd6cz6FdHA4+C72d4aLSFz5PePK4F5O17pY7I1n/53
	tAvS6NK+JJaeUOGoUrz6x8JBtGz1tKbQCWC/1D58ZZJRQyzMlrgw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0mbmfrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 22:55:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFLjh78000483
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 22:55:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42tbpc7jwx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 22:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtWo2VybSgzZIEj2fsoYwlz/qg+7ayszcBEU40E/N3r/n5SRkOtsACYPijhgD2dumKT2MPL+/i3/88ACiMWwy/Th9QN2KvrXoPpQvJpMJTI8O+Gc+cVWWpCHWVVfy66WB5EgP1cogpHWLC6tiuVmcpMEkPanFMik2cgmoQI/c7QW3I4U9o7S/s8/btCAKVLhxMghGCyBh6gCDprrPK+88ZBXUIdetSV2pIQJeKvWLNpZEuigGARRuU51ihlHxzkRgcqWCluVQfhOZsZQYcSOG8bl5bRha8YklulK8Rj0DvyYeULBg9vLwPtbmFxye/9y5l3ffVMXy29ZMlQHqd3Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sAk4BJjG5Sv8nfMcydoPbdWLZfdO7jY2kgcP1fWlq0=;
 b=dYxZhIt9UlEnXdE4oO0pTM5lViQiXd1xie8ig5GEpB0mvCdn32VtsnajCav8BRApTdm+mc/DxwQL47pDLnk2gHHS6hpGb3pjyE2nu3ZWq5wODUdpwA9mitkDCX9b2meakdzOyBaGq4mYaJphFuSJq2CC5PI9FHgpLBE9nThPHuo5ino0RDufA2h4n8N+B6k5PeU5SS2SjKk/46p94LhUZSxEbKz5TBEZ/uL4z/pTmjFPwOkykRkdGO4bC5n8s7jUNPU4G41L555AMWwqSDv88tuyfJmutpkJ/QVOROIUWhgMdv1JNK9TdmnpXdcVLdJTHlfUgqfdS6IpRAuw2v4Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sAk4BJjG5Sv8nfMcydoPbdWLZfdO7jY2kgcP1fWlq0=;
 b=XgHRcFgNdGUJ5EjbvwNm+7D4gA9jaC+zRM6696JI3hSAl2PYKI2Tlm/UAZwtrQC78D4N2mrJTbrjPhcFjkc/5FuBORTOshlP46aI7a18btCDa5CMq7GhurLTaM5+sytx9tF1ozONmE6J0PrqmnmABOmxS4VMBvxaMIaBlFdkQ28=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB7310.namprd10.prod.outlook.com (2603:10b6:208:3ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 22:55:11 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 22:55:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH v2 4/4] probe: make it possible to destroy probes in
 more cases
References: <20241114220108.95647-1-nick.alcock@oracle.com>
	<20241114220108.95647-4-nick.alcock@oracle.com>
	<ZzbUalCqoBgmUzPr@oracle.com> <87ttc8rz8s.fsf@esperi.org.uk>
Emacs: no job too big... no job.
Date: Fri, 15 Nov 2024 22:55:07 +0000
In-Reply-To: <87ttc8rz8s.fsf@esperi.org.uk> (Nick Alcock's message of "Fri, 15
	Nov 2024 20:57:55 +0000")
Message-ID: <874j48rttg.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1c964e-53e0-44bd-51eb-08dd05c88f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IpLLnEA0TllY0YcC9Gbr0n2lYDVR/9mhuziJ/vDGjzBJ+V/F0dF+1D3UOqvM?=
 =?us-ascii?Q?CuJPrGfNaHI6Wvskm5PQ4AsQa0s/E8VHVI6T7enyKdDtPXtIzEybpaTW3V9u?=
 =?us-ascii?Q?kcoAePwhPH6fvlFj8Oe9lqb8dt/AEe6I0sA/T0g0NTJBrzTcGyqMs3oPyavq?=
 =?us-ascii?Q?xKyVuIpkRGjj4oblm8hqQoV27jspLkQrWnof3acIiIe99mNEZQBIe3U9rGnU?=
 =?us-ascii?Q?0aJg9JMa/GQfK9QUe/Oqoz0FfQ48x+Nk6iohIF0gZ5L6K5qNyOaHGHJEWfQ9?=
 =?us-ascii?Q?oW+0KwVxiyV630SGLwYw6mDfvgquWrHs4ovEwyMrcmIrWew26DZlOOwzKhBE?=
 =?us-ascii?Q?4bgztm7UYdZbBgJwFrsDnKB2eWk93exjQdzS8ImTM4h6Epsze+L4k5pBJ7XW?=
 =?us-ascii?Q?GULfJEp8ZMlH/Bhc3GzEbucAtTl/yx3LquY3EyL8kvDSzkY74bHS4iItRRqT?=
 =?us-ascii?Q?IGoqvkHmAix9xuhjawkQnXmo0zZP5NfZnZDwtMxx3kHto41EH0ubjbBweMph?=
 =?us-ascii?Q?38jKFd+I6SM9AjiQFR4A+Uk3CqHgzIpOoK07SI/EiNIImI5JmIHExos3Zvqg?=
 =?us-ascii?Q?2aLEQxQEsjMLBf7w9mKIJo92AHetc0lQ7xWsCNLl6pHUlJ0mZbqVcIIlldFa?=
 =?us-ascii?Q?+VqMrIpWLUa6SwzVVqoyVp07Zd5ChafySdRbKu4Rf+M2h906q7HFmTn2e1hZ?=
 =?us-ascii?Q?WI78pBMdSMUt8uhk2dPJKFUWtTr2y7EhSei7lnGiOYEcRh92pSV3p0iSk5gO?=
 =?us-ascii?Q?75VOnK93x4yye2myJ7aLy2FEI00R+Ax0kAZrhs0bW/a3r6fvJh6yhrh4F9GV?=
 =?us-ascii?Q?vCRifxkPQPVI44J8xBM/8gwHNaBNrKH0Sb/CTpTE3dEPtGwpuVLzPDNW1H2m?=
 =?us-ascii?Q?NKEnNheJIdzj84Mw5ixgsAvt+YiMTiAMLcG/zQjmrG9Wp/W4osJ1UFBlZgkU?=
 =?us-ascii?Q?/MXCONM0ypof/cLxN5ADyfVB1r/5pqtGKzshrj/0vKuZD4rppg50iVfgX2SO?=
 =?us-ascii?Q?gwlwRiLPALxadv2+oaWBEzkyWp9OKkF9Jghme5rZxwSztl1yjINgMliA3ZON?=
 =?us-ascii?Q?FIX5oDeOopVA3v38lY0aeKnexBvKoTH0tGmHv70ffUm+HNLQc7c3PXlnsgMu?=
 =?us-ascii?Q?FzaLk2haolEMEYEdvNaTrAgvKsoB3POKWXRoLcMTeqx1AtUtn2sYyF04NGMJ?=
 =?us-ascii?Q?rQNhnzft5Mj8731YOUh4b4mpFm2ND+jdaJte0XhapP5RIdQgykDZ3fEJjv7r?=
 =?us-ascii?Q?lx9j8BOKvFnE5EnPmtBuPaGF+jgxHYQIZw7dBkDjc76uXjRb1afrotWrCeKC?=
 =?us-ascii?Q?5YXzwsf/VRGnrMDoOTR9Y/TP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7p5R84LzmahWO/WVAHNNRD1wWRuEelSbp+YL56adWD9d29fBeah8M/sttyhc?=
 =?us-ascii?Q?rfj25HE7iHfpMr96v2Y+9i+QYA5nx33btc03fVt/2NjThcBJHG01dS0tOMt3?=
 =?us-ascii?Q?kK8cDvCDx8mJL3BkyCBtZC+v5qu4Hxl6bO6gLNYV2hMsp+vl6HoHuTa8YEmE?=
 =?us-ascii?Q?Lv40zygdV3PURBmWxeKvDPdiTuuDQ22p7EavoHywbtRfVp74gLa0/lOWiKSI?=
 =?us-ascii?Q?yrsa+lwxF9Nv15ZG/seTmVeIy8mIPN+R2tckrzYmwilOn12lu9q1h/4Pi/rd?=
 =?us-ascii?Q?TorY4vubjaS9Mn7tEnhyo2iZd7b4dILJNkbhCqvfyNdVEH9jGTRkQws1ilyJ?=
 =?us-ascii?Q?Uj/5ubGERTwMu2fmpJ4UqdqVi01L8K8rkx8G/4YRkkxHCvgnfDvt7NXN7fiG?=
 =?us-ascii?Q?NKy3J8I/SITtJR1iBIBympLR6bcZrmAzU5LvxcOVuVGq27pvYMcB7vRT3xTC?=
 =?us-ascii?Q?lbulvJc+K5lmu7+ASL0H7cS47QhU7ZQygI0V3Pyj74IeTS2sEHBsBKVam74e?=
 =?us-ascii?Q?G0IgF4mtUoa7wwQLDM2GPgqz0SXUxG2Bqcf9JNpRTV2NMpuiT6BOahRQZyZu?=
 =?us-ascii?Q?Cy4+N/oziwDkej1CFqGTcYSFBvQGWow+zB/ITdFH9+uD9Q5EmviiCyFMt3QA?=
 =?us-ascii?Q?UxstATLMTHiNHOPKAi8Y4dfmx4g166vu6cs1zmeFf3y23yNsEVNZBvuou2GD?=
 =?us-ascii?Q?X3V4VslF9OyCD9oBjlxgqWpa8RKi1RmnJ9rurF/kTvjtxKnx8xz9IEWvO2sz?=
 =?us-ascii?Q?aV/iP5ZuSRHBIZox7tXpmAcvgPpIP8eNEFptlNogWyM2EJ+vWbK33FbxrPFi?=
 =?us-ascii?Q?1htR0fflhRI48wlWxRPwJSk/tk184jlEeVShE9fzB4MJ+h32H/T9iq0Y52Cq?=
 =?us-ascii?Q?di1h1ches8o1YCWWOR5yuPl3sDHdvmvv0nOwHFgZGqRP4D+HH+F4BSpiRbXF?=
 =?us-ascii?Q?TePx97s0LHrn3p/5Np2KZKs0u5ojROCkmoZ9DfR82UnD09MUnd1EGPMl89nw?=
 =?us-ascii?Q?2Q39zRDVaDlznOymbwA2IU2LKJlUwrH8J/CW1iYkxTzzF3qc8p1I75SZfziQ?=
 =?us-ascii?Q?vH3E6L4pq9Lz5j9OGRAHyUBq6xUD72qjOYY33j/Uvu/DrFWtdstrWWvQdb2Y?=
 =?us-ascii?Q?X8B5yRmGkRqXuVmCQFkK6jS02uxTQqgKFf4h7auOdIuP0bantFj5kYJzO3b/?=
 =?us-ascii?Q?abCbOFFTIZlYXJL3Zqa4wAN/ijJg49KAkyDzDxpiXu5No1esqTs3Yos9QITH?=
 =?us-ascii?Q?CBdPuRcAZ/qpyxW3PKtkPL6dtZY69eYb4QkcPjPF5+JT0A0NgCt7mV+MxlQT?=
 =?us-ascii?Q?4q6trF0HxxbXo0KozgodQjuw7PlfMYpeGXRU65ZI82igwJDmMmih3PrCveGP?=
 =?us-ascii?Q?A91NotNwf+/R3cAvrnsanW+Sn2sxUqZa8p+URhgGGiQ6XW9W7R8ViNUNVrzy?=
 =?us-ascii?Q?UK3BMLWd+XSv7UcRYFstJLKAvQhXeolCIm3Vy+pApakHKFAjOHciAo/AzCm0?=
 =?us-ascii?Q?4VYZ8q9v3UOgQMInboefFZqhSBAKlpXBCu3M49NcajAlH2epYPbZ4afkWJZZ?=
 =?us-ascii?Q?UVfa/Os0yTosiiGT8kV/LPoO7sda4LtD8oOZhbh2KQjov3Ig5YQ1S1Oq7WHU?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MvvcL/km2UD+sJ9qEN23Q+0hueDItiiutG7oOHkZ+GCCuzEJQ6MwQ6dHaWTVEL2In8RdrduEJfORrem0CbnHykr++hZUHxOfWyJVXBg0DXJtJYC5soB2tzoQjeG7LUQD5BbCrIiRSnNHkUkE0B7s45mfc274XbXi/7w5WI+CHDv33u6SQRXe8yBcygYEpPHQfjeTMJeJbv0jcXJurwBleSUNvjckI5u4vdrWaoEBUSDJeSYqe87hkxeCd002rqgS/BlTNkZgUAYbNlY1B4Hk49nwC9nZWsn1dy/KCVaisQ5VpqHJofHFcnxC7qKfPUlVlDHueGvM/NHf3u1OMY6ZlDSUOb6a/iE/t20gTNJZ//ZpZmGBPt/LHY1Isdu7sLWCiFTJYSaHGlI7CMVSubaM3QCVhiJ7re8lc0F/1N+U3mEcRH3fly04Qwf+dpx1XRXFOBNxXInL8o0N2bXAA6cHMpKzeJK9wGb6cec8h6kRln4Epx1otCMPNV6xrkQH9R99MJn3Lq3LspPuWwuoFD9RE6Vvl2y2ZZCKQ5RQmFRlnQJNp51HEhwtF1sObDvJN0h6L68uk/x7dLFDLQJPqmUsP0sUXgvabTcjIkdNXJtycA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1c964e-53e0-44bd-51eb-08dd05c88f03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 22:55:10.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t45ryX/SH9lABpts2zFDVBotV5o01HmODhikgZ75R56OYwXEd0z9o4CW2z0SkuftgcgxlRvLS1s9FJUN6MmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7310
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_09,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150193
X-Proofpoint-GUID: laWdIn-8wLR-JASt3A-4HpTMXEH2OJkD
X-Proofpoint-ORIG-GUID: laWdIn-8wLR-JASt3A-4HpTMXEH2OJkD

On 15 Nov 2024, Nick Alcock outgrape:

> On 15 Nov 2024, Kris Van Hees said:
>
>> This patch is not needed.  I do not see any failures related to the changes
>> in this patch and the test case passes even without these code changes as
>> far as I can see.
>
> It didn't when I ran it. Try under valgrind.

... and now it doesn't for me either! I guess 3/4 when done right (as
you suggested, not as I originally did it) obviates the need for 4/4.
Still don't entirely understand *why*, but maybe the probes vanish
before the parser terminates, so they're not left lingering for a late
deletion.

-- 
NULL && (void)
