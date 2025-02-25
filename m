Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021318893C
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517714; cv=fail; b=CxK9U2cKpwa4mBHff+IdvWYOrfg+XaaDmE9vMZocXZ7+VnCFNxAA/gTEIjZ1YwvegxkFw0ZS8EpKrN4IvYn7nmCQBotyCbRvpkoV0OISE0daSSMgK7HVuZbfPP/gNdpCkzhA+pKOKfruzpCd0twIiRjvBzjVgukYG7l/YQqPpwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517714; c=relaxed/simple;
	bh=c48CwukvEGKXmB3IwMUmIyPB/dCpq6IUT1BRLGBmEiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rjwXXtILjIUMRNhjm/JGlz+bY8E8TLNe7jNLUAO8y+KAwxIALya8CcdNUPKgQCECLdWzEd+pk4KyN5dpmwZF8uI+3nNtJSNsPL4NOhgY9GSL5trMoS+/mUhM+NsYGbinqGVGFanLjJDEiyU/NCiXW70aVn4Ojh+xwoeG41vEJ1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tep+js19; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DZKUXKrk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tep+js19";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DZKUXKrk"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIXeOY026111
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ihukgq65ZaLzaSsQw9
	UfM2KJONHXEC82E3iQASoRj+M=; b=Tep+js19zd5/mCKwTrJEhFzRzoMp4iXiOm
	HmJ5Wuj1IoYzKEazhoeG6Dc6tPRnBTC3JOHe++Yib/hqFNpEyu4UGRzccWM/G1rl
	1gQt1+N5eT1az+i+O5z+/HoYOXZWcPK9Iy0bhbRwHlkWnAHfNO8fvasac8Mv+Twp
	Uz8uGqFdyqW7FFbSLPVhSZDKngHiAaf9pV1DGe+yPtGqH10IVkKVZZBc1EtUW72Z
	lgF1zogMLhVwEttg3wLSCPJpR6P0aH7FGMv2KB2LFgvCUj7a7bJFoKgb+/Veljv2
	TuY9EeRk7U/cqG37QmwxFpfv6Rl/dnywpULVthAdL8bla8LzrPOA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y5606bqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:08:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PL69AH008222
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:08:28 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51fumap-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUq3aazhZ7qblDkXUdI0HP1XVY0QNeDU1apTkEh6rsZ4YNFPVs0sP4P1Cvh+r9BZ0jYNeaCJ8qix9Da4IAAEf6u0ttIIrE8PjdBNX8GEmHXBKQjD2zfzPpkaKFzE+SAmVnglrOEhbNBX7I89pTnzVfF2+1IxJETcCxvV63MU8SL/qPbbeIRK3u44sFx7sEn2Iyh8iE/wFIUMx06zcxV5/d4W6cXzp7tSdb+rj7aRRmvb8q2CLWJWD80XC5Jv9BwGQTVG60lnwWmV5sfiCE69+K2tuDG5roDbyhzHSpDcGW6AJQQTAY/nWvf+dMQf8zncjpMBAbEWR2aSS4RKKDyTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihukgq65ZaLzaSsQw9UfM2KJONHXEC82E3iQASoRj+M=;
 b=K/xGn18N/hSSG5p50wBz5erxZhAorc5y9HImCjpeEqpEsmEZ6zG8raw6etjFQk3LhMyGqPZnfJ+A3kLfCPEL0bg7D5xtXqwmZrhL4F+reW8gwcwL1F6soXpEPZFc4EqiHniTdLQRKHsmJ88qGIZcoV9e1wkqfuFnqYA9YmBGZknkSRkbdRWI/WGERrw2IIa1RDTFyG3U1XGD5IukcOY8B2aTcHUpRqbEYq2WmljvXtvpWCoR0bHXUDvkZSDchwIRUnFD9eVGRCLtyhzWi0uBb/N3GySE1QuqrvcEDT/+rrdCRNNEQt89HMTUSrc2WQ52onP6zqlmcJhpec4VWEtZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihukgq65ZaLzaSsQw9UfM2KJONHXEC82E3iQASoRj+M=;
 b=DZKUXKrk3/PVlg9AQdM/ivnrlVWtu4pi5TBtho5MSZ8jVbZprjXpoPf3KJ8K2m9BDg6cwkltX/tTwQx3Zve+xs8gEhLlY0xakevw7sfS7DeWxl34+lQPFvgl5AnJd5OvOoKD9yrN3EN+HXrN060xGbf4I/nDt1D/ouqXRZ2lMvI=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB7413.namprd10.prod.outlook.com (2603:10b6:610:154::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 21:08:26 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:08:25 +0000
Date: Tue, 25 Feb 2025 16:08:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3] Allow arbitrary tracefs mount points
Message-ID: <Z74xR3dDklGv2efx@kvh-deb-bpf.us.oracle.com>
References: <20241112134256.118717-1-nick.alcock@oracle.com>
 <ZzeySbY7k8Wt5iU7@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzeySbY7k8Wt5iU7@kvh-deb-bpf.us.oracle.com>
