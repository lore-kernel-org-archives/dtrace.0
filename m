Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE42155CB3
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753130352; cv=fail; b=pBKcd3xJta6gT0zVrb8BO2Q97VMHaZjrC72gRgqvHJvAR/HawgwBVV6uasoRUHqhBcAGZr+asP6ehpnWyuV30S4ie5P/oV9RrQhlZLyshVkRhOEoIWnadDFZWNctP9xR6h+wweAlMhtF0A00grwuan423m2XCA929LDY0sXtKw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753130352; c=relaxed/simple;
	bh=uD2HAeHgswJbN38s9WIvyqFOoHhyY7pJPqcAx1kKlTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c9e701GDOyJDdq8ZbD42umA7kIcsBHRiUaUaHcYzqXIssI1n8BuCG4GYNBebSW53/do0Bh257+H8u+guAvQz/viHOPwkEMcwmxH2kKX1ms4JIUg2C+IH7U2UqjrackAbm2S2GC4AqVvaK3cWA9prifJwTzj4aGpf3mXmFMfQ5f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pC6uTifT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k4acJnnj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pC6uTifT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k4acJnnj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LKS7Bv002476
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=usrX9GugohBXEY7EdE
	+dUtljAk8KSv9cdl3uBgowEBg=; b=pC6uTifTKAj5LInpS1EF3bq4LB6WknHFgO
	YN/Eg5eAqPrX997ppPRaYeVW/VBOu2WXPcFd+rKlAL4nr2Sfq8mEJMCCuyIPa3qh
	yGFdWu8bkZPNVHcMIrgdcmeL82bOUPD0YFhCZaoxJojy0ZHDT4tSNn8pTTxv9/xd
	43GodLno9i5RUHZICy99yW37yW9xQw4wbqKz3SduZH1lBdHW2nRlXXgBeg+aA5dE
	2bbplTsELBAB4JwwOUWCC06cEDU5tFfHZrhK3Wq4hfx/glWQlxD+8eUXmh8n3aHk
	bTeAd+xv0TmrHZwqJe9/t1FxYV+X8SXqTmv8LAHPOncUiTI/xe3g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9ks3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:39:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LK9wpK010333
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:39:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8h0jq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 20:39:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br1PMhUozeoPUSWTBcwcO2GgVBMfcF5FbdCp45k0kV6fd/6yLVlOJ3NWZwDs/zvwcaeqXE10yYs3UGHUK1F6pLmVmwtSvvSjXwBIs9AQK6GNr70xVPdntdshD9468w6A6mZhc5OpVE3VYrDNTPpVGyoA4wU9HDlQmZP9EFmH/xT7Db5fXpzLgbCvwg3ZcGMbsWRdSumMbSn+RIULCUo4o4NuSx3omrNu/fTZU/kv2ukS234o1d2W9482K4Q89GmHRj+S4Nc8SKntrHyU9W1qR4LQZFgSULE9StIY/qLYboYMC3DspDM/bRy/kCFao6cECVNF6GmN0+Iuh6EZLMyiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usrX9GugohBXEY7EdE+dUtljAk8KSv9cdl3uBgowEBg=;
 b=LThfpLxmuRRyVAMnzigWSgp061BcCmuwXQOeowDumydHC8jqDM++pjMY0CRrToSuBtE+0g/UroFqX0AUDeN8y4rXUeDJbRgRR8IdAyPfH2MqcJbOETML2yKdIS2EaQqK4FkyalaQ8sWKj4Ku/NKjYPNXRvne3RF5fh6cbl8cp/mQFBLeCY+qcpMQk15B38CW2Hw1l17h9naL/biC05UWQHlBUX9eL1uiLAUM75tMUyeH787qw/UFUuhnWGKI1JJw3IVWdS+CCgnGtBdtlDrV6F8H8gh3XnAkCuAo4S5Cc+4Tcdn2oYtrkKIxUhGkxaIzIfqmR4AxdwNrdFgr+iXw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usrX9GugohBXEY7EdE+dUtljAk8KSv9cdl3uBgowEBg=;
 b=k4acJnnj/G2V4a7FbM+AWHtgLcnKX8MQnJI2dna98RfszFx147KyLXqLVAgbmqs8jwsIh6C3YTHPid1D1qaAKwrBgPT8v1HQACDprNFWs3O3XzXVqBkvsYcDFGBPQa6Odksb/fS5bCf7n7Z5vx4WYPY6SqpziQcwRPlk9TaBAMQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MN2PR10MB4240.namprd10.prod.outlook.com (2603:10b6:208:1d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 20:39:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 20:39:05 +0000
Date: Mon, 21 Jul 2025 16:39:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3 2/7] cg: bump number of TSLOTS to 6
Message-ID: <aH6lZicL9L1qo2A0@oracle.com>
References: <20250709140948.15090-1-alan.maguire@oracle.com>
 <20250709140948.15090-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709140948.15090-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MN2PR10MB4240:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b33c5d-ef10-49f5-7315-08ddc896a285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2plQro4WRhQxSs9iE8pAnUsxXbAGuLw/dCArj6OXY8vnjTECAPsSXcIqEZCm?=
 =?us-ascii?Q?Crp5/Dev4iShH9LubcekosW+flGRsCsr9/54+SZPC5S0xwf8+Lu4yiG/gz9w?=
 =?us-ascii?Q?8OtNAcvdLTf+B2wwVVmvlfdt77MfwBT7EiwRbh7OBoc9Xy26kSYAjflzIHSj?=
 =?us-ascii?Q?N9/xWACJ9oyA5PSYYMD2C/35EK6UrsKqrJAHG5xAMKqGsMkB3oKqknmI+BVs?=
 =?us-ascii?Q?gQR6O1P2NdEauaG8yAygfQyyt0amD0Wi8PxRY9yg/mOMSOcGPhiDRrBpRmfi?=
 =?us-ascii?Q?2KXuVG9fGDqbU9qmJ4sLoBwcZhMd7uNSsRhoF98TJ3iJplE93c9cPzB8lR4/?=
 =?us-ascii?Q?LkrNkOEi3f1jnH+4NzvTi+PwYSTmAXfxz0qvAvG9RwBcdtkmJMdU7QlQEWRF?=
 =?us-ascii?Q?M5FZtQ+DjfvtYeoR2IBBgR1Jrq5dK2R4w6XCk8gTBBVk6r29Y1n6ujJLibHf?=
 =?us-ascii?Q?b0QmaJ1aEtTwIrkjgk+fFTrdg4t+yFY0MQzyttciZX/99cBpidGigCuPXLjC?=
 =?us-ascii?Q?W1HO8iN7pIhuf7XJM8GuUvO0OapM2+cBuhftJpKeUf4q5vuPPH8U+3whp7KU?=
 =?us-ascii?Q?Pcnkh9QteS9CS9DCxrdMG+esEOn08Ezm9Z5ScynYCsVlavFulcBO60koMTi2?=
 =?us-ascii?Q?gNHWEG+bJ8kQ8y4dzbVdL9VL4YTJOqEAaH6Od9sbH5gmShFswc87+xBtyPml?=
 =?us-ascii?Q?bZy1hrX9E7xazn/z08vUmlp8ULiDGXQs2fBZonXArwuffzai+kevPlWw6uv3?=
 =?us-ascii?Q?S60oIwAJRU+k5Xsd0vINI+U/VbzO6YzLcUBDagnfywMNKPw738Z/ZmJdM5BF?=
 =?us-ascii?Q?bFJHshhEEwmll2SkbzBy0sprbQKfYA3pgnKzOZA7qLxGF8mzj51Nvddv2MdI?=
 =?us-ascii?Q?3Mo1xKmp+O8OvRkm1KA2U6KcadTT+JVJFq1VzkEbs5Ujc5ZldJHN/7JlGzGK?=
 =?us-ascii?Q?2pPGy7HeqWGkoqf8AzCr0tJCtef09rr7re7+fG81kKyyle+8eH6keVk6M41R?=
 =?us-ascii?Q?RmGJnjunFEQvYhknoD6SGDU3mQDdJjkK+XOur+4lrQh4ElzikNOYWPPcMUU9?=
 =?us-ascii?Q?X3/wd1Nn+snRyRLUPWMxDzqGZJH22VYWwoNceKgr4KkMh+37+m7N84QkuMRB?=
 =?us-ascii?Q?yJ+Fczm1Z6fQrM7e562EY+qYZEv1WEHOgF+iMsSR3bbTXqnchLZAVX5krNS0?=
 =?us-ascii?Q?oL8vLdaN945xkplwADCVIdayzHgTJ40UlrwXGVvwVLY5omwff2kLrRma64bh?=
 =?us-ascii?Q?VsiXEVFSXHRf4Ly5420rkcJGx2oYqwBIeAiM7B2HURFjqffmraUqQAdc+ssE?=
 =?us-ascii?Q?AYEOuqsOG4sS0u8dhKKM61M2HjPd/I/OmJ+CitBWDFHlHSeqamKM07xQO57z?=
 =?us-ascii?Q?Vwx5Bcok44Pe1VH5ocP5DDldJ+wlOuvY4ExgBRnKaRBPd/VMT/Rnn01fmdwH?=
 =?us-ascii?Q?pswgXzpNrDE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5o8ouhhX9GAKmaO9Xt0qicqBlZyl/qYoIdsKgCECyrjmrdpOTslsGayVaa2Z?=
 =?us-ascii?Q?bswX2PBDzwfzTZjYibr6Y+0irxG2M6PdEwwhdxHWWXr5BTPAaFGwfj1CmaEF?=
 =?us-ascii?Q?x7aSrzQJxe4DbscJEOarWkz7gpgkr+knoHw18tyJq0Dqom82eImtebwuRmAh?=
 =?us-ascii?Q?6PcYOXvMiXktNWpNlOeKPaKcVxp1bWUrsrNs+Rite5dE6RZ8JkttKGOaSNce?=
 =?us-ascii?Q?WRj6QpwArYuOq/USW3nJ8HjBLPzvEdF/zfQ7SClGhIpau61CSSDWXzJgzqA6?=
 =?us-ascii?Q?iqq1LHCMpCQNACf/ie/My9ZyNYTtI8+9Qlx1sE0efb0JkqO8ep0dNcXahyBb?=
 =?us-ascii?Q?+RseU/Birc19QOGvLeqVzNllLG9I3JEh8FFdOOxQKgLCDZkxvtRGcMZw4iyB?=
 =?us-ascii?Q?sZbw9dhNfkOkFvqfZkJvCYz7AeVU6NpLnP2eSjo/CWL7XXmAbaiITMKykeu+?=
 =?us-ascii?Q?MnU5U3269IsaEST5ix+qQW+JNiqmb7kNrZ+um5jlwsplPgQfXTaVfOLohCVr?=
 =?us-ascii?Q?422QfrrZ33k71z/aLNiYh2nh0J31myXK1BLM25AV/jI3e3qpNUKzuf3vjWra?=
 =?us-ascii?Q?YOC2I24RcSyAGt0ndjdqAbiQkdFVWXMh0rc6AaBWnI0EzBPwc0zFDbqkleB3?=
 =?us-ascii?Q?Y70Ly4mDszeRawusDpN6ftiBHmhi3olrTeVF+OITYwsSmGUm8NVtqgmBMXe+?=
 =?us-ascii?Q?zuHcSXYF6oNAI7gi6XJrxIno2Us5pjwI8FZpiDEtoeLWCNb5dgmz/JRFeZKp?=
 =?us-ascii?Q?IuSPvnmD3aQTB8njsWfMPGIk+2cvwNp9ZC1h9obQ6PkYF6TTcOo2cWud2xL1?=
 =?us-ascii?Q?ZPEsHhxXVVd8aVIISCYDHOSzYd/eMUaTwbJ5Un5MFDPWwVw9m/kkUf91g/2x?=
 =?us-ascii?Q?4YSGtzFmqFTbGdA8UaMrY1Pboyoo4NFAL7QOWVB+B/RNExKDxqleGLgZX9Gr?=
 =?us-ascii?Q?sy6rHLk4nnJgf4aJqCgGiTGv6c/Xi9sdcNaKFm/ODIQ7bubEDeLe7pV6509h?=
 =?us-ascii?Q?ypxWhNqc07FvWAk3/zB8BFUiFwuQnH5vJGsDHae9zlfe4knc7kDwUSo+kzeb?=
 =?us-ascii?Q?g55wZXdE/fZitN0vypolboU2I2Q32UyP83KjvPIITQ8AV6AHgGohX6TbKPk8?=
 =?us-ascii?Q?ah1nsblLq3FZ3tBztDl3fqi3X1lc90C2LRw/TI+vGJrmPuF3+ABAGasK8Z9p?=
 =?us-ascii?Q?Hnd7MNpmZLLkO1F3F9NpIknul7/2SLELcljefRkStDAk0TKy7H7akDPXapH9?=
 =?us-ascii?Q?W2fRct9m8UXyBG6vvCzoWvBb/EybNLcz3sJcjNQZ00SjGPpRHTqfaNIM7LWQ?=
 =?us-ascii?Q?hmXCt3bH7gBFj7qT5ynzg3F7QXoiGpRaYCqrWnG+o76hqsj6iymabuRpWwfw?=
 =?us-ascii?Q?XmDo9FPcG/3McZyVwvA/S/QJ+1nGza4mpZiLsWRTTjNoVkTtiZ52iR0nNfQV?=
 =?us-ascii?Q?MXBXnqJRq5TiZaniYsSVGnbnOTF97JbSQ4hjz+uCinYNv3QhmSJFdy9J2Fl9?=
 =?us-ascii?Q?+Bmxlc6QAvQIek0x3wWHEQSG0cEgIeP5Eg0kuEymtP35US0H2uQH6O4JYgmW?=
 =?us-ascii?Q?vNhx0be3qwmDoFK93Q7sx332uRHIAiUkmRcXohpofz9SVF9u7bfk3cew76Rm?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p7/4Ltlw0WMWqa3UvQDaUmvKkl88LvaFUxNJeCnXSe8QxwYjHw7Etb2gkrVEbYlstH9jSiOZ4suFGoJ+nv3Zk2vND7oinPLEVrtOSysAhyTObwYM4Y9Kx0cWWigS1MUSQyxUIna+TgujCUP7HJYCl4ZlSVLx8C7pA3MFbk5Zc4eCA3XPDkMeIKOHmb3R4TN4TriDrCEOtN4lMtoKy0UNiX9DqyD0p8kOhndeEySFT+sgp6c+bRx1/zVDdWADcKdEnnMLTKGvD4NFXZIqs8naukEzTwHSBYkpueCmLplPKvfd+dQvIoSoBDUZZGh4XK4EHaWZKbborhBQfKfSMof2l9Q8XQa8YqNKkJ2xBZvpkOUxlLV05jkWeqM7VE0iJPMZBuOt/FPE3S4lPU8IlMo1Y9f3cG6Q5Vhefx4zlozEwR7NcVszeP+/3VQazxEjUvVHczpN+bQQ6PEH2N/+TbjeiLvdRE/+9VQ2PPM+DiR+uoq+R10xgY6uNGvNMaxKvSJAz05SNM+TD7rZihMLL8Jde2r+j2kWgTakbkY5846S1GrE9mRgi1Md+aTvMY/vizwtyicoJASmXiPAPKbmqP5TBspRo4BXb2xXDbJCHO5kP3w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b33c5d-ef10-49f5-7315-08ddc896a285
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 20:39:05.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiUVZmi/PtTYL+6Xl2JeC3WtjSTxMlAvO4zi1l/Xsu3zcsyu63RgFel6j46E+SaszQlPzrsHZgvUr0k7ixwhXP3h3zrZTMP3oy3otboCh2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4240
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210184
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687ea56d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=aIz_Co64duF09TpWQkwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: AjStpSrDgav6X6uZqlMmbV3eujHEEL-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE4MyBTYWx0ZWRfX0P7Gh/i2XoGI
 /5tWH3Cquxy1nnEPum1Ws7h/Fe6Y4ed5mfqBDYtAswzL9Fp9aLyW7XyY5FNJPum+oWLIJnkrthd
 wPLqD4y8aiTI7OKkDrxY+0c7KzfljN4i7IchqynheaeZoFiVqVROb0V95hNWU8Q+iFggQR0bjuU
 H9QPR0WUJBdW2RP9Ks9NRd4rH3oB87QOc813WxztBl/TNFfFRcMwZRK+9O0RLwFtqBrI5GbJ7Ly
 hxvzOASXYejWxNiWQBuQpM1YN90lZgW/IrouU4mu0z7petS0NH2yroWDXtYmAQSNoxXGRUVxMGT
 n1a9YvEvZzRhLvbWNxSkNQHule1czKK5do797amuCT5qvbxOE3RE2pSPSVl1gLWzJJSDg2CpUXQ
 nVB9nUGMRQU++Pzi8wQ6ouJcqvcur+ySBUd93/+yKElhSZHRY14c06yycVsJSHhRzo3vR9Xe
