Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092F78C9C
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758678510; cv=fail; b=ePVmFCUgwnRmIvG2izwgSEhuA9QuvJxviuWaOC9KX28UFkCF/J+MUc7xp25FfjnWpvQmjDzlTP3raZ7Ipk8/icQn8mQMBGlzrQ3MExGCJuzKsgt47fFf199kXtFE6tFnge4MmndbWSXEInuZnZFbYhT47DFwGY+9IpKabnQPpPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758678510; c=relaxed/simple;
	bh=6cVUlAtCbxt+gZA7Ccs2/6r9+ZbcHeIpTdKq+hTefdM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=IoF9aJAeX4+dzc+4bBMOhLxU8l+b0X9+KHMeRj1tdXBfScLLK+7HRnzBdel1upUc89LlO3+EE4oTNwH7zlDOImj2CPNtzSS84IP/7ot7YMGakiXOmHL4uBKYLQzGyHO22taXWlQPntjqlqL7mOpp1yRI3pn4PNSj01Gj6Ng7fFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f6Wkadrb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M04rCLtd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f6Wkadrb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M04rCLtd"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLcOHi025588
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=YGvJp5NtCyK2AwbPgq4BvLdbxJTB4U3T8dve6sg/lzk=; b=
	f6WkadrbBooW9FkbwL5FsOjPBrj47iYcFplH77/0qjwELUht3/lxKjqM+7DPObw/
	4qceW+jNihe+Y1/X4hhZ7lrcnGKoDSRIhSt2MbnStg9NgQpDGOly3PhbTP3sLM4+
	KLK9YTK/HjhaaODcY9Lyx1fUX4r/raVGrcLwZKCRGOuo8nj42SYo7RqzfjsLnLZt
	ltqZuNMQNsbpmhfpUlF2Jnxmudy/5p522dVER0Kb4mcSI+GBMxJq5D1mBdRd6yUF
	xN3+tFs4YI2jQSWXEYbotNweQiBvM23brnF/fY0qFcbl/ZuHP8Hq8ffO6y9XzmQu
	ZFG80MepQ4oQHr5tI87Bug==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499k23dyk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:48:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NN19UA026008
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:48:26 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq994ej-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 01:48:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaFUBKi7xBaLinAV8WX7mZ3Qa9VxQX6sPCobaUjqsabrkWknNyEEWzhi99ZRMS7vq6wzZrfg+CPknsKr9AvFNW92IeM/sOMdXGER1lHGGicED2oF4JctdJRAXLJPkX1DsBt8G6tp9KQjXhGQo16DVWf0sWcjjWh9h6HdPtszTTWbw8alTzNwtwrc+MZAJ9W4yD2puqCLTFGBiMKYC/cUKHZoN/t584akdCydMqxg+OgL+uoTiMkLeSt/I2sJM3u7k9L4ggXWdPinZUVKzv+YjasEtA1ksFiKtoHd9hXXhmBPWJtfh0197ulEl22uZ4xVfy83vQoYJHKTy8J4akcKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGvJp5NtCyK2AwbPgq4BvLdbxJTB4U3T8dve6sg/lzk=;
 b=lCINSYAlGs3vDM/LFa84wykyLpTfyWbYa1W4dCivv1RGsOxAV9h2CvwxFXufMWhrdRYB7nKumVfziQiX+mtu131neD5KkCS2qQu/mC/2IdxZuT4sAzHxOL4FOAxjZd9vollEqIMlSAtbV3xwPKbwGXTlFk5aBfYiL5p7QMbyNcfdwJclGska6NfoIMbJA+EAP5YuQlVMEZSlSo6U8YRphAGdnf9FFiiuBbzDKmg/1DrOWqR/96R8t8tl6sEoRCI3NZxsUCZl0ek30WgbtU4lXekfTDTAVkkKcchTlitRN5L2Q5J1H8cPyGOd3of9lbktjEGANzRrEO3LdazgNep8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGvJp5NtCyK2AwbPgq4BvLdbxJTB4U3T8dve6sg/lzk=;
 b=M04rCLtd6fNKvRabsbFRU8hUZJ6FrgHwXfcUezgaH7x1GygwQghogeeMgYwnjxVkCv4ImeBC5SgywU5EkqIDgiM9LEOphEBUP78aSN0h7vRvY+vW/I2rCo1oUfzyguIqsBnd8mZT6Scs/hxWXJLtloLBwX5irLWGO0ZhXBC2Ur8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV8PR10MB7751.namprd10.prod.outlook.com (2603:10b6:408:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 01:48:23 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 01:48:23 +0000
Date: Tue, 23 Sep 2025 21:48:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] cg: fix masking of lower 32 bits
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56722CE7DDCF7B95B77EF032C21CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV8PR10MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: c355ef24-0fff-429a-912d-08ddfb0c725d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MsXXLDelKrXZFeGRENxRZBjRlUzIPEFQtMswUNXSxHkXepq1WwAsB0aX6hbg?=
 =?us-ascii?Q?bR9tKUcB9q/g0HvQKz7Hjk+fmjZKweEmkoSENXpH5oRQTiUr8FFu6YySoKEh?=
 =?us-ascii?Q?7uUCvVVjNlrSqj38AJ0igqnjBNaDOzi19l5oiYnBrhJzJIlwwwykV5EyUGz8?=
 =?us-ascii?Q?eS+UeIsrCvZiu1K3SvpSaTgqs4XaDyL8FSjlyV+0Ulr2BJ/WOLdWLKZodh8p?=
 =?us-ascii?Q?9jW7283lmG5j90qKQ4L0UcHinCGDZSOT8niwCpg7H2VsEl0nnshkuY3umtdC?=
 =?us-ascii?Q?YSYLEj9tA3jaBfZzOdes4AvfDSTK1+7KgoLiTCIfDiZ1qxB/obdL0XvCmsiZ?=
 =?us-ascii?Q?12eUdFZvNlLixLlw17x32vnhfpdDCeuatndW+fGeMNhwIV4Kv5wuHDXa0VFe?=
 =?us-ascii?Q?mFVoRMxkw7dr2DOWQTaMeA96iY5hAXSCCBdxmk1aN/AWHRUkqcD2qysFNsvc?=
 =?us-ascii?Q?seUdXAtOE2x7zkdRg7cigGVs4/XlcB4ahdXEysNf8L8GeXAdxXAx4so/iE16?=
 =?us-ascii?Q?Hwm/QBwXuoBpGSXHS+/cDwzCgnCq+CQVOaPWFSClHQz73ivr42mer4QjmjKA?=
 =?us-ascii?Q?XbF96K2BI1oG2nQRREhu9h2iYWimnwguzx69OBQFpoxZqTJjy25H+yKhYwQh?=
 =?us-ascii?Q?4Qq6aRuaOw6UCJEspoCqfW9anDiM/gsoaJWIr6v9L5qy77LlFKYah9QNbkKu?=
 =?us-ascii?Q?rSZ+SmiOeRQIF/yve8OucOeb8egd/pUEi6PE1goD95hpwUujuzE9B63OR1ki?=
 =?us-ascii?Q?FFOARdDbtsCLZjq+clVIH5QzMeq8N/GWYuYOl5tqBpUEWXczBrSU3t9AhnX4?=
 =?us-ascii?Q?IVTHQf0wlL5yhLFYZb2PMZd9lIqQrJhk0dlOCaStgcMSfJOLwCVtmi6CSOqO?=
 =?us-ascii?Q?EKCk9U4GFxsj1CzBwh6ZbRHVJxrJP4WXxvUpLPPg4URNjYhFFZ3NAeu8nZk5?=
 =?us-ascii?Q?1vCSSI7nTZBYEBXTDXMNwUSEj9oNB3qqVa907GpfCuyVjp120gYfFbP2dYzW?=
 =?us-ascii?Q?7jic3ToM/6uUiIEJTEbVWO7OHZgWAiDTpmXIY668C+/SDwypjDjApEZLjxMO?=
 =?us-ascii?Q?zx6zsoEKoeH7HwMRYEcLufnrU6qZB0Gf06QkHTAemhnWPPSeZ1TZksKhkxLq?=
 =?us-ascii?Q?H2mDA1txl3jv14FxvWBqn5st79k/BN8aVtal9VRFjnAcvfDtx2yJUZj1F7wW?=
 =?us-ascii?Q?+Y/eLN81+GzmvmTcoWPRXxvWQy/uoh7PFv5OrH74PK7NFE4U9AdKT/XAc7aJ?=
 =?us-ascii?Q?q27lRFPaLabrOaI9LaaMSb4PuFNQ4FZhcMcP+AB050WU9zHACIY0KCUT2yyT?=
 =?us-ascii?Q?JW5yE2ojQ/g7M3TCo6ERJFBJbYRW/5E4Z5n08is5veg/6ArdacTLr8ttY43N?=
 =?us-ascii?Q?SCzBSRpu5HnzIDf+Ghw5mAiUkIcrNI3p0pnS3wBR6C/qmmnMVwHYb+J4vUDX?=
 =?us-ascii?Q?/TkdoOOrmMU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?21ru40dBOJHc/Py2N3kVOHmLdtVCj9G/UcAnAPHrCYXilSfgTP3moNE7yLm0?=
 =?us-ascii?Q?jNsk/TiKf53OgFe01+aAWEMBFo4kq4u3Mli2bavRYToZi2o1jNwWC2p6k79u?=
 =?us-ascii?Q?b/kHabQ2NMzIrzajrSB+RGdot4AL/M8+anUXi0ooGx13cMKpKjIzK9WP5F3h?=
 =?us-ascii?Q?1HSFe1CZzmA5HspYQ1VOjBAHrTbA69/YUvwuc5X8vp1ol1QXFq/dvgCfY28y?=
 =?us-ascii?Q?aQBRJ7eEtRAqU3VR/2OZ+dKRIzWn70oqNPW2A9NFlnz1QvGTW16i/9aD2XvK?=
 =?us-ascii?Q?X7XKPL8anB6y8Tp+JtVRoGralEOj6dBIA83ZN3aQ+GlzYkG9mAmC/nMDZlCj?=
 =?us-ascii?Q?Iii9j3OFsSdSMERlu/yfOsrmCQOXGtrr8r8Qn9kaJ7FDSrOQGF/aqA9GdiNt?=
 =?us-ascii?Q?kPTLoSpuXkAeNeBeSFSIZdB8An4XI7JohtMAriDwVUbPsQoLBBGjMOiKcc9X?=
 =?us-ascii?Q?FkByRsQWMsbtds2RlpWusdcUcJYGkmXzInIBhqM4qeeLbamYM6PoN0kJB1ir?=
 =?us-ascii?Q?Q3IqCiiqrbS+mx5T2ZpKm2+PlTPCR0n1iCEOXE3qNDtNv6xbzVLCifGoJ0ox?=
 =?us-ascii?Q?H8ufyRWIb61okIHLJwCG9kWLcnBszl9wcTAtMYvLx/l+nXouJszw6SBityx/?=
 =?us-ascii?Q?fa2svBWxIemWMrHJ4aT5NadVb6qZieziA/PBpc2ph/G4zO/sCynyGP40UpsR?=
 =?us-ascii?Q?tWBdMU4sPR1T363z2CXPKHH1bvV+lbvEaBSqZj//TcqHsvlPemghnDggNy3S?=
 =?us-ascii?Q?9BSNkW6W3laeA0zsI49RsV2SWqfraHBz36QOCR+CYucqcxzBdHw7uMbliA+l?=
 =?us-ascii?Q?Y/Q+egsCx0iVPiz00cee3bzBG6ZVW+NQzIfuYLvMzg/1SfiGzksa1cTM6yut?=
 =?us-ascii?Q?zEZljlxgFmmnpo0sp4bJ3wB4lPPcScpKxTT0tzZIqNxWae3czZYAdg4u6g8l?=
 =?us-ascii?Q?nupRbefGBCq8yIcLAzrH7xymOW3T36dPViwoOPUdpdGc4IpO3Eh66DrrNAd5?=
 =?us-ascii?Q?ygRah0fgBlr8hygUri9BpysPHb+rJOmsJyZ4P0GiOpYqoeb0lup4aJGiOUDQ?=
 =?us-ascii?Q?ySdEpGW+5O4uMHc+vJmCUWximBPnKI9X4pfOA9Phlz7XTDdH1lakbxj6Y+3I?=
 =?us-ascii?Q?Mwo6EsJ1bk3YRKyoo7eR/gPK92ckr+JFLbUH2xElx7HvuWBuPoKoDJp4IWzV?=
 =?us-ascii?Q?j7WTHr0qeFLCtlJTEbn17Xr0jpfOJ2yHgxqcf/gSgITpFurCoA7iECbBWtlD?=
 =?us-ascii?Q?nncEUiY5cuniDbe/9LYg3nAtGEuUrQ9o145jyGciqyGPRlSgPEVFEIQOEG7S?=
 =?us-ascii?Q?SPXKDiiPHcU5wwXJ+beEM+nLHj+FQgUq7SHKQNUZRrmcaiiK2wnicSlsgvZa?=
 =?us-ascii?Q?Xpi3Xd6enAYONYykpYoX3e+5R9qgcUIz2/X28U6lmCswVjWSbINoqfOWdm7h?=
 =?us-ascii?Q?KFqAlJp70MiWktglfPgHDVx6rqrEPt6vp98WIheBvIe2U77idI+xuo4M3sps?=
 =?us-ascii?Q?ZyzGCNhe4NsOKW+kFcFW7a7ruywJcPf7CdJqHnDME/Ip0qYuByWqSgmGjMSU?=
 =?us-ascii?Q?4c3MeHUqmK991AE9dk41ejlbL8FuyibtJdxWN3+VNB9mYxB92DhTmo1AFxf3?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ph0M+VhSu25X9QP00ZxNkHQSBtfqahLLSNZExlUyjfVyxWjCXOfuqOng7IPdFaEnGCwSJU9RmPom1+a230LWA0RwS3OBNDmZypTglh4mnFUVLm0yhMIBzrzhLHuXMDnXDJcb1Jl2/6SIJ36tFJ87NcHXAuew+W0un0SGz80Xm+G6on0QmffDremN0snZdsZyZCp4P+Qyt8NdR3fMcnIrKEv/ntruBNdznv7jww2iR/AoGSXFXOSvhmRk4Pd7bPz3oTtppzlNttaHdozDr6j7ejKRWQTcAFR6vrR/9CzirkD9niM5ltVpg3FbZXvB3zDW5Xpxo9aPckIRoGuDYW+WB0rB2/hxSRkoH2pqO9y8yd5x7Z0lI7+7ix3gdTod4k9Ynj5E065dYRsVGl8VjP6x7dEVb/gwnHDnpbTl9qme+S+v5BudCCZlLVtaq7VVKa8oYGsnGrXfZzFfyDD9qjlCUMJIJV76jSRwHuyzaQDFjmt1lDWzYVaSYB0uhhNIutCr97E9FK0V+WIDVjJFKKFPlgyC8UWJchTgS/mu9DHrKu5UocaisrLcGBofjdrGvh8ZHSaQroiPot5nodDHAAKxp6GDRzGt2/kJV05WUoqNIJk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c355ef24-0fff-429a-912d-08ddfb0c725d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 01:48:23.4980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIuKLF8vrhoOnw5kzwyT5NISFELyekTTxyaPcedIEpUtMopJjkiFlrLreUbvu2mvvj6bty8vtLQoGyEmScB5hNqnEOwY5xIcXHq+Mj3FR9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7751
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=948
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509240013
X-Authority-Analysis: v=2.4 cv=C5XpyRP+ c=1 sm=1 tr=0 ts=68d34deb cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1kPvXq0XW9ibrzGFLOcA:9
X-Proofpoint-GUID: u9VLF5Nyi72TPAohMqfrtDYatF-elNrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNiBTYWx0ZWRfX/VqbIASsB7N9
 +5JLh8zEm8XIxd39oYnw3ai+nOXQSPncCbIYtIYWbe0t4ShQVz0p0z5yY268NECmNgM2B5nhzTw
 45lMOwHHuHQRSvZPd0VQqYFMAKpWi2nxuXMmJ6+bkdZjov6GaGil5DDRXbcJ4MqLdqWvCxz8ubK
 m8LAVvUzgQq6l6nD25h/g18BStwlxXWJT7bjUdbKyy2SwPCDt3oqUjsKkm9KYqjeIl2/Dfwt8RI
 I51nmOmKlesoWrZbGR/uqci/t+ko9+jQnOwR2iwTYtQ/mpm6gMuleSKMY/2hh3yK8RpSy9LjT48
 4Is6w6fNRLBbPK36LXpUusxEwd2xi+At5pwZ4F/Vo52diirjvhRP6vEun7svJkYLp/houpDN1q2
 8OGSxQge
