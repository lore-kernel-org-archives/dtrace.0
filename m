Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31927735
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524034; cv=fail; b=XomW28IAecX/C2/3WI8kqFsBKl92hm/eaI2QlswBGeJAm9CZMEsHrFUv3ss8nz87/ICZoL6JfgSVS2ZUtyH4LtK+4Oj8meUobVCFdnLX8PmQS/XmRXsTlmgCZPSvORMOj1wav6DhiK0D8BLXjRcbqioezpUSb6fysnEhkUCc7zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524034; c=relaxed/simple;
	bh=MTlMg1YmmCNDDz060xzeVhQI7FbW3q7x178shAYcyT0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=blK6qUj+LXQ1PW7/wutH3m1R2JVcn/SCvsbzwDys+00fc8fRAzAoHws6K9mLDJIkJK69+8uxTIyOoXVFebkdmB073pL20lmPp6Ex/d0fQaZckqdquCWM8Ed9hrlv3tzyFsyOVlx5Ca4qnBEhP3bKdg43C3P+rtlrzP9l0UkjQFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BmsAn005883
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:31 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DOie/upYM+ME60P6?=
 =?UTF-8?Q?DRoc643AliJ44e82seU8qO8RUQEk=3D;_b=3Dls1InekUhhqIT70x1a1r43RKbX?=
 =?UTF-8?Q?QHoW35xYLWIxIyO5S27/ndt6EZ/j3ayyBk509BD1Pv_GIG0UV+ItNGBOit7PVVK?=
 =?UTF-8?Q?sDpxWOJrGjHDGX0J4MLTt9YQzMXA9NHig9sLriyvwDvKRz8N_97//RoG+rK7z6+?=
 =?UTF-8?Q?WlHd6J9Sk0M0ugzF1JqIjpnhgzG25M805KrcC8utFfO4V6SR8lNS7/_mHo+pwN6?=
 =?UTF-8?Q?BGEwxEZK9OmP5/szDWk0uYECxINTrt9Y833D0UjH0XArOxktiOi4qqMTHVbj_1O?=
 =?UTF-8?Q?NYA5EObwgkL1t5oBR9IU4pa4cv8c2rneSSjrzbjd3eXYvrG1yTD7ulXPLTQfsJ9?=
 =?UTF-8?Q?MCY_Ug=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuvvwjbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:31 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454GdEsg020540
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrj2c937-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afTS7vIg+2orufOd7mT5jEnESM1kMfiHOom0n1tdNdPQHsqc79bbVGrX8HlxnMHWvPzYKA/7swLM/k6u9xkm9gmUqswHVtgwqrGnjzFTqdxtUWLSJwJbVbtiZLLnPVIBKjMCQcQASRbACKk0L6pL5HpEFg4mLLwUiuZPIXP3FP3P+a2aOOpUOdN8uzdL1F+B4kJC2wlPtmSVV6xwhwIvUh9Iq9lru6nGhPQU5m4TrPvA5YsxoBmsI6XjWmQ6LK6VWnxrDIWZzl7eWCHwtGjhFz9kh3GKSGR2ngu8oDKbyR1f6SlCkFcZ3jwpwhW9yxW7oowB1WzefLL3/m+b6/eo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oie/upYM+ME60P6DRoc643AliJ44e82seU8qO8RUQEk=;
 b=c6Gt8saZ6WgQ1ITeEdbJ3fycLqgHYvnPMSMWo+D5ryBkb2nYT6M1yKy6bPVJLWkKZHzhX8u0AWgx5jDTOLOSy6sUCUNE9wp0ZwkVFSXvm9FYciuS0vie863MZcEi/dM6+WatD1IBfsPAqZieJPFOI3fYo0TExWuhL2EY2JEM33AD8YEGPekJO+7jrL5+Tu4+K4JsoKJOSdd3R9LoiI11fV+PFTmb/9uVzM2meqgHNXSuUDGPJHSUx7lXZ+Zl8oz8SlemONvj0Jct/UV3AGbPU39QzZPztQAzS/HX0qsKFH10/dms26reBo2qA/NPfaLD+wnjDXoTpVh0KRCJW16g4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oie/upYM+ME60P6DRoc643AliJ44e82seU8qO8RUQEk=;
 b=z3p90SrIkWtE37D1uQ92aOdOx/u2kE8VM1w3kdCTf9ULPTtu86qSaExTZAw+C6aieZu9CAsFen26afge9PcaF1bxz7vUqR8GRlG3cp9ypkzIhMeJ17XcI8+qMjJHzrpNtZ6t/b7j2W75bZo3Jbpdm7wkAhMc2r35mVyVPW0PuW4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6106.namprd10.prod.outlook.com (2603:10b6:510:1fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 18:00:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/8] test: Check dtrace return status
