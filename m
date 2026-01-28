Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5292BD02A
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218669; cv=fail; b=Xu3iGa8zM7tD9mliKUDyJ2vMjqXqXxPM/gLYuViWbLl4RNlwh4TfZn5l3FZGajYMUnW4kT41VNviF8TGwgiO80UjeWTjDLZqSIojZRQFBZX1PwfbGLWsNRAxCsTGvYOh7y4fH++VKwDSr9fgpqaiOpuM7bKsmWyJGdxaHRB68Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218669; c=relaxed/simple;
	bh=hnP+s47Ajfml2cbO5YmuC8uUwTEixkyfn8HIdi11od8=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=KGWqpzWMvdosvtN1B5QFuPuwVKOFb2KeoKI/FfLf/Zv+u/4DqPm6DHvVMk3zhafdgchIzVqpsf/9YhOPvVMl1XSN3w+XQMTmL3d7dglMrb4Pk2EkzogjdZf5fkW75RDzViaZQp9r0+XXOF/Kl4F08QTw9JDzIF+AujwWyWgve9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JHQ9OmHz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lftxPjuI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JHQ9OmHz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lftxPjuI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614DOFrD1716183
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=mY74eko8BhCJyZ/XbEK3IwatHWB7SGLWJUAnWAUluEM=; b=
	JHQ9OmHzdpwRphwg6tMa3ke24CZ6lriJZAdRZE1/1GdQLsCgTruRmWcpTtZPLuMg
	w0YvL9ryS7bM8Kb4thsNmNumxiwXCSFirJsG6EkFlhS3gYPzUD/7KnDpQsQsDQFl
	xo0YOAOyJs8vdPEqkI53m5nUQ9QM9IVqC6TSnSJEW5WF8NLKvouyJsagjkDp970I
	Yw3sZEJWp4Ap8V3tYd153HIhykTFNf/nxE6LkYG8FYSaReYKAN3uaywWPsNmuBpD
	fHB1s5o/KvLB9ls7a/Pc0biE47FaVew3Q0/4k4zAaqYBU+JpHFhvIdC7YTqD8+QQ
	9aLtuNOVjAVPVY/gI/nPhA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jhb239n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:24:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614F3lXo025691
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:24:26 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c257a67s5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDB4iQy1Y7Kwl2Gu+Yzz1uFcFR2Tlp+rEE1zVDEnnOJHpKgeoP81EhHxQG0l3lXPX6wtPXjdvWSst7c0p2aMhczoAB/8wvAnv5ZogzbSf2btzGlW1lgYawtxK8vm2sJ6aLIna1YT8iHmWrU3PnCErIbzmdqro5LkU/NQx1S+Wo53TefXgYHnR83kjI24ulZq6y1BkXwRCeutNjDMhAH7bGPgoKS5EovxOljZO3++hozOcLkuvb3XH4GG7TY3qplZL4mBDyjWd2/nuqY3En88ukQHnj5fudF5irIdzC5I1QehkcOvQklxGfJgQfTcTq7B/y0LR1RmfP0A2kw2dat2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mY74eko8BhCJyZ/XbEK3IwatHWB7SGLWJUAnWAUluEM=;
 b=X+RdZtr4EPPMwnvSJCQhmv5KICeFmVu/KX3DcRxh1k60P8IGOoq0mtGscPEcKITcVmULukcfrLZ8i85Npkg1ktD1mGcI46j9veXhPhfLHvI8nd5VvZa+Gp5RwrIC1Le7w2Cwis4TwBGlqS6rwDq+cjPGo7BaBtkXh7n78fUcjDbKEeQ3Kl/Jy0iG5fFZu3EV2IRgFm/s8RGYlBZxRhDlYr07SSd1OQpk3uNK2Sgzik6G/+RQkgT2vHzgZuUZzm7W9FyA5WCNDrZ8fY03Bb0fd5KkAdSLRQ9H6k8RsTlsQOjhhWIdhVRJ+sC34pCSN6VF4ZdtYnpUm5UgxaRzMk78Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mY74eko8BhCJyZ/XbEK3IwatHWB7SGLWJUAnWAUluEM=;
 b=lftxPjuI09Mc7vT158sw+wcRKb4nu6Attk39kFRpgH4t4roWr7Bd94+wPlduCuYtDgqN5sUjV0TK3V9VS2o+ZqjGRiJYmcTrADowtNi+kIjvXcK1gOau9vjBPZux6GI2KN9wooR/p2/AKN6FhqTpez11nVcjrBRQnLUvQ/TV7WY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS7PR10MB7323.namprd10.prod.outlook.com (2603:10b6:8:ec::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Wed, 4 Feb 2026 15:24:22 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:24:22 +0000
Message-ID: <3569ca0edb3fd194d7e7e7232509f244@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Wed, 28 Jan 2026 11:44:10 -0500
Subject: [PATCH v2 1/2] spec: fix missing attribution of patches
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF000132F8.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::29) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS7PR10MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae210f9-a7d6-4562-a340-08de64017926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eI6hyPjjqHFo8YbNfQ1M3eZrHJpuOeZo0/H9YvamefkdZD7xkr9agm626N35?=
 =?us-ascii?Q?Z9xiRfnZM4kBn8G9R6Gk3XsskTnh0AgK9fLDavA/tuG11uff0oPBmwWFKqPC?=
 =?us-ascii?Q?l56NnejQaeK+AY3TDNl+aDWYDMW3GWDhhje+oSrVdirmZHPPsByMpt7qeZzM?=
 =?us-ascii?Q?xJ4mzMGNxQWounnvi62o76bYRHrdyxBOBOOXKkOArjO2G9FXq/evFti+TKni?=
 =?us-ascii?Q?2LZBfSn9Nri5Aa+9NZazlzGCYWw1i4FMT+FsWGco831gWaPnfAn82dNC84fc?=
 =?us-ascii?Q?St0iMupPLjye7oqScTwnd6futHAeN42ugu18pR6sFzEgI27mUPkqlXTYRxDS?=
 =?us-ascii?Q?fcdltRcXGeTyCaEO5pQapEGvydK0F9kAy45tdkCVQAaiYZcIWNHET1IwqeZC?=
 =?us-ascii?Q?KlwkgFmjpCSgPW3Fnz+YxcmJOy6IevOM+O+pb0OWTlSsYQIykQTJi3ckmJOF?=
 =?us-ascii?Q?jwN9OEcYUau0X0ZmXWF7rZNsq7Xa1N9Xxu+BJvmCjX78kbI+AZLsp2wQNkQI?=
 =?us-ascii?Q?/KED+1Kw37hGGBxDfjsSJGSAsnS88YgH2kNXeXNQR8ROPAgeHSs+WOKeGcOR?=
 =?us-ascii?Q?7y+R5KSDkXdMGtZvouVFgKkIGcImFtrytIHmojLk6UltBtSIXX4IZwyxkdX3?=
 =?us-ascii?Q?t+aJeuqp4FrQXLJyI3rJglnrI1oAEATSaWNo0+0tXp0eU4tEt+IFLVZCFwbV?=
 =?us-ascii?Q?RgcFWk+4ym92NR7VTeQoD6qp44cns89XQ8jIovg4Gh7aa46NOe5fkUT+KPLA?=
 =?us-ascii?Q?waUqOVOKi74DJQlHJnHwTVvkxuv9m7pBBy/LltnXrQFihYqReRqN6cRHEvkQ?=
 =?us-ascii?Q?XbBtAK/d0dskm1KeAXLPUuxtBDO6gOkCZRJJTzfDwalExXptvUKe3+kCEUkE?=
 =?us-ascii?Q?4g0Es4XM3QznzrqdQsltVT6/VhFxKEpS7WKtNKnmZ0PpJhPUqe2exUTxc4IR?=
 =?us-ascii?Q?h/PLG9fpQplcrZZZet/vEXPF+7TidPHvDay66z8DiVdeDgiSAUL4s735PjVk?=
 =?us-ascii?Q?x66fTfFqDroR+IXykSQNRXja5npN9M8b0FMm/D/9ThaO2pZcBZMm5q/iVFtZ?=
 =?us-ascii?Q?6awUcVqarvLlZhl0aviyTkRVIJfAosTkFBmFdRShlZgfJ+26z/YYLfblw8rh?=
 =?us-ascii?Q?ke1KLL6h1RfZTtqYxelegIcXF5BSNa0GvLXwsA2nAqxYB5CaDeVUlIGyXoe3?=
 =?us-ascii?Q?EJiE6UcWlre3FNBSBdkJINYBg9lFiRcE3v1gufzIGN7fz5X7Ka7OE1KEkG/2?=
 =?us-ascii?Q?YAIvdov0nHH+VbOUNvF2Q0eYO9BttoITYez1W/sgKskQK4hqDtlXJ30Zoljf?=
 =?us-ascii?Q?tK0fFihDyMOegcP7TT+UV/K7lJRtMBKQjs5NI+7+58B06mfqW7j31aitfMbd?=
 =?us-ascii?Q?s16XCTqsz5IVRSe3ODofGgTn2eBWDjBN5h6S7wSvmHZe1oGZIPAakJdTlPhn?=
 =?us-ascii?Q?K0eYX6cxdeYJa8wJIWrYKDLRg626Wj5WURzsdRIb0AVPlGIOMPTfOQwtfLZw?=
 =?us-ascii?Q?HA7SkHRGG9e0S3B6MVb6xUJUEOzRo2RdS01c3cEbYHHUmy28aOZ1hMOE7qGf?=
 =?us-ascii?Q?3iyjgSKcr4F70YIWMmY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JbMjj4/DLHI9bCZYPLooTwRQPchyIHnOhpBrsv0lrAbIkO9xzeJWMyzuumvq?=
 =?us-ascii?Q?1O0DKDF+XVvZ4eCR68Oc8tZ7fPfRgzAZkrlMlNCt4mj/OSYuDD2prFSnjRcd?=
 =?us-ascii?Q?X4V8fAVgNdF+d7i+BuI/tqdvQ3SZKh816SruWDoq5jeWqomD+ecnCRmmAyfA?=
 =?us-ascii?Q?imXbpT8ZpxlTwy6mI4ew4Ehx1Q9Sx0WKfh0KFuI3TJppUiqOwg5YSmHzced5?=
 =?us-ascii?Q?w5cSdNJebuVOLbAGYYTuuIDcJUObEzdvZEkFYAPVkO9aZsq3qn06giJJOpxr?=
 =?us-ascii?Q?dHN0FPpCERd9TcvLV4CELWagpJWqvySqEvJlNUgwxjRLYhSIboKVXFUmXZ3F?=
 =?us-ascii?Q?QDOrAq4W8ytCJ5mN/FegzaWHHI0zJKHNzanT0RHHHuhI3PLrfqpr0jw+Yl6S?=
 =?us-ascii?Q?GP/lXw9nQ8rXa6crZc1O/JD2yqhT+OiE4iBySw9zbgxlhhJo0+fCtUcC3Jln?=
 =?us-ascii?Q?F+JN/NgBuC9lXK0NTMIBj/V6mlpW3Qxpv/bes2x/Pj0/0aRGn57yXDwHH2pi?=
 =?us-ascii?Q?Q0YRjWV8KIX2vL/SpAzsmT3ji+uqPXkv3veYTIrfsKqV/0x+jWkQ29cXWjPp?=
 =?us-ascii?Q?rIuK/O5bpoxLc9SFFVjsaFP9CTs3Otv3sDbbaadzeYLU17Lf6Wivnl97j9Uy?=
 =?us-ascii?Q?R6+HXa9OwJyNK5k9gzp6j3SbnZ9NbL7qBDjVn7IqhHraJ2qz33MGvyB0w9Ij?=
 =?us-ascii?Q?XQiLodXiMzvUZB79poEz4GXKZy4CBRwau3Dw8tTLsAKvRoGGAV6OD92Fr2bY?=
 =?us-ascii?Q?+9htx2SQQndypfOszUwqqa4G6FEntBfGvV4YLOGtHyLGGNMcGww6V7BAybuk?=
 =?us-ascii?Q?1Rxr2WIUj5H0HiMJAMjK8Ptr+UHV5sVxPFGEVqAHhiCI+vjFgob1CwMHu/P4?=
 =?us-ascii?Q?z5IHmJLdq0xteHyzWHcBR4r9gbBw5DyuvdMySQoO6MfW0KN08zoZ7v9BhjMK?=
 =?us-ascii?Q?zjo0BzCN0sFHSlw7FVI+M2P/41xEuHybvmxX45yVeSAZ5JIQGsaGCWdQ6TU+?=
 =?us-ascii?Q?Y90glO686b9Nm/D6XpxQXCaZqrCIC+QjqEmNSVQqKm/2d8xUG4y/cADhWtqV?=
 =?us-ascii?Q?MeDrD512sY/qBbH/4xJA6h2M8FFIiFcl6sCIR/PsQBOsug6yOQNusN9DWTqD?=
 =?us-ascii?Q?9a7wT7Q2MM97pGSlfIqpywOhzZxFwtNT2+FUYx8T7S9etlvlE0OsfW7z9u+V?=
 =?us-ascii?Q?BSJEneqQZsv8hm5lOeBXE+TYIVrF+hLo5ZFLJEtQU2CUcYUoSq2WjXyycvtE?=
 =?us-ascii?Q?ZmrVBvGTQ/HQS3C0HP3SSzcV/Z5pyenH72TiKDvgHI4ovNKrkBAN7xwI+DfA?=
 =?us-ascii?Q?Rh4IDhTIlWyx9qOWJTBXDq+vDq8eyLuhOdjAqMLoiacIE+LqYHomltxY0Nnl?=
 =?us-ascii?Q?qnC1Ablf0enRN2OQ0THpz5k9M4c0QYqsATQlHuvvxwFdVsUa0DnKy4p2k7N3?=
 =?us-ascii?Q?25MVdDD5gL4ZOktMuDKVkV1gyrgpjxOBhAlrKFos/E1l/q3DzisQO8lALgAj?=
 =?us-ascii?Q?1stAr+APNrMcb1KKqZcId1E+KIsbAEQQQ0K1S9aLLMziYOyu2hL6ha98AlCc?=
 =?us-ascii?Q?IWv3eCGnzaNm0Bgz9xy1sHgHpIjnLwCQ2cTQQPgmSoArlJN883Gvo8K2pX39?=
 =?us-ascii?Q?H2e1Mc/b6uvd+Q7GqhfP3N4apidIwdijWwGGdosIF+gl2grmxVfIFLccnv8Y?=
 =?us-ascii?Q?wgHgujY5DEi7UFXeJuhzR/XuwtvFf/UrAGiA7PPfmKmZKpRUTp0Yc//7p6T8?=
 =?us-ascii?Q?lEWmdNEal0wTqgKQcVuKRhGM4stHqCY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	to/hdDOeHKq7sjat2YldLEyBLgqbvhEiI8MAhQciyqHVw8wagpvocEla52AkSegfXkncj+vaFM/ShDB9cegaESfONl7geIUJW+d66MXKKRXt41uqKQCnLNN50VHgXK8XXD5MkxK4cOgr6+Crgoypz7AGhbpHlfKCi9VSM7W3ppFNBNfkdNDQ0oZSiMp9iYJv7LIlo8cyRcrwPDCGcsDj+WRFubUAGm4zQ9fHSHfSqt8OodUqzUneVr3xIJJFY7qjJnbANVtPokG15iqSLnppaaGh2mnFf1hq5vsl0C5XJyp/iYwcZFOeoWmQxwsEkGrjyRE9/pKET7+a9FMMK54H4xpAy9lQPqLZvkZuojGnKHkqNLwjCATVK3ut0pG2HwwBC4rtARbF0yFsZBQF/BPQhLR64VJSNzUd/hYHRwP2AUj+ICKw4XI7Rn2DJOuLvN5FtVxmnalztiN+MDAcwmZ8G6eH4lacdIB9aQW+1HV1hVhyiBsah8oDvvqaEYAT48T6oD6RoyD84nofLIPrZx5SdSkf4xLHBkmVXGAN3W/sM2C8tzGk963bsSuhAOzoJaVmbTT8ks1iwXcaocRntGjhan9iivv83YYdYveLzxS7xSg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae210f9-a7d6-4562-a340-08de64017926
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:24:22.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21/YqT/ks/zlU+trT7vque1+gITQt+HCY8SuMtCiBjzNjOlFqD81OXGF0S8aNbitEFFOONdrlpz7FwKiNgKOVZUahN1RCoFURixkBDWlPmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDExNyBTYWx0ZWRfX/HtEWo8whMnE
 ZDvd5PmGDCBXty6t7ii4QqUjCxiJHdQsRhUv8fzfqaFeXcetqyLYBSQR2MEYOaCB6tMlIAxlfHR
 f3F/xPLxaYC9ZjJNdL4J2NvVk/ZnVm0zxFC4LWtZcSYSypjWlaWqT6DLeUPny7AbOrnk8Jbr/P8
 /hmkEoecc/RTyjnNI3jMt1yVbft3cTLIXYu3hxsJT5Et1qOdM/RgE1Oe8jtRaI2FSJZkXCZIhjc
 94OvHDT6y+f8s30N1A7eaFvsCFxBkmauChogttL2zorUn+ZGyxdSnBj70LA5Wz2EHnhWZVuZGnO
 JwuW96iMaAUjl7U/pVBznXQ48wQoHaiuumXwzIphgb41cmadsD3Ngul5IRNUQYjF3Tv0lE3mG/g
 PsM7pUG2QMbdkW/oQakur004T+beJ+We3MFUDdVqPhv4uQU7fRLPAnZ+96P/Jb63+yYG39Xq296
 3s9qxXKIvdZ7g6G9IMCVPxEE0sMrtmGpn113hR0w=