X-Proofpoint-ORIG-GUID: AjStpSrDgav6X6uZqlMmbV3eujHEEL-O

This patch is superseded by:

5d1dc16c parser: add dt_node_is_tstring()
429f828b cg: validate tstring alloc/free
307d90a1 cg: optimize ternary expressions for strings
c2e719f3 tstring: fix leaks

On Wed, Jul 09, 2025 at 03:09:43PM +0100, Alan Maguire via DTrace-devel wrote:
> Because of the ternary operations using inet_ntoa*() in the
> TCP translators more temporary string slots are needed.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_impl.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2adc1252..b8c0f94c 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -203,14 +203,17 @@ typedef struct dt_kern_path {
>  #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
>  
>  /*
> - * Why do we need (only) 4 slots?  The maximum amount of string arguments to
> + * Why do we need 8 slots?  The maximum amount of string arguments to
>   * any function is 2, and if the result is a string as well, that means we may
>   * need 3 temporary strings during code generation for that function.
> + * However if operations like inet_ntoa6 are used in ternary operations we need 
> + * 2x the number of slots for left and right.
>   *
>   * Since string functions can be nested, we can (at most) end up with 1 tstring
>   * (from a nested function for which we already generated code) along with a
>   * nested function being processed which needs 3 temporary strings as mentioned
> - * above.  That brings us to a total of 4.
> + * above.  That brings us to a total of 4, but since the ternary case requires
> + * 2x we need 8 in total.
>   *
>   * Each tstring needs to be large enough to hold the largest possible string
>   * and accomodate the largest known need for tstring space in subroutines.
> @@ -222,7 +225,7 @@ typedef struct dt_kern_path {
>   * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
>   *   and a terminating NUL char, or STRSZ + 3 chars altogether
>   */
> -#define DT_TSTRING_SLOTS	4
> +#define DT_TSTRING_SLOTS	8
>  #define DT_TSTRING_SIZE(dtp)	\
>  		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
>  		    72)
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
