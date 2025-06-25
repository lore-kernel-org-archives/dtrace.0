Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2494C83
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825286; cv=fail; b=dn6kaZH5NNCfTR3ftKoNT2Qphp7CCUcyuIx6fpsuO0FPJL5ly2VE++00OF8gTFCcrG+ldIBd4ittb2WB6BTTk6RQMTIOSZJ2Y9J5MzopIxYc25+YAAoJ+77oMMKumEcVI7lorvCGGPKPM6JOX6xNdh1+fcn4p1qkQim3ouiH4+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825286; c=relaxed/simple;
	bh=jGiEWsCLUa/ldhlvbcygVuAjA7z8CHzUeliRLBfC2e4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LAAwNsU1qL9QKXLHCWocqZTnOtt5vgxXaXgrZ404v8Oqp5Xe61iPfQTqZAoJ9rEaNI4CpY864N7awg1t2coqoHlQUTfcWE4KkbZqS1wfWs8zai7sNPPo+FIgQuwwTpf5vwjhERK1Sck9VJk1/QUcm1I5dfywHwTgtKNH68p//sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZwIYXkkO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AGx83sUQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZwIYXkkO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AGx83sUQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifmj030649
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MoVaKadMrPkB7hI60R
	/HGTboL9tqOyTBTXCqQXIc3Q8=; b=ZwIYXkkOG/uWx6G1yWFYcmZpiwjjAiaOx9
	d4vj8OiqyWye07C8pGmuLzWo/x4sDvNhDnI4/F6230EwV6Pe0LI22L4r+t3t1iYf
	EE0DmL1WLj0h1N8MAiCNKEKoN501mJ1tiawvGpuJzUKufgvgxM3ikRKY4MqFVMax
	DRCEcqU7xjTCwOS4pjvVnzEQWWqrBR5GOoHBcviYPWydrWJDa/ULlACFH+ZyIwZQ
	9vxK+k8WLMciAiJthRNIYf9mQSB3t1bhUA+kps8LrAOQpjPOLBBzdI1xlu2eo9GO
	PcJaqFXHkJSBI26J8/eD2uarNh9xJxYLJlhwtupjieSDBMfevQ0Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxen6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1YlUX024374
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:22 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrhhpb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfBcwvu3QXIvTa6fYw48HV34s6W/x/QJ8aD1ey8+g79kYmcJYxjqyRKy8K8oaiqTk7TrxTrHUqfmtWWa155Em5N/FFXZilZJ2uRyz4qyXh08bdUPybuVAixFfznkwpQ0Z+ya9RsB28ry//qWQar1KLzwlAVnDxAEX5e9nq3sIdnkkwUHr9hiH0zYyURe6+v/WXRK7ufoORJ2CY7IagOnQ0jbMER+VMiUm23YJGze5lIbBkZq3wngu3c2+xuGNbaG3LYPx1wjWw60ND6vBgKZhWmjgjJG3skdNmtVEA5S6o209UCcl+YX6wFQKAf/EcyJKsjnQvkPEE6khApfM0vvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoVaKadMrPkB7hI60R/HGTboL9tqOyTBTXCqQXIc3Q8=;
 b=vnUkskrZbXf+AfUiqDHcojMeGJDoEdtLCE3m/xdPuq0taPx7xkO7ToGfYDyNmdPXfeNaDESyyTCgYICN4WI06l7VkDnmw3hfr8c9VHXpgkQOD0ZczAXEM1W9a1himi86jeg98gI6+tykJrGf7EmAziS6PXFzuVcE1QFazIiKrc9SUO70fPLFFLCwdaDakL87Z3tpKlyD+oKdL6UGWAXERCWsKt7MP9ywo9Z3FIU4NpB+HYqdnGbxcoCBcgxZZGin8TJjmjPf5Tq4LLEG8nWRR63JaEbgA0Ck6eG3v2lypHLq3wp7BpLHR7IQIFqXHADcMYLLmKmI7A2ElejfoOaSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoVaKadMrPkB7hI60R/HGTboL9tqOyTBTXCqQXIc3Q8=;
 b=AGx83sUQe4TK0MEqVpY4f01JRjE1iBfEokzWj68Azm+kAoo4XcHtp0Bv1izXuCaSIf0pv/Dje2WDMcyTzh3UAggP43GhZA+8vw92OJlBwW5+W99MnXkVaNqUTp3I9aLgH86j752/4lqiqg8oKVId0SbVC/0BRI4V5Y14Cpmfvik=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 07/14] test: caller and stackdepth tests for cpc provider
