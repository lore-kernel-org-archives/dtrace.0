Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FDB198E6C
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736772; cv=fail; b=td1NGbVWyYP88jsIZRGPo4ZHPn7Hp4abXNsHKssRBSfb+U8UXSBzPynxo4kJ8aQm/yTV72c8ZgJ6N9bmq85VLgHcc1dmK4KIgcajZLAXPS8n1F/EkmQB4ICFD0hqiJhi33udxC3DZu5SeJfkHiNUuGfjbdrxwwgRwsk5AhJDCDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736772; c=relaxed/simple;
	bh=xZoGkciufUTuND0raJp9wT5EedzKB64zDIuJqeXLSnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k74BtDFViM1M+djxl6cW/9cfH4muUcbyJ1GnDoxR6IUS3iKDaemi3otChngUU7FrMHNB7n9ykgMaX9BgnRQ/I4N+G1oKB01pge3xc31f3OVcX2khS6mdqQo1VctqNJadWy14amTVIJSZqtMOG0XgHTt4SMFAnIPCBBKJu81qbyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XTTK3UmS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qmv5lJbo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XTTK3UmS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qmv5lJbo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J7tcMj005026
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 09:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=92h011VV1kTKRen
	tDF2siAmYZNooxHf2mOhkfaQGkxU=; b=XTTK3UmSrJk99yVEZ6JinXqFfn7o0iP
	tlDwx3FXPgMyAUAQxdb0hMRF61u3IyIgvD97UsI2TZokaYwjiLoXuUf49TlDqTSQ
	kUNuHcWpHdbEq59/f4o4Y0eUIben+6+WzvXJsInK/JCa+qc/RdUTo60WLuBhS62P
	OUqF4ZDoDboSr0EffKbVvDAzggjroT0UyIn5aFoUQgiq6ezwUzD4vDAi4pG4Ifyt
	G3Bop/Ft3BoZ+rmjiZ42VA7wMVtbVAy5gbC+OmU/S6VdXY/ZV1T++2rV6rgIWtPG
	KrFfP04a5omoeMcZ0nZSXF2GukzSDUePTKX6pjC4gMzLAazF1BjCoqw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3pdu8c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 09:06:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48J7sSUi017842
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 09:06:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nyd07uk9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 09:06:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIkcZPwPZ6ABElEIK2ootbuZaDNsjQELO4DcGy9qNM9LQbGBVfNjEHBQaquVeRsbzRX0o7qgAMXeQOlflFlTDd6Hy2dKbrnoVFQ7jxHWDGVOqqW1xXfK8miVL8CsoIzOZGzv5ovMzOoro0BBgI/ysDrzr2/Nmf9bOLEtiInLI4LbVopaRfJx1dfdHVFews5CMuFRLQs/nYy80jF00RXvLmUMwBbI2Kf+F3rxODaPR/iRwu9Xb7jr0jHHxSnIi8eEX8PUiR2hVvJUZlfXu6sirbO1UMbMDSSX51ognBOdfRWnVFjq8rfrKRmop4bTSyd/nETDi6JoHYv6b3WSu3k2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92h011VV1kTKRentDF2siAmYZNooxHf2mOhkfaQGkxU=;
 b=mXNAvUN5PiBQBWYozTPQT5xrAIbKJLyJEVX7FgyHE1mXk5y5A+yleyKbK0bFZZDwnbwygp3oQMwh4h3gjkz6kzYADCvdbKXW7XNv6bD6i5yzVLcqNahHK9YmlQQIur2a0CB5vrABtg+Ksq1kn6eaummvbeMpGni1rioTqmAipf+8zwDqTtFwGttuu2e5kG+RtpMf9qzkYZgTvfjPa5vXVWRxW4E+ETp0jnsweSCJje2fCRR9CnStYFGVRLFNIUrvqaba9aefeGLqbX8LufBowKLIAdyJ8b2nGXr9u28LVXflu9+LtWzUQKOzm+bxd6i1DDKDW6Ux3BzzebxrMEMEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92h011VV1kTKRentDF2siAmYZNooxHf2mOhkfaQGkxU=;
 b=qmv5lJbo7A9KLp6VcxCszPkE9j8ewcOVtbSOvv8lRmkjv1szEOQ6UldUiJqHfVLy3QQb2jLEPFD/ST7AYB+/1yw3a2XX4Fz2dY02QXItS87aghKEtpRPYADf8Qv3pEzuugls9Py2/91otdwVQ3/IP4hjLCNFGgV65/Mq+cVlhU0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6419.namprd10.prod.outlook.com (2603:10b6:303:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 09:06:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 09:06:04 +0000
Date: Thu, 19 Sep 2024 05:06:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 01/19] Change probes from having lists of clauses to
 lists of stmts
