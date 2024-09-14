Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D7F9443
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 01:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726279192; cv=fail; b=OrEMeBZxuihoIhos+1FtJwynNZVDwGluy/RBCWrWU/V5DvRqZxtWH9IrxAeCU0rWwQOiBWM15Cpd5gHu7kI5dUEH6etBlHaA1LtfiO5H0Lfh8vWjPjLJwENs95sKgJdaZwlB+WWmedB7L+HTEyRYBuYYQaDaO72Hm+OLEklHK7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726279192; c=relaxed/simple;
	bh=MzR15UBw9y2TB0fYsYDYRDwNGQ84NuoCCrwJR9mkT3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L49rxAoOR32hjApbp5OXFaziZ64Lzi8L3Kydts3vsDLT67eShaEi3k4POXYSiO6m3Hn/sy5MtXfK2sUZo3EmMEqeAKSCaqdZ4lqRfF+kJW2oE2BVPFK8eFi27Qe7jdFcNAniTC8Y2BIRDzP2NPUasgK9jEcA1IAbxuURdITbtpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=If611Y87; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=obUlU1dA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="If611Y87";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="obUlU1dA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48E1vYa1021434
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 01:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=fSZyJF3RW5xsMfh
	axkHfAd2iht4Coy9CrJVncq61KIA=; b=If611Y87Ellp/jDKIz3LWzDmg7HvWpA
	4jjLA+pQWe8vlIZUgMc7mZpGv8zdnK5uFkDBo3cP9d7K3pQvRhKjqZde/jKasYs2
	YIn/jfKmAk/zUfyUwvwF2yTO7tphzX44mOp3UXyzwqMQjU8utf3Uu5RjFK7mA22A
	yWe3/QVZG9XnBBZAcgqV4+YU1tG9kS9hSVYPNBxsK6qS2Ofm3Dp07dc/Dy7jPBFw
	EejjwTi/RPGM0VrfR5jVHZhQXfCj+69Sk3lwbMTJwmNBqAmzH8WuirqV9QV4ChgI
	adOjr8l5jHTPD6jxsnQ+F6CR9WAJnsQLENU908F+9OnKri8AaK+Tl1w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n192r02t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 01:59:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48E1XavL036883
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 01:59:48 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x68b0y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 01:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4C3Q7X31YqDciFugRkd6H1KvTVeslWyeHPcVh0MezLPujsf/HjIg/hF6Cc0XL36p9wNTbsYGMR6wECZ3MAvdmz7+HlWyD0/Z5gBoaJnsEtAqLk6m/A20mpv+kodmHXMD5JCgV0boAZz0+yMD3M+r9kRnbqj9o3I99N61gQP15we7vrvIscdChUzkxkY8L7UhP8THkU+FpaQArHDRw3vbinQyQDknqAG7JmMDALsB5URPVqBtXitjfZC1954I4aOY0pIV6uHvegQgGVAj/Vc722Y9p8Fzld74f2FxNWKfx7C80tjHoaURFSUC+nACaERSYzYriKtrEP1nSXcXOrvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSZyJF3RW5xsMfhaxkHfAd2iht4Coy9CrJVncq61KIA=;
 b=UZUzqcqsnApXwozGz4nZbdzoHakg0pa5Hi25Z5jAl5tCqV7ypgPcr7GNqAEtnZq6NANagw04f/4hQetODshQ3EIMZlmC6vExA0MRxfLHt+Z/82fjTY+d1c+bbUd3WMoH6/Ss5jJXNgFG9qiLJBqVe+fmsUr7WWz8fXHK82F/jvzSHiiVVpHFOeEgPkhh2pwmJ/LMpxZ2zSt/pTI/hEBEAFgIRrXmZlR7FCKf5Hk9Nzs7Z7qQB362iC9ESozOcIGM0w99IsKjz0sXyDIXN1jqEgyNE4Vuq5BURmv1pmEvmiKB9TdXrqW87/DjDzif8HgyC6HqiEMbnIANt/vqeoNW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSZyJF3RW5xsMfhaxkHfAd2iht4Coy9CrJVncq61KIA=;
 b=obUlU1dAXuLQUCV0x179yrk+Ie7Uso2wExQXXNi8BfH93e8VZHzE3fDPLbEQBc83YAzZidLk/WhCS52y5hpQRlHmlPHkbKKBW9HdSrRIFQmrW9HxhYgfvjVlNMxba0d29Xx8RQEDYhPWxqzSlQSHIiTwQ9YT0Ixdb1w7CZEHUFA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.9; Sat, 14 Sep
 2024 01:59:45 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 01:59:45 +0000
