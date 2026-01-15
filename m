Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415272E22B5
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768517779; cv=fail; b=Trm6seF07n5gZj4GJBDkh5I6Sf4y75f5y3xi5434cNapC4C69WyIa8n7sNG0OMgQGDkwNO6osHzraSlJoNabZijTwiDwNZ+jfFnmdyzL29Adqf4jHX40F8iNy+1O4zEo9lGzQefXoWViAf5fdkatpo/rWaxg4lnKcqXUN5M7wzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768517779; c=relaxed/simple;
	bh=M4aCvg64JNsDtrjgPsO7lIzI0PbimxrmohUHSbCYmzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F4xqJoG/iLFaMBbUG582NIF7QQ8KwAXPb+7C+YaUkOaWct5QjHKaQpstiaNwm0mPHNLC7E3oiC06FoldFAsu2iBKx3gjiglaUaWgY5BjlJimxrlPe+izxr6m4nkrEyZTIKf3tStGlXAafhY7xcu2QKRtYAGYHFseV1E/YQLCBTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QusGmuED; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VOYoWgO8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QusGmuED";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VOYoWgO8"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FM70sq1295689
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Bme8lzq7c6NABIgEEU
	Er219hpB11L0qbNgUnE742NX4=; b=QusGmuEDV14I9TwuppHU2YmsvvzLQsDtgv
	MJJSjjmGfaAAeKeTpadV+8V0ohVcd4APOwF5A/qixibCC/69P+WuCkr0b1SOzqdC
	nRoevLXZHEhXPyUXxH8XNDPiK/oU829m4HSBDMMGCdvCphabkz2w9TdABJbH/5qD
	G6cUUE3SPDIvGOf4e8lFalEh3mpkpeC+us+32KZ4bo63dpaSbHGn7X4+/uE09M06
	FQ5vOVFt/7PKJWb/aKNOLt74c9ECX4ABPeG6bL+NBfDcPXCDCxDV3jKdp8jzYPf9
	MdcrHcAkXX0sfAzHO91fKMFeLX0eEBJ0vDt2Rqnpj2u+o2cCy9NQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5tc48s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:56:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMfSvD008270
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:56:14 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bq4xd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJ6gVvjvhFME9Kc0kHLAUMXKZEIfVseaTYqnC6AzeRRyZIlbxKm+TH9nNsKCCvNo2GOus0zdM8/envrjUtPqPnkjsZEO1wsbvrxSyEbmb6v2f4LKlIY7aSK1ugh3WlW8BH8Hw6NhZyOyBlSHf1IIL+jZ2kdL57whJj06+vsubQYO/4aBx4oX+QIJK2tbxe/1+JoJgKoVzl5JcBhOG/SC2AqvbI2Bs+QSaK+0Q3WlaVj11A10yFFZ+RRBmb3Fpsp44Xk3m1vpwl0wbAvSj9zUXxRCUJT8qTAtGhbskyJ9wRE90UTdIYUZDJAMXCm/nfsXgwWtcFVPoJwK70tJ9sjfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bme8lzq7c6NABIgEEUEr219hpB11L0qbNgUnE742NX4=;
 b=ZjC2t/PUYrEPotM24CiCKU9yWtw6yZB9ZmX/LzVar0qYankSg6lcn2JRhlP8LKLHa3Xexegdg+AIVa/fM4pHm4E8dogZ+shc0EgpF3BvlqfmzyI7wd+eYUXrIigLUoqmLrDF/MlHekQrx/teje6YQN6LQo71eWHrMBsXnIYpt5h9YvoNHJDPYM2xFYXE9aPFGfG8595Ig9rLbY6ffp9q1wjwrJIEumzbUOBOGnVnKDql8x2FFDVLa53lyRjKOzvigC0WnxjcDJZwBI93CCgbF8KfXQdG7h210I5YKclq/33iMwc3qUwAMi57/s6gBRbw1ehmHtiVzePxGxkQek09uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bme8lzq7c6NABIgEEUEr219hpB11L0qbNgUnE742NX4=;
 b=VOYoWgO8MqXbgQ2bd23BPnkLLWlgIUBOH4pRaoNmSlELMjMwoLYacHqaSWiDdZi6mzSZv3T9dbIjsOD1lw1YY7dkk+a6lRq4ZIQh6cGq0wslD3GB19vyf3RnRY0OdaKLu/tlCLHJWwJ4a54LKd5arqT55AuwJSm8H0GUoCKc/Wk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH3PR10MB6715.namprd10.prod.outlook.com (2603:10b6:610:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 22:56:09 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:56:09 +0000
Date: Thu, 15 Jan 2026 17:56:07 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Guard against inserting the same provider twice
Message-ID: <aWlwh6KNEYXFBtmK@oracle.com>
References: <20260115222251.7228-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115222251.7228-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH3PR10MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fc85f2-8bbc-4097-e10a-08de548945ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?78tYTzrN20OdInlmB8jWXaPfrtqZTlIBoO+ymYz1AbzkD+PJEq+iHqBkztpI?=
 =?us-ascii?Q?y0+/OWRm9PQY9T7uaIRRUD6WDhQUHz/ftRnrt8yJl4AgRiiGEwkxyW4bY7uc?=
 =?us-ascii?Q?VPEEZzs9Y/3T1VNoFVy4k0GX/GMZqLn8pBGE9qh/LZqcoVezCC4gxsk1r+aD?=
 =?us-ascii?Q?R52CP4YMyVESFmDe2d3vSvz4TPx+Y8TNXBPaHJLzB+qXaFh0Kn9pdMkQksaP?=
 =?us-ascii?Q?RIXVXIaBO+mth944LXRnW34dsy1n6qmWnXxoFRJTpN8T8CtRBHhERujwGAZw?=
 =?us-ascii?Q?x8BMfJAhMNzVMPDApdZsaNrV6IhlT2mih2b1aQiWsSq0ucCPpjwuJxBtRrhM?=
 =?us-ascii?Q?q31SSYZwbxxdFiVDctH9ZwyHfgbfecpQ0EVwtq3GvHTX31zNR3NRBtA57HPs?=
 =?us-ascii?Q?Xxa/Pn6nKphGSJNvtejnLGuVUw6VU576YwB6uRCywCGBONJGFJCbO+bRxhBs?=
 =?us-ascii?Q?uPKAaCEL899I5p83QQY/Z9e/HXCPPTKn9lm+yL5N0YbrDe/hVfdSbEVkLjWp?=
 =?us-ascii?Q?gqpQnCK4ezBXw/1EGX2nBuIIWFDTDYFZ8wbPFjhUIixJuVjiIxgxYmlYrJ3o?=
 =?us-ascii?Q?/DqfIv/IW6Jg7X2TBA9kpn4Y/JcC60lCcMXH3jWvCT0h7Q75qNYLW929O/RO?=
 =?us-ascii?Q?eaq5d68u0FMZb51yHmj6q6GzJlf6cm527/gahQ3kVAs54WSVRc6EcE72twCz?=
 =?us-ascii?Q?ehIMhUwL/lP3YsA7htXqX9YnI/2bvy86Jb/AWQxgOTSLoeBFqOKTHHeGLkx5?=
 =?us-ascii?Q?cwpnXZ5ZNMp6yQwlKR9Ydm/SWcNXUSL+fPLQbFxZB4r06pd1LMa8PLY3QLdo?=
 =?us-ascii?Q?TGhb/hNhjBTUY9p7ftZ4qTgSDuXoPjrdlogD98PLveQ2xN5ZNsGBZgwMxTPB?=
 =?us-ascii?Q?JzUPZIuGmPFIWZSsFRnSXIovPJaF2RwQV8mQpMIQnJhiInxtMfbuRxjW9ULs?=
 =?us-ascii?Q?PCcoE9LQ2JIjN9M250jXLWhHfo3d89HkdUMCFoBpWzouQRHxi3fzbBxEMgWv?=
 =?us-ascii?Q?bUlQRAespKfLybNmNtDnQpw7poZPNmpfWJ8W0/9Icbu1SjWfBLDMmS62WBXT?=
 =?us-ascii?Q?sws7tkObI1BezfdBpK9QMm2HfCFay+mOjcIIGOgEUX+w9n3hZimPe5EKonUZ?=
 =?us-ascii?Q?AgLoY2ao2nvyFTwt+EOKfU1D0w709Xm4M3M6KPyQOILjEheo1f9nDROzSVWp?=
 =?us-ascii?Q?KcWvM/q7dCNhg4ymzdU96+f8ueOfRXsRjYd3BzZfs7rQoWO/2me5UOEDO+zf?=
 =?us-ascii?Q?anpAo0RXh6bWeZqQMmso7fIGaqw+3CHi+mI87vax3j/ZExEBwzkOt2XmH0Sg?=
 =?us-ascii?Q?A+0rOH208Z/r8Q1hJZ8xK+CgClLSfV7PWvU8n6zJcQgwYWWvlAiIS1CbfCPr?=
 =?us-ascii?Q?0Ge0Sw3MwFPh7G/H0QvUGZuGr01PMkxElSugPT+oQCeGEoppglUt2mt63Qre?=
 =?us-ascii?Q?QReMtkx1FPuqSzii6avDx4TA4wj9xpjmTkiprEO3z35Lph5wyjpx5UVbiP1G?=
 =?us-ascii?Q?/6XHNJxpum7NFk/CDL5kj2jHSpsA9qSmo7Rt/eJZinbzaCqKAz2YhPKvzyiT?=
 =?us-ascii?Q?Dso9X9cBE9KmlJjxQj0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ZnwT5Vkd1DU5ynOzNezhbiavXMlEwhh8TxCF5Smitd9mLnVyGPYTA40VQ1n?=
 =?us-ascii?Q?enp698WK/PVGI5kVZobH2+EhYoderSsdtLLkd7AcIGzl/u22fNZJ1eDjJQuj?=
 =?us-ascii?Q?knpWfCkUSAKvrolzIBGzJIVyncZh+SoZUAL2ZbbtM1RcWRJXj3OSiNoxnM6T?=
 =?us-ascii?Q?EvVHJx+EYVpKeXzoxZ25bVebf7p/AUJnIleQG7LmVYXBaW32Gzd4Ww10R3pE?=
 =?us-ascii?Q?C64TcPTXYZ9RP/thayeQshFna88e98dQx+bFk6nIYpaeXUP+9sU7wI3PsqNo?=
 =?us-ascii?Q?MrG2wJqZtYkY+IXc6qe3ScmlErzD3vrxcPqpl2kSPjMnZGDPJ+8CesTWAjUN?=
 =?us-ascii?Q?wXC9dhrudxw9ZEe89DLqHGeMubu1sMSRqmRNOSyhu7PhaGeqWGUTImpXPvjo?=
 =?us-ascii?Q?lJGxLJXeb+GkfW+LTAGIQpaWDwMJNMK0ZCAtnZplyrOBI11Oa/tukw2Zh7nX?=
 =?us-ascii?Q?rRnnwjWma5p/xKEK9vQn53MmqQd1gXqyBAb0/DXJTcMEWFidCQPIdWsgNFuZ?=
 =?us-ascii?Q?z37zOvawoyNzdppXIJYJ0zBUHDuOyQodZ5Dfcj4XOsCXvAsvAQ5X4H5vWunN?=
 =?us-ascii?Q?wPiCPYc4f7AmRNAmASLYVxnGXM55jbowrslt7nsR+pl2HhXjQ3JbI7a7iSFt?=
 =?us-ascii?Q?WMGFt+r42hmBs4qv6FSXDW1WEeyLeFSRqFhzzkbHrLtB6th00DaWhBY+0Hsy?=
 =?us-ascii?Q?yXzIM7V/uHxER15GSv8xdIqscQTjKJ3IROxpvaTxxM4kxJyCJp/Lo7Hh4y0H?=
 =?us-ascii?Q?3234kdKh5ftAw5ihJQiSp/zmAMZ7ZHZQHkKufaznWm/k3bzW112hUQ1ffmXA?=
 =?us-ascii?Q?HrcRBW8FbJ8VlNFchcdJJPD6mhrTnKf+apJs7i9ZKWFb6zuSThdTrr789dOT?=
 =?us-ascii?Q?J0KKrfPI4dJ/8ztuHE0bhsxReHO63qCH9wU4sPQZIoWNN2ev0iFjw7BSG2Gm?=
 =?us-ascii?Q?8L+fUWcsHmsJ5G4ZIJUZykiV0+Uchkrx0Y9JrhQ+EbAeQ4kUpJDH7Dzy1EUQ?=
 =?us-ascii?Q?+I64hSIA5M3YObu25LmZPCp4Rs33GeQRYrm1DcCtynicOzhSiT2mp7Q/C/Go?=
 =?us-ascii?Q?lEmZ8TML+YdBSck7mEw/SSgZRgi4SAEMRzdaaPt96Ll0DVEt4N+zj8OeTY5x?=
 =?us-ascii?Q?HD8riJ4d1pf9PbNmyugHLFGkU/N12pR9dfUJv5BZ1Itqz55sBzJnLixeStA4?=
 =?us-ascii?Q?TBnkOWWoilBxIg54yskK7in/6s920EY7hHjMygOSu55z3aYc/2xL4LVWbU7G?=
 =?us-ascii?Q?Dr7Dzo6YvOcDJTDBfc+eoYHEkelym7adBspe4H/KCrnYK6fvkF6LyK43JkuX?=
 =?us-ascii?Q?BILlSZtx6B2puK/wQaSChzTeDIDQMrIqKlw2Owme7JsbIc+wMq4YOSYd17+s?=
 =?us-ascii?Q?1NG+K8varaTowggROPfSy9vbVUJDc7yrNmRxNZYQPKRU8KYKYeqQLVW5fdWR?=
 =?us-ascii?Q?MOm5F7PNyJlK/8czq8TYTaiy4V9eryYG+K1ELkw1W6JaW7p9y0C0BAYtFbk8?=
 =?us-ascii?Q?0E9/eIHxVa6CqbvuEqgQXM20nSDauW3FzGm1lCmwm2WZq+RFENn1i051JCw1?=
 =?us-ascii?Q?npskiI/zfosI8z3myGVdKPYFrcEDay2+OG6Raej0EeTiZGG/mD0V2MzPEl08?=
 =?us-ascii?Q?/GNzHtW9DNQoUzdiMjv+0DoF8WAURabzZweGjyWGtEwQgIhskhhgwzeRdYD4?=
 =?us-ascii?Q?er4YwuaM3FgzDQN19IzVhKfN6NAwP7uY1iFiuPfpAFkifsLSRUALblftFrin?=
 =?us-ascii?Q?uc4Tr6Ozkw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dD9L6A5H8VJupb8ioippJlaUz2j1xnXhAh/Pcht9RbZWW+aTDj0MZyKElfhylVldwPFahU8feBXqpWGJ9eVkIWSt2wt42xBhvRGhOfhpHwPVwioEU13ioJDVvwo0zTqpeBrvJYWmTWleTsggcuSDSs1jZ21DqyPO+vtyn+8cvTiai1rrVTvDJn3AiDUJvp+CJvO1fdwJDbwi4B5EmyIMxDIGAiSZKzQYynmZxk8ez7UjNp7EgkSewjERcT7pBU52YbLqBrrAnfwnj7UuJMhzeWkeJ7EtqNr3XP9DuiC2pLTRhq81/gKHwAQEsKcpEDfwVTkQV3bMMFIJ5WzWXUcjPGT8i0Hz5sBWpKIdgy2Yxjh0HKWy5bLo7mDdRNRMR3jaaBAn875yVm5XDsjfB1ARtj5RrHqBgzwX8NEL5r5Hxk+Y1SyqNcYi90mwMM1vYkgvFgDRpO0+IlvZAGyU2wz/TpOdjMQGNqodvxF9HFIt9UGoRr42SJVaVTzwbFoA9l6PVbs32/pUSvD05nz8Sn1FvSZp5m03EUjFAvYVMa3Z1kkW6ho+n46Aep+PRT1PtJtddQhCPbbv+sPZtWu85U+KFPlCFncuHH3qnL1YIdlAR4w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fc85f2-8bbc-4097-e10a-08de548945ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:56:09.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msyjiln3QLgCH+y8A/y4XPpwAg6fJf/YntXRnqh7eNlj0RWVXoj6mmYWnHOee8k417VLb1c/yZlUoxBKJwpXIlxO12rHgt19MTKCZ8ZMXWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150181
X-Authority-Analysis: v=2.4 cv=XP09iAhE c=1 sm=1 tr=0 ts=6969708f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=s3tQ9Tm7wuJu9hj3zJYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: DGJIYa2h-PCuaqpP5dIihtu96oGo1QZ7
X-Proofpoint-ORIG-GUID: DGJIYa2h-PCuaqpP5dIihtu96oGo1QZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4MSBTYWx0ZWRfXwd98VVKscWp6
 WgDelRoc4g7eajXl5zawN4hqkw9+hgAYuqR0NPl8a0mgYNVBwheAs+KX8mrp7OXVsuqRfovmvX5
 eQQGrdEUyViHO8pA6pxxl4v2wRbmJ9EMps7QlCtnjY9lDGCoY/FJovltAKV8mGHdS0l2thW17Q5
 ZCHQl6gDkn3yJQ72SJP6KeodMHP3sNSw9XwIZ5TyB5MuKnDw0t2H4Ay7jcN2iM7VEyqcLi0FMLf
 blncSs/AtbOmZOnE1HKu6n7pNsZkrSXnChMTGE6zCVZ7fb841KK9z89T4l5IlkvssAwn6lR723K
 MThN9IIAftf9fOSfOX9iZgnEXwaftI2JoM6NjGXJ3vDtlbBoOS4rRiBXz7XRq7nZukGJhqzSXtd
 jKqRWzsBhBROWmZDq//VspAyaTubTWI46nJgQ4FKAAPS/D2P0JwvXQoLhkWBcItbQrZQ/YeOvrj
 jOBD76UjJO9sC1iIIpQ==

Minor nit below...

On Thu, Jan 15, 2026 at 05:22:51PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Add a safety net to dt_provider_create(), to check if a specified
> provider has already been inserted.
> 
> This also requires a corresponding change in dt_provider_lookup(), so
> that it will work even if no providers have yet been inserted.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_provider.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 848fdc132..9d75225fa 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -114,6 +114,8 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
>  		return NULL;
>  
>  	strcpy(tmpl.desc.dtvd_name, name);
> +	if (dtp->dt_provs == NULL)
> +		return NULL;

This should be moved as the first conditional in the function, because we
want to return immediately if there is no dtp->dt_provs yet.

>  	return dt_htab_lookup(dtp->dt_provs, &tmpl);
>  }
>  
> @@ -124,6 +126,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
>  {
>  	dt_provider_t *pvp;
>  
> +	pvp = dt_provider_lookup(dtp, name);
> +	if (pvp)
> +		return pvp;
> +
>  	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
>  		goto nomem;
>  
> -- 
> 2.47.3
> 
