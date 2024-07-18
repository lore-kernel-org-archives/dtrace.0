Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2871B86D2
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721335325; cv=fail; b=XEnpaz3edD8BKXbJn6QBThrjks5BD+wPo1YPhNumLdcMRxpqBaBs3ca6unIU46nYrRIeYmjJMhaIA7FMLnyOmLMv/4iYlC66GE4cHfVZzV5ZsL+vbMGwnwb+MX0uXd0EuEHZFTKqRJsEwOoGWoQy5lmntLxNR25o5Otv9JtX9UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721335325; c=relaxed/simple;
	bh=zXPFp1Npwe5JsWT7zbGkF1xHFehlb7d4tif1YKOar+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Su/aAkIdRRvMC4f6VnXzo/S4elcNKOy1t4MQZw0mR157tStlU+1HVc9oZiV/dmgDZW/cbCnvZDJJ1UTUHldio4dzluKApVUCAy4MDH858iRyKEpM/AAjaSKjEPSCafCWAsz3jmmuYCWX2LipeBTZv8vv19pOvGa4AFedgPJaK6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jZIJNWcl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DoTrCUle; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jZIJNWcl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DoTrCUle"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IKf4wP026758
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=W0K90Ugt5asHDSU
	Il6JuKn7PdUlmcEd8gJecb8IorX8=; b=jZIJNWclBMGMqq4F1w+yAUKPeAo+NIW
	EqR08yDOxglSHW9TDDAguaWha/oEw9nHwWGeOe295if9tyRFYYKuujw8Yy0+FgY5
	5PrCCWPPjjrpRawnNjh8+AKRm4SgjEzKGA2bvGW8KEsCzfrHysWwpqxTYt1RgxyA
	rxwcwTcVjfQnFJZ+rZ+VEM9t60kP10CdTPNrJnWFrtIYT8Ls/DYfR6rs+RtXlFWh
	IBUxJlJiTop02xlyHChjXV8lEMgknYav+wyzjyLkJGlcVo957bTNM/AdiSHfbD3D
	8iB+BeriLg+0PVuZS8G42HUU5OQG5p6pdO9yL2w4ZTFsj1nyW6QjutQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40faa68017-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:42:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJWpq5003622
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:42:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0xey7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDyMIZX7m2TXI8CygEwXuuOdv5w/ujybZR6X3mZa1g6AGU+ha4awvLnEWQIresQkUx4VLMnRX2ueQh5YIbxraUhQbJRf/UnGh1xulW0JzGrHn3Tf0s1cM9llEGXJ5xYbPUvvB+QloZvLOvJOyu7FD+yFFvRY+34ge14+UmXCHeM6KuIdrGzJ6WrZDn42Mn7fBUP+bFsRG76tpk6QgUXEPG9GhGdNo6AVz9iYXN1/BQE9L2YIstfAaaCBOZMraIftT7sRsjAALOE7IRNtt8QnzdsL25se7Sj7D0T6fsBzuTvKMJBb7q1UwLA2mlub5i3H/4rDbrVDU0d9GFSwQwSXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0K90Ugt5asHDSUIl6JuKn7PdUlmcEd8gJecb8IorX8=;
 b=X34e0GTAHC9dw8/NlcDbjZh4ll9XD5GjsXbXo9md5jlpH9gIKf9ROZ2t3LCKFd5Na7k4yS07tMv/cFRT7ar7IqYUX+9kYvcJYzuw1Y4ER14IpSsWVGPGq1U2HqWSWTE+Q3tOGgYS0aKcpc1kCwe+pcyOCRDIP2PtLoqWoJgfgPZy+FzUyXVHP7aapEr3zeLjROhn2QdpHq4Po2yQRhnA3lDY3MvZJ1w0m3SDCrTb5ktEDoen1oG7FwMgof0DfLInK8FHMkJ0BU0vWyiNM4IKe7hjsE7RzvhVsnjqC8RBVQ2NxEqPGxl2IhL52eQh3npIh9aQ3p4A7lJXbHtoOPQCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0K90Ugt5asHDSUIl6JuKn7PdUlmcEd8gJecb8IorX8=;
 b=DoTrCUleNc/tqnuTT1ayekTt8Q/WYUU+/hAmJtjSqKfSWkgakuh3u5LCGuyIcxJnAGuMIqzhYWN4hhqK3/ZSMK0hbNZ1eqoNkMTZ/t75Aq4iV0VxbFiwEWgTIXH1rh0u7hCkidKSGC8jAQQiOwf9mWEheDZNavgvWMltTO601rw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BN0PR10MB5159.namprd10.prod.outlook.com (2603:10b6:408:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 20:41:59 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:41:59 +0000
Date: Thu, 18 Jul 2024 16:41:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 37/38] Fix some dctx->mst->specsize comments
Message-ID: <Zpl+FI6/pJhRuimB@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-18-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-18-eugene.loh@oracle.com>
X-ClientProxiedBy: BN0PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:408:141::32) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BN0PR10MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 81665fc1-38f1-4bc6-2356-08dca76a11e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tZINhhuSPX0NQbK7JedPoQ2Dr/7uOScxCBnwdoSNh80nthA1qdzsxhc6bQeT?=
 =?us-ascii?Q?XBj8zxfrZU4IE/SYVeLanvai2ccoFFvE3O4HBQobHBPnUTx7+tJiyhfpdiXi?=
 =?us-ascii?Q?d0x20gUcqF5M2WT/lEpZJQka/gp/XyIUDo9Mij/GL7hFYJbwKbhLCZK1bPJq?=
 =?us-ascii?Q?VfEVgI0XnVE5khoDiJQwUiWP2Hsjk24mz7i5ML1EZNAtarwI9uT8B/B8TVmF?=
 =?us-ascii?Q?+aanu0YIBFbJK63LzbdfW1Y3dmziMBQeQdHJfyuNRpui7Scc804D4+CUa9MA?=
 =?us-ascii?Q?9x3ftdozBS3naP4hMOGJGmD23JiV2fa0/H+OvcNLxpHfQi+5ZQ017oxsZ+Wo?=
 =?us-ascii?Q?/TBQWIv/f7qINCzxNiWNwezyZ8v4nTqxIIL2wsuBTV9jgo6iuyrSE7kMHJa6?=
 =?us-ascii?Q?grEmHeVfMb/+92YIj/5NhiwrH7okZVDuRvKUQCrl80vqlG0Cm99uWANqp6iS?=
 =?us-ascii?Q?j8AKkVwxwVm1+u4Lhg9qT31m23cSlGW5d3tf0dOGG/G9oT2li/Hnj4oMEPmc?=
 =?us-ascii?Q?XTJQ+i1AnfKPuHu5GefaLee2pmxh207eJ+8jbjc8QK/OSas50xkKKjiGe982?=
 =?us-ascii?Q?JsMyt+tROEf2PFsiGmtFGBJ0S/5+nIVEL05nOE7ruD06GUmoEc0PQytWNfUq?=
 =?us-ascii?Q?sPaxMAVdNkS6SKqDad6wbVgvnbS0nUPiz9ZE74biQ654//smcGE7tbVYRavH?=
 =?us-ascii?Q?oT+u68IwiH6Nc3RpRYiSsLIURKfzgtx142SEdObWeiGGMP6tkuokoz79fMMN?=
 =?us-ascii?Q?A9/QU2Oo+49GWwzQacHMDc7OYkbyPqwEkeuMos2JUkmSB+OmlZErrrra0NjF?=
 =?us-ascii?Q?8zucEhrw3M8QgS2F39Lwc/KT9HUwfVuoFkw68c9jufnLdmE1WvGh82dCX6V1?=
 =?us-ascii?Q?fSCyMTTipQ9lyV5Yy/sCbo5SntUNfpFyLyaIycQ9/P3P6BWDRSXWxbApMSj3?=
 =?us-ascii?Q?zdZp/Sco7PPT7l9jdRdAI/v93IsOQhdi20lljYx0Ponqv+2CIAb+iIN/Db4h?=
 =?us-ascii?Q?KZpdFb4F9BQqHUhHktU4OrKccZDX8CyJpbnTD4Yb0AxjVpAwKirOXXE4HpUv?=
 =?us-ascii?Q?tbqWawyR53u76ADkqPt26zVEDUxX7Wm0FEvL5sIWZtn0oKqrl8RxC4Qklpm/?=
 =?us-ascii?Q?AOSyD/393gkt/ljyxjcL/+Iz6sfKhj/sGfcKo+o2UdhI/IAhbJDSGPDg25YE?=
 =?us-ascii?Q?VrhhYYrjCWaCs/gzqOr+GRFYt8Dw1kNYb/uENP2iVTIMwUuU1mS0QOLKSwN2?=
 =?us-ascii?Q?Y64hLLofJg/1rFmW4B8IU7pzq4dN5fNzunYFnRsCr035eih+iMuaSdyYpCFc?=
 =?us-ascii?Q?2EVSuQRerkYD4OVQqrXISlDF9Y5Sz2WkFn+7YkLxbHohfQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HPmIKek3fOcijKdrT1NeSdYw5gncu5ecooV/4oFeJ7rg/OBzX4TQlna7D6Rl?=
 =?us-ascii?Q?XPMSgXaN1slt0RRk+tVbowoaLRzGqNm+5zE3Us/+ZT9s4XcxTQ+exmT8rhcU?=
 =?us-ascii?Q?Yhn5puZzaVMaMLeFN3TsEiJ9xACAj5CIlCBpkyO9+BhGVWDex5G/aUMU4GPB?=
 =?us-ascii?Q?gCTGBopiWSTjvUxGUj/fRMYGiJk1ZkT1cpVO7Gzb2zOTt98KCza0/TilWl5x?=
 =?us-ascii?Q?wnnW3dsrWlRsVsi3CCKnWDdv8t7h0Ip0CQwA9Sa2vtx6A5EB/UKS1Z6Z5fMx?=
 =?us-ascii?Q?TcAWkemYjJAgP3sRVZozL91OHn72lllwjTPsSpA14v64UNhZQuYwRtYpRzqL?=
 =?us-ascii?Q?IuYg28oZrgZ0mlEAwFYHoJ24Vyc595ErjJPtdcCUUUL1UMjraPCb7/I4DRyD?=
 =?us-ascii?Q?lXYe9w58SuG4a2o+euiLMHRo/Cma4og7/vGd2F3zlBRH65fl0oQiuJCLUETO?=
 =?us-ascii?Q?5ioAhQ1LKs3cSfIkbZU4NtlokstwwRDyIb32Ny2n1nrU/YS6ahfsbo3g5qlT?=
 =?us-ascii?Q?6eumkeR+tmr46CefxDWgg1XjGlUPZT6kINgbN2oH+lPa1Sg2g3BmTsucOHzf?=
 =?us-ascii?Q?VsIuxwwOLbA1ej3JCk0nXCzJGFm8xPP7z1fGu3BKvAJlR9sa2JAsJzgdyMCy?=
 =?us-ascii?Q?N3Akb7IA5GQSuweZQnpuhUonHwfYaDxnAdt3I6FPEoMTGVUiXSdowVeZIeNS?=
 =?us-ascii?Q?r2UprlKl5ZfrbuL3CL0TNp/mOcvg2qu4i/8rQpHW7uf+Fhvhe4WPSuM261yU?=
 =?us-ascii?Q?NNpvPdK3R4toZSnvuAnGgJX/w3LEu18DhVaCejxfgT0NXlrZ6v9hQuTRzs6g?=
 =?us-ascii?Q?oHkDvZ82e/6usZ8Kvm5eKYPiL/JFq1Ja1ZmVvXNdp6e39i01Mekso/BUqxCG?=
 =?us-ascii?Q?a68mwQENYalSWn2X5QVfMGJcUOd8FZT4gjHI/FBHrZo9j9ijRjj4rN6IGWgp?=
 =?us-ascii?Q?ZLEYKpP0KpgFwQa1uYetsge9CB6SVoKC7ifCraR1EYwwumRFdCjm7BM05dCl?=
 =?us-ascii?Q?43cCS7Hp10GQ08f1zdCXRAM+7n8YK+mFTB4YbMui799SXjnYL/RSUH2xmi5t?=
 =?us-ascii?Q?WtmKAt8sedVs1eQJ1FuemAJra+tTNSNxXEBRVetm0rBYf4VFPpWNgtpWrg3E?=
 =?us-ascii?Q?8GjG6CoDCl1DNV8iGisDIHZ6EVgrEF8O0WEtINu0zWzTAlWt0eZgfLdP8E3A?=
 =?us-ascii?Q?dI8wWQGgVEVZCM3CsIQWvpGOq8PnFmJhsW21pQBSA1++Mfi3bjqaYV2lobmr?=
 =?us-ascii?Q?hkIQQMSFnQdyC5QitUoFK6W7nH+mR8SBvz/1hCI99n+OC96IMAtKZXgyM9ru?=
 =?us-ascii?Q?Uwj7bJOY8uUxLDd5HiZ9U7bcMaX/SmGtvAKnNoeFgyjafxP0QpFB7wcEQ5kp?=
 =?us-ascii?Q?sV1+OdzFW5/g4Car+lcgWXyvWArbVZGxPW7u+j3T8sxG+RiqCnwzq6aCRIKs?=
 =?us-ascii?Q?GgeTArSGWxBd+zXJhAcHGq7Aq7brafFhXcWH9+6vZNwyK5c5LLFtq4vSHSO0?=
 =?us-ascii?Q?uZ9TrJmq/U6xvxKFxb5bmrbBTJEE83ae8NDb/RzDxVMrR/sJ1ZS/7cAOmN7O?=
 =?us-ascii?Q?LS83K/ZGMWEevqBwOd5ljjnjw8/tw3NpYiWhkJfr2ij1i3XA+FUeGvjYxIrO?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YAppRRrg9SEQDZcKRE0UoKYnfdYCbNlPffydUDPBhxzQT+80dtdeGBCXjamDbnMAtGpBjKGm4dKXUlIgH2vHPV4uJgfb3KpU9TKVVxcJIHTZAJBVJ0z+5fUy31daU8JKm0FphRsEts/BQh0i4la4gH4zbDJF7lvrUvY4nNQuhxe5m89oVwPej3Zx2kevmlek3KN1XvvinQBs4kasTuOa8UPebJ8sGWgPDqBcJNyhamf3Qvgujk4yinqE5hFQJ6EejP2/0XKrPfkF6dTc9hmeDpfXtXxjYDN7qhMD3+Rp2TRakcZYfan7wuKB48cvtJyLXt1mXHpZZkqfp8PccRRZsLx4og84DVfOTEN06vStpKYEGRybPs5fID8cJrONjoK5s4HsbZeWdSdOwnBoyPnHYmfjOUrbB8O9/NWUX8ZYzAoSTZ75EMx/IYPTFcDx75skS+W7uhQ/c0r5R+KnLVzYiQgPSo/J1a919ejkV5okhC8JMnVyQ5Thop7AJSedBwDegJh9sBno2uc66Pecczxp0JZN8VvwahkPTTwyVK0ZtYO/5NIdj3x6J7fsAET6a8G2kTqkcqci7ejKwMEV4SWHedpJVrOlQ5Vr8IzcjXOynh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81665fc1-38f1-4bc6-2356-08dca76a11e6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:41:58.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLAfagmsa+ylUJ7bZhcTc53fN4JaIyXnVje04InWySVhY7oRbBfD+ov5zM5zqvDvnfaDgJrEwrd+qbMlQyECMHoctbYXjLxv39anFhc9NhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180137