Date: Tue,  4 Jun 2024 14:00:06 -0400
Message-Id: <20240604180008.11331-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0137.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: d62b818f-cfde-4d97-242c-08dc84c035d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cxIVRVjS6E7uWEL+cimNeWLA9eg46OFD6PG0oA4uSrWbLUSbVs7nywRtU4aA?=
 =?us-ascii?Q?Kszc/FqnEsRCBImqm2wiy6zv1d6leYzSXQQ2hUte3NzSUtK7s0fL188cj01Z?=
 =?us-ascii?Q?kA0IbbC8o/+35sSrAf6TI8R5FV8AV7me1cEXedKHIO372TlO7kdm6RsiDU5X?=
 =?us-ascii?Q?Q2q1IPyeUtojPu/Tzy0wyyQvPQz0K3ZJBm/kIS9FL+O9ULNuajDNXqxCFRDP?=
 =?us-ascii?Q?UKqFfe3tValWrsXdbLCdsS6F6iVF3wiuBW8ew+byFeJEvD+/yNM91FpfVkYf?=
 =?us-ascii?Q?qKBCYNMqdQLRM3hkRkfB6Ks2g4r1MuKPCyghow42GQz3IeWFaIMHCKH8NQ86?=
 =?us-ascii?Q?2YKeHnSrObk+w00so13p7ixfsUo9JC1ri6yicczGMEGak4k/diUmLsobj3XL?=
 =?us-ascii?Q?yeF6w1r6ZZYloa/wdfs8xtRM61if3bfqE8jT6Mm97ucaMcrtR5/KjnNlnNFW?=
 =?us-ascii?Q?NB8itF2Si7ZM0ksB3ZGqTYu6brFtmXBcMP9wyT+nOEywINMFptEsfbbSgU2E?=
 =?us-ascii?Q?sM1TMkSvPta0ALK8znCQeMZTLI8Quj1/phAf1kanNr8dbnSU1IAIQBgz7Z7x?=
 =?us-ascii?Q?RjX+5a8PZjLytO9ZEbNTVY90uYKtY5egqg1ofH20BEMaWTEb+THOxtUsBlTH?=
 =?us-ascii?Q?SMCMdvYFbtnQb0fBDgDJ2YQw+CH7SShhXSEuV49de8hGPyC1k8UjMsYhwMm4?=
 =?us-ascii?Q?tjQllKoyp9uj0+7ekwzGpcEOF3stM8NnSOIts21V9Ok4ddUXGRX3nkoLqMro?=
 =?us-ascii?Q?g8W1yDJGHfG2xiN88GUS14Wq2BmUot0hMskWQFQP5ItgU4YV2e3+0mNoBne/?=
 =?us-ascii?Q?xxwVjwLZPdAF7AkXCDo5BEQDWKTNbp3e4tlbYZEH/xP0RDhHfKmztg5aJqRm?=
 =?us-ascii?Q?Sb8wot6t2lPp1BlmbhHihaCv/Tnnd0Z+KqGGnnWAbRj0h+4+3nTaNm3K4lDR?=
 =?us-ascii?Q?VHylz5R7TcF5VMmm8AT787v0fl/9ijwrhRoQ8SncR7Z6GTswRmey/kiQMzn+?=
 =?us-ascii?Q?uVL6LDzn/AWcGQvdO5ea5iLmGF3L7LYTAKZRvLDeVXZb7C+feHPZnHieADZ5?=
 =?us-ascii?Q?nGIWVLykFURsfLSZ851NFeAXEb02VN9vBoWeGVK1TXRkcQ2g1eUZTNOgV1tp?=
 =?us-ascii?Q?OC3AZyIfcR3GTk/wr2LGyrJkLi5OHKtrw2LBJe0C/Sj3nzgRZNm3mPSGL6jo?=
 =?us-ascii?Q?GBxO6D0bYAEnSELSAuweI9I6KAwdzvunJspkLAfLS03lZfwHh8oSgmyZcJLZ?=
 =?us-ascii?Q?nqDjx92vT0RjAqQPJAmGMghMDEbOWNrs8gMOfUUnKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tRcyzWazVks2CMylT4DYMPSlTJQ5BNUvMI0qj+LJD7kHBhdhyTCaeO4OPAIr?=
 =?us-ascii?Q?lJvW08krH+qoWDadD3XrlxNXdgpHLSn1Jd0B3HTw/upIOhPrMPxiZPOx3/98?=
 =?us-ascii?Q?XXJGQuOVpec+lzFR3pVkbieDZxB/yYiTpjKqzMVMuBRKv3milHBnhe7PZFqP?=
 =?us-ascii?Q?Sl68X6WMNKcFtboW40SwcQ2eoi/hL1i3tRpGcCMDQ/HRVA18WhV4feSmlOuB?=
 =?us-ascii?Q?C/5DuDOVYN8nbfrH6Q2TI5cffmBy3byjlmIM1ZoxzktzQhQgsF2K3GC2xXhj?=
 =?us-ascii?Q?wBY+s1au0mQ6sk9LLZoHfnjJJnOXmeSSnanTeBe+YY+qwgITdYiHu1hmLqIK?=
 =?us-ascii?Q?5qBZeY41/yx6DwsDkVldDxKLP/r17nPgD4IHyCpViMKmzCFArmcwSYbMP3MU?=
 =?us-ascii?Q?YVLTgoKjDDm5nhhw0zO0jRFR1csz16xuo+WcujVFN/tXyVQKv+Xcgjbj9BSG?=
 =?us-ascii?Q?ywWnRW2jTzqQRNcA/ZeEiOEa3TUCp0Rtb7ZJNdSKJ5Y+s+BSdnaZpnPrFgYL?=
 =?us-ascii?Q?1G/ZlFZj99eHOY3plnvRovF6/FCUHUjVp1dHKM0sNuV0PbFPLbAkzqm/6WnV?=
 =?us-ascii?Q?cRb6TPoDNc1xxU3Y3eV5PvJviMgGQVjvg/RE6u3YNkKRmizQ90f5C4J+pTwz?=
 =?us-ascii?Q?FZ3vejxvmTbieHBnNeueC3UjtrzcTuIDi5sw6A+UJgwBNxcPkSyL14YEvzuK?=
 =?us-ascii?Q?j+MieqAatC0tu2zl4coWh2oiL9YGOnMgWBmAnrUBaSC6hd7oL+9l5+Nnn+du?=
 =?us-ascii?Q?ki2WtBELOibK/JCoq7TQl+WOsfiKJbZWMyC/H0oK6wg7ZLtBJHm6IgnGVLgh?=
 =?us-ascii?Q?yZ0iAR8HqXiADS4HRfGzTeu8yEYpD3jeptG0gW1rPa0j8IhR9VDmhBkJQa8q?=
 =?us-ascii?Q?Q+d4beS+Qr8d7h1pwHC8ChG+tXTlcv+wc2XgNslmoVWZXiUL3e5DwkkbVwxL?=
 =?us-ascii?Q?JptXGm6uf7mxHkcav18EFOPcnF7AtiYLPIehZAmlhdkA6iFaOn2476WxJd5r?=
 =?us-ascii?Q?DwKihdq+VoGtCv3JIttpywtQ2NmgUbl2gN/pTV3nqU4yYPjtsNDP0/3WNrrj?=
 =?us-ascii?Q?kIBipo2gM70yaQIYRA30BkatVkFrTMDfr+TPpdGRsR9VU8Q7m0qiMMcTv1OW?=
 =?us-ascii?Q?vz2qDyrAV+6LBk2g0sN02Ds4Fe8d9PF9TrNI/ceypBuXirvTa3PVXEyA9sNb?=
 =?us-ascii?Q?y5PBb5fTPDkbowIJl+Q3a5Bvyi9gAVWYWsbBWmPFH0Bi2RjyC3o1YI6wtgj5?=
 =?us-ascii?Q?bJLH3kFoct8IelEkU/mXPzg20XShk2cY0z3aHYO8z7+S4Gw1o8kULbOEL/mS?=
 =?us-ascii?Q?8d8zJ3diY7Cbkgom5cakRvFccVjppGk6RV7jL/Z9DxWssMKdgCqImRl8vRkQ?=
 =?us-ascii?Q?H6JMEY3yQw17dp40MFGZNaIFOvCViaJwrNiyGqY464cMF/X+zUPNy1MFxivL?=
 =?us-ascii?Q?8gfCVvf7qkibzJEbVIidqGVeJ+qeQJWH5D4/iJ1iDJKKa/wjNC4RejkFhlCn?=
 =?us-ascii?Q?CK9vs/UbaoAznFiDUJ8el4v3A31CBMHlrWtKc+lL/4FRx1uWbxcDJ30aVnRX?=
 =?us-ascii?Q?a6QKQ9RtwcvUo+ZLtund24WE3BqYONSduj4OtyfP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aJKBxjZPOMlpIiAcB74rykDUVr3G4AZ5bT7sbzxYGanXnaQEkBrMhrrTeTjkcOMvaEqfRAzqf7wtJ/T/3dKJa3+zFQ84oKtbpq7SgF8gNuHcETIhgM8On9cwvvhVftqbAfxAjJ5eBAdZ6zInsXXsgvUglnT5yHl/67R80eeZTxnij2QRBwhrFZDUKIBvLAFhnNffeCgS2+ypUlLCt7DxxCg6QTY94d+hT4NRcI4pRGeYurZEl/jr5aGO/LTCEDWutj2sRlNLGFVC5sOa4P/wpX2bKwAkEhjjx6D2G3h4gHwi5Ai58gYaWqx7w5G898WAagK6A4Yr1D0+R3/kpucaQDuc6Brq/wNXEehLYMkmCCk2Nmxz+i9UMP2AHB4KyQmp1aByGTU4p9bny+tdD3iUOyYl9aHnrlVAG6cp9WVEUz6Yoaf25/dGEqf7IvEKo0tV4jwWbbJ3+ovhkofpXBQnmby18mlTkvkZQfL282wZTJaY2XND048TpFzFqW/51ApeONafvlPa1EDy2lO+Z/rwi8br+8QyESBSMYJ7ZkUw04gQHZb0DdxqoZh6tr+FJvBD81ApsYwFokvbNX+BIxquCZ0y+0/EWkCdfwXLBKYK1kI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62b818f-cfde-4d97-242c-08dc84c035d5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:25.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsqhuSXBOLODgJXjHJjAT5jotcN1r4zOWf9AlTCPXLlyaLEDMh6BGD0mVu6AxQeGUgvHjhw5Df8VPlWbv9rgDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-GUID: l7xypoS_7OKBVboL-yOXEwt1a4k5NpYT
X-Proofpoint-ORIG-GUID: l7xypoS_7OKBVboL-yOXEwt1a4k5NpYT

From: Eugene Loh <eugene.loh@oracle.com>

This test was spuriously passing.  DTrace failed to run -- many error
messages in the log file indicated as much -- and yet the test passed.

Check the dtrace return status.  Due to recent USDT changes, the test
now passes (properly).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.forker.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 018a6572..92513eb5 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -32,6 +32,10 @@ while kill -0 $id >/dev/null 2>&1; do
 			exit(0);
 		}
 	EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: DTrace failed to run
+		exit 1
+	fi
 done
 
 exit 0
-- 
2.18.4