Message-ID: <ZuvpeML_Fvmt_VxH@kvh-deb-bpf.us.oracle.com>
References: <20240919003041.23158-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919003041.23158-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: e74a0f9c-a318-48ec-94a6-08dcd88a4a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3td/rAMDiKEQljzs5OyqHxLaLlNTLHTIn4IlBG3WL8pQfVGDCTgYYNr9Ijac?=
 =?us-ascii?Q?lB3c2ndoH8cqaYtOf0P9drunx7JASS0KouM0m8wAu7IWRtVNYc44tKQOxSeZ?=
 =?us-ascii?Q?NNlveZ368jHaFUIjlv1E6BOtS8ONPkqU1fCSoqzFM+NjvoShAJOd89UmCpiG?=
 =?us-ascii?Q?ge+uPm4leUd81c0AzqBt6JWTmsCFkto8EvvAxsLNsNpLeqXUweODmNfxLsyC?=
 =?us-ascii?Q?HJIZcDlZ/DSr5Tq1V3AsapR5L9sG2AM65vQvE91lE9JUZajy98cZn3bphHzD?=
 =?us-ascii?Q?CnuaLr7Rll0FItk0/D/1lF9y/NNTgC6LxPINN5eRstzeVJR2sk6/yZgImsWq?=
 =?us-ascii?Q?G/G80XduQznngdKjuPEAG7dNpJlDJNwCTTKHLFF1wpbvrWLvVe8u6R8Z1VHY?=
 =?us-ascii?Q?K8d6yosU3tOPlitFcHfnNBxXHR+6E+IIbYoo3S76dstJCqwUg2NNO5FpoqYG?=
 =?us-ascii?Q?fmWsenjmXda7dDlDHRhOikeVZGt/pZX0EDukeptq/5zTrkLdtlHR55Z24LT+?=
 =?us-ascii?Q?lr+Drj/J1Tkob+O7lih/hB/1b1MPOvuijFjLJ7B859RQROR5piFAWigYvqHx?=
 =?us-ascii?Q?WtegcoU/08wNuAOd3QmDqpbK/IAZCh49snB/x20Ded6gCkWX4wKphTKNnVdH?=
 =?us-ascii?Q?SVk9tDXSWXgFRu07G9PexGx+XbQH8fCEclJcu+/kTXFI1lkdGLr5cYkw3Bqt?=
 =?us-ascii?Q?YfEiaKzjmMENedM7aAM8HQEey/oZ9t3W6NSfuw7wW82gukR8mabNHGObHBAg?=
 =?us-ascii?Q?cgfeCWB3hxdLx21EHxUTuJPdgiiN3OfhecN3tNHDJavQpDhtVVtKAZzF6HFf?=
 =?us-ascii?Q?4e+qxJqeqAm2fLU89xWjhEeyDxe0vz+5hz2nFx+RD4F1gzC7yBjgSLD9GcGh?=
 =?us-ascii?Q?HNh+D94QxeLRCdE3uc0mXym7u9Ob7iCDa6Uz0FXTtWjaFjQ2RjtRX5b8o+tO?=
 =?us-ascii?Q?CxoY3AGr1od9eVQuVnTQTPDaMSXrncoYRAl/SxvI9gfyY51GSLhsITuf1Em9?=
 =?us-ascii?Q?geNh3ij4y8I79Oh/C/FR8AKaKo+jCJRnJzDKvqUUKH+S5ppl43Or6Ox7fnkI?=
 =?us-ascii?Q?QyRNYc1NxBEO18BlIcK8deaojN9bX8zzUw7if8OrdMdO/UjHE5n4aVLiSHsX?=
 =?us-ascii?Q?uH49kfmZBpQCY4ITHSH3zmWDQLsRsxQcvmU21466XbzL7xLQzf6GzBMUilc9?=
 =?us-ascii?Q?0AOhbssy8t9cQWulehQDBTLviPQ0NQtyEHzXXMpdd+vB+Uggg+WOnLyXnrlK?=
 =?us-ascii?Q?RnwZAYHLjcbsRIMfe7cZvPSF3J3OYiQIhE1FDP3HT5awni01yz8ge44jXV+c?=
 =?us-ascii?Q?IObyox2e8fdsQtH35C/K4SEhLXZhfVzXeLVXfoDXJtGzmA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTncKCzHD2bjl6HcydpXJOfl781o263BtC49iK+6xGXGvXx02jZ4P2MPsf27?=
 =?us-ascii?Q?XTfl8kam5cn/ZCsRXIxPqk+dUKxIEqGYSou4l4Rgjwn+F3zCtxFlqLBZ7UcH?=
 =?us-ascii?Q?4KSW+WkEzFAN7+LpyBMm0OLVwD6E6/AUOrNVWx88kBGyq8vw4JMx0nfinB37?=
 =?us-ascii?Q?Rw8YZbzvn599ZYPleH3ikI2ak6I7RECySgmQVlS8u0e7/c5e6UuNj0t37uam?=
 =?us-ascii?Q?8AmMeaDOR/Zb5cTdqkbSzkKwwAj2YnxaW8X++TlVjI4geFSh/EvhRHrxsj3d?=
 =?us-ascii?Q?Jwr5ijgNlO8BBvqJvJRyrFjzUxeoHk+CVkpjaubZs0IvOcebl4FcUXz/xLu9?=
 =?us-ascii?Q?rUjhWsfWHgXbzjPKcHDjfJdnso9WyEnu2GLFBTK0KA75C/gTfQZx4ioY5NWd?=
 =?us-ascii?Q?5AWokMNSNlsdD3ByyYVLoL3POEWoMGFnXosihWL2O9xiltllJeXWrTrhdT+m?=
 =?us-ascii?Q?F4kDjzeVOamxobsr7FTC7Glu8gqyBdoQSH2XzKCiIPXTZGkMRVYxI8bPaFH+?=
 =?us-ascii?Q?3wy9TZ+Fb6cV0yPJtUWR7TUL4TopjlxdyioyjqV/EcW5cX6fqNp+8g5q0FtE?=
 =?us-ascii?Q?o0yhbJ9gPlojAr2eKnCrDnv/XofoEvCxRb6cmV4K7K03UdSidKfrD6DwdnTL?=
 =?us-ascii?Q?8MS4YZ/SAGnhtvfnrNymdOABAmN6wLzW9n5MTTNd57Yvs47o1Z45KYe/ugCI?=
 =?us-ascii?Q?jfrlArwdS1qumdhtN7jyGZ5mbqaG6cxwVbEqVnQhf4Yi8/QOU3kCzKlQN8cX?=
 =?us-ascii?Q?W/9v21bhnUFFE0hBMyhIUFSu0mTmtdQRX3lRjcFT3HBmrjcJMCixRObUKBwV?=
 =?us-ascii?Q?bGBG5wxtedQGdZ66mvHIb1QtKm0ltiOSebYHLzG3he2mlU5NBV8L/lVDaq7R?=
 =?us-ascii?Q?Ant6eiV5n5ejPT8XRWe+5jQVQGjzw1MESFZxKKeNKtFeWYZ6AlkTUknvo82G?=
 =?us-ascii?Q?/b+XhIkf9v1DpuiC/r/B6Fg9DRFiInMQLIbl4e7HcZfyQlBwa8Ai8rD07MIW?=
 =?us-ascii?Q?j4VCm0e7KJCm76NucecqLnQLsmKlQ6gmYMLNi+lbtx640UWjb8A/hsHsXMRd?=
 =?us-ascii?Q?Re9ZWQe4vgtuB+AKT5B0cfCLxB1MbpESJG+oUg238yWF+oTWoR5On83vO8aB?=
 =?us-ascii?Q?BbYTQM3duzyYXrBg0Ar+iAF4ppAdoY3p7r3cuPDdX3NasHVUAdC4beqw5mV9?=
 =?us-ascii?Q?HmXSVg1pzjGmK5/j6MtaJGyRt8JyfZau/J3pzO9YeFbxQgodT03kPAk0hbRe?=
 =?us-ascii?Q?8BhLH14LxN9NruPJgqkilJULfVvMqsn3F3/tJZZ2nWv2fi6+Ey3/+hHth5kj?=
 =?us-ascii?Q?ecoHqxhDU4/nRMA1xR1X/DbcIWoBZJ5oTiVMldpYQD4jBYcnJBTUgnzWVNLK?=
 =?us-ascii?Q?tc+CHgUZr62CIh8OcZJaO86hajHDjxJSWZ+D6IA+WLuH3WusEqRDxArta9Ni?=
 =?us-ascii?Q?vd+wIYZVLZYTb2W/phFSAlrbZS8kJhj/zk0A718vlQAQin6gUA6mX7UudK+q?=
 =?us-ascii?Q?0yGBelosT4thyBopPKY9Fxa7al8wOaliSG3B/yMc1Nyxj7PX+kgSlG9OBgqX?=
 =?us-ascii?Q?jXRc7n80tKO9jCtymhZdATjF6VJABObmA/G7rYUMgvyZsNSRrJcQ2ex1RXE2?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8VTpXWUshi8PB/9xSDpn0S2u8m1PQ7arGGi6pSpRY1LhnTmAqztriRsYM7PJ8uytS4eeKpTPEIvwYcW78IbmmlKYtBAFqwzeGJ8v6X4cwqLulRXPfh+ywypb4tuF5ZNwMRU+coECsapL4lxj5I2HWtGUa8BYPzmiI/EyJB/EBxixE5ibYtrjL3cMGwWYiOYru1XKwtj6FHj1PUk19b91E4w2u8xFeh6ERFhlHvm1AHmoRNgSwLaqtqYJq5AOBXmPixJ3atLXY39k/61dTkojZMmS0a0sDhAQXY5zvbF1vQ8TgO+RvkXu/qXRS0x1YaG34nPP2Ds5LVJZAqDMpnK+X2IGvYwaljxQxPGX21XIwq4aTOjGLRT4LjQP32zzKJj/nzvlyvaW4QJHzgqoGWw/5hULtWoh/hZnQwVQRmvLr5SFGwVD5j359r0+QHAR1yYf1KGFThB2OCqnOvegrkyQuk9jrH2kk0wCH74FrhQs7NR4+lkq4bfHqLMR5ltoUFWfwIcQnpzqNEmQBLFRResN94QupDdrtgfchRZwuIBvmdke6/PBw94DK44m19sAVnkypyHsIOrNTQDrSYZ7FOgFEk6GuvftKA+fvbzOpTW51wI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74a0f9c-a318-48ec-94a6-08dcd88a4a82
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 09:06:04.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY7kn8pEPAN0nN1ne9XLDGMaGrtDHutw2X+7dQ/+fRHXMikUC32wTwhVmsEOZH092Mh9uc9Qchy1Fjk7oBhuySLdzlKG7ItDunjbxfbbDW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6419
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_05,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190057
X-Proofpoint-GUID: CwDE_lPWBXRWCst8L2WMu2gPIRDNXlLk
X-Proofpoint-ORIG-GUID: CwDE_lPWBXRWCst8L2WMu2gPIRDNXlLk