X-Proofpoint-ORIG-GUID: h8l4NKaBC0ZGHYt5yHhijwGKmkhnPCvZ
X-Proofpoint-GUID: h8l4NKaBC0ZGHYt5yHhijwGKmkhnPCvZ
X-Authority-Analysis: v=2.4 cv=CaYFJbrl c=1 sm=1 tr=0 ts=698364ac b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=PrRoNXdMV8jhObifQFYA:9 cc=ntf awl=host:13644

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 6f0b0135..8a81e5f2 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -231,8 +231,8 @@ systemctl start dtprobed || :
 
 %changelog
 * Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
-- Implement PID-specific uprobes.
-- Allocate the buffers BPF map to fit highest CPU id.
+- Implement PID-specific uprobes.  (Kris Van Hees)
+- Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
 - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
   [Orabug: 38776929]
 - Fix prvname so that both rawfbt and fbt probes are seen.
@@ -240,11 +240,11 @@ systemctl start dtprobed || :
 - Do not convert "__" to "-" for stapsdt provider names.
 - Fix printf formatting with non-monetary grouping chars.
   [Orabug: 30430270]
-- Discontinue -xversion=V as an option.  [Orabug: 38615307]
+- Discontinue -xversion=V as an option.  (Kris Van Hees) [Orabug: 38615307]
 - Add the DTrace Tutorial to the git repo and install package.
 - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
 - Update LLM context files to forbid "if" statements.
-- Test suite weakly pulls in kernel-uek-tools to get perf.
+- Test suite weakly pulls in kernel-uek-tools to get perf.  (Nick Alcock)
   [Orabug: 38064413]
 
 * Fri Oct 24 2025 Eugene Loh <eugene.loh@oracle.com> - 2.0.4-1
-- 
2.51.0