Date: Wed, 25 Jun 2025 00:21:00 -0400
Message-Id: <20250625042107.13571-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 1311f96b-bc95-408f-23cd-08ddb39fbc4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a0hjgk286V4B+BGIE0LRqD3Z0kCnn/8KNvgYP3Zg7qHngFtHIVQU4B35ppFW?=
 =?us-ascii?Q?E9tzPPmccUhExYDmkQcK/gDyAjcRcDukKKdljY6VTLkgxtpwcz9EVu+03Fws?=
 =?us-ascii?Q?pndo36RYAOS4gPhPLBNBNx/Mpp61XTKiARLvHxSR9YcidWyK55N961ZVSlTv?=
 =?us-ascii?Q?YQ2xjGWTX+lVLVZ3qEvEAvJsyo3dRjTcLosjOyw6LCVJ8kcymxgkB+7R8u+f?=
 =?us-ascii?Q?jb9rEKAMN8yQSeufsW+QS8JaWnWr2DFZrCqrKoJQ16QJyO4u2JdECtyfqqKm?=
 =?us-ascii?Q?S3SNm1bTLb+qZZiGIGG4x+D+/AXvhvYduQosIblSwmLXLHwOs5KkGba8ZnJX?=
 =?us-ascii?Q?ZcJ16J490gjKzpscLyYz32EC47lQP2pBLA6dXYaaVUjoNy+Bn+N6PIC52L9H?=
 =?us-ascii?Q?Z1CV9BbespNYlcF6jS7goN3k/xV9hKNGO7NWI7Iw1EMlne7Mk7NFy2wmkrSW?=
 =?us-ascii?Q?xfpDyjQJzhDmZkedec/GQDkkiK2bIJDt4BkgATI7oLCRUcfuuhk3YkclBqdo?=
 =?us-ascii?Q?AKEbBnPnf8m0ndjPOeMXUD2JVfFvolT2L2xks+ZD6CZytqcVUDB1Ly4kachh?=
 =?us-ascii?Q?NaCw9ksLS05VVgMtu4kfXqUBuBVqQl+B0FnOIWAXk9OYpcArFzVtpMUEoyt9?=
 =?us-ascii?Q?3OoqyvVjXSY64zEZ5ldgrOI0k+f3HveuIq12uAbtzDb1b2chqxW5NdTbT5xd?=
 =?us-ascii?Q?R6YvMo4bnfpQEAipTsfZ2OXaN5SFsQFg4W8gTPpUA0aLLZ5tbsFb8U8p1hc8?=
 =?us-ascii?Q?3yvg1bO4qA/toZcY7+OVuynrYTHrtW3o0OLJcYXeUNwBjZPNsPtAMEboJE/+?=
 =?us-ascii?Q?xuHE4SiNhl0BPLJB4a8cPSy+GCV6eAjTA0Pr6Jdn3B/hwW924/PBcMSFcYIG?=
 =?us-ascii?Q?2uufbY8AfzPZo8rv8+csKJphO60y1HwQMgJUQWcwpdiCOzV7eEK3KdgInB9y?=
 =?us-ascii?Q?aany1t2qkCYid9yDVwoPAKu8LqIbxeEYrhkpEmY8PwHqP5WBe6W31Ux7O/Xb?=
 =?us-ascii?Q?ZMPWqXFpp2EWQ+WqBP5lP1T9XlChBXVhg8/lowy4W7UGWdJ+dBFLCSgjzAAR?=
 =?us-ascii?Q?+pULmUoFkWRs/trZICbpMSV9we4CnWvyatMES8XzQl6GSb8ZPIVXMDtS9aTL?=
 =?us-ascii?Q?Lr0r2CweEnLQZQHZifRTwVA+dRkNlL+NlMNxdsjorkzFseQPORbZIVzaZyOj?=
 =?us-ascii?Q?N1XD4Ad1lnE8zrAtKn0tjbAs4pajOw7trjWUI3hGePVU1uwgmZuOhXRNS/+k?=
 =?us-ascii?Q?pgaNPaiWYLtpv/vpUG2k9wo7XnjDnTFGx66RTAYL3DdjWfNXflwByydwRmmL?=
 =?us-ascii?Q?Jft9rWRAKWSuwN5NDapZ+hxLrPwphA3IWL3HYKv1r/RzY12U9PdBAV+nlinY?=
 =?us-ascii?Q?2rf1NzvH+ub1FCTTLtyoTQg8KMhPd+apdrG5yIOtBtY+67PJqt0Rzp0rjWRK?=
 =?us-ascii?Q?6KbJuvjlAQg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TxgBRKq9Etxdrzski6YFliFG2JFmSpgbWL4wX8qm4Qg2aRRn7P4BjkglDVyT?=
 =?us-ascii?Q?G6AvJXakdYbmF2qqsYPtHublk7usl657q6yGv9IGsd0Xq1/2l2sMkGIqKIi8?=
 =?us-ascii?Q?M9QLwX2RFeLBBvzKXgW3y2RmCyoUdNBIl6GIC6RoH371ZRxbyMST0LFH8nzA?=
 =?us-ascii?Q?Qf73SqNOj6hP/g3jBqSqnvg9Sa55rCiO5F9P0WofL/i1C/7KQUJSqs87zu2v?=
 =?us-ascii?Q?0gyz+su27BBBCw+DIfYiarhdfy7TTvlPQRqpOsfGAKBII/yiIwd0b8ulRocc?=
 =?us-ascii?Q?aVpro2QiUvbkp2nqnjPp8QK+znvDrVtRxXTSwc4MKa6EPI3v+BJtBqwkYxVm?=
 =?us-ascii?Q?xlUE82SJaCNkNj0kSflO9NsvOnQsrdwpVAwI5Hj/CIXzNEWetaFDtsBA3GFl?=
 =?us-ascii?Q?uHp3tXjiUB/5Omnyn4zBV+pXqfmXkEeUedGXoebEpTnhcItm8rHn8qNWEXOb?=
 =?us-ascii?Q?As4FoXvCSlt8MKXOsz+OsQqzZeUYHFOjzwJKSLLa5RPdEkmiiUcebX3gPZKO?=
 =?us-ascii?Q?xpK2huAZL6GyYq+wBVVerhE9oM6TWMZPv+OiflRRqnZijUCf0hBwc4E96CuR?=
 =?us-ascii?Q?IXdVofYsSCTXx5pjxlLXhoxSnVuaE2AL/VbBBwm8RaXX8mF9SAiFWbTr3NES?=
 =?us-ascii?Q?Gp+ASdy5HZaYIugjYL/JzglitFnwCJB21kSaqNJNPoHigSREzbqFXyEPTwaV?=
 =?us-ascii?Q?hCU+dGxg/pEw8YG4cLPBCq8ltqdCFEXrYimMZIa8fi39O08V9uS4RO+wZTTD?=
 =?us-ascii?Q?BSS8TEBxszflQLpxGi1oQsVsQzsnjS0a/Qm506Y4S8M1DpGIcY/ntXHHaZzR?=
 =?us-ascii?Q?BSVkY2zfsNJKr6W82xFAmkYekQgjrduNCO5iFfWQHFAgZ/FzPnrylpcDYGou?=
 =?us-ascii?Q?zNOpqgHXxiiWt04ARCSpnso/2M5YTCDNyXV64w1FIm3opasFElBMC6RfweeW?=
 =?us-ascii?Q?ODx65cE7RYksppIoxlrUSm9HGOnGh4vMCksChh6AFLuQR25Gsb6z6H8GlA0l?=
 =?us-ascii?Q?J8XkLGV865F7JUzTak/zJvcugbUjHxBOEFLaoF6FdKN3L9EPa62s6EML1m5i?=
 =?us-ascii?Q?YnBsL7f6YJdK3TbV8LK0BOpGm1IRWTAyTAYMgdLineK255I460Rie8SZtWWk?=
 =?us-ascii?Q?hPYdz4SgDgR/OoRC/UE172nOsYc+RNZEpqQVgQNDFIPsQFDd3PF+DsrsHp4V?=
 =?us-ascii?Q?09HiMNHMvV7gHSlQauoPWhPuaS3iJtahwpGTXUbrpqjxvXVbSn+snyyEGu5y?=
 =?us-ascii?Q?Z6p93IgffsZSk6tUPEOKKlFGlFU+5PFO8pOMw25C4oh7aKXDyzzcsGEO9KqS?=
 =?us-ascii?Q?aMVgN5H4a+NBr/HzY8jrz6cd/CdXpjWUAqfUYDmDo/khK+EX3CDF3JrvXebN?=
 =?us-ascii?Q?JevATSjADY9lmndPHB6hZ826InHAHm5oFGlrypnbjJLeLxLDtTWVX6nMhtOv?=
 =?us-ascii?Q?jqIjDXYgq/U0xznZrpaurvZU1dGgUTBWe39cKtHw1wBJEpaiYMgJ1ndeJTt1?=
 =?us-ascii?Q?VwNQFWoJT55mzPE+Z+0moVFn+oNnfnDZ8qa5/yc/PcyauHU2fnh9naNDe753?=
 =?us-ascii?Q?o+zOD6sysWnTeoOeEaIcqf0zVSU7ukaVLkOgcj6y?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7CWfnpIfGkzhWrKpuMwOOG6+4R0+6u/Wh3/feUmRB4HZiKCCB9eWcXYqJ0bHLXy8u8hqTYbVb52uogNS4CrsRNOCgXqCJ4senbsbVRH6K4M4GlyrbxmlJpteqBAne3/pDbRU4oNOY8cwOckjnsduBe5P5YB4XwDznhcukp7k05gN8I+KS5A1i0hHbwrNLIzDS/ZfT+CWwys4GImTMew1sASNiyR0Vhxm50OoXVTUfoxkokBufGG1Mc6l8o1i++1kaXrm9C01SBQDYNxI07lC4VXSVE9+epaHQuMXelibAzlLHKmKF8i7eF+GvYbgEZn14sdOkR0O2vyd3l3MkPpPPjfDrNWAceubuXYH17rO+1g3FMjnrHrNV+kMxQDrUVQmy0EuY4gtj9q89+g7x3hgSztbQA9zBFzrV8aRrVzUvju48kXENUSrBaJMXLN+d3VI7qivsUroduuf7V9/sgICCgnTLACgPYOhEULAhucdwaSIi4mUVfzjl1NTL4k44IlRArv/SUjybWLX1OWZKLT9KxvrL87HI2uKihMYJAtJHvPs42fDgPvlQLyTLSzV9XDdEL8UuPdQJ3jeak2Ta+Y2wO5S0OeFLFfVAsgpFn91+Sk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1311f96b-bc95-408f-23cd-08ddb39fbc4e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:19.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kknqKTcRvhz4VcqTH+A/PpODdmmADrB9hLzO4FqAzCavuO471FratZ1/QuEl8Zem8G0OHabO2NXOXwzI1+CxDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685b7943 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: ps9a5Zf9TABo1c0bKQfT_CEVceiHFu8d
