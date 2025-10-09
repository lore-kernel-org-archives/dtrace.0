Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17302253B0
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027408; cv=fail; b=AEEGP4d5EIirBpu4jZFkzNFTNLeAWUzXWVJbmOS7Cvj8K4NFk0uqoICzvx77piz9000VYjQm+gfUpxquaS8Oy3wyNMfj+hrC39bdv9bivS5jTYGwBIqumfWmB6HJu/zzFGbpY0Ig2r0aiATvU3T/nqNOf0jLPYh+H89Ccg9dLRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027408; c=relaxed/simple;
	bh=iMQ9Gym9hGRAvM5Cs+mBLhTKq8rXfiWDI6c0cWQgJ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GY3rxGzPgpi4/3HI8n8C7MLDDCehi6sU4jmY+ssqjSh8fkL5VoZ8LWW8od52t0zJ7ufhPTCOQ77enwn+9m4gdW/5xhg3Mi/6Pt/iQ6dzvAywOUhjpAUVHrz8dbiYNo9eq/lhk2bqvkldSw+34wdkv6Ag0D5CAPSWPZDKgzyOZ/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F0ULAvoh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H/QzGiFL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F0ULAvoh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H/QzGiFL"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599GDKNt015246
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 16:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EwI63AJAFlGBfVomQO
	2hmULpOZJml0DgCik2XzlxCr8=; b=F0ULAvohmv83VTrMCNCC7ntLkiqF09oUvm
	EHPPPphW2TI3dSUBx/jtURHhm+TlsYP2nbIZuSaYxO0uqsw4pWU5s5o5zBLnCtuN
	JuzVyftRaN9YSaBZpXcL6NxIVWWrjrB3TJMM6KDqE3Bx2lqmmcqEyRjt6VZ6c+f/
	QrBQrkBsDOkIRaIyEgUcidU/Q4z7gt4TgqbxjUffNHKGNEo+Yy7LyqWqh528Y1mA
	VhDClsv3YciLffOyhcFEZMTnBjiFJ9Tm2LszEvSW3FbJZ2xCW3apkxB/2cB9uBAN
	hoHhGy6LbzyqxvW9hnZqoTaOzigYq1zsQ2SsmgYcTSpo5ndtKicA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6ca30m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 16:30:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599G1x6H014365
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 16:30:04 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv67n7kw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 16:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O38/Y+BQWVM5LnRP+XyPCQgLbE5R0LIowso5lTg2SNnj+OlFQGpjWlm3KgNFxwpQpWJan1P24TrMm6CXhpdMpUttv8ITvTUZt4n/nHHuE43ms8MTtEoFJpuHhHpNlhn/+WE+/VxQdJ7D4iyTDnXIzBS9Akr007/G4xuVn2MltDL3VtTAr+QjxZKGinJJLSUP7NJWrILml9CEMTCi5nAzUQ+/IFgL2FRHywHm+0sdZefzgRml03GX/UPKzfVHYpCm/6BBzSGfsn9caWAJ7BxLL8x16NJPjXU7L67ljGAUyw9l3Sh/lKf8n8IdwOsp96KVW15NsTPH4asOyba0kVYyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwI63AJAFlGBfVomQO2hmULpOZJml0DgCik2XzlxCr8=;
 b=l4IL2Or3R7hUWX11kKjwDnnsxyh1m+pSAEXJjuT5Pob85hi6jgyBsTpxd7ZJLZvDsp54bWw/utUd6TNRf0v2Z4dG392uNXWwta1iELi/K/mwajbdVblJ86tpAevH7qSdFFLqyGmYj/BdHt+3UVyII1vqoKQfSCyST1T40Kir08iijDUSPuleNwVZqIfcp6WP6LImaVfrq11lxfe+8zF6C/uO5dj0qpwOb4HXdE1Z+W9/pbU+SsFP3xfC3KC0tC/svKY1wFW8hxd3eRcUn1duP6sQ2UR89rffCw4BrH+B+aib4DWtZaj1x6+xSToZnt2UUqz0QbGp7KsdXzDFHNpjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwI63AJAFlGBfVomQO2hmULpOZJml0DgCik2XzlxCr8=;
 b=H/QzGiFLkmz10u4kl1u+OW6aKkhQV949shenO3bJrjKwx1K+n8PMEEBnpsrEz2654k/6vbfqwuR/mFj/WJnzIygSTL23PYGj1bnSuYiP6FH/ZC3FzBU8nsZdZXZg8JO2pfJxmy4x55xPwLRXSdwuOauYpqb4VuiOLUWUNzQcrG0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB6745.namprd10.prod.outlook.com (2603:10b6:208:43f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 16:29:56 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 16:29:56 +0000
Date: Thu, 9 Oct 2025 12:29:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/5] test: Fix some ustackdepth tests
Message-ID: <aOfjAfXbxsUP7aeM@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
 <20251001062418.6902-3-eugene.loh@oracle.com>
 <aN9L5MPaovKcMo7+@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN9L5MPaovKcMo7+@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf767a8-cf10-4a7e-a857-08de07511514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?25fK2A7dYYhvFmwZ8zd6ZuMssH0Q2cKDVUDu+c6gxGQqiqnFAFpkDdT+PimN?=
 =?us-ascii?Q?AcBdqEZGG91jYM5Wkd7izeUy4BqxAiQXopAFsnVH6XcMhq22DpyEWA6i9aQ8?=
 =?us-ascii?Q?jgJkCtZI8HFevFPwLUYQtB5lsqWkXFnJyvI2pFzs7/4yh9SQhfg4V9zd8Ps9?=
 =?us-ascii?Q?XMTEsLHpXsIe93vd0nJvTCxwWscKQ67Plx2HzI+fq0Czekc4Lo3rD64HJCrh?=
 =?us-ascii?Q?akcSwvLZipPAK4wGj0aHkiB8t/erJ8EY3Y6pJ8+xATqXzWUj66Slfuaez7F2?=
 =?us-ascii?Q?9by4KSyKGz0gfZ7Yg0EVGpAWqKUYwmIG/V8wzrGgPZH6KHqSQ3Xn3kjIgcUZ?=
 =?us-ascii?Q?LSxfkNLiPUrkudV5MgaSpuADVwPI+ENX+Tcxkza9fvREM/RcJREUcIk8gvX9?=
 =?us-ascii?Q?Hr7gdXKgbprC/lyd2IoVjvPOT/QlcHF4hazmVrFkD/GFlpORo53eqgPCwM3c?=
 =?us-ascii?Q?8ozL2O/uyfutzaDOL66/F95XvvktwsN8BUlQGQ9IH/f6C+InU8B5N305xffq?=
 =?us-ascii?Q?0LjuWoZHOERDjcb8N5xXvDJ7u0h5/W6Qgndm4HNBCA0bLXoklNOe2NFlRUub?=
 =?us-ascii?Q?aEZFuX56sriI1DL6rHMQ8mqc+NLBTZNIPXjDtgGQoQaHJs+ugDx0JqOBVa14?=
 =?us-ascii?Q?E1LBWr6sPwwjUiEPB460bU7NaIzI2fbT+v/TYEnAVIyPJsjGuFIH8YLuy1ob?=
 =?us-ascii?Q?JEBwxjEZaZIL/5QvDq/VtY9ZnHNl5nwIafif1p0XN1voOKgjk3kC/znVoQL0?=
 =?us-ascii?Q?wwnGvp6iFIcYAypVeG/Y74VUffTDOd1pzaxOrQu1FQnBh36lr091TEHvqp8O?=
 =?us-ascii?Q?hW1/sYLz5u6RWDwqAQG/9Cu1f3Xfe5XFkER/R4fekrmIwN9PcnBiusXbsxed?=
 =?us-ascii?Q?WyYr1fWIRcx8T+2vWpanJPEY1aYrKoJfZVUdv72sjDWM+taRlsUv8NTelUl6?=
 =?us-ascii?Q?RaDiJXxoxYOadN4t5WQNPxon7up08nXMQrpptAtU+YMQlPTT9gbFy9Idsadc?=
 =?us-ascii?Q?fJVRSdRyigSBEoJgZsEuWxE4kjol7cyEvDrd4xxzYYmfJd4UqMHavW+hZteN?=
 =?us-ascii?Q?TouPuQAGg86I7Q06RzDhtwF9S88bpVmwqGKTvrTxsUexMKzv+g0CUU1tuAxe?=
 =?us-ascii?Q?xMDryEsYkf/9AxVzw6Mo8WXYIXaCvOkwS5ZBvP5PSVfEqEvuAloSSUd4r6t2?=
 =?us-ascii?Q?iER8yeE2qU2jgVrceEyqcC3r/I3sYW6MWuprV3qn8wOqDeaRoqmE5ajfZbJc?=
 =?us-ascii?Q?O7xZ5h8iWvfDdJVhuTyeeqdqkYlbn671XsCB87Fnbk5VosePpZqvN9X3MQ8e?=
 =?us-ascii?Q?FAP8Ugx4XchxErAc6xSNMZQbwgdNazv9uiIPiljO51qp3OUPSAWGKgpvGbgn?=
 =?us-ascii?Q?aneeKLvBwgptiWGUmQvLXCUAjh2Yiw+wXWt0axQfL6dyi6HU1oxOoUilojv9?=
 =?us-ascii?Q?CQBNof5ylTTQwTDmsewGYuPMwCSOFmTY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PoJGw/Ie6CCSCoNQirZgF20r0pFg32mKYzIv1fifdzhlhFK7C469I1NpPUJM?=
 =?us-ascii?Q?P8WMeiZjUlEmV9Qo1LayRgyrku6gxlAP5Zkp9UfiSQcpGKCpzSLfTsWuGQQq?=
 =?us-ascii?Q?3ZwnbhYD9JjWW1t/wyCRA+HjPJ0/U0X4XCKO4Cn4ubSJ5R5RMc6Xa06bvzAv?=
 =?us-ascii?Q?GbTtJZE0YTU0t9CiA0olxyP5CGiuOqEnEJZrqK5oUZQTr8KXcRndPUqyFore?=
 =?us-ascii?Q?CUEBPMx/2MnKF5MxM6LtesMAGWSA1XkUsrMsaV0s+3ygafmaJLm5fwEV9/hT?=
 =?us-ascii?Q?VR+UIfW0tgBfdMT4XiH2uVTnKkoszeUkiZbUW+lsNOF7sPFSZPWVTv3OaJ2b?=
 =?us-ascii?Q?ZuTooJwCpgCCCWlTi6e71pLvgoE+SnTDcCiIHqVLcMDqTGkwWMRXb9ObiXlH?=
 =?us-ascii?Q?yopaGDfOwooRqvfIf8BJmbE12MBOOi7xm3dnUiZyW12lUooFoCTKXWUjCbTn?=
 =?us-ascii?Q?jY7+DyGIMsOo74b2ilOn4XZgXdpiNkDMCuTPoIJTyxtbHeNm4XJTpMGPs/tx?=
 =?us-ascii?Q?EK2j9+zMLO02levLPK9mMLdArDjGMjWAmU8WGo92Wu7r9tY18pQxw/usM4gq?=
 =?us-ascii?Q?7VZ8IdNvAWVYRI7YOFV0QYaWC5O5D1JOSPZByzn/QCuz0lwg+K55TVcrf85Z?=
 =?us-ascii?Q?F4H3c4I4YaxIfhUBj/GmSdGN8WO29FeY9/9ETsSi6cjpHeA+dDjNrGYQ8v2B?=
 =?us-ascii?Q?h4mbPmEtw7jPc9gpgYJMotSCn5d7fI1bjee0rf+i12p9cyKsVCg0OmqS7tc+?=
 =?us-ascii?Q?ZAlv1deWdBW/VlHNPc3mXBMKKakud63xn5Xs+OpFc9bIOx96A+/jIadPzGnV?=
 =?us-ascii?Q?xodDKX1b9ACOsXtJ+BVPEHbQjK9lx+SpKnvcYshZ4z6WoWFtszqNtsgL5hkJ?=
 =?us-ascii?Q?ZfWaMifWJKrc89od/5W/ump+1Co5Uft91cAb2IKUXsRU+rO1CbdTSItwuCmA?=
 =?us-ascii?Q?nolPI+dgiJ54I8tr8J18UCxFi3cwrvYpjfMSYlhgAPkggmYp3q6wytx2QzgT?=
 =?us-ascii?Q?mJ4ijZPn/fIWuqwTOrGMUDsF3h4VJj1pQ+CnEWGi5f07np1HTwKAhir9nzlW?=
 =?us-ascii?Q?UN6zP6DO+i7dtR8T5I3O4AVL3H4VLxaLdbrcnZ/DBnd7sP7hRmKm3yT/Qukd?=
 =?us-ascii?Q?ib7D1SCaA5PWiVwAdfq5dWGCf0JLuPVAu2503N56wlbH8z7+Y8hYDU+AiKEb?=
 =?us-ascii?Q?ZGGdC2MowXifHnSV9VSd7f9ihVrU8p9G6skti4/ZiSqnm2NmIt4G49RRpP8I?=
 =?us-ascii?Q?1OUXtqTlaLbVzCh4L3ygrTH9N/0xVty2jEJHUuf6wJh3RzKtnWP0RYbePzMR?=
 =?us-ascii?Q?jsHX3FPLonFEPSGqVP/Vwa3JJ8bd0r0E7J2liV4Z2NNTGw11b1/A8dgoMzy9?=
 =?us-ascii?Q?buUjm/wcH3FNS8gXNc6fU8TVjpeCHqFcGxMtmEBrFI1mgJxZkdFdchwsdGSW?=
 =?us-ascii?Q?RbtaA1hJ3HARVMxDb4UjsEZoyHeLEuc9grVf7447d4sDYnNy7MsTg91GSlty?=
 =?us-ascii?Q?0uvo6FRZoA/+3bxROLrVjsSXSeyFBpE0bwND96N6woKfvz8YlpvEWLXslyOe?=
 =?us-ascii?Q?BzmxRJ6vly4IwK9pruO8qYy7nUNUMa8YcjzGQp/ZX2y4EZic1FNpCatxMZuC?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JnCFciblekgmDhErWcTJ7Uwfn5zVAraztM1i6bNQaIPfR/8GMRgd6lePY7jrvtliFc0dOWCYXlSsJgvqp6m4c5oeEdx6fOuCCGdNNhI+hIo7fPcSWCmnfRjVKOHN42pj9c5K6o7hIgB0mMTt+Z1TREF+FANQRrZRR+8od+O2y/8IcZt38MPDY3LFOupznRuYdsMTOAsPU9MLANRa67Ya8bc0TY7F6kRtqH7CwhWonYDZA4+NvUuxaznoYa3Kvz0V6z0PjLfGnbSa2TE4eRKDx3wfgDCBTJAcqFrS3i1U/ThIj1kBwc+CmoAqsoydjXRPdeOEji9l0cSV8jDDDmI3ZqXMRiix2bUrbgeLWX0b3o9YYdGNYGerCMAJNlDMTxjTLL3dunPRYsuen0oYL6YDQ0b9AoIuivRZxf8eXZCZkrf70tQ8p3BmbCxUQ5aWDj5tFd8JmwjB9B+tdW1UOEoN39XuIBW5BtOPgpKpPr8leZH9QHro9LeqKUpNi6lGfuNZa3D/S1p3Rh/FKNKGEHvelKS12QIuLSPlg0du0Y+zP1S+yq6A4CsmiHDJM06suv97SdyMzNMuIghDwPXkekb708IEZweavdPj3cOS1q0VhoA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf767a8-cf10-4a7e-a857-08de07511514
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:29:56.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtGS1jqDhb7ufylhUL7+V924YCv2E+VTdxg0dCGD5TINcuzLYyvz7Lm8YAPUlBOWzlHFzHIs7AnYGnvviwfUUL2xRHRsKPxODinyYtysjoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6745
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090100
X-Proofpoint-GUID: LYZc3xJ51uOrQV_QheXzz2b2_IGlKycv
X-Proofpoint-ORIG-GUID: LYZc3xJ51uOrQV_QheXzz2b2_IGlKycv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX636JlVCQBdrR
 UUlbC1AUmSE+EivAsgXI54uMRGHKgMY69DJWBi1EZwmOw8+NnsDPYY2dEp0FLMP4OTddvTsQfju
 5+mXxKuXYKAHjuljyfNjjLbWncxP88g46CA9sW4HKK54gnkl4jAugN09DTiIm5OBbQYqEB5nMs3
 7Dw6JvaPb0PdYDVJl6Y9R8b7lWHtSINkF4vdhAtN7DSRzr5Za42eS3d84wmK00/Wj9CVmamk+Qq
 0t8L9NFB+yTWC1/ZpKKNZS8tqB4n+N4dfxtdaPgyxlo4XW3gdx+XNTe+iJbWX3Ux8nKfiTfDYP2
 hNFRT+P/zKRjVPliXRX51ooC60+HadYoFjH2fYTBccsPMp3vojNAdf7pNrQurhr71esD7m9l9xt
 xAl7+gEx+OgEHBowqnzfBuDjf49wug==