Date: Fri, 13 Sep 2024 21:59:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 07/22] Supply a default probe_info()
Message-ID: <ZuTuDumQTJ7R+f0W@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-7-eugene.loh@oracle.com>
 <ZuTZVNrF2WAZpbrV@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuTZVNrF2WAZpbrV@oracle.com>
X-ClientProxiedBy: BLAPR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:208:329::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 682926cd-e9fc-4592-16a7-08dcd460e7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E+92aUb0IjKAZ6jSg25vVbImt74luvaCJ5xq5bahnTWRgpeWMrLayeYGIH3r?=
 =?us-ascii?Q?Wp4rWHbYpmZo0gJXyfHjOTBMHMAem4nJlytZAVv4OY9rsg2PNsuU6O347f2f?=
 =?us-ascii?Q?OnyL1e6EGZ6/DfKuJul4gUrEsWHI4y95p6ZwdgsyjehB+aOiT34O/XqvZ2tc?=
 =?us-ascii?Q?zUHGrxZGIPpF4yPJ6lY0r74uqFy+ImqGRnk3JtnlnB8V5eZ609D0A40prciC?=
 =?us-ascii?Q?SN0QH/y+CHeikNqdedxmVjLgw1t3vHp0C0NES5JCOHzrFTLTH9TeTspotyMQ?=
 =?us-ascii?Q?A0i/jSkRONNgbiWKf1rGh4niLyCzs+YMRNqNi97OwuRDoJVpGe0zUxAFI9QD?=
 =?us-ascii?Q?FsqBJSW+tI4fwvOixSeps5tfq289j8PCeFBNH8u/T1oCkzobBdphoQoUe475?=
 =?us-ascii?Q?fHL0vXtzCMBsnAvGZWApAqQPPzGEYmWkAoORU6e3XPCp2C3qis1b6KncGEnZ?=
 =?us-ascii?Q?SQkswYSIHrRiXkAr5TdMda+QPavb2O6iqqXFPnPZdYt3EEy48uKKeYOB9mui?=
 =?us-ascii?Q?9gAUSoKGgZXpT0Qr160z6qKuhEMyh+qpW/FMKmLtPwTDZ2XWEt/z5vql/mlB?=
 =?us-ascii?Q?rKboCmsFOJ7j3SyvF9bKZo2Jg9R4a4DR/FWauwRYUKRcOXY8kQbKIQ36ah02?=
 =?us-ascii?Q?c5k51Qefe/YyuFVHKEFnS4uI1CIEy5BIX/as4baL1T87OwLyR7FmUDMEyiH5?=
 =?us-ascii?Q?M8yCFwh/09+//C4JHFfECgkRNGLL/x06Lf+j0pxXU2qGcUTdsaUJ/RVqbn/V?=
 =?us-ascii?Q?u/dfcboQEv4TPMV8JSIXuSFo6CHK5W3gL/XQqg2BfRauOQ6ebHhIT2v2okBl?=
 =?us-ascii?Q?5zU56F4jX/doqs6yD2QDVpK7k9XtcF9i81/2nRqdy8/eYo6FlZkKxL0YL/Ya?=
 =?us-ascii?Q?zyheDDtm06v5bocG0mFq89E1pQ0XR5lyz+QKNq1P1UIZ97z6IMhRMVzSWUhQ?=
 =?us-ascii?Q?bRg7YSJVNqnfBukDDSm/3CIeUBICqBn8GP1UbK1QQkqM2kfY7ZUGU4E6AUzP?=
 =?us-ascii?Q?+NtX+cf8qzqVB043OkeTws3Z+FVAG54LZJqAjgzqxEalxacZIBT3syCQhPBg?=
 =?us-ascii?Q?JEzX9dOS5kVV7P9zH3HCgZRnsQuzjVP4VVPcyaIN21zSvlYcXaFaw/dITvu2?=
 =?us-ascii?Q?WCamu+dV0nFNbtI3S9Zbrh3MQKJTy6Bb4IKh9RiKRkgWrZsCOqK6C00uJgoo?=
 =?us-ascii?Q?c9HEH+tUW4ljTsGUcuvLWp8sn0X9kRwc1SbK91gr60fk6LNz4tx+B/kgbomP?=
 =?us-ascii?Q?AWxeG5qEr5M4yUH2jBYHEzPU79FxEtNKHHJb52chm4wnMZQN9OKuO1FmLBdI?=
 =?us-ascii?Q?5lSa/Wcuxh+HexqmebEPc7Z4MIeu6BrNlScIfOYWFnAtWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZkOQEWsBn8Ujllg9Qm1+ZsWhg4CzcJ84TjUYdUU38M2davhgcSl9ZpLW5WV3?=
 =?us-ascii?Q?C5/gR+5C6nQ4c8dsEdTbkdeY2isy0xxqgWvR5stOZYyNy3doF1SMh0FM48+D?=
 =?us-ascii?Q?Jh7S/tsuKJzUGuPdUs1FakEuwSqLs3YWPU3gsKSjmrexgDglF/P850iWNPzR?=
 =?us-ascii?Q?qcuRYxoJ9iybhKZfGf7r1/Os+tAFt3iP4cOtuRNHN1sTC9YIuXR/lViUyCdf?=
 =?us-ascii?Q?LxrlAhCkAcpQ7lMqhmK4+ldoseyKR82KwN0J2lLXfKIYbISBVyGiJEYSiDYm?=
 =?us-ascii?Q?UctRzbZNoMzJXPZ3PTdvFdJ7VyZG2QEHfg04vv4Pyd7YQvBeKahtMU7233se?=
 =?us-ascii?Q?OgqAFuNoDu5Wmk9rR+KCc4XEv+RdSJ7M/vWgK2x7Zj9TPVTyB0SJ4iRpfBBz?=
 =?us-ascii?Q?BF7Q2MoSEQqRHifAjNV6T76VsWHZDZ/iKzW0Qx0uiPhrtsLUsEmdP+byPasg?=
 =?us-ascii?Q?UDJeJQGNTyMqBjlgqT8h6UFYBCcruO8Mf76L4Fqpi5atX1AxK9e4VVa5dNlE?=
 =?us-ascii?Q?di9ftkATCGE7k6LKq5cVeSrNBDXkfuXbYu+k/7Q1KWQ0kun4If+X7xbrdKVG?=
 =?us-ascii?Q?AGJ1Rndp2tPKYLr3Mcv0q0zTF8s9yZU4nh4D3JCn6sPlhLM/o31a8rAAAmVy?=
 =?us-ascii?Q?ivfUcWesnifYmXEl+B6ylFU/njRWsKSgNmOiI5MavQ6U9xkm/BafdHZBthOH?=
 =?us-ascii?Q?jpouqKvoE6YdNRBaIqtjSWCsXnv23jOIfhQZXS0cxrFMj8X0iTPMzDJYYKxN?=
 =?us-ascii?Q?qbzw4dqwRqGQh1VH7s7eo51QrAn7/4Pn4D0kNuYITDLvQrlBxofmTN/DGbYc?=
 =?us-ascii?Q?QBJ1o3QD/cUq0IF7XCVOMvxobe9uuWkc3WcK0C/t5ItABV9no1IzU5Ls3/NU?=
 =?us-ascii?Q?N4Dsun4vIfDgr1kPGxnaNEkA4MW2VVYj0w7/jwweAmQ6zxIiQz9RFnS5AATJ?=
 =?us-ascii?Q?l/8Zs5hryiGL+QVYsMsD5EPA6KPiIi1PlUOHBEV3/HacalPMsyCSnfqnUEec?=
 =?us-ascii?Q?kVviWpjTGQz3GxUd3H4hCvY7teUXp0SPivIs+hq8nIC7c87JmeYVe6OGU0uV?=
 =?us-ascii?Q?y0siretpOSQn6dAUCSDaJWpjHou+UH5rmt4PbUc9utpKFXJgmntkqpjXqiYJ?=
 =?us-ascii?Q?7fbvkGgZc2+hHai155nl2QO5kti5UjPDSf928H2dOawVlEAPd3xIaN2o9xzo?=
 =?us-ascii?Q?vnynEdq+OiKvvrRJy1CVwM9lRa0tPGEJxyEfhOnEfKUmmLjlXmoh69q7ymgM?=
 =?us-ascii?Q?9daoKFGKtH10H9q4AE/ghAztMcMydlXyimL0tgmgo6Ia+JnS8mjRF7ReL+nR?=
 =?us-ascii?Q?ScJIPHEPJSiw4bOg0nAA5N3VWdmzNz1F0UEQTuurX4+PH2YKTV5INZo1pNxy?=
 =?us-ascii?Q?HjSNr1eRKsAoc/QlTrzQYN7NL62VO+z+a49nInpZ8EcwFtYSMX1N3KNuHF20?=
 =?us-ascii?Q?8TV5lKjBsO7Ce/DEQ3l5oev2+ja/qTjnzZMp4yH2WN0UqJv77IpmlYSpGWnd?=
 =?us-ascii?Q?pCJFh4095tMeRUXo8ORjyFl5KeXN6nuJfXMemqp7E3VGY77NrnhipwttYDZY?=
 =?us-ascii?Q?x38PvlfxyEWEbiTEzguR0VlaiWLP1WrRE652BCxQhEGZqwXZG1fN7U2NoDQi?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0Oj9Gem1qdoQ0Xheg5eqobe1DL+F8POeygDA16k+K1+ToeE1zsQHCmH+dLmfHkf/5J8hkI/TPlIab/3zvGTJp4LaJbVi7TjZ7rBKMTo2EK4OPZx5mqzzLFCl9YV/MXAAj0xq2PPVciQQRZw5/twtwjuwiC9nw6pvEksj/eE+BP5bdXYO/UKdf3v8LWCs1Xsoj2PJQGx3o7sVhWWZpeshd1GF9pGfp5qzcqIzJun9KJ7F1Ank7AN2/LlygV7pPcjU1OS7aEet1Vp1o9MuYAkqVm8zeXpAVzGOgn49za4kvByDBRyJm9g2GRwIsA0RmcFaJkn4YtHqZobXPIGzCZhCC0oOug3i4Pbpp/5BHHQXwdafFc9PHVLdENG9YyWPq5/LlOtYOlpLsEsuWwrdnvPD2hkGZo9VDwiGMpG94Y2dNzOnMDNuccuHdCmiTYjWiuPu2zNgjzAeQQXkjEIEGKJxrkRApKHxY5v4Fu7l/vhWv6tLRd5DnygYMeMS6w4ha6j5MxlR94LEctZETK7Nd0WqLwD4Nn2H6Utxbbz+UJOtLv0hW9wKK0/1TcNioxkGL5vYRkKGG/tjOCI6h0ksytQelkWGK3tf2/3f+8rsZbLooPc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682926cd-e9fc-4592-16a7-08dcd460e7b5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 01:59:45.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycj+wEmp5JRVoQINIleb57Gv5JYMlul6+wQ9KHZJ8dYdIn2JDAt2HG2tAKE1HbFSzyjhFedOaiOL1PRIpbLpJ65b79+jFpQFcNGUboTuVGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6707
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_01,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140012
X-Proofpoint-ORIG-GUID: RJBlRT-NbQQX2wVKctgLauPyfTmeloab
X-Proofpoint-GUID: RJBlRT-NbQQX2wVKctgLauPyfTmeloab