X-ClientProxiedBy: PH7PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:510:323::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be884d7-5323-4330-803a-08dd55e08b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mx6xQA3tCkne0DUwmpPh6a6LVmkpIC6t4R23JXBbT9zTQLiL00fjTtCFDpmK?=
 =?us-ascii?Q?8B9cvtOCTd2aPwaWcU+1xO6RCrmagZJdFbTLSTZoTJNo0rttcSWr0zG6/JWX?=
 =?us-ascii?Q?LER3OLtVqqjd+oVW59KdsE/xIaNaiydwh/uv+CT3DlXESVyT+o6opNtsDrP/?=
 =?us-ascii?Q?HNTrCzzekxHEZvxsNM2xQOMI9p493nezFTFR08pyu5y2/GCFs6Fuo4WVHXkd?=
 =?us-ascii?Q?v5LV113vruM+vU2EQqB7UISaLXbqiiT0D/CRFi+TczC0uECRwWItU5HgKphn?=
 =?us-ascii?Q?w5RZW0SXabcIiD76Cs4CEigbXqM7LXqo/Y40hXPoDhDXy9Mb+2kG3J6IH2nf?=
 =?us-ascii?Q?Vc6N0imy+sCcVuuOomaOIHkHGyApaCibp+Pht6YJ+5GMymyOoawnMHosco3z?=
 =?us-ascii?Q?+6B1bb9U8Yhw1uCEVoEEOoDRYZ1rhOr5KgbezfLom6bwlMUXMma91nrXQ945?=
 =?us-ascii?Q?Xn1GjDG76tZ/cNOqNBXBlfeZLTtD7lmLHIoBUkSY5Yt0TYpDVP3LCtkZYusW?=
 =?us-ascii?Q?rPNjCsWeS8dzdLBeCRRV3XmjNYGdFhihx9I6E7+rqDVd/yRchKY91WbCVENZ?=
 =?us-ascii?Q?iC7I0ss7Z9cQXWgei5c7gL514SfPqQukV51pvbaertk3uDwCRQ8hg8GevPoW?=
 =?us-ascii?Q?hpfWy/lM5TRQvwvdCrG8twPtLF6jE+bhbqcqk+0afdwOcVCcYf60nxNVGwxZ?=
 =?us-ascii?Q?bOBdCbcVfMZH4Yb/ICJ9TXT5Rzy2Ip6Y8VgeKCTZH0oidTlMjXaIp1sf1pkp?=
 =?us-ascii?Q?uhO7yb7qpxILmTGmw//YdS/jO6uqHVuFL7/51qPcNmQd5uQ97AQwjbHTZIbF?=
 =?us-ascii?Q?wFgVyD6uu0cYEG/4Bhd6XW8rAbTKbDnLgbevYfZ2jvnE7Ga0myGrGTlW8fdw?=
 =?us-ascii?Q?4wH3ZpTcaFdV6MDJNAvuruHQv82zkVmVAI4Kth0F1xGP1+1uJl6sHh4X/XTk?=
 =?us-ascii?Q?pja5X/KotH7vDrMY/VlhtpYxiFATW6aqnHCE0/71/pLVJQbpaMBxLktJO6gI?=
 =?us-ascii?Q?qVCl6V9ZP95nJ6tFjPPBvTe+owy88/ZBKnkJN10dCpVRrBQKAVXHeXX61bdA?=
 =?us-ascii?Q?F6fD7hCXAVUrOO4UTHpSKT2buzqxSmArulcMyUc4hDkPJndv1+Gyn7Pn77AK?=
 =?us-ascii?Q?YI0CwkivxHi2brKm/dZA+rC2EIaWAGJUODKr0jCOC2uLwhzJH10zv7AgtvH3?=
 =?us-ascii?Q?3YKUTmzop408TYU/Obvz2b6nO6EynQnO6jGam48rbZ7KeZlxMBNUj0S6vYfW?=
 =?us-ascii?Q?UU439Q4UY4Sprny94fOx6q5K4XQXICtV82oFJEq/Gni0S9gccGdQLhzdPYxL?=
 =?us-ascii?Q?pv8S/VlPwV1rYX34VFleEYRSvbUpQc6bvjxJrDGCKnbR6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qbZ54ImlWbB3A8q+Osepxdj21gf9Riql/nOm7jgFOSZUMK2JSQhN9Dbzp7i8?=
 =?us-ascii?Q?4FwS9ZbPbtZTb/jSvLM13DCdCMxa08jzJPTzio8iaLueBiL5HUF2oXFjCAgp?=
 =?us-ascii?Q?eVqBS3SfF2T9ftCwL222AeJZF4U4QOQQM8uucmNmDiJi73u/20h+U5E7D2xG?=
 =?us-ascii?Q?V+1AMvrfH4udPvaDp/Ga3txo1I0h3Xk+uE/FPwMyu9AaCHIFwk3e9aHZ7dX1?=
 =?us-ascii?Q?aPpZ4mZRVWDmLqUHKXMxt9NUUicehVGDuB+rIiLCx9JKvzsBTIyTC2otZU2l?=
 =?us-ascii?Q?JLA9d0gDRMNWr+I1rvYdudKXW8keRsIEcc8yzyAvaseZba6qldQMABk76Zln?=
 =?us-ascii?Q?52sbEUDk5ey2pkSs8DyGZZXNthKBYleU28vCmZ3eLNlppFgRhPZbvp6wZkes?=
 =?us-ascii?Q?HOCx8NsZwrqCMD2SwWr20Id+M0gfVhd9oeutzNlb2CFfPlimYno+mPnHon1J?=
 =?us-ascii?Q?rs/uOEECyNZ/MdC6EaazEehWhg4flAKfgiqC5kLAFc+Myz3W/pTEnHruOdx6?=
 =?us-ascii?Q?VdoTxkV0oKjidzz4ylsgkoHpzz8sxsuFJ6AsmzDC5jVn9f48r0dHdzdr8Spo?=
 =?us-ascii?Q?mJd2OZ97LdDWlVdtMQGLTtQXv5qJijvmQaycgyd3X40wouTHItZ1jdu6UEz+?=
 =?us-ascii?Q?6UC1uOzTBlbe3rUD3CXnokz77WuwHscArRGuhDcoeAn40atHDQM0ZQZUUQJm?=
 =?us-ascii?Q?ndR03QNgU7VX6dcGrzHkZyNmEu+FgeVZXoTB6v1x5jZL4TUb1IVZ5yGM/KgB?=
 =?us-ascii?Q?JPFWCNmFdSk2GRZRTe9Y2CMqZuOU/8sE1xheq3VXfeO/ej/7q0QcRbGAOIfq?=
 =?us-ascii?Q?3/k0APKYuAHA9pK53RCTE3Lyb1Za2LkTXK/C1mfTzfF555VxE7mGkvqyM+j8?=
 =?us-ascii?Q?VrYDi/KTRAgZEc/KgjcaAI/ViBg5zH76Rhm71dOZxgZ7gwaZhpDmL4kSUf7i?=
 =?us-ascii?Q?TeAppXvPDVe3KcP2fPOb1LRX7tF9zIVEgZ6mcDRgffaCvc2NvX8ALizcRS38?=
 =?us-ascii?Q?1iAA0Rb+6/PZBRcydqY05m4VGvvAs/apG1ligGMGmMtd77oXjbsV6PoYNUuD?=
 =?us-ascii?Q?+ta1ZoMU7j71f8eJ9Ew8wJcdptwTC9RdSqo6ljTNnBmafBYCBbZ7xl4FJM+I?=
 =?us-ascii?Q?q4e70CEdl4AvJYpi9N8JWEA6HiTlUcN+au+9GAXt9lcqco8l+mWPcwPvybZg?=
 =?us-ascii?Q?670FTAINfsO6r3lYcRCyA6tgxDj8VZVELWcAptUgCBvbETOaNnh5G3KGPzaM?=
 =?us-ascii?Q?5XuTiYof7bAeQIVvnGyr6SdMDycXGucb6SyWln7aoD0ukSCN6Id13p83X+Rz?=
 =?us-ascii?Q?4MLELAoriMuH+WFnoVyNIKq1rFWr+MZOUIg8pp2GP9RYyiFuyhXIF/POtwdq?=
 =?us-ascii?Q?Yx2f/gK3R6SiKAJP+/uhARzty9H/WjB1XuxZl9gejzIjTtV+0EtnGZ3bQKF3?=
 =?us-ascii?Q?dkdCQobiCmdUkt+o88Ba+3Ajy4eyIbLeWvtDG8wQkwQRPboDf2/qWNODA6fw?=
 =?us-ascii?Q?TwrUypBXIk5gqJZZZCQrVv/2mz3aj+ad+xNxqN2adLvuDG4zc6AvVxXLgGyN?=
 =?us-ascii?Q?TA6IIDFe8eQJ2Ayn/LH9qIMExS9h0mnIh/0hPE39HjB3k0WZqTNlpH6sEJ8n?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MoD+cSPgs6LHA+HfbkDpSUVKHoZUDiGVqqV5lJG2qYX5PWlOgkgqNV6xnRuLxkeJAYbbW9WjuLOzfjH+fLgkw8DgAsrP6l/3Lts9pGxt+IBFhGOiTj3oRMevmarfVMtDJSOylZh5kyi8ISbjGF0m4E6nlIOy9Tw9DY0FpHVIl2O4Dl3pqbVSCVZRViLpFLiZc22zHJP+JdT/82OK9wjxDltC7PAC0fOaFT6c8jvjlzu6a1GEtyptMB58UqJ0+noqf4usw/+uU/357BwSqHb0GNvDEad52mlPP0OBXkTuf8n+H91AOdm+XPHOYsOfmuO3HSDMimHxSFCS4CfTcS5Kn433f5OWwhAyqkVeYxFXNeN2yzz0WrhihGZK+lPxdvuid6tdgng19RflPAuKSI10ouosPkZ+Qrbs+Ii1apRE15HnR9EE7BorWqNpLlih6ViS+Pfqe0VIgTV2Ffzzrq/gfy5nhW7YLAGSEuZ63M9blJ6prUn/Ye4Xf916RsFAtoeLexHyU7rqFp6AVTklmSTKc0zJGyLK6NiAurJh7Fd1bidpG2SJ61ROIg0QGCxMfkDipozxJ0ZVGdVJqfniTYIZD5BCBSqjMHxoGuy6IPGfQ7U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be884d7-5323-4330-803a-08dd55e08b6e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:08:25.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhIUZ2B70Bf6nneFCbsokrSKkmHOexkMlOKpXooiC54RfnI2KX3GPIXAah6lLbZ2MIMw3Q7m+bXw5UX2fgR0tAkwGVTmmrUhTtrjEu343xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7413
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250126
X-Proofpoint-GUID: 1xj11magKfhIG7JWuuxv72mByeC5m3le
X-Proofpoint-ORIG-GUID: 1xj11magKfhIG7JWuuxv72mByeC5m3le