X-Proofpoint-GUID: ps9a5Zf9TABo1c0bKQfT_CEVceiHFu8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX4pv34h1DBasH EaGJVPU6psdoAF9ToVrZOY8BFwLLcakAvPPHckc8TKt0VnxY2U7PhflT0GdHx16Zxv6m2uXnxhn zP60hsSV2TJKCdYeOZYrbeH5xp/XnHXgqxU0O7gccGqzQGN5OL8kpVK+X3gSOtP6jsDlIYQ+eo1
 RmtjEzswVGwjmUof+TBHolHPofZ7kErrG2+FhgwCuhVW3pfg2rl0o6B51qHOwINk9iprjeo34/s YxFEOaaVmBtLmmYpsim9qPcwXDUmm5QeQC/vGSnDnLvkyAgEJcq4glPkhHCX8q9pTWyz13snaZ/ ox0U8O3YI0F0Y2acfRlYVIa+K1crJz0C7DgBE417dfOMuS7Jz+AbkyUJ7quZJnudhWegchFpUXJ
 ExLTf/Nn+DbuSyHn0a8r56LG4iuimTYQ0z1wu6TSu/oWToXVWnP2zFicuXqLlb5lA+QA5GjB

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/variables/bvar/tst.caller-cpc.d | 23 +++++++++++++++++
 test/unittest/variables/bvar/tst.caller-cpc.r |  1 +
 .../variables/bvar/tst.caller-cpc.r.p         |  1 +
 .../variables/bvar/tst.stackdepth-cpc.d       | 25 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-cpc.r       |  1 +
 .../variables/bvar/tst.stackdepth-cpc.r.p     |  1 +
 6 files changed, 52 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-cpc.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-cpc.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-cpc.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-cpc.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-cpc.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-cpc.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-cpc.d b/test/unittest/variables/bvar/tst.caller-cpc.d
new file mode 100644
index 000000000..ff275e8ad
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-cpc.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+cpc:::cpu_clock-all-100000000
+/stackdepth > 1/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-cpc.r b/test/unittest/variables/bvar/tst.caller-cpc.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-cpc.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-cpc.r.p b/test/unittest/variables/bvar/tst.caller-cpc.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-cpc.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-cpc.d b/test/unittest/variables/bvar/tst.stackdepth-cpc.d
new file mode 100644
index 000000000..5adae23a7
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-cpc.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+cpc:::cpu_clock-all-100000000
+/stackdepth > 1/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-cpc.r b/test/unittest/variables/bvar/tst.stackdepth-cpc.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-cpc.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-cpc.r.p b/test/unittest/variables/bvar/tst.stackdepth-cpc.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-cpc.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