On Fri, Sep 13, 2024 at 08:31:16PM -0400, Kris Van Hees wrote:
> Is this still needed after the fix we put in for dealing with argc == -1, i.e.
> commit 0e3231a268 "ident: fix unsigned vs signed comparison" ?

Ah no, you posted one that is based on the ident fix.

Comments below...

> On Thu, Aug 29, 2024 at 01:22:04AM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_probe.c        |  4 +++-
> >  libdtrace/dt_prov_cpc.c     | 11 -----------
> >  libdtrace/dt_prov_dtrace.c  | 10 ----------
> >  libdtrace/dt_prov_fbt.c     | 10 ----------
> >  libdtrace/dt_prov_profile.c | 11 -----------
> >  5 files changed, 3 insertions(+), 43 deletions(-)
> > 
> > diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> > index 0b53121a..ab90d2ed 100644
> > --- a/libdtrace/dt_probe.c
> > +++ b/libdtrace/dt_probe.c
> > @@ -892,8 +892,10 @@ dt_probe_args_info(dtrace_hdl_t *dtp, dt_probe_t *prp)
> >  	/* Only retrieve probe argument information once per probe. */
> >  	if (prp->argc != -1)
> >  		return 0;
> > -	if (!prp->prov->impl->probe_info)
> > +	if (!prp->prov->impl->probe_info) {
> > +		prp->argc = 0;
> >  		return 0;
> > +	}
> >  	rc = prp->prov->impl->probe_info(dtp, prp, &argc, &argv);
> >  	if (rc == -1)
> >  		return rc;