ping?

On Fri, Nov 15, 2024 at 03:42:49PM -0500, Kris Van Hees wrote:
> On Tue, Nov 12, 2024 at 01:42:56PM +0000, Nick Alcock wrote:
> > So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
> > canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
> > this requires an explicit mount, and a great many installations have not
> > done this and perhaps never will.  So if the debugfs is mounted on
> > /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
> > as it used to, as another tracefs mount.  And of course there's nothing
> > special about the "canonical location": it's up to the admin, who might
> > choose to remount the thing anywhere at all.
> > 
> > To make this even more fun, it's quite possible to end up with the tracefs
> > on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
> > (I got that during testing with no effort at all).
> > 
> > All this means that the existing DTrace hardwiring for tracefs/eventsfs
> > locations isn't good enough.  Instead, hunt for a suitable tracefs mount with
> > getmntent(), and add a function to open files under that directory, allowing
> > the path to be created using a printf-style format string (mimicking the
> > things we used to do with EVENTSFS defines and the like).  This is actually
> > all we need; there is no need to ever return these paths at all, so there
> > is no clogging up the code with free()s -- and actually there's a
> > noticeable simplification in most cases.
> > 
> > Tested with both in-practice-observed locations of debugfs, and the
> > obviously crazy and bad-in-a-format-string path of "/%s/%s/%n" to make sure
> > that is properly rejected.
> 
> I think it is useful to put the testing (and results) in the commit msg for
> this, especially since you do not have a testcase for this (and I can
> understand why - though if we were to use chroot or something a test could
> be constructed, right).  And the case of tracefs *not* being in standard
> location is worth pointing out to clearly show that this does work in the
> most generic case.
> 
> Or if output of testing is too much to include (I assume it shouldn't be),
> at least make sure you test standard and non-standard locations, and then
> confidently report here that it works for all locations that do not have
> % in the path name.
> 
> > Bug: https://github.com/oracle/dtrace-utils/issues/111
> > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> > ---
> >  include/tracefs.h                             | 14 ----
> >  libdtrace/dt_error.c                          |  3 +-
> >  libdtrace/dt_impl.h                           |  3 +
> >  libdtrace/dt_open.c                           |  1 +
> >  libdtrace/dt_prov_dtrace.c                    | 27 +++----
> >  libdtrace/dt_prov_fbt.c                       | 37 ++++-----
> >  libdtrace/dt_prov_rawtp.c                     |  9 ++-
> >  libdtrace/dt_prov_sdt.c                       | 30 ++++---
> >  libdtrace/dt_prov_syscall.c                   | 27 ++++---
> >  libdtrace/dt_prov_uprobe.c                    | 41 +++++-----
> >  libdtrace/dt_provider.h                       |  1 -
> >  libdtrace/dt_subr.c                           | 80 +++++++++++++++++++
> >  runtest.sh                                    |  8 ++
> >  test/unittest/funcs/tst.rw_.x                 |  7 +-
> >  test/unittest/providers/tst.dtrace_cleanup.sh |  9 ++-
> >  test/utils/clean_probes.sh                    | 12 ++-
> >  16 files changed, 203 insertions(+), 106 deletions(-)
> >  delete mode 100644 include/tracefs.h
> > 
> > diff --git a/include/tracefs.h b/include/tracefs.h
> > deleted file mode 100644
> > index d671f51adefc..000000000000
> > --- a/include/tracefs.h
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace; simple uprobe helper functions
> > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -#ifndef	_TRACEFS_H
> > -#define	_TRACEFS_H
> > -
> > -#define TRACEFS		"/sys/kernel/debug/tracing/"
> > -#define EVENTSFS	TRACEFS "events/"
> > -
> > -#endif /* _TRACEFS_H */
> > diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> > index 213f0d9e1385..9c4a2b32888e 100644
> > --- a/libdtrace/dt_error.c
> > +++ b/libdtrace/dt_error.c
> > @@ -98,7 +98,8 @@ static const struct {
> >  	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
> >  	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
> >  	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> > -	{ EDT_PRINT, "Missing or corrupt print() record" }
> > +	{ EDT_PRINT, "Missing or corrupt print() record" },
> > +	{ EDT_TRACEFS, "Cannot find tracefs" }
> >  };
> >  
> >  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 68fb8ec53c06..950cb34819aa 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -354,6 +354,7 @@ struct dtrace_hdl {
> >  	char *dt_module_path;	/* pathname of kernel module root */
> >  	dt_version_t dt_kernver;/* kernel version, used in the libpath */
> >  	char *dt_dofstash_path;	/* Path to the DOF stash.  */
> > +	char *dt_tracefs_path;	/* Path to tracefs.  */
> >  	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
> >  	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
> >  	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
> > @@ -643,6 +644,7 @@ enum {
> >  	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
> >  	EDT_PCAP,		/* missing or corrupt pcap() record */
> >  	EDT_PRINT,		/* missing or corrupt print() record */
> > +	EDT_TRACEFS,		/* cannot find tracefs */
> >  };
> >  
> >  /*
> > @@ -713,6 +715,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
> >  
> >  extern int dt_gmatch(const char *, const char *);
> >  extern char *dt_basename(char *);
> > +extern int dt_tracefs_open(dtrace_hdl_t *, const char *fn, int flags, ...);
> >  
> >  extern ulong_t dt_popc(ulong_t);
> >  extern ulong_t dt_popcb(const ulong_t *, ulong_t);
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index e1972aa821e7..775830f64492 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -1317,6 +1317,7 @@ dtrace_close(dtrace_hdl_t *dtp)
> >  	free(dtp->dt_cpp_argv);
> >  	free(dtp->dt_cpp_path);
> >  	free(dtp->dt_ld_path);
> > +	free(dtp->dt_tracefs_path);
> >  	free(dtp->dt_sysslice);
> >  	free(dtp->dt_dofstash_path);
> >  
> > diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> > index 34b5d8e2467f..670954beb4c9 100644
> > --- a/libdtrace/dt_prov_dtrace.c
> > +++ b/libdtrace/dt_prov_dtrace.c
> > @@ -23,8 +23,6 @@ static const char		funname[] = "";
> >  
> >  #define PROBE_FUNC_SUFFIX	"_probe"
> >  
> > -#define UPROBE_EVENTS		TRACEFS "uprobe_events"
> 
> Since you keep KPROBE_EVENTS etc in other providers, why not here?
> 
> > -
> >  static const dtrace_pattr_t	pattr = {
> >  { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
> >  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> > @@ -229,11 +227,9 @@ out:
> >  static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  {
> >  	if (!dt_tp_probe_has_info(prp)) {
> > -		char	*spec;
> > -		char	*fn;
> > -		FILE	*f;
> > -		size_t	len;
> > -		int	fd, rc = -1;
> > +		char		*spec;
> > +		FILE		*f;
> > +		int		fd = -1, rc = -1;
> >  
> >  		/* get a uprobe specification for this probe */
> >  		spec = uprobe_spec(getpid(), prp->desc->prb);
> > @@ -241,7 +237,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  			return -ENOENT;
> >  
> >  		/* add a uprobe */
> > -		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> > +		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> > +
> >  		if (fd != -1) {
> >  			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
> >  				     GROUP_DATA, prp->desc->prb, spec);
> > @@ -252,16 +249,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  			return -ENOENT;
> >  
> >  		/* open format file */
> > -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> > -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> > -		fn = dt_alloc(dtp, len);
> > -		if (fn == NULL)
> > +		fd = dt_tracefs_open(dtp, "events/" GROUP_FMT "/%s/format",
> > +				     O_RDONLY, GROUP_DATA, prp->desc->prb);
> > +		if (fd < 0)
> >  			return -ENOENT;
> >  
> > -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> > -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> > -		f = fopen(fn, "r");
> > -		dt_free(dtp, fn);
> > +		f = fdopen(fd, "r");
> >  		if (f == NULL)
> >  			return -ENOENT;
> >  
> > @@ -296,7 +289,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> >  
> >  	dt_tp_probe_detach(dtp, prp);
> >  
> > -	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> > +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> >  	if (fd == -1)
> >  		return;
> >  
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 21f63ddffc73..b5c1f5d22a06 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -43,8 +43,8 @@
> >  static const char		prvname[] = "fbt";
> >  static const char		modname[] = "vmlinux";
> >  
> > -#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> > -#define PROBE_LIST		TRACEFS "available_filter_functions"
> > +#define KPROBE_EVENTS		"kprobe_events"
> > +#define PROBE_LIST		"available_filter_functions"
> >  
> >  #define FBT_GROUP_FMT		GROUP_FMT "_%s"
> >  #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> > @@ -65,6 +65,7 @@ static int populate(dtrace_hdl_t *dtp)
> >  {
> >  	dt_provider_t		*prv;
> >  	dt_provimpl_t		*impl;
> > +	int			fd;
> >  	FILE			*f;
> >  	char			*buf = NULL;
> >  	char			*p;
> > @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
> >  	if (prv == NULL)
> >  		return -1;			/* errno already set */
> >  
> > -	f = fopen(PROBE_LIST, "r");
> > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > +	if (fd < 0)
> > +		return 0;
> > +
> > +	f = fdopen(fd, "r");
> >  	if (f == NULL)
> >  		return 0;
> >  
> > @@ -363,16 +368,14 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  {
> >  	if (!dt_tp_probe_has_info(prp)) {
> > -		char	*fn;
> > -		FILE	*f;
> > -		size_t	len;
> > -		int	fd, rc = -1;
> > +		FILE		*f;
> > +		int		fd, rc = -1;
> >  
> >  		/*
> >  		 * Register the kprobe with the tracing subsystem.  This will
> >  		 * create a tracepoint event.
> >  		 */
> > -		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > +		fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
> >  		if (fd == -1)
> >  			return -ENOENT;
> >  
> > @@ -383,19 +386,13 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  		if (rc == -1)
> >  			return -ENOENT;
> >  
> > -		/* create format file name */
> > -		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> > -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> > -		fn = dt_alloc(dtp, len);
> > -		if (fn == NULL)
> > +		/* open format file */
> > +		fd = dt_tracefs_open(dtp, "events/" FBT_GROUP_FMT "/%s/format",
> > +				     O_RDONLY, FBT_GROUP_DATA, prp->desc->fun);
> > +		if (fd < 0)
> >  			return -ENOENT;
> >  
> > -		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> > -			 FBT_GROUP_DATA, prp->desc->fun);
> > -
> > -		/* open format file */
> > -		f = fopen(fn, "r");
> > -		dt_free(dtp, fn);
> > +		f = fdopen(fd, "r");
> >  		if (f == NULL)
> >  			return -ENOENT;
> >  
> > @@ -431,7 +428,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> >  
> >  	dt_tp_probe_detach(dtp, prp);
> >  
> > -	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > +	fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
> >  	if (fd == -1)
> >  		return;
> >  
> > diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> > index 778a6f9cde90..6940edce6a6d 100644
> > --- a/libdtrace/dt_prov_rawtp.c
> > +++ b/libdtrace/dt_prov_rawtp.c
> > @@ -38,7 +38,7 @@
> >  static const char		prvname[] = "rawtp";
> >  static const char		modname[] = "vmlinux";
> >  
> > -#define PROBE_LIST		TRACEFS "available_events"
> > +#define PROBE_LIST		"available_events"
> >  
> >  #define KPROBES			"kprobes"
> >  #define SYSCALLS		"syscalls"
> > @@ -64,6 +64,7 @@ static const dtrace_pattr_t	pattr = {
> >  static int populate(dtrace_hdl_t *dtp)
> >  {
> >  	dt_provider_t	*prv;
> > +	int		fd;
> >  	FILE		*f;
> >  	char		*buf = NULL;
> >  	char		*p;
> > @@ -73,7 +74,11 @@ static int populate(dtrace_hdl_t *dtp)
> >  	if (prv == NULL)
> >  		return -1;			/* errno already set */
> >  
> > -	f = fopen(PROBE_LIST, "r");
> > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > +	if (fd < 0)
> > +		return 0;
> > +
> > +	f = fdopen(fd, "r");
> >  	if (f == NULL)
> >  		return 0;
> >  
> > diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> > index 675e0458ca4c..7ebe010efa79 100644
> > --- a/libdtrace/dt_prov_sdt.c
> > +++ b/libdtrace/dt_prov_sdt.c
> > @@ -36,7 +36,7 @@
> >  static const char		prvname[] = "sdt";
> >  static const char		modname[] = "vmlinux";
> >  
> > -#define PROBE_LIST		TRACEFS "available_events"
> > +#define PROBE_LIST		"available_events"
> >  
> >  #define KPROBES			"kprobes"
> >  #define SYSCALLS		"syscalls"
> > @@ -62,6 +62,7 @@ static const dtrace_pattr_t	pattr = {
> >  static int populate(dtrace_hdl_t *dtp)
> >  {
> >  	dt_provider_t	*prv;
> > +	int		fd;
> >  	FILE		*f;
> >  	char		*buf = NULL;
> >  	char		*p;
> > @@ -71,7 +72,11 @@ static int populate(dtrace_hdl_t *dtp)
> >  	if (prv == NULL)
> >  		return -1;			/* errno already set */
> >  
> > -	f = fopen(PROBE_LIST, "r");
> > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > +	if (fd < 0)
> > +		return 0;
> > +
> > +	f = fdopen(fd, "r");
> >  	if (f == NULL)
> >  		return 0;
> >  
> > @@ -192,16 +197,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >  			      int *argcp, dt_argdesc_t **argvp)
> >  {
> > +	int				fd;
> >  	FILE				*f;
> > -	char				*fn;
> >  	int				rc;
> >  	const dtrace_probedesc_t	*pdp = prp->desc;
> >  
> > -	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
> > -		return dt_set_errno(dtp, EDT_NOMEM);
> > +	fd = dt_tracefs_open(dtp, "events/%s/%s/format", O_RDONLY, pdp->mod, pdp->prb);
> > +	if (fd < 0)
> > +		return -ENOENT;
> >  
> > -	f = fopen(fn, "r");
> > -	free(fn);
> > +	f = fdopen(fd, "r");
> >  	if (!f)
> >  		return -ENOENT;
> >  
> > @@ -223,15 +228,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >  	int			argc = 0;
> >  	dt_argdesc_t		*argv = NULL;
> >  	dtrace_typeinfo_t	sym;
> > +	int			fd;
> >  	FILE			*f;
> >  	uint32_t		id;
> >  
> >  	/* Retrieve the event id. */
> > -	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
> > -		return dt_set_errno(dtp, EDT_NOMEM);
> >  
> > -	f = fopen(str, "r");
> > -	free(str);
> > +	fd = dt_tracefs_open(dtp, "events/%s/%s/id", O_RDONLY,
> > +			     prp->desc->mod, prp->desc->prb);
> > +	if (fd < 0)
> > +		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> > +
> > +	f = fdopen(fd, "r");
> >  	if (!f)
> >  		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> >  
> > diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> > index 20843c6f538e..63ce3bc43ae1 100644
> > --- a/libdtrace/dt_prov_syscall.c
> > +++ b/libdtrace/dt_prov_syscall.c
> > @@ -38,7 +38,7 @@
> >  static const char		prvname[] = "syscall";
> >  static const char		modname[] = "vmlinux";
> >  
> > -#define SYSCALLSFS		EVENTSFS "syscalls/"
> > +#define SYSCALLSFS		"events/syscalls/"
> >  
> >  /*
> >   * We need to skip over an extra field: __syscall_nr.
> > @@ -61,7 +61,7 @@ struct syscall_data {
> >  
> >  #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
> >  
> > -#define PROBE_LIST	TRACEFS "available_events"
> > +#define PROBE_LIST	"available_events"
> >  
> >  #define PROV_PREFIX	"syscalls:"
> >  #define ENTRY_PREFIX	"sys_enter_"
> > @@ -71,6 +71,7 @@ struct syscall_data {
> >  static int populate(dtrace_hdl_t *dtp)
> >  {
> >  	dt_provider_t	*prv;
> > +	int		fd;
> >  	FILE		*f;
> >  	char		*buf = NULL;
> >  	size_t		n;
> > @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
> >  	if (prv == NULL)
> >  		return -1;			/* errno already set */
> >  
> > -	f = fopen(PROBE_LIST, "r");
> > +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> > +	if (fd < 0)
> > +		return 0;
> > +
> > +	f = fdopen(fd, "r");
> >  	if (f == NULL)
> >  		return 0;
> >  
> > @@ -195,23 +200,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >  		      int *argcp, dt_argdesc_t **argvp)
> >  {
> > +	int		fd;
> >  	FILE		*f;
> > -	char		fn[256];
> >  	int		rc;
> >  
> >  	/*
> >  	 * We know that the probe name is either "entry" or "return", so we can
> >  	 * just check the first character.
> >  	 */
> > -	strcpy(fn, SYSCALLSFS);
> > -	if (prp->desc->prb[0] == 'e')
> > -		strcat(fn, "sys_enter_");
> > -	else
> > -		strcat(fn, "sys_exit_");
> > -	strcat(fn, prp->desc->fun);
> > -	strcat(fn, "/format");
> > +	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
> > +			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
> > +			     prp->desc->fun);
> > +	if (fd < 0)
> > +		return -ENOENT;
> >  
> > -	f = fopen(fn, "r");
> > +	f = fdopen(fd, "r");
> >  	if (!f)
> >  		return -ENOENT;
> >  
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index 205014617586..6a02243ff572 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -1116,13 +1116,13 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
> >   * uprobe may be a uretprobe.  Return the probe's name as
> >   * a new dynamically-allocated string, or NULL on error.
> >   */
> > -static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> > -			   uint64_t addr, int flags)
> > +static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
> > +			   const char *mapping_fn, uint64_t addr, int flags)
> >  {
> > -	int	fd = -1;
> > -	int	rc = -1;
> > -	char	*name;
> > -	char	*spec;
> > +	int		fd = -1;
> > +	int		rc = -1;
> > +	char		*name;
> > +	char		*spec;
> >  
> >  	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
> >  		return NULL;
> > @@ -1132,8 +1132,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> >  		goto out;
> >  
> >  	/* Add the uprobe. */
> > -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> > -	if (fd == -1)
> > +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> > +	if (fd < 0)
> >  		goto out;
> >  
> >  	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
> > @@ -1153,8 +1153,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
> >  {
> >  	dt_uprobe_t	*upp = uprp->prv_data;
> >  	tp_probe_t	*tpp = upp->tp;
> > +	int		fd;
> >  	FILE		*f;
> > -	char		*fn;
> >  	char		*prb = NULL;
> >  	int		rc = -1;
> >  
> > @@ -1163,7 +1163,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
> >  
> >  	assert(upp->fn != NULL);
> >  
> > -	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
> > +	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
> >  			    upp->flags);
> >  
> >  	/*
> > @@ -1177,12 +1177,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
> >  				  upp->flags);
> >  
> >  	/* open format file */
> > -	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
> > +	fd = dt_tracefs_open(dtp, "events/%s/format", O_RDONLY, prb);
> >  	free(prb);
> > -	if (rc < 0)
> > +	if (fd < 0)
> >  		return -ENOENT;
> > -	f = fopen(fn, "r");
> > -	free(fn);
> > +
> > +	f = fdopen(fd, "r");
> >  	if (f == NULL)
> >  		return -ENOENT;
> >  
> > @@ -1251,21 +1251,20 @@ done:
> >   * Destroy a uprobe for a given device and address.
> >   */
> >  static int
> > -uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
> > +uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
> >  {
> > -	int	fd = -1;
> > -	int	rc = -1;
> > -	char	*name;
> > +	int		fd = -1;
> > +	int		rc = -1;
> > +	char		*name;
> >  
> >  	name = uprobe_name(dev, ino, addr, flags);
> >  	if (!name)
> >  		goto out;
> >  
> > -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> > +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> >  	if (fd == -1)
> >  		goto out;
> >  
> > -
> >  	rc = dprintf(fd, "-:%s\n", name);
> >  
> >  out:
> > @@ -1297,7 +1296,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
> >  
> >  	dt_tp_detach(dtp, tpp);
> >  
> > -	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
> > +	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
> >  }
> >  
> >  /*
> > diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> > index 8f143dceaed7..4598a380b950 100644
> > --- a/libdtrace/dt_provider.h
> > +++ b/libdtrace/dt_provider.h
> > @@ -12,7 +12,6 @@
> >  #include <dt_impl.h>
> >  #include <dt_ident.h>
> >  #include <dt_list.h>
> > -#include <tracefs.h>
> >  
> >  #ifdef	__cplusplus
> >  extern "C" {
> > diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> > index d5dca164861e..f129e5591465 100644
> > --- a/libdtrace/dt_subr.c
> > +++ b/libdtrace/dt_subr.c
> > @@ -20,6 +20,7 @@
> >  #include <assert.h>
> >  #include <limits.h>
> >  #include <sys/ioctl.h>
> > +#include <mntent.h>
> >  #include <port.h>
> >  
> >  #include <dt_impl.h>
> > @@ -998,3 +999,82 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
> >  
> >  	return hval;
> >  }
> > +
> > +/*
> > + * Find the tracefs and store it away in dtp.
> > + */
> > +static int
> > +find_tracefs_path(dtrace_hdl_t *dtp)
> > +{
> > +	FILE *mounts;
> > +	struct mntent *mnt;
> > +
> > +	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
> > +		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
> > +		return dt_set_errno(dtp, EDT_TRACEFS);
> > +	}
> > +
> > +	while ((mnt = getmntent(mounts)) != NULL) {
> > +		/*
> > +		 * Only accept tracefs paths that do not contain percent
> > +		 * characters in their mounted paths, since we use this
> > +		 * to augment a format string in dt_tracefs_vfn().
> > +		 */
> > +		if ((strcmp(mnt->mnt_type, "tracefs") == 0) &&
> > +		    (strchr(mnt->mnt_dir, '%') == NULL)) {
> > +			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
> > +			break;
> > +		}
> > +	}
> > +	endmntent(mounts);
> > +
> > +	if (!dtp->dt_tracefs_path) {
> > +		dt_dprintf("Cannot find a suitable tracefs path.\n");
> > +		return dt_set_errno(dtp, EDT_TRACEFS);
> > +	}
> > +
> > +	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
> > +
> > +	return 0;
> > +}
> > +
> > +static char *
> > +dt_tracefs_vfn(dtrace_hdl_t *dtp, const char *fn, va_list ap)
> > +{
> > +	char *full_fn;
> > +	char *str;
> > +
> > +	if (!dtp->dt_tracefs_path)
> > +		if (find_tracefs_path(dtp) < 0)
> > +			return NULL;		/* errno is set for us. */
> > +
> > +	if (asprintf(&full_fn, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
> > +		dt_set_errno(dtp, EDT_NOMEM);
> > +		return NULL;
> > +	}
> > +
> > +	if (vasprintf(&str, full_fn, ap) < 0) {
> > +		str = NULL;
> > +		dt_set_errno(dtp, EDT_NOMEM);
> > +	}
> > +	free(full_fn);
> > +	return str;
> > +}
> > +
> > +int
> > +dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, int flags, ...)
> > +{
> > +	va_list ap;
> > +	char *str;
> > +	int fd;
> > +
> > +	va_start(ap, flags);
> > +	if ((str = dt_tracefs_vfn(dtp, fn, ap)) == NULL) {
> > +		va_end(ap);
> > +		return -1; 			/* errno is set for us. */
> > +	}
> > +
> > +	fd = open(str, flags, 0666);
> > +	free(str);
> > +	return fd;				/* errno is set for us. */
> > +}
> > diff --git a/runtest.sh b/runtest.sh
> > index 46b532d7e161..fbf4e60c82a9 100755
> > --- a/runtest.sh
> > +++ b/runtest.sh
> > @@ -607,6 +607,14 @@ elif ! /usr/bin/cpp -x c -fno-show-column - /dev/null < /dev/null 2>&1 | \
> >      export DTRACE_OPT_CPPARGS="-fno-show-column"
> >  fi
> >  
> > +# Find the tracefs.
> > +tracefs="$(awk '$3 == "tracefs" { print $2; exit; }' /proc/mounts)"
> > +if [[ -z $tracefs ]]; then
> > +    echo "Cannot find any tracefs mounts in /proc/mounts.  Some tests will fail." >&2
> > +fi
> > +
> > +export tracefs
> > +
> >  # More than one dtrace tree -> run tests for all dtraces, and verify identical
> >  # intermediate code is produced by each dtrace.
> >  
> > diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
> > index 29c581116154..5737c7575a26 100755
> > --- a/test/unittest/funcs/tst.rw_.x
> > +++ b/test/unittest/funcs/tst.rw_.x
> > @@ -1,6 +1,11 @@
> >  #!/bin/sh
> >  
> > -FUNCS=/sys/kernel/debug/tracing/available_filter_functions
> > +FUNCS=${tracefs}/available_filter_functions
> > +
> > +if [[ ! -e $FUNCS ]]; then
> > +	echo no tracefs found
> > +	exit 1
> > +fi
> >  
> >  if ! grep -qw  _raw_read_lock $FUNCS; then
> >          echo no _raw_read_lock FBT probe due to kernel config
> > diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
> > index 4ac59ccb4315..f3e434ae76fc 100755
> > --- a/test/unittest/providers/tst.dtrace_cleanup.sh
> > +++ b/test/unittest/providers/tst.dtrace_cleanup.sh
> > @@ -1,7 +1,7 @@
> >  #!/bin/bash
> >  #
> >  # Oracle Linux DTrace.
> > -# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
> > +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
> >  # Licensed under the Universal Permissive License v 1.0 as shown at
> >  # http://oss.oracle.com/licenses/upl.
> >  
> > @@ -14,7 +14,12 @@
> >  ##
> >  
> >  dtrace=$1
> > -UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
> > +UPROBE_EVENTS=${tracefs}/uprobe_events
> > +
> > +if [[ ! -e $UPROBE_EVENTS ]]; then
> > +	echo "no tracefs/uprobe_events" >&2
> > +	exit 67
> > +fi
> >  
> >  out=/tmp/output.$$
> >  $dtrace $dt_flags -n BEGIN,END &>> $out &
> > diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> > index 8292b3096424..cfd100088eb7 100755
> > --- a/test/utils/clean_probes.sh
> > +++ b/test/utils/clean_probes.sh
> > @@ -1,9 +1,13 @@
> >  #!/usr/bin/bash
> >  
> > -TRACEFS=/sys/kernel/debug/tracing
> > -EVENTS=${TRACEFS}/available_events
> > -KPROBES=${TRACEFS}/kprobe_events
> > -UPROBES=${TRACEFS}/uprobe_events
> > +EVENTS=${tracefs}/available_events
> > +KPROBES=${tracefs}/kprobe_events
> > +UPROBES=${tracefs}/uprobe_events
> > +
> > +# We can't work without the tracefs: just give up quietly.
> > +if [[ ! -e $EVENTS ]]; then
> > +    exit 0
> > +fi
> >  
> >  # Check permissions
> >  if [[ ! -r ${EVENTS} ]]; then
> > -- 
> > 2.46.0.278.g36e3a12567
> > 
