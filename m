Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DB5028C
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733437055; cv=fail; b=UE0B4kWQKovhtNs310HPAEuuTQJBfDlTSoRjth87xFWzAn2suMv40vpecMpkaYrn8gQ0mcxi4/AreWyvmUHd4UyhUQN4O6gVo2iiGrlc/CK29Gsyum5Gcr/oCcGZBIrDYaUGHcvdDWUH0QezfftyuqjFC8KpKZfeY5WJI2eZrT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733437055; c=relaxed/simple;
	bh=sGJ6x7aQFm3Fx/Qjo+BIt0ZYrO01rEXtDRjhjce37hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RQFgdN9a6+MHtaGGKtMRhOLrY/aX/CBLh+A/5hIRwgQb2MhsJo37RQIR7E++3klWSMA0q9j+6aMPWqLKICKiRwEc6sH3v0QQ81oiZHkAUrE1RsI1STD83IPj096lsHWKKgYZA80Zq2b0LScUlVYVdLUTw8IDS/kCsm14ZRhSknw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YYTKCPuI; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Yf2D56m2 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YYTKCPuI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Yf2D56m2"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNYDe025096
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 22:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=I4fXXYL+z5LqzVjmm3k/QmaG3fAOMyf8oDKcT7mUBHE=; b=
	YYTKCPuIthxceZX1ng+EL6zjLa8XKmtdPMmrl8NDVbS6uhasfle3uAyoAZPzMHJM
	JLu4u2fH7Xfk1/kVPi84OTDUIMpQURhScLvT2OBzSpUtSE3QIeBhoMJFgvZLHsO7
	x/a6beFAvah485DQAIuwHAOG7Z/J2I+TM/qPiH9t4Qy59DzB2DylDohOlV7DbUzr
	85dUaB0xF5cLNZzvbj8WsNpUXKn3KkVVhdQPubq6L5uKYvebF//o7YJRI+XfG92K
	VMdO5y/JyI51XWJnjH/VWI9LP9LFIkxtjTCZLAjYz/U3cJlc4E2OYoSvI797fKtk
	4O0PY5HAFAlDJOgnTVXZgw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437smamcm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 22:17:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5M4wUX040049
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 22:17:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836xfbbq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 22:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9vpXgwkhDfST6lzt7FfSV7Flddx6OkC/CU8DqK2syw0oHGOxVYl6U19yYazbb6Mj88nv8vaCr2PTFFR9wA1LaEDxXVO4fx68GY7W69/yLWMH6Hul9c3ufTX0bMHxZv7eCoXcjMaGuFmPmk3Vl85fFI3c6qiDTRgwRQpe9DJWQsPQQveGLxdytwfRvpmckqt52wpDAB/HrmFfzYZXtBCh+qBwgiOwhABeTbkL6/FoMb7UJRlUB5IcKvZmeNNXLdqM43LJzJh8VbT4E5DQMM1pCod9a+dcAajkI0Nd3CD2GCjl1p0f758UE7oaFEQjtcjNqoJ7U1WYuXMypB0YqrCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwxda/SEIk6zvv4LxvTLKvKZZ/GlCpv8ApcgOMl2edw=;
 b=JhkzqokVKchOhlvgvjcNl9R7HypwPIO1GPd9mTugCL39FeAI3XaUpuR+nHVtQ4jjLuCpRs0xvda78lqIQEfvXzu5WiEdd9PtyIrSGfaYkrW30CS9NuoC/H8QZppWw3gZAzjbsRBhlITD3kA0xepT1drBLigiJhxzqZZfM/obxumsQzf+Yf5AYhAEYvF7PnNuPOAxRA6Lc0U0g7Cq71PsjSL5HzUe7N3+0VSfM3IlFWqqrE3ch3PPlYTRV87ey+BJnBfW1w5azOO0Gw/dwtkjTdGkUQPLdVsjSi+aKwFjd4Y1pC8rGu1eUAQnrEgFoSq8RXSh3EMGRUh1Xnlbdo22FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwxda/SEIk6zvv4LxvTLKvKZZ/GlCpv8ApcgOMl2edw=;
 b=Yf2D56m20nSzqH+W8xTWq3HSyoEvkkzy/GBn/WjqXHB64mo5UWQwVmIdIq73Inrser8SD82ALp372LtvfYq0g+1A0FEFXETnzDxacu/TkOrnJV1CPd2sWRga8dumFha8zaft9VLB+iMWIcPzxzpozkOiFSt7ehjShob5JfJ9HlU=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by CH2PR10MB4343.namprd10.prod.outlook.com (2603:10b6:610:a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 22:17:27 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 22:17:26 +0000
Date: Thu, 5 Dec 2024 17:17:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 2/4] fbt: clean up fprobe/kprobe support
Message-ID: <Z1Imc8J6z85i1gEU@oracle.com>
References: <PH8SPRMB0037647B2AD6DBEFE5E31417C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
 <6efebe82-1f0e-2fce-3c78-cb734be36273@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6efebe82-1f0e-2fce-3c78-cb734be36273@oracle.com>
