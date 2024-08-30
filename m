Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E6B13AD2B
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724988306; cv=fail; b=Bnei7RgjNPQAb4hsQma3l9cD7twWnNBC9jEOGPMdJXmpzU84XyXzOPyOAALo4gnh8jf9TtrFcdNo+OjRSq6MlW1F8wYehsCG80WixCjIRU9DEuoe5fr0AqHAVTstwBoF/b5vnB/V9JId7bXrIKadB1gHFgkK85TyneYigVbu2ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724988306; c=relaxed/simple;
	bh=MrNSK6CW93R5XkNFdg8n66eQRZWppnwddJZKvkszqTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cl7/hh1FVzvaHIF4dj0g98aL9lfPf2mNvB6xq/z8XQEDXgls5bNTkyUxk0ko8UidFYxOdvA44PAwqE1DzOFAYOJKcPn8Uzc4HkIoZeRSTGqx355V5msiUem3R2xp8OYvb9eqP83Jh6FaO21FcKMeFX2aHo1TWsJCxhiJAy1BYek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kp2twR0p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sp3eTCqi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kp2twR0p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sp3eTCqi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U2t1GR018731
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=jb5vFydu/BJ3ycs
	pnF5kIQGZuyN82dEJrJn2frnr3uo=; b=kp2twR0pBy+yF4wV72DgRbn/m8NojIq
	tGkLr85RckfkG3OEzAYRa69XUkDBk3ZXEYhZ/cmqSnkdoIY5xmRvoHj5BeHt8/2G
	SRJkhhk2NSlJ+IBbfxeFDXsSxzvzaD15TnjJgv6tVC0V+u5/3Ukp8YfrDJHyMDIx
	DVVqt3ityHEPoqKLpuHHOSLrWJ9KPiD8fzxU8ZlfsOBgbO361yYA5RottWVMTcxA
	PItsU6hnki0Jq2h4QyafN3VxXV8ZgBvJxld+UiNuX+HM6Av+3+lHAtrPQcPyJvcy
	u04YNhgLEKhrgTpluY3Txq8lcIyoj8l45wjNCvg7No9FGbkoyW51Bag==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41b5q380nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:25:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U04IeV016702
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:25:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5vxcjt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 03:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3o7dWQiQhryEh3wKDc4ey/mQDVWQRqVWTckati2oWre66FLl0kYivnSCSnTeLUvC3XgHavH7EKwRXjLXsZxnUNZQozi+GB9k4Wa+8hBpjfTIoy5ThWXnQtKfPP4In64hOkI95i6c0joLoNEVh7minyLapzdxu3b/EjoVhqav5/dBDt/b0+jkmtNErRlcAaT9a2oWWKf9ZyWrNFJjRCo3Bpww3JBPT5ohbKiBLOPI1XFHUpzH+1BaOdEjFVMakGBuJXJhmgmaxkzpHKL/SqLxxESnUpIEqg2czTXtvplQ9So1HOGG2GAqjJZ7rTesWXnynxq32F+EpAloN7Y5eJ/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb5vFydu/BJ3ycspnF5kIQGZuyN82dEJrJn2frnr3uo=;
 b=iIF4YinOyzXD/5Eb3ZDu4+4HVUqFX+gqQsVhN66rZdKNIzUaRvDd8qFdlAnQJhdGdn3PAAaJXV+Obi5j0O6eUMhInEuh1R42GFDclPoVoA7TBALLfBp+MuNS1oRuZt3onkesqZbDE8YcP1KVCPZxTYB/dVL6QkjVVBHFYIoN+Z66Kwj83rSElCGG7mJWDDtWPri9rc1PEyvX7XYrYUcFVaNdKxZJ7EjWZH5jtmW0RVakbhm4r9aiLA0LdFvDjCGQOIlZdbUn9CbN/jvF3WwBKynJLZCHgOEw9SISjNzbu6DBpHugYiwjHGjLWEehmEUNp4he3paxCJOjEeR+GP5Akw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb5vFydu/BJ3ycspnF5kIQGZuyN82dEJrJn2frnr3uo=;
 b=Sp3eTCqiukGtYxNkUbIVnHphIUqnqH0xxYwvX4K+xUx8rp+U8uit9D4uJju0KiyElLiodms2CP2ewzUUp6TcWzzDS30md9QTivFPOd9DpKhtPrbOxc/W6BQX0YgzPIzjW3bW5D2q/TrX1VHatqCyk5sWALcC9kjpOS+VJuu5f2A=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB6122.namprd10.prod.outlook.com (2603:10b6:208:3aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Fri, 30 Aug
 2024 03:24:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 03:24:57 +0000
Date: Thu, 29 Aug 2024 23:24:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 01/22] test: Handle dtrace:::ERROR arg3 specially
Message-ID: <ZtE7hV2L86TaG6M1@oracle.com>
References: <20240829221819.10237-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829221819.10237-1-eugene.loh@oracle.com>
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f47e63-e8de-4ec3-0335-08dcc8a352b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GrcdeKq5OQPETwUdK626Q0QTW8oh2pP5GYJK/ZBw1AVviHDx3YABaRobnPQu?=
 =?us-ascii?Q?BqNfD8psNfb1/tSnx8oPKvdyEzN+xD4+4mGMSAWhWY/Mt0wjr2nfwphLJT1t?=
 =?us-ascii?Q?lvmVRurswrMV6+oOVrW60ebPBgmDIZsjvla1vtjprv9YE8TU6bH0/nnJFDYM?=
 =?us-ascii?Q?OVctGE5rMF4wUXZiQ9TpSZj7sLc6svWSEg7M0locN2N0pqE1jJ/jwwrSP6bH?=
 =?us-ascii?Q?N+kQvoynDNwEGvqDhTaxGoLRgQsrapP3Bx3WBWUrSFFP3heKliO1VueEIxlN?=
 =?us-ascii?Q?pAdwGYqdhBwBlw5wNcxF1PsPDGJyN0P/3tQv9PkyaIIex47RSDeOV7WepqwD?=
 =?us-ascii?Q?4JrsD7KxH4J+1DwIsAL6Hv4/m78jDYQHJBwALIaraLrQCGB76dSlxCE0tOe9?=
 =?us-ascii?Q?5ARQrrfzCY71iqG5o3e4cbe2GhLz8sg8v2BjxJvlXaNbP0fG4McxPtEL3imr?=
 =?us-ascii?Q?30GxXFElwugx0lw2OMelW4cSoWYs2bBfQtCTg3cue0gvbZ45WAwUisXLBPeW?=
 =?us-ascii?Q?PsgmwTdUnGeRwoM0B2UwZgxjWEdITa7rFKqfrDy0MXwh2D5KuZO2pUe1fksS?=
 =?us-ascii?Q?9RvOlSMJtXc7Yfg44UZKmy/g5N5vbMf6UfSfGeSzLeisiIw+oqzygIGpKf6H?=
 =?us-ascii?Q?OMADHi16PhF5vCP/B1BAcaiWAw/UcZP1LiXj7sLgxVDEO86vqjupHgo2OKDg?=
 =?us-ascii?Q?KxCMVBaGop4/aPMd0d88q2sO89gPIaEzWFKvIX5UNwoXVRko2RQHfTClzfdW?=
 =?us-ascii?Q?5FeY6gIz4wYkpwjcFAU/ue5116W1zQSAArUp7F1ZmB3u9NhDsyOopYjT0EAL?=
 =?us-ascii?Q?pQrl2KkIRZYPyUyH+6IVS+bSyF1oQHGGL0Wya4avmCsWJY+bsejeIRoLQx9D?=
 =?us-ascii?Q?852iqZOChCumjyC4/uOPlYZYaa559QTZYYupActcZjnRGbMqyj6Mps0RuVko?=
 =?us-ascii?Q?/GjhL4vIu6yU18aMvcPOwgL1Amj9nxpAYh6gi+DBKEBv5YtULS8WkRU+LCml?=
 =?us-ascii?Q?UmIRuIqAKtGlAVkdGFgp6XGBJfwJV/IFQUBjgQyLjIAQskKNwPu5paxL+/9q?=
 =?us-ascii?Q?zZZ2JRsos/d2tdGIeqUDMCwspLmq9x/SOJIIoVLcOJ1xrE6/iOTF92Ysdh1J?=
 =?us-ascii?Q?tEAO+EWWZOPhk3MXY6lVHa0ln5mP2pdINwaBfrMmtTX1O3NwZ3lNTueE0SI9?=
 =?us-ascii?Q?laEgqxG/8ulqXWc0NLxtTQQDzXOdO18bPEJ2ZKcvsM6LLX7F54UNxU8vSLHG?=
 =?us-ascii?Q?DWE6caZ8V59VXTOm1TW0r+ecOaS7zSbPkGBiTwDEEh9CcMsyXJWJQL4tPz5K?=
 =?us-ascii?Q?l1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJcQetoZaGRcYG5E0DY4d13R+6eeM/qgkppXfh5aBBjinspWNGHfHrzFRadI?=
 =?us-ascii?Q?NWi5vpuJRBFpknNOjshn6cAvc1jxJZnKDHYZTrvXrTxZn6sl1gmbbVhqdYXL?=
 =?us-ascii?Q?Bzpo1gt2PpF6YiC/QcpuwA71ZmohTu9akUXt4X26pMwDkByLo4GxsjRuUmTi?=
 =?us-ascii?Q?Cc4J0MXmU6JGSFrblz/8BOkVWHhgBYc45Qi7K6uraxjqCCw1c/crT11pb3QX?=
 =?us-ascii?Q?cqxZCq1agYlpHoqCsKcCL9XzN8bysJpg+ZO/7UbBLKYxnryqrqwO88F5RLBt?=
 =?us-ascii?Q?9wEk1/mX010gtjiWkgSw6EuapoadmVU6hn4tBeqtn2ADW2HVbwroeo5HtzN/?=
 =?us-ascii?Q?CxO24sXMY74dAoLPM35FTltfj9TeyNfsPmalm7OlNW1hWsARy16IQ0fGp1y5?=
 =?us-ascii?Q?eQWW6Ad1QPsXPJdBLVR7hyf5wE63Gzwt8V11vknuyaYXtdT62pQ1M7hFICIP?=
 =?us-ascii?Q?McdbrDY1aQvPtltbj/h4UGdMhUakkBozXDt8o3OqnfREFV61Z25KIbjMYnwL?=
 =?us-ascii?Q?mngvfqxZjtIf5wsSQxFBQEfLKweDh0Uv0r+Uc6lkIpINcGa2I+l84/hLgO6x?=
 =?us-ascii?Q?eBqdf9xA4mXsg8uubIZIdAEXhvhdXXUPMojRQMOJXkoqC5SS4BtJG5UM8GVC?=
 =?us-ascii?Q?HbGptbZFgc9IRvbRwRfqQm2hAzu6WOMeQi4MTULFHliN6GS7irWuKgX575E3?=
 =?us-ascii?Q?nSWi+dmaIt0eDK3F62WVK2d9xZVTZH4hrl7fLVOQeRmhhhRlcAZh3Roq8ckO?=
 =?us-ascii?Q?oKPrUVKDuN+2Qiz1JKLLL/lX7tXJdmVYR5bZxbX4t2SMIx+0TtMuyd7YGA/F?=
 =?us-ascii?Q?YITfYH9omfVK0TXnrHdIGn8wIJ+Og7hUJRXO9/Y94On60TO1+KgYE7KFTdnG?=
 =?us-ascii?Q?dBh7g0mjNnEuJcaWnypRD7LVcyKaawHRe0Ziodr9dP3mrdqEiMGkN2LOXUpR?=
 =?us-ascii?Q?ZJu72Gzb3mDpT2kBKGdDFz/A+fv6exZkPxFnL5k3Ys+s+rU1jMxawlGAl3Wx?=
 =?us-ascii?Q?psDkTIfKXVw00Ix/BquBdOEcSVeGTzC15UQ417jKCndvMrkrApmi1iQSt2Pi?=
 =?us-ascii?Q?kZlvaAPdY9VBkz81qiTIBt430ZIMcUcE8nzLFIEH4LSk5x3ef+fQdqX5EsUx?=
 =?us-ascii?Q?NM5nGMrn0XbN5QEAO2cFlgqQwD5f7YuRNbesbrlCL/q0AxBB7JpJhM/JRdI3?=
 =?us-ascii?Q?4G1D8Dn7fqJJ/ubacCJwgVt3+zNqg06H+XkGqRpypUU1u+gEMym3bh8moXuA?=
 =?us-ascii?Q?N9F/Hl8J30KjPDTyjmUcZpSK5QdiR0NNFUYWEgGvRYIiD2y/PiTp2vKzNkIm?=
 =?us-ascii?Q?CPDhQdE0vtEKwDloUsdZLgxAiTvGdVmsebVnCA1XNUecJZ0pXiHryJ9h0qNN?=
 =?us-ascii?Q?g0ULIkasaEHoOP/K/FPvwcstanFg31EYk+/FQ4jsZnicCC0+pB23GSHdNfLP?=
 =?us-ascii?Q?Er/KCp5d4WI0kohLUN4roz1Z1j73VJGSiu1AcuVRTHFc1OML2vX/kTPazzTz?=
 =?us-ascii?Q?fLKCqMJXhA5uHcnlXzM99aPTWUX7m6Kele1Yc/ebrsZujOkve61FTfd6mV6L?=
 =?us-ascii?Q?GXdEolyHvGjVL/uW1fvfXoQTKhLhhtWhTiAbunUVfF/Y4WalHGcMQMBzKdH1?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8K2VERWWYWdQGEYOrLiloQ0BX9nsmVS37jtjjOq8kkHJvlVbLf/fKMV7JdihDGL8IUNXLc27bidkucFaU/yn88E2aH51cqab6dd3btjaOZBg9lEInv1lHu5HBDolu7scz0+7qU0vd03w8OffVOiMHoDLkmLIxcElxVZh3HTGrAsIQooskoFDse+zt44+gY7oOak+pkLT77JjHEPDXnMB+xjRfKhpxayUDWYHX40xLn7Gedi6pq9fuksdzq6C9yafzG9SDn6DAJmx9dU18iNTuB9J2tDisSZg0fJtr6ZOLMvDGJfQegwfwBLmWI4QCSHS8RpJpEiz853KCRXNCIcgovpVVD8tk3umsH9tozHFohZiPcWHvlpBZ6EYqVmMHMumXYDb8PAVrVF7XWSYJhwoOFLXfqoSIqiTGPjbrelprxuGhsJSSBCMG1vLQernPyNOaqPOBclzJDOcjgRuzso9B3MtIecQdxDoerXrvuSvh2BjI1sjxHl0XEEZqEEN3sbwbinqRnO/6dD4iSnE4MKUAMJFRsAvaERTUBDme+Q1BfGeo+4oLPo2ezVlx/LK3iJsATegJwxHSizbstjKwV12QmAMSV/IzfuXt5VVngjqdbo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f47e63-e8de-4ec3-0335-08dcc8a352b0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 03:24:57.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRsaIdp/TqWjfvOosP4ui8bk7U8tYGQOZpinOcIw/J4fU8EyXE0g9s9ezGnN1UwgSQyUqiRyM/H678DyXrJLX8XwyLgZATbkjg2k4BbBtiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6122
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_01,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300024
X-Proofpoint-GUID: BeGGfAHzTc2phdPwqh5uAlCsPoOhOZsG
X-Proofpoint-ORIG-GUID: BeGGfAHzTc2phdPwqh5uAlCsPoOhOZsG