On Wed, Sep 18, 2024 at 08:30:41PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Each stmt has a clause and a probe description.  Traditionally,
> we have added clauses to probes.  Further, we have generated an
> enabled probe ID for each probe/clause combination, and the
> consumer has used the EPID to determine the PRID as well as the
> data descriptor for the clause.
> 
> In this patch, change from probes having clauses associated
> with them to having stmts.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c      | 17 +++++-----
>  libdtrace/dt_probe.c   | 73 ++++++++++++++++++++++--------------------
>  libdtrace/dt_probe.h   | 12 +++----
>  libdtrace/dt_program.c |  8 ++---
>  4 files changed, 56 insertions(+), 54 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 166627fba..f6c88c5ca 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -844,9 +844,10 @@ typedef struct {
>  } dt_clause_arg_t;
>  
>  static int
> -dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
> +dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *arg)
>  {
>  	dt_irlist_t	*dlp = arg->dlp;
> +	dt_ident_t	*idp = sdp->dtsd_clause;
>  
>  	/*
>  	 *	if (*dctx.act != act)	// ldw %r0, [%r9 + DCTX_ACT]
> @@ -874,14 +875,12 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
>  }
>  
>  void
> -dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
> -			 dt_activity_t act)
> +dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp, dt_activity_t act)
>  {
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
>  	dt_clause_arg_t	arg = { dlp, act, pcb->pcb_exitlbl };
>  
> -	dt_probe_clause_iter(pcb->pcb_hdl, prp,
> -			     (dt_clause_f *)dt_cg_call_clause, &arg);
> +	dt_probe_stmt_iter(pcb->pcb_hdl, prp, (dt_stmt_f *)dt_cg_call_clause, &arg);
>  }
>  
>  static int
> @@ -990,9 +989,10 @@ dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act)
>  }
>  
>  static int
> -dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp,
> -			      dt_irlist_t *dlp)
> +dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_irlist_t *dlp)
>  {
> +	dt_ident_t *idp = sdp->dtsd_clause;
> +
>  	/*
>  	 *	dt_error_#(dctx);	// mov %r1, %r9
>  	 *				// call dt_error_#
> @@ -1029,8 +1029,7 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
>  	TRACE_REGSET("Trampoline: Begin");
>  	emit(dlp, BPF_MOV_REG(BPF_REG_9, BPF_REG_1));
>  
> -	dt_probe_clause_iter(dtp, dtp->dt_error,
> -			     (dt_clause_f *)dt_cg_tramp_error_call_clause, dlp);
> +	dt_probe_stmt_iter(dtp, dtp->dt_error, (dt_stmt_f *)dt_cg_tramp_error_call_clause, dlp);
>  
>  	emit(dlp, BPF_MOV_IMM(BPF_REG_0, 0));
>  	emit(dlp, BPF_RETURN());
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 01a0196af..686e2a661 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -24,10 +24,10 @@
>  #include <dt_list.h>
>  #include <dt_bpf.h>
>  
> -typedef struct dt_probe_clause {
> -	dt_list_t	list;
> -	dt_ident_t	*clause;
> -} dt_probe_clause_t;
> +typedef struct dt_probe_stmt {
> +	dt_list_t		list;
> +	dtrace_stmtdesc_t	*stmt;
> +} dt_probe_stmt_t;
>  
>  typedef struct dt_probe_dependent {
>  	dt_list_t	list;
> @@ -335,7 +335,7 @@ dt_probe_enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  void
>  dt_probe_destroy(dt_probe_t *prp)
>  {
> -	dt_probe_clause_t	*pcp, *pcp_next;
> +	dt_probe_stmt_t		*psp, *psp_next;
>  	dt_probe_instance_t	*pip, *pip_next;
>  	dt_probe_dependent_t	*dep, *dep_next;
>  	dtrace_hdl_t		*dtp;
> @@ -367,9 +367,9 @@ dt_probe_destroy(dt_probe_t *prp)
>  	dt_free(dtp, prp->nargv);
>  	dt_free(dtp, prp->xargv);
>  
> -	for (pcp = dt_list_next(&prp->clauses); pcp != NULL; pcp = pcp_next) {
> -		pcp_next = dt_list_next(pcp);
> -		dt_free(dtp, pcp);
> +	for (psp = dt_list_next(&prp->stmts); psp != NULL; psp = psp_next) {
> +		psp_next = dt_list_next(psp);
> +		dt_free(dtp, psp);
>  	}
>  
>  	for (dep = dt_list_next(&prp->dependents); dep != NULL; dep = dep_next) {
> @@ -1147,24 +1147,24 @@ dtrace_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
>  }
>  
>  /*
> - * Create an ERROR-probe specific copy of a given clause.
> - *
> - * A modified copy of the clause is necessary because the ERROR probe may share
> - * some clauses with other probes, and yet it needs to be handled differently.
> + * Create an ERROR-probe specific copy of a given stmt.
>   *
> - * The following modifications are made in the copy of the clause:
> + * A modified copy of the stmt is necessary because the ERROR probe may share
> + * some stmts with other probes, and yet it needs to be handled differently.
>   *
> - *	- it is named dt_error_N where N is taken from the original clause
> - *	  dt_clause_N (which also guarantees uniqueness)
> + * In the copy of the stmt, the clause is named dt_error_N, where N is taken
> + * from the original stmt's dt_clause_N (which also guarantees uniqueness).
>   */
> -dt_ident_t *
> -dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
> +static dtrace_stmtdesc_t *
> +dt_probe_error_stmt(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp)
>  {
>  	char		*name;
>  	int		len;
> +	dt_ident_t	*idp = sdp->dtsd_clause;
>  	dtrace_difo_t	*dp = dt_dlib_get_func_difo(dtp, idp);
>  	dt_ident_t	*nidp = NULL;
>  	dtrace_difo_t	*ndp;
> +	dtrace_stmtdesc_t *nsdp = NULL;
>  
>  	/*
>  	 * Copy the DIFO.
> @@ -1180,7 +1180,6 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
>  	name = dt_alloc(dtp, len);
>  	if (name == NULL)
>  		goto no_mem;
> -
>  	snprintf(name, len, "dt_error_%s", idp->di_name + strlen("dt_clause_"));
>  
>  	/*
> @@ -1194,7 +1193,12 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
>  
>  	dt_ident_set_data(nidp, ndp);
>  
> -	return nidp;
> +	nsdp = dt_alloc(dtp, sizeof(dtrace_stmtdesc_t));
> +	if (nsdp == NULL)
> +		goto no_mem;
> +	nsdp->dtsd_clause = nidp;
> +
> +	return nsdp;
>  
>  no_mem:
>  	if (ndp != NULL)
> @@ -1207,40 +1211,39 @@ no_mem:
>  }
>  
>  int
> -dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
> +dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp, dtrace_stmtdesc_t *sdp)
>  {
> -	dt_probe_clause_t	*pcp;
> +	dt_probe_stmt_t	*psp;
>  
> -	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
> -	if (pcp == NULL)
> +	psp = dt_zalloc(dtp, sizeof(dt_probe_stmt_t));
> +	if (psp == NULL)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  
>  	if (prp == dtp->dt_error) {
> -		pcp->clause = dt_probe_error_clause(dtp, idp);
> -		if (pcp->clause == NULL) {
> -			dt_free(dtp, pcp);
> +		psp->stmt = dt_probe_error_stmt(dtp, sdp);
> +		if (psp->stmt == NULL) {
> +			dt_free(dtp, psp);
>  			return 0;
>  		}
>  	} else
> -		pcp->clause = idp;
> +		psp->stmt = sdp;
>  
> -	dt_list_append(&prp->clauses, pcp);
> +	dt_list_append(&prp->stmts, psp);
>  
>  	return 0;
>  }
>  
>  int
> -dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -		     dt_clause_f *func, void *arg)
> +dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp, dt_stmt_f *func, void *arg)
>  {
> -	dt_probe_clause_t	*pcp;
> -	int			rc;
> +	dt_probe_stmt_t	*psp;
> +	int		rc;
>  
>  	assert(func != NULL);
>  
> -	for (pcp = dt_list_next(&prp->clauses); pcp != NULL;
> -	     pcp = dt_list_next(pcp)) {
> -		rc = func(dtp, pcp->clause, arg);
> +	for (psp = dt_list_next(&prp->stmts); psp != NULL;
> +	     psp = dt_list_next(psp)) {
> +		rc = func(dtp, psp->stmt, arg);
>  
>  		if (rc != 0)
>  			return rc;
> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> index b4c1a3e40..2a78cb9ca 100644
> --- a/libdtrace/dt_probe.h
> +++ b/libdtrace/dt_probe.h
> @@ -32,7 +32,7 @@ typedef struct dt_probe_instance {
>  
>  typedef struct dt_probe {
>  	dt_list_t list;			/* prev/next in enablings chain */
> -	dt_list_t clauses;		/* clauses to attach */
> +	dt_list_t stmts;		/* stmts */
>  	dt_list_t dependents;		/* dependenct probes to attach */
>  	const dtrace_probedesc_t *desc;	/* probe description (id, name) */
>  	dt_provider_t *prov;		/* pointer to containing provider */
> @@ -86,11 +86,11 @@ typedef int dt_probe_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
>  extern int dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
>  			 dt_probe_f *pfunc, dtrace_probe_f *dfunc, void *arg);
>  
> -extern int dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp,
> -			       dt_ident_t *idp);
> -typedef int dt_clause_f(dtrace_hdl_t *dtp, dt_ident_t *idp, void *arg);
> -extern int dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> -				dt_clause_f *func, void *arg);
> +extern int dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp,
> +			     dtrace_stmtdesc_t *sdp);
> +typedef int dt_stmt_f(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, void *arg);
> +extern int dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> +			      dt_stmt_f *func, void *arg);
>  
>  extern int dt_probe_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp,
>  				  dt_probe_t *idprp);
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index a4b052fc4..0e2c1e2af 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -139,8 +139,8 @@ dtrace_program_info(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
>  }
>  
>  typedef struct pi_state {
> -	int		*cnt;
> -	dt_ident_t	*idp;
> +	int			*cnt;
> +	dtrace_stmtdesc_t	*sdp;
>  } pi_state_t;
>  
>  static int
> @@ -151,7 +151,7 @@ dt_stmt_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, pi_state_t *st)
>  	dt_probe_info(dtp, prp->desc, &p);
>  	dt_probe_enable(dtp, prp);
>  
> -	dt_probe_add_clause(dtp, prp, st->idp);
> +	dt_probe_add_stmt(dtp, prp, st->sdp);
>  	(*st->cnt)++;
>  
>  	return 0;
> @@ -166,7 +166,7 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
>  	int			rc;
>  
>  	st.cnt = cnt;
> -	st.idp = sdp->dtsd_clause;
> +	st.sdp = sdp;
>  	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
>  
>  	/*
> -- 
> 2.43.5
> 