X-ClientProxiedBy: BL1PR13CA0421.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::6) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|CH2PR10MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aef5757-a70b-4c07-5e47-08dd157a99ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?b5j6Jn2pSgEmpw8XQsBU1mqMzWPV63sCrF+TZYOwfoTDKDyXIbXWaHTIow?=
 =?iso-8859-1?Q?egh+xQsXuA0FNHXseUreB3Vf4xKHy8rjacLhx/7RfmaZQ+BrROZOqmDwph?=
 =?iso-8859-1?Q?himRGkDeMXsTh4oxa0lmuDxGQG7fJLAn0fQACUUUsaChuBiCOTy04XCqi5?=
 =?iso-8859-1?Q?/jrI4FIYF2OLzMKmuW9WhAeboNSp3ZaCShQUhXZzyNx/OHmVO+cmWVaw2l?=
 =?iso-8859-1?Q?hjv5F1V/DzP/3cceQohYpBigV2FpWHQfADrPz8UV+zIGO+LPxFfgY4WzRI?=
 =?iso-8859-1?Q?r1uaaLm+Oo5RqPT4lK67rZ2ZOmIbXY3jec1Z+p8s4VPL4ebUxjmjnPkciQ?=
 =?iso-8859-1?Q?plY622/x+u4KgAyPLJAbUF2wVQddx9uk5Jfk4IeAK1WLVZd3/xBEvv4QxA?=
 =?iso-8859-1?Q?/wSrwvwkprl9lG9xJCFnqWLR40w9aKgZhfEm19mxrT9KgtGJlZoumZV34C?=
 =?iso-8859-1?Q?+2wByW82GHn9bChUNQKnQM2+P1sUqBUnuWPNqWyV5OZ8CNnOBTwsezLlbv?=
 =?iso-8859-1?Q?ptZOPgXN7FFQu3MdKaPk+nivx4gJ4EA4qthmZIrkqgEIonpDEmOM5zy8Jy?=
 =?iso-8859-1?Q?5pK0iPdNFGw1ExOeP3nSPotbHEJ9r78XfwW64lfY5em12qEUVH928cHoQX?=
 =?iso-8859-1?Q?d7mjWqJnfjYZJyDg1OkWEe+uFc4rnWx4eP0KAUKCtJDpbu5twpuQWVKdEx?=
 =?iso-8859-1?Q?Y5pldE0kmHsklK5Ct5mhd88726bSN6S77h5j5+ZvDUxCNziSDzg3bKdFql?=
 =?iso-8859-1?Q?pVj38eZwm7WDuMaXyE0gApF1NPdH+uDdzxbeK3mkvyY5D0mDjZd+3t2eSZ?=
 =?iso-8859-1?Q?Pf7wOfqsYFTQ2cNEDH1ZTDVSc00YRhAcHnS5Lf5FBW9SEOIFCNXclUJrav?=
 =?iso-8859-1?Q?ULRnpcNkEsFxr63KAUqabyMV2EaN0nRo1UGvr0SBYXO/KqWPIAhoc/5yI8?=
 =?iso-8859-1?Q?cDsLXRpkEiIDMGpoBBCbdD9TEgQXAwX3+F3aB5xHF60L/erzg0P2AbgEWh?=
 =?iso-8859-1?Q?QUY06jlCBAHVZkgXhbIsSfqAwFOSpkOsghlQ+H7N0hYvZmDVfDDoAkvSHV?=
 =?iso-8859-1?Q?pXe2W9a6fvaqWsfH78bmM26bk314OjWQyvbLhdIqH77tnn6Usvvhl4B97K?=
 =?iso-8859-1?Q?c1sE4h1QCAUbw9b1lheadFD+dJhKhatUPxM1FSXD8ZqySoPKX4S2K4BS+9?=
 =?iso-8859-1?Q?KQCw8ETse+K63BoorKpqI7/pwSP/99ZrJHib0LFw3EL4FDcjgSd4K+rZ1J?=
 =?iso-8859-1?Q?dQxeFLLfjalOpU2f/4WXiqn6tqqO5GlF8bHyf1og6gTlrqzu/9kq4RBcki?=
 =?iso-8859-1?Q?e5FKZba0feuysUBUSg4wOt5LHIhsi/eCBmOY0BBmMNu6gGIfDFQGYLR0Zw?=
 =?iso-8859-1?Q?jcF6582E0LlDdT02Z5VJUeALb9n4Dgew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?n8jfk+/ZgyrJsFyuHqiouNHVKubpVGJlsyucalstMOK512jmbK2W2MEJGQ?=
 =?iso-8859-1?Q?rvOe2riAcseGdTu+7ADWRdoSq3TFoWTujS3RJ2duWTrZPn3lp63KJYAqk3?=
 =?iso-8859-1?Q?9mj4RmUeh1vxrwxu9SbYHEzevdXGmcKZAU7aNO9X8K0m4T/40VcPwqaaSF?=
 =?iso-8859-1?Q?C6YOp8znxsIjPkg4X3GrSEHZeibfD2kPrN2AVyrkbgDLKtLWd9GEPOmE63?=
 =?iso-8859-1?Q?7PRf9c2uzMjH6xP1Z3j3OlPzFLUiQIS8N8WgyFaQ4iUrPMupEqvmkR2ccT?=
 =?iso-8859-1?Q?xDKz3+wdqSzGWASR6q365nSQhHa6pBbbXUlUFVNNzmamT8FvNou+y3OA9n?=
 =?iso-8859-1?Q?hvUwOxwuc9f7QIOKzrznv6Z0hOUe9NkgSKgevU0TrEbsQqvJ2Q/aO7GUzn?=
 =?iso-8859-1?Q?bZ0YJDN8csCHTKY/FdECs2V/xE1r0XtU1yemX/eJHuO+bJ+MMnr7ltW10S?=
 =?iso-8859-1?Q?RzsXsAHcRn/qAcj0TQNQfRXL2jy8aI/XP+GOcJcsS4TOAw6wV/CCGN+uA2?=
 =?iso-8859-1?Q?hn7XUTcivp/+crl2U/tI3C8+2glMJVWQS0qWJ+A1RIO7YbX0avTf29+z+7?=
 =?iso-8859-1?Q?VUn3JyOFIEqvMgJMtbrbafNY3ghG5cm4JGvSMNup4ioDPL478l+4Yz2/U1?=
 =?iso-8859-1?Q?eYJWeK4mb4PttLSPNvQFM2yYSVroHKawNvRApJQk3UuT5sPhvdaHhG5xko?=
 =?iso-8859-1?Q?kt362wC8hUym6are5VPuzS6JP0G/AjUYPS4lGNBozYiGOzs03a1+wJZFYf?=
 =?iso-8859-1?Q?t1wf9UaRS+sbKZu8+pyB3AUprEntxF+OyxuitMIwqWe/Zqpv/taVhoOgxW?=
 =?iso-8859-1?Q?VSj80u/7DZiOur8Us41oJSIsnzmsuIDZWLnjytlO0fqrqdmT9nM3uze9tL?=
 =?iso-8859-1?Q?9p2EQBgagoIyEfaGmmetajim2GanBpW7eZB8wah2zJclbueVSUM9kpJODI?=
 =?iso-8859-1?Q?Q09mFphf7ykl6tqZKq7ljuY0FIrLZrWXpHTvXVqNiyUYuIAdT6Vd2NmQfr?=
 =?iso-8859-1?Q?faaxmPRHeYMwyAfKLfK18VgbrY4JhP3gC3Op0G35WFEM8aY62Kbpr3GmZm?=
 =?iso-8859-1?Q?KQPqcH/OFd2srQHIN9xbcJJZ/EXnIz28tL1Ytz9fU1J3cU616KOV+xtYEI?=
 =?iso-8859-1?Q?Shn6SKBSW+jFqQmZuEzy7KlqtAq+Y7os8aUEIGZt2CFsM1OzQg5TYJEkEG?=
 =?iso-8859-1?Q?bPjlnkSTS3K4M15IWgMDqzlw+rLV+QAkh82HhUwJdgFcO1XlY5I06fpce3?=
 =?iso-8859-1?Q?NjMnZXhPCzWSnZTBvvLq3uMRN08kXu58iDIry84HikpQPAGfsz/tlFIabC?=
 =?iso-8859-1?Q?XZtSjaUAt05FAiq2PoTfxwR3a5wVSGBsyO79fT4X4/254ZIHNwyGjRnssB?=
 =?iso-8859-1?Q?ZNrmEkDLmELfX1o3nA5gP5/5NTqRGl4bDu7JbVT+SFskdKtB9mPbrSb3cL?=
 =?iso-8859-1?Q?E3uDU9bGNiZoRWYG5dIBl7PFwWV/PGCqTUZZN0NzfAc48srOoYSs3BH6Fc?=
 =?iso-8859-1?Q?H8tkQOK8qIpTcfHVWB5tQVyZpwg7gVYy7YEeu0xTY8Alw7FmF1m/WrBnCM?=
 =?iso-8859-1?Q?UNqoFMyYsex1sAz857BJTUMLEX+7bIV9l2Lyzw+7TKQ/hWD7xKhzeYuSRx?=
 =?iso-8859-1?Q?DO/MOwiAF0nixBv8DV6SJPg/cCNSal7BnG+G7tRgH+bG0AL9vAYNx8AQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0wNiTt9o+Jbft9+h+oApckfGkEPOt4KDmx+M3zFGAbTprzXxnU6nFN9T9ZS40d65ZwC5bBj15MAENanNkPoTh6nlejEQidb85OCLzkcph5KBYBsfdsSLSaLANFArlFxq/In54dZExKGNfV6oewAocd4LuLvL/4s2F8I2+8N2FHDiqHAEHHIi8PNRQ6jXQlgmci/ir+h3Ea9Me/Qa0UbCML4KtXbzNDRIhXsP7eafHlJqfydjZYAIrf2f4mEqH1Fa3vEcHX0fSmbkCTFgriYk7lZepvh9c2bcQRJ/6/z4vvVMjLs6G+gCmWXSXHCT0zg2k0bIX0CbU2rCk10FJs1rmsD5yYC22VXk9ZpGRjb02YlUrUMT7cx5SrJ1H5GW1LooEgztovocUIt2aFM84ku0BhROV9vN8etu1ZFHLZPCrrYE7StU20wWxSyZT2U6CUyDR2g3misKqnPfCdZxwArtWk7cPzPxP2w2WL5bLp+Qndy0Txe22c0x0rJoPacgIoiAZwsYFP+MHpYAtLfXf76GZjEDdyJr4DsDVWSPz7dt/cccgIU5FUbSRKUmd/IGOCiz1nrgPT1Hxat1rhVBY1heqU396VNRCs8ORtOKQiHLbHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aef5757-a70b-4c07-5e47-08dd157a99ae
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 22:17:26.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkvmwj06UXMRUag9CMxzRyMF/LmL1mfdwMNxnyTWSr9omvGEL1ol7HcwSMPR4KY2cnVxwsuQ9zz4xVOhc+vFgZpFdE23VRantjheSDP+HP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4343
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050165
X-Proofpoint-ORIG-GUID: xnPvKszf8H1wAzZOWse9dav0LMtEgG3z
X-Proofpoint-GUID: xnPvKszf8H1wAzZOWse9dav0LMtEgG3z

On Thu, Dec 05, 2024 at 05:05:15PM -0500, Eugene Loh wrote:
> I wouldn't mind a few commit msg words on what "clean up" means.
> 
> Mostly, how/where is dt_fbt_fprobe used?  Put another way...
> 
> On 12/5/24 13:53, Kris Van Hees via DTrace-devel wrote:
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > @@ -73,9 +75,10 @@ static int populate(dtrace_hdl_t *dtp)
> >   	dtrace_syminfo_t	sip;
> >   	dtrace_probedesc_t	pd;
> > -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
> > +	if (!BPF_HAS(dtp, BPF_FEAT_FENTRY))
> > +		dt_fbt = dt_fbt_kprobe;
> 
> If the BPF_HAS() test passes, shouldn't we have basically
> dt_fbt=dt_fbt_fprobe?  In which case, one might arguably go back to the
> ternary op?

Since dt_fbt is initialized as dt_fbt_fprobe (the default), this conditional
sets it to dt_fbt_kprobe if fprobes are not available.  I figured that was
obvious from the code.