How about something a bit simpler like the attached?  We don't really need to
get too specific because as long as the reported PC in the ERROR reporting
matches a dt_probe_error call site, we know that the reported PC is valid.

I think that would be sufficient as a test for the arg3 value.

On Thu, Aug 29, 2024 at 06:18:19PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The ERROR probe's arg3 reports the culprit PC, whose value can vary
> with minor implementation changes.  On the one hand, we do not want
> tests to be overly sensitive to this value.  On the other hand, we
> do want to check the value is correct.
> 
> Therefore:
> 
> *)  Change tests that dump ERROR's args to omit arg3.
> 
> *)  Add a new test that checks that ERROR's arg3 is correct.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
>  .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
>  .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
>  .../unittest/variables/bvar/tst.arg3-ERROR.sh | 172 ++++++++++++++++++
>  5 files changed, 181 insertions(+), 9 deletions(-)
>  create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh
> 
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> index 001903ff..bfc77bf5 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -19,8 +19,8 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n",
> +		arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
>  	exit(0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> index b11f6c99..3e7caac4 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 2 4 1 64
> +The arguments are 2 2 PC 1 64
>  The value of arg4 = 0
>  
>  -- @@stderr --
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> index c23f9503..ec519f4f 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> @@ -1,10 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 d_path */
>  
>  /*
>   * ASSERTION:
> @@ -18,8 +18,7 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
>  	printf("The value of arg5 should be %u\n", 0x18);
>  	exit(0);
> @@ -29,4 +28,5 @@ BEGIN
>  {
>  	d = d_path((struct path *)0x18);
>  	trace(d);
> +	exit(1);
>  }
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> index 8c601a43..be1f6d5b 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 1 28 1 24
> +The arguments are 2 1 PC 1 24
>  The value of arg4 should be 1
>  The value of arg5 should be 24
>  
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> new file mode 100755
> index 00000000..4b139be2
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> @@ -0,0 +1,172 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +##
> +# ASSERTION: The 'arg3' variable in the ERROR probe is correct.
> +#
> +# SECTION: Variables/Built-in Variables/arg3
> +##
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +function dump_files {
> +	for x in $*; do
> +		echo ==== $x
> +		cat $x
> +	done
> +}
> +
> +# Run DTrace, also collecting disassembly.
> +
> +$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
> +BEGIN				/* dt_clause_0 */
> +{
> +	nerrs = 0;
> +}
> +
> +BEGIN				/* dt_clause_1 */
> +{
> +	x = (int *)64;
> +	y = *x;
> +	trace(y);
> +}
> +
> +BEGIN				/* dt_clause_2 */
> +{
> +	x = (int *)64;
> +	y = *x;
> +	trace(y);
> +}
> +
> +BEGIN				/* dt_clause_3 */
> +{
> +	x = (int *)64;
> +	y = *x;
> +	trace(y);
> +}
> +
> +BEGIN				/* dt_clause_4 */
> +{
> +	x = (int *)64;
> +	y = *x;
> +	trace(y);
> +}
> +
> +BEGIN				/* dt_clause_5 */
> +{
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	/* Report the problematic PC and continue execution. */
> +	printf("Error %d at %x\n", ++nerrs, arg3);
> +}
> +' >& disasm.out
> +if [ $? -ne 0 ]; then
> +	echo DTrace failure
> +	dump_files disasm.out
> +	exit 1
> +fi
> +
> +# Parse the disassembly for start PCs for the dt_clause_n.
> +
> +awk '
> +BEGIN { phase = 0 }
> +
> +# Look for disassembly of dtrace:::BEGIN.
> +phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> +phase == 0 { next }
> +
> +# Look for a blank line, denoting the start of the variable table.
> +phase == 1 && NF == 0 { phase = 2; next }
> +phase == 1 { next }
> +
> +# Look for a blank line, denoting the start of the BPF relocations.
> +phase == 2 && NF == 0 { phase = 3; next }
> +phase == 2 { next }
> +
> +# Report PC for each "dt_clause_n" (or a blank line to finish).
> +phase == 3 && /dt_clause_/ { print $3, $4; next }
> +phase == 3 && NF == 0 { exit(0) }
> +phase == 3 { next }
> +' disasm.out > dt_clause_start_pcs.txt
> +if [ $? -ne 0 ]; then
> +	echo ERROR: awk
> +	dump_files disasm.out dt_clause_start_pcs.txt
> +	exit 1
> +fi
> +
> +# Confirm that we found expected clauses 0-5.
> +
> +for n in 0 1 2 3 4 5; do
> +	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
> +done
> +if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
> +	echo ERROR: did not find expected dt_clause_n
> +	dump_files disasm.out dt_clause_start_pcs.txt
> +fi
> +
> +# Dump the error PCs to a file.
> +#
> +# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
> +# we are looking for: "y = *x".  Each time, we check if address x is 0,
> +# calling dt_probe_error() if necessary.  Then we try to dereference x,
> +# again calling dt_probe_error() if necessary.  Since x==64, the second
> +# dt_probe_error() is the problematic one.  We look for those calls.
> +for n in 1 2 3 4; do
> +	# For dt_clause_$n, find the starting PC.
> +	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
> +
> +	# Look for the starting PC and then the second dt_probe_error().
> +	awk '
> +	BEGIN { phase = 0 }
> +
> +	# Look for disassembly of dtrace:::BEGIN.
> +	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> +	phase == 0 { next }
> +
> +	# Look for the start PC of dt_clause_n.
> +	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
> +	phase == 1 { next }
> +
> +	# Look for the first dt_probe_error() call.
> +	phase == 2 && /dt_probe_error/ { phase = 3; next }
> +	phase == 2 { next }
> +
> +	# Look for the second dt_probe_error() call, reporting the PC and quitting.
> +	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
> +	phase == 3 { next }
> +	' disasm.out >> err_pcs.txt
> +done
> +
> +# Do a sanity check on DTrace's error output.
> +
> +awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
> +  disasm.out > err_pcs.txt.chk1
> +if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
> +	echo ERROR: problem with DTrace error output
> +	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
> +	exit 1
> +fi
> +
> +# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
> +
> +if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
> +	echo ERROR: D script output looks wrong
> +	dump_files D.out err_pcs.txt
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
> -- 
> 2.43.5
> 