X-Authority-Analysis: v=2.4 cv=FYA6BZ+6 c=1 sm=1 tr=0 ts=68e7e30c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jZdIBPJuD_smgKpe6NMA:9
 a=CjuIK1q_8ugA:10

On Fri, Oct 03, 2025 at 12:07:00AM -0400, Kris Van Hees wrote:
> On Wed, Oct 01, 2025 at 02:24:16AM -0400, eugene.loh@oracle.com wrote:
> > 
> > Issue 3.
> > 
> > That ustackdepth_big test only checked that the stackdepth was
> > consistent with the reported stack.  While this check is good, it missed
> > the point of the test, which is that the system limit could be
> > increased.

This test seems to not work right if the system limit is already 200, which
it can be.  Perhaps it should first lower it to e.g. 20, then raise it to 200,
and no matter what, restore the original value?

> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> > ---
> >  .../variables/bvar/tst.ustackdepth2.r         |  2 +-
> >  .../variables/bvar/tst.ustackdepth2.r.p       |  2 +-
> >  .../variables/bvar/tst.ustackdepth_big.r      |  1 -
> >  .../variables/bvar/tst.ustackdepth_big.r.p    |  1 -
> >  .../variables/bvar/tst.ustackdepth_big.sh     | 34 +++++++++++++++++--
> >  5 files changed, 34 insertions(+), 6 deletions(-)
> >  mode change 120000 => 100644 test/unittest/variables/bvar/tst.ustackdepth2.r
> >  delete mode 120000 test/unittest/variables/bvar/tst.ustackdepth_big.r
> >  delete mode 120000 test/unittest/variables/bvar/tst.ustackdepth_big.r.p
> > 
> > diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r b/test/unittest/variables/bvar/tst.ustackdepth2.r
> > deleted file mode 120000
> > index 5cc8498f8..000000000
> > --- a/test/unittest/variables/bvar/tst.ustackdepth2.r
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -tst.stackdepth2.r
> > \ No newline at end of file
> > diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r b/test/unittest/variables/bvar/tst.ustackdepth2.r
> > new file mode 100644
> > index 000000000..3bd29b8ed
> > --- /dev/null
> > +++ b/test/unittest/variables/bvar/tst.ustackdepth2.r
> > @@ -0,0 +1 @@
> > +Stack depth OK
> > diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r.p b/test/unittest/variables/bvar/tst.ustackdepth2.r.p
> > index 8320b603c..e50f12822 120000
> > --- a/test/unittest/variables/bvar/tst.ustackdepth2.r.p
> > +++ b/test/unittest/variables/bvar/tst.ustackdepth2.r.p
> > @@ -1 +1 @@
> > -tst.stackdepth2.r.p
> > \ No newline at end of file
> > +check_stackdepth_to_stack.awk
> > \ No newline at end of file
> > diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.r b/test/unittest/variables/bvar/tst.ustackdepth_big.r
> > deleted file mode 120000
> > index b6a2d6bcd..000000000
> > --- a/test/unittest/variables/bvar/tst.ustackdepth_big.r
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -tst.ustackdepth2.r
> > \ No newline at end of file
> > diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.r.p b/test/unittest/variables/bvar/tst.ustackdepth_big.r.p
> > deleted file mode 120000
> > index 0e8338907..000000000
> > --- a/test/unittest/variables/bvar/tst.ustackdepth_big.r.p
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -tst.ustackdepth2.r.p
> > \ No newline at end of file
> > diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.sh b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> > index 777940ec8..e84850c02 100755
> > --- a/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> > +++ b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
> > @@ -14,11 +14,19 @@
> >  
> >  dtrace=$1
> >  
> > +POSTPROC=$PWD/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
> > +TRIGGER=$PWD/test/triggers/ustack-tst-bigstack-spin
> > +
> > +DIRNAME=$tmpdir/ustackdepth_big.$$.$RANDOM
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> >  orig_maxstack=`sysctl -n kernel.perf_event_max_stack`
> >  echo kernel.perf_event_max_stack was $orig_maxstack
> > +trap "sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
> >  sysctl kernel.perf_event_max_stack=200
> >  
> > -$dtrace $dt_flags -c test/triggers/ustack-tst-bigstack-spin -qn '
> > +$dtrace $dt_flags -c $TRIGGER -qn '
> >  profile-1
> >  /pid == $target/
> >  {
> > @@ -32,7 +40,7 @@ ERROR
> >  {
> >      exit(1);
> >  }
> > -'
> > +' > D.out
> >  if [ $? -ne 0 ]; then
> >      echo DTrace failure
> >      exit 1
> > @@ -41,4 +49,26 @@ fi
> >  sleep 2
> >  sysctl kernel.perf_event_max_stack=$orig_maxstack
> >  
> > +$POSTPROC D.out > awk.out
> > +if [ $? -ne 0 ]; then
> > +    echo post processing failure
> > +    exit 1
> > +fi
> > +
> > +if echo "Stack depth OK" | diff -q - awk.out; then
> > +    mydepth=`gawk '/DEPTH/ { print $2 }' D.out`
> > +    if [ $mydepth -gt $orig_maxstack ]; then
> > +        echo success depth $mydepth exceeded original limit $orig_maxstack
> > +        exit 0
> > +    else
> > +        echo ERROR: $mydepth does not exceed original limit $orig_maxstack
> > +        cat D.out
> > +        exit 1
> > +    fi
> > +else
> > +    echo "ERROR: stack depth does not match stack"
> > +    cat D.out
> > +    exit 1
> > +fi
> > +
> >  exit 0
> > -- 
> > 2.47.3
> > 