X-Proofpoint-ORIG-GUID: u9VLF5Nyi72TPAohMqfrtDYatF-elNrJ

The "and %r0, 0xffffffff' instruction does not actually mask off the
lower 32 bits as one would expect because 0xffffffff is interpreted as
-1 and then sign-extended to a 64-bit value, i.e. keeping all bits.

The "mov32 %r0, %r0" instruction does correctly mask off the lower 32
bits because it forced the value in %r0 to be a 32-bit value.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/bpf_asm.h | 11 +++++++++++
 libdtrace/dt_cg.c |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/bpf_asm.h b/include/bpf_asm.h
index 152d2312..63987e01 100644
--- a/include/bpf_asm.h
+++ b/include/bpf_asm.h
@@ -36,6 +36,15 @@
 		.imm = 0						\
 	})
 
+#define BPF_ALU32_REG(op, dst, src)					\
+	((struct bpf_insn) {						\
+		.code = BPF_ALU | (op) | BPF_X,				\
+		.dst_reg = (dst),					\
+		.src_reg = (src),					\
+		.off = 0,						\
+		.imm = 0						\
+	})
+
 #define BPF_END_REG(sz, dst, dir)					\
 	((struct bpf_insn) {						\
 		.code = BPF_ALU | BPF_END | (dir),			\
@@ -68,6 +77,8 @@
 #define BPF_MOV_REG(dst, src)	BPF_ALU64_REG(BPF_MOV, dst, src)
 #define BPF_MOV_IMM(dst, val)	BPF_ALU64_IMM(BPF_MOV, dst, val)
 
+#define BPF_MOV32_REG(dst, src)	BPF_ALU32_REG(BPF_MOV, dst, src)
+
 #define BPF_LOAD(sz, dst, src, ofs)					\
 	((struct bpf_insn) {						\
 		.code = BPF_LDX | BPF_MEM | (sz),			\
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a8f2c9d2..28b7e7c4 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2757,7 +2757,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 		dt_regset_free_args(drp);
-		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
+		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
+		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
 		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
 		dt_regset_free(drp, BPF_REG_0);
 	}
-- 
2.43.5