X-Proofpoint-GUID: Yo_gGNkEWp8PudcdT_pA26nGpzN-lvbq
X-Proofpoint-ORIG-GUID: Yo_gGNkEWp8PudcdT_pA26nGpzN-lvbq

On Thu, Jun 27, 2024 at 01:39:03AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index d27a8cb2..1548d58f 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1739,7 +1739,7 @@ ok:
>  
>  		/*
>  		 * if (*((uint32_t *)&buf[DBUF_SPECID]) != 0) {
> -		 *     if (dctx->dmst->specsize + off + size >
> +		 *     if (dctx->mst->specsize + off + size >
>  		 *	   dtp->dt_options[DTRACEOPT_SPECSIZE]) {
>  		 *	   state[DT_STATE_SPEC_DROPS]++;
>  		 *
> @@ -2461,7 +2461,7 @@ dt_cg_act_setopt(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>   * back pending a commit() or discard() for the speculation with the given id.
>   *
>   * Updates the specid in the output buffer header, rather than emitting a new
> - * record into it.  The dctx->dmst->specsize value is initialized with the size
> + * record into it.  The dctx->mst->specsize value is initialized with the size
>   * of the data thus far recorded for this speculation.
>   */
>  static void
> @@ -2491,7 +2491,7 @@ dt_cg_act_speculate(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  	 *		goto exit;
>  	 *	*((uint32_t *)&buf[DBUF_SPECID]) = specid;
>  	 *				// mov [%r9 + DBUF_SPECID], %dn_reg
> -	 *	dctx->dmst->specsize = spec->size;
> +	 *	dctx->mst->specsize = spec->size;
>  	 *	exit:			// nop
>  	 */
>  
> -- 
> 2.18.4
> 