I think that it might be cleaner to do:

	if (prp->prov->impl->probe_info &&
	    prp->prov->impl->probe_info(dtp, prp, &argc, &argv) == -1)
		return -1;

because the code that follows will look at argc (initialized as 0) and argv
(initialized as NULL), so if there is no probe_info hook, those initial
values will result in prp->argc being set to 0.

> > diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> > index 08689b35..8f33cf58 100644
> > --- a/libdtrace/dt_prov_cpc.c
> > +++ b/libdtrace/dt_prov_cpc.c
> > @@ -451,16 +451,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  	return nattach > 0 ? 0 : -1;
> >  }
> >  
> > -static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > -		      int *argcp, dt_argdesc_t **argvp)
> > -{
> > -	/* cpc-provider probe arguments are not typed */
> > -	*argcp = 0;
> > -	*argvp = NULL;
> > -
> > -	return 0;
> > -}
> > -
> >  static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> >  {
> >  	cpc_probe_t	*datap = prp->prv_data;
> > @@ -504,7 +494,6 @@ dt_provimpl_t	dt_cpc = {
> >  	.load_prog	= &dt_bpf_prog_load,
> >  	.trampoline	= &trampoline,
> >  	.attach		= &attach,
> > -	.probe_info	= &probe_info,
> >  	.detach		= &detach,
> >  	.probe_destroy	= &probe_destroy,
> >  	.destroy	= &destroy,
> > diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> > index bf87cb05..a9deccee 100644
> > --- a/libdtrace/dt_prov_dtrace.c
> > +++ b/libdtrace/dt_prov_dtrace.c
> > @@ -273,15 +273,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  	return dt_tp_probe_attach(dtp, prp, bpf_fd);
> >  }
> >  
> > -static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > -		      int *argcp, dt_argdesc_t **argvp)
> > -{
> > -	*argcp = 0;			/* no arguments */
> > -	*argvp = NULL;
> > -
> > -	return 0;
> > -}
> > -
> >  /*
> >   * Try to clean up system resources that may have been allocated for this
> >   * probe.
> > @@ -317,7 +308,6 @@ dt_provimpl_t	dt_dtrace = {
> >  	.trampoline	= &trampoline,
> >  	.load_prog	= &dt_bpf_prog_load,
> >  	.attach		= &attach,
> > -	.probe_info	= &probe_info,
> >  	.detach		= &detach,
> >  	.probe_destroy	= &dt_tp_probe_destroy,
> >  };
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 62c568ce..21f63ddf 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -411,15 +411,6 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  	return dt_tp_probe_attach(dtp, prp, bpf_fd);
> >  }
> >  
> > -static int kprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > -			     int *argcp, dt_argdesc_t **argvp)
> > -{
> > -	*argcp = 0;			/* no arguments by default */
> > -	*argvp = NULL;
> > -
> > -	return 0;
> > -}
> > -
> >  /*
> >   * Try to clean up system resources that may have been allocated for this
> >   * probe.
> > @@ -469,7 +460,6 @@ dt_provimpl_t	dt_fbt_kprobe = {
> >  	.load_prog	= &dt_bpf_prog_load,
> >  	.trampoline	= &kprobe_trampoline,
> >  	.attach		= &kprobe_attach,
> > -	.probe_info	= &kprobe_probe_info,
> >  	.detach		= &kprobe_detach,
> >  	.probe_destroy	= &dt_tp_probe_destroy,
> >  };
> > diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> > index bc224348..e1369ca9 100644
> > --- a/libdtrace/dt_prov_profile.c
> > +++ b/libdtrace/dt_prov_profile.c
> > @@ -299,16 +299,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >  	return nattach > 0 ? 0 : -1;
> >  }
> >  
> > -static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> > -		      int *argcp, dt_argdesc_t **argvp)
> > -{
> > -	/* profile-provider probe arguments are not typed */
> > -	*argcp = 0;
> > -	*argvp = NULL;
> > -
> > -	return 0;
> > -}
> > -
> >  static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> >  {
> >  	profile_probe_t	*pp = prp->prv_data;
> > @@ -337,7 +327,6 @@ dt_provimpl_t	dt_profile = {
> >  	.load_prog	= &dt_bpf_prog_load,
> >  	.trampoline	= &trampoline,
> >  	.attach		= &attach,
> > -	.probe_info	= &probe_info,
> >  	.detach		= &detach,
> >  	.probe_destroy	= &probe_destroy,
> >  };
> > -- 
> > 2.43.5
> > 
